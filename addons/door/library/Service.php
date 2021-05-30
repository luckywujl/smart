<?php

namespace addons\vote\library;

use addons\vote\library\aip\AipContentCensor;
use addons\vote\library\aip\AipNlp;
use addons\vote\model\Fields;
use fast\Http;
use think\Cache;
use think\Config;
use think\Db;
use think\Hook;

class Service
{

    /**
     * 检测内容是否合法
     * @param string $content 检测内容
     * @param string $type    类型
     * @return bool
     */
    public static function isContentLegal($content, $type = null)
    {
        $config = get_addon_config('vote');
        $type = is_null($type) ? $config['audittype'] : $type;
        if ($type == 'local') {
            // 敏感词过滤
            $handle = SensitiveHelper::init()->setTreeByFile(ADDON_PATH . 'vote/data/words.dic');
            //首先检测是否合法
            $isLegal = $handle->islegal($content);
            return $isLegal ? true : false;
        } elseif ($type == 'baiduyun') {
            $client = new AipContentCensor($config['aip_appid'], $config['aip_apikey'], $config['aip_secretkey']);
            $result = $client->textCensorUserDefined($content);
            if (!isset($result['conclusionType']) || $result['conclusionType'] > 1) {
                return false;
            }
        }
        return true;
    }

    /**
     * 获取标题的关键字
     * @param $title
     * @return array
     */
    public static function getContentTags($title)
    {
        $arr = [];
        $config = get_addon_config('vote');
        if ($config['nlptype'] == 'local') {
            !defined('_VIC_WORD_DICT_PATH_') && define('_VIC_WORD_DICT_PATH_', ADDON_PATH . 'vote/data/dict.json');
            $handle = new VicWord('json');
            $result = $handle->getAutoWord($title);
            foreach ($result as $index => $item) {
                $arr[] = $item[0];
            }
        } else {
            $client = new AipNlp($config['aip_appid'], $config['aip_apikey'], $config['aip_secretkey']);
            $result = $client->lexer($title);
            if (isset($result['items'])) {
                foreach ($result['items'] as $index => $item) {
                    if (!in_array($item['pos'], ['v', 'vd', 'nd', 'a', 'ad', 'an', 'd', 'm', 'q', 'r', 'p', 'c', 'u', 'xc', 'w'])) {
                        $arr[] = $item['item'];
                    }
                }
            }
        }
        foreach ($arr as $index => $item) {
            if (mb_strlen($item) == 1) {
                unset($arr[$index]);
            }
        }
        return array_filter($arr);
    }

    /**
     * 内容关键字自动加链接
     */
    public static function autolinks($value)
    {
        $links = [];

        $value = preg_replace_callback('~(<a .*?>.*?</a>|<.*?>)~i', function ($match) use (&$links) {
            return '<' . array_push($links, $match[1]) . '>';
        }, $value);

        $config = get_addon_config('vote');
        $autolinks = $config['autolinks'];
        $value = preg_replace_callback('/(' . implode('|', array_keys($autolinks)) . ')/i', function ($match) use ($autolinks) {
            if (!isset($autolinks[$match[1]])) {
                return $match[0];
            } else {
                return '<a href="' . $autolinks[$match[1]] . '" target="_blank">' . $match[0] . '</a>';
            }
        }, $value);
        return preg_replace_callback('/<(\d+)>/', function ($match) use (&$links) {
            return $links[$match[1] - 1];
        }, $value);
    }

    /**
     * 推送消息通知
     * @param string $content     内容
     * @param string $type        类型
     * @param string $template_id 模板ID
     */
    public static function notice($content, $type, $template_id)
    {
        try {
            if ($type == 'dinghorn') {
                Hook::listen('msg_notice', $template_id, [
                    'content' => $content
                ]);
            } elseif ($type == 'vbot') {
                Hook::listen('vbot_send_msg', $template_id, [
                    'content' => $content
                ]);
            }
        } catch (\Exception $e) {

        }
    }

    /**
     * 获取表字段信息
     * @param string $table 表名
     * @return array
     */
    public static function getTableFields($table)
    {
        $tagName = "vote-table-fields-{$table}";
        $fieldlist = Cache::get($tagName);
        if (!Config::get('app_debug') && $fieldlist) {
            return $fieldlist;
        }
        $dbname = Config::get('database.database');
        //从数据库中获取表字段信息
        $sql = "SELECT * FROM `information_schema`.`columns` WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? ORDER BY ORDINAL_POSITION";
        //加载主表的列
        $columnList = Db::query($sql, [$dbname, $table]);
        $fieldlist = [];
        foreach ($columnList as $index => $item) {
            $fieldlist[] = ['name' => $item['COLUMN_NAME'], 'title' => $item['COLUMN_COMMENT'], 'type' => $item['DATA_TYPE']];
        }
        Cache::set($tagName, $fieldlist);
        return $fieldlist;
    }

    /**
     * 获取指定类型的自定义字段列表
     */
    public static function getCustomFields($subject_id, $values = [], $conditions = [])
    {
        $fields = Fields::where('subject_id', $subject_id)
            ->where($conditions)
            ->where('status', 'normal')
            ->order('weigh desc,id desc')
            ->select();
        foreach ($fields as $k => $v) {
            //优先取编辑的值,再次取默认值
            $v->value = isset($values[$v['name']]) ? $values[$v['name']] : (is_null($v['defaultvalue']) ? '' : $v['defaultvalue']);
            $v->rule = str_replace(',', '; ', $v->rule);
            if (in_array($v['type'], ['checkbox', 'lists', 'images'])) {
                $checked = '';
                if ($v['minimum'] && $v['maximum']) {
                    $checked = "{$v['minimum']}~{$v['maximum']}";
                } elseif ($v['minimum']) {
                    $checked = "{$v['minimum']}~";
                } elseif ($v['maximum']) {
                    $checked = "~{$v['maximum']}";
                }
                if ($checked) {
                    $v->rule .= (';checked(' . $checked . ')');
                }
            }
            if (in_array($v['type'], ['checkbox', 'radio']) && stripos($v->rule, 'required') !== false) {
                $v->rule = str_replace('required', 'checked', $v->rule);
            }
            if (in_array($v['type'], ['selects'])) {
                $v->extend .= (' ' . 'data-max-options="' . $v['maximum'] . '"');
            }
        }

        return $fields;
    }

}

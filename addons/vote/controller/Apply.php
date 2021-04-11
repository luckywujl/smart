<?php

namespace addons\vote\controller;

use addons\vote\model\Subject;
use think\Config;
use think\Exception;
use think\Hook;
use think\Validate;

class Apply extends Base
{
    public function index()
    {
        $id = $this->request->get('id');
        $diyname = $this->request->param('diyname');
        $subject = \addons\vote\model\Subject::getByDiyname($diyname);
        if (!$subject) {
            $this->error("未找到请求的投票项目");
        }
        if (!in_array($subject->status, ['normal', 'notstarted', 'expired'])) {
            if (!$this->auth->id || $subject->user_id != $this->auth->id) {
                $this->error("未找到请求的投票");
            }
        }

        if ($subject['needlogin'] && !$this->auth->id) {
            $this->error(__('请登录后再操作'), "index/user/login");
        }

        if (!$subject->status == 'expired') {
            $this->error('投票已结束');
        }

        if (!$subject->isapply) {
            $this->error('投票项目未开放报名');
        }

        $player = null;
        if ($id) {
            $player = \addons\vote\model\Player::get($id);
            if (!$player || $player->user_id != $this->auth->id || !$player->user_id) {
                $this->error('无法进行越权操作');
            }
            if ($player['status'] == 'normal') {
                $this->error('已审核，无法进行修改');
            }
        }

        $fields = Subject::getSubjectFields($subject['id'], $player, ['iscontribute' => 1]);
        $data = [
            'fields' => $fields
        ];
        $subject['fieldslist'] = $this->fetch('common/fields', $data);

        // 语言检测
        $lang = strip_tags($this->request->langset());
        $site = Config::get("site");
        $upload = \app\common\model\Config::upload();
        // 上传信息配置后
        Hook::listen("upload_config_init", $upload);

        // 配置信息
        $config = [
            'site'           => array_intersect_key($site, array_flip(['name', 'cdnurl', 'version', 'timezone', 'languages'])),
            'upload'         => $upload,
            'modulename'     => 'addons',
            'controllername' => 'apply',
            'actionname'     => 'index',
            'jsname'         => 'apply/index',
            'moduleurl'      => rtrim(url("/index", '', false), '/'),
            'language'       => $lang
        ];
        $config = array_merge($config, Config::get("view_replace_str"));

        Config::set('upload', array_merge(Config::get('upload'), $upload));
        // 配置信息后
        Hook::listen("config_init", $config);

        $this->view->assign('jsconfig', $config);

        $this->view->assign('__subject__', $subject);
        $this->view->assign('__player__', $player);

        $this->view->assign('title', "报名 - {$subject->title}");
        $template = ($subject->applytpl ? $subject->applytpl : 'apply');
        $template = preg_replace('/\.html$/', '', $template);
        return $this->view->fetch('/' . $template);
    }


    /**
     * 提交
     */
    public function post()
    {
        $this->request->filter('trim,xss_clean');
        if ($this->request->isPost()) {
            $this->token();
            $diyname = $this->request->post('__diyname__');

            $subject = Subject::getByDiyname($diyname);
            if (!$subject) {
                $this->error("未找到请求的投票项目");
            }
            if (!in_array($subject->status, ['normal', 'notstarted', 'expired'])) {
                if (!$this->auth->id || $subject->user_id != $this->auth->id) {
                    $this->error("未找到请求的投票");
                }
            }
            if ($subject['needlogin'] && !$this->auth->id) {
                $this->error(__('请登录后再操作'), "index/user/login");
            }
            if ($subject->status == 'expired') {
                $this->error('投票已结束');
            }
            if (!$subject->isapply) {
                $this->error('投票项目未开放报名或报名已经结束');
            }

            $id = $this->request->request('id/d');
            $player = null;
            if ($id) {
                $player = \addons\vote\model\Player::get($id);
                if (!$player || $player->user_id != $this->auth->id || !$player->user_id) {
                    $this->error('无法进行越权操作');
                }
                if ($player['status'] == 'normal') {
                    $this->error('已审核，无法进行修改');
                }
            } else {
                if ($this->auth->id) {
                    $exist = \addons\vote\model\Player::where('user_id', $this->auth->id)->where('subject_id', $subject->id)->find();
                    if ($exist) {
                        $this->error("你已经报名，请勿重复报名！");
                    }
                }
            }

            $row = $this->request->post('row/a');

            if (!$row) {
                $this->error("请先在后台配置报名字段信息");
            }
            $rule = [
                'nickname' => 'length:2,30',
                'intro'    => 'length:6,255',
                'content'  => '',
                'image'    => 'length:20,255',
            ];
            foreach ($rule as $index => &$item) {
                if ($subject->iscontribute($index)) {
                    $item = "require" . ($item ? "|" : "") . $item;
                }
            }
            unset($item);

            $msg = [
                'nickname.require' => $subject->playername . '名称不能为空',
                'nickname.length'  => $subject->playername . '名称不能小于2个字符且不能超过30个字符',
                'intro.require'    => $subject->playername . '简介不能为空',
                'intro.length'     => $subject->playername . '简介不能小于6个字符且不能超过255个字符',
                'content.require'  => $subject->playername . '详细介绍不能为空',
                'image'            => $subject->playername . '图片不能为空',
                'image.length'     => $subject->playername . '图片不能小于20个字符且不能超过255个字符',
            ];
            $data = $row;
            $validate = new Validate($rule, $msg);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()));
            }

            $fields = Subject::getSubjectFields($subject['id'], null, ['iscontribute' => 1]);
            foreach ($fields as $index => $field) {
                if ($field['isrequire'] && (!isset($row[$field['name']]) || $row[$field['name']] == '')) {
                    $this->error("{$field['title']}不能为空！");
                }
            }

            foreach ($data as $index => &$value) {
                if (is_array($value) && isset($value['field'])) {
                    $value = json_encode(\app\common\model\Config::getArrayData($value), JSON_UNESCAPED_UNICODE);
                } else {
                    $value = is_array($value) ? implode(',', $value) : $value;
                }
            }
            $number = \addons\vote\model\Player::where('subject_id', $subject->id)->max('number');
            $number = $number ? $number : 0;

            try {
                $row['user_id'] = $this->auth->id;
                $row['number'] = $number + 1;
                $row['subject_id'] = $subject->id;
                $row['applydata'] = $data;
                $row['status'] = 'hidden';
                if ($player) {
                    $player->allowField(true)->save($row);
                } else {
                    \addons\vote\model\Player::create($row, true);
                }
            } catch (Exception $e) {
                $this->error("发生错误:" . $e->getMessage());
            }
            $url = addon_url('vote/subject/index', [':id' => $subject->id, ':diyname' => $subject->diyname]);
            if ($player) {
                $this->success('更新成功！请等待后台审核！', $url);
            } else {
                $this->success('报名成功！请等待后台审核！', $url);
            }
        }
        return;
    }

}

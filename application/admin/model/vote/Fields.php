<?php

namespace app\admin\model\vote;

use addons\vote\library\Alter;
use app\common\model\Config;
use think\Exception;
use think\exception\PDOException;
use think\Model;

class Fields extends Model
{

    // 表名
    protected $name = 'vote_fields';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
        'status_text',
        'content_list',
    ];
    protected $type = [
        'setting' => 'json',
    ];
    protected static $listField = ['select', 'selects', 'checkbox', 'radio', 'array'];

    public function setError($error)
    {
        $this->error = $error;
    }

    protected static $config = [];

    protected static function init()
    {
        $config = get_addon_config('vote');
        self::$config = $config;
        $beforeUpdateCallback = function ($row) {

            if (!preg_match("/^([a-zA-Z0-9_]+)$/i", $row['name'])) {
                throw new Exception("字段只支持字母数字下划线");
            }
            if (is_numeric(substr($row['name'], 0, 1))) {
                throw new Exception("字段不能以数字开始");
            }

            $exists = Fields::where('subject_id', $row['subject_id'])->where('name', $row['name'])->where('id', '<>', $row['id'] ?? 0)->find();
            if ($exists) {
                throw new Exception("字段已经存在");
            }

            if (in_array(strtolower($row['name']), ["nickname", "intro", "content", "image"])) {
                throw new Exception("保留字段暂不可用");
            }
        };

        $afterInsertCallback = function ($row) {
            //为了避免引起更新的事件回调，这里采用直接执行SQL的写法
            $row->query($row->fetchSql(true)->update(['id' => $row['id'], 'weigh' => $row['id']]));
            Subject::refresFields($row->subject_id);
        };
        $afterUpdateCallback = function ($row) {
            Subject::refresFields($row->subject_id);
        };

        self::beforeInsert($beforeUpdateCallback);
        self::beforeUpdate($beforeUpdateCallback);

        self::afterInsert($afterInsertCallback);
        self::afterUpdate($afterUpdateCallback);

        self::afterDelete(function ($row) {
            Subject::refresFields($row->subject_id);
        });
    }

    public function getContentListAttr($value, $data)
    {
        return in_array($data['type'], self::$listField) ? Config::decode($data['content']) : $data['content'];
    }

    public function getStatusList()
    {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function subject()
    {
        return $this->belongsTo('Subject', 'subject_id')->setEagerlyType(0);
    }
}

<?php

namespace app\admin\model\door;

use think\Model;


class Doorrecord extends Model
{

    

    

    // 表名
    protected $name = 'door_record';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'record_status_text'
    ];
    

    
    public function getRecordStatusList()
    {
        return ['0' => __('Record_status 0'), '1' => __('Record_status 1'), '2' => __('Record_status 2')];
    }


    public function getRecordStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['record_status']) ? $data['record_status'] : '');
        $list = $this->getRecordStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function doorinfo()
    {
        return $this->belongsTo('app\admin\model\door\Doorinfo', 'record_door_id', 'door_id', [], 'LEFT')->setEagerlyType(0);
    }
}

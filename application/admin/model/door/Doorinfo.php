<?php

namespace app\admin\model\door;

use think\Model;


class Doorinfo extends Model
{

    

    

    // 表名
    protected $name = 'door_info';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'door_type_text'
    ];
    

    
    public function getDoorTypeList()
    {
        return ['0' => __('Door_type 0'), '1' => __('Door_type 1')];
    }


    public function getDoorTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['door_type']) ? $data['door_type'] : '');
        $list = $this->getDoorTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}

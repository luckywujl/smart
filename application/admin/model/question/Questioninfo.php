<?php

namespace app\admin\model\question;

use think\Model;


class Questioninfo extends Model
{

    

    

    // 表名
    protected $name = 'question_info';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'question_datetime_text',
        'question_status_text'
    ];
    

    
    public function getQuestionStatusList()
    {
        return ['0' => __('Question_status 0'), '1' => __('Question_status 1'), '2' => __('Question_status 2'), '3' => __('Question_status 3'), '4' => __('Question_status 4')];
    }


    public function getQuestionDatetimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['question_datetime']) ? $data['question_datetime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getQuestionStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['question_status']) ? $data['question_status'] : '');
        $list = $this->getQuestionStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    protected function setQuestionDatetimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


}

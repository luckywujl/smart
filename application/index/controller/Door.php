<?php

namespace app\index\controller;


use addons\door\model\Doorrecord;

use app\common\controller\Frontend;


/**
 * 会员投票管理
 *
 * @icon fa fa-circle-o
 */
class Door extends Frontend
{

    protected $noNeedRight = ["*"];
    protected $layout = 'default';

    protected $model = null;
    
    


    /**
     * 我的开门记录
     */
    public function record()
    {
        $config = get_addon_config('vote');
        if (!in_array('record', explode(',', $config['usersidebar']))) {
            $this->error("模块暂未开放");
        }
        $recordList = Record::where(['question_user_id'=>$this->auth->id])->order('question_id', 'desc')->paginate(10);
        foreach($recordList as $k=>$v){
    	  	if($v['question_status']==0) {
    	  		$v['question_status'] = '已提交';
    	  	} 
    	  	if($v['question_status']==1) {
    	  		$v['question_status'] = '已受理';
    	  	} 
    	  	if($v['question_status']==2) {
    	  		$v['question_status'] = '处理中';
    	  	} 
    	  	if($v['question_status']==3) {
    	  		$v['question_status'] = '已完结';
    	  	} 
    	  	//缩略图处理
    	  	 $pos=strpos($v['question_files'], ",");
    	  	 
          $v['question_one']=$pos>0?substr($v['question_files'], 0,$pos):$v['question_files'];
    	  }
        $this->view->assign("recordList", $recordList);
        $this->view->assign("title", "我反映的问题");
        return $this->view->fetch();
    }
     /**
     * 提交开门请求
     */
    public function opendoor()
    {
        $config = get_addon_config('vote');
        if (!in_array('subject', explode(',', $config['usersidebar']))) {
            $this->error("模块暂未开放");
        }
          $record = [];     
        if ($this->request->isPost()) {
            $this->token();

            $row = $this->request->post("row/a", '', 'trim,xss_clean');
            $row = array_diff_key($row, array_reverse(explode(',', $config['availablefields'])));
            
            $row['record_user'] = $this->auth->username; 
				$row['record_send_time'] = time();  
				$row['record_type'] = '请求开门';         
            $row['record_status'] = 0;
            (new Doorrecord())->allowField(true)->save($row);
            $this->success("提交成功", "user/main");

            }
        
        $record['record_send_time'] = time();
        $this->view->assign("row", $record);
        return $this->view->fetch();
    }
    
    /**
     * 提交开道闸请求
     */
    public function opencardoor()
    {
        $config = get_addon_config('vote');
        if (!in_array('subject', explode(',', $config['usersidebar']))) {
            $this->error("模块暂未开放");
        }
          $record = [];     
        if ($this->request->isPost()) {
            $this->token();

            $row = $this->request->post("row/a", '', 'trim,xss_clean');
            $row = array_diff_key($row, array_reverse(explode(',', $config['availablefields'])));
            
            $row['record_user'] = $this->auth->username; 
				$row['record_send_time'] = time();  
				$row['record_type'] = '请求开道闸';         
            $row['record_status'] = 0;
            (new Doorrecord())->allowField(true)->save($row);
            $this->success("提交成功", "user/main");

            }
        
        $record['record_send_time'] = time();
        $this->view->assign("row", $record);
        return $this->view->fetch();
    }


}

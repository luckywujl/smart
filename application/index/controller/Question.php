<?php

namespace app\index\controller;


use addons\question\model\Record;
use addons\vote\model\Player;

use addons\vote\model\Subject;
use app\common\controller\Frontend;


/**
 * 会员投票管理
 *
 * @icon fa fa-circle-o
 */
class Question extends Frontend
{

    protected $noNeedRight = ["*"];
    protected $layout = 'default';

    protected $model = null;



    /**
     * 我反映的问题
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
     * 添加修改投票项目
     */
    public function post()
    {
        $config = get_addon_config('vote');
        if (!in_array('subject', explode(',', $config['usersidebar']))) {
            $this->error("模块暂未开放");
        }
        $record = [];
        $id = $this->request->get('id/d');
        if ($id) {
            $record = Record::get($id);
            if($record['question_status']==0) {
    	  		 $record['question_status'] = '已提交';
    	   	} 
    	   	if($record['question_status']==1) {
    	  		 $record['question_status'] = '已受理';
    	   	} 
    	   	if($record['question_status']==2) {
    	  		 $record['question_status'] = '处理中';
    	   	} 
    	   	if($record['question_status']==3) {
    	  		 $record['question_status'] = '已完结';
    	   	} 
            if (!$record) {
                $this->error("未找到指定的问题");
                
            }
        }
        if ($record && $record['question_user_id'] != $this->auth->id) {
            $this->error("无法进行越权操作");
        }
        if ($record && $record['question_status'] == 1) {
            $this->error("已受理的问题无法进行修改");
        }
        if ($this->request->isPost()) {
            $this->token();

            $row = $this->request->post("row/a", '', 'trim,xss_clean');
            $row = array_diff_key($row, array_reverse(explode(',', $config['availablefields'])));
            $row['question_user_id'] = $this->auth->id;
            $row['question_user'] = $this->auth->username; 
				$row['question_datetime'] = time();           
            if ($record) {
            	if($record['question_status']=='已完结') {
    	  		 $record['question_status'] = 3;
    	   	} 
    	   	if($record['question_status']=='处理中') {
    	  		 $record['question_status'] = 2;
    	   	} 
    	   	if($record['question_status']=='已受理') {
    	  		 $record['question_status'] = 1;
    	   	} 
            	if($record['question_status']=='已提交') {
    	  		 $record['question_status'] = 0;
    	   	} 
    	   	
    	   	
    	   	
                $record->allowField(true)->save($row);
                $this->success("更新成功", "index/question/record");
            } else {
            	 $row['question_status'] = 0;
                (new Record())->allowField(true)->save($row);
                $this->success("提交成功", "index/question/record");

            }
        }
        //$typeList = Subject::getTypeList();
        //unset($typeList['array']);
  
        $this->view->assign('record', $record);
        //$this->view->assign('typeList', $typeList);
        
        //$this->view->assign("availableFields", explode(',', $config['availablefields']));
        $this->view->assign("title", $id ? "修改问题" : "反映问题");
        if(!$id) {
        	$record['question_status'] = '已提交';
        	$record['question_datetime'] = time();

        	}
        $this->view->assign("row", $record);
        return $this->view->fetch();
    }
    


}

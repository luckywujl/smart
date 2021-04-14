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
        $recordList = Record::where('question_user_id', $this->auth->id)->order('question_id', 'desc')->paginate(10);
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
        $subject = [];
        $id = $this->request->get('id/d');
        if ($id) {
            $subject = Subject::get($id);
            if (!$subject) {
                $this->error("未找到指定的项目");
            }
        }
        if ($subject && $subject['user_id'] != $this->auth->id) {
            $this->error("无法进行越权操作");
        }
        if ($subject && $subject['status'] == 1) {
            $this->error("已审核的投票无法进行修改");
        }
        if ($this->request->isPost()) {
            $this->token();

            $row = $this->request->post("row/a", '', 'trim,xss_clean');
            $row = array_diff_key($row, array_reverse(explode(',', $config['availablefields'])));
            $row['user_id'] = $this->auth->id;
            if ($subject) {
                $subject->allowField(true)->save($row);
                $this->success("更新成功", "index/vote/subject");
            } else {
                (new Subject())->allowField(true)->save($row);
                $this->success("添加成功", "index/vote/subject");

            }
        }
        $typeList = Subject::getTypeList();
        unset($typeList['array']);
        $this->view->assign('subject', $subject);
        $this->view->assign('typeList', $typeList);
        $this->view->assign("row", $subject);
        $this->view->assign("availableFields", explode(',', $config['availablefields']));
        $this->view->assign("title", $id ? "修改问题" : "反映问题");
        return $this->view->fetch();
    }
    


}

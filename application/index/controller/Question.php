<?php

namespace app\index\controller;


use addons\question\model\Record;

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

    


}

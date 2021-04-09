<?php

namespace app\admin\controller\vote;

use addons\vote\model\Subject;
use app\admin\controller\localup\Service;
use app\common\controller\Backend;

/**
 * 投票参赛管理
 *
 * @icon fa fa-circle-o
 */
class Player extends Backend
{

    /**
     * Player模型对象
     * @var \app\admin\model\vote\Player
     */
    protected $model = null;
    protected $subject = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\vote\Player;

        $subject_id = $this->request->param('subject_id', 0);
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign('subject_id', $subject_id);
        $this->assignconfig('subject_id', $subject_id);
    }

    /**
     * 查看
     */
    public function index()
    {
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        $subject_id = $this->request->param('subject_id', 0);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                ->with(['user', 'subject', 'category'])
                ->where(function ($query) use ($subject_id) {
                    if ($subject_id) {
                        $query->where('player.subject_id', $subject_id);
                    }
                })
                ->where($where)
                ->order($sort, $order)
                ->paginate($limit);

            foreach ($list as $index => $item) {
                $item['applydata'] = json_decode($item['applydata'], true);
                $item->user->visible(['id', 'nickname']);
                $item->subject->visible(['id', 'title']);
            }

            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        if ($subject_id) {
            $fields = \app\admin\model\vote\Fields::where('subject_id', $subject_id)->order("weigh DESC, id ASC")->select();
            $this->assignconfig("fields", $fields);
        }
        return $this->view->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        $subject_id = $this->request->param('subject_id');
        $fields = Subject::getSubjectFields($subject_id, null);
        $data = [
            'fields' => $fields
        ];
        $this->view->assign("fields", $fields);
        $this->view->assign("fieldlist", $this->fetch('vote/common/fields', $data));
        return parent::add();
    }

    /**
     * 编辑
     */
    public function edit($ids = null)
    {
        $ids = $this->request->param('ids/d');
        $player = \app\admin\model\vote\Player::get($ids);
        $fields = Subject::getSubjectFields($player['subject_id'], $player);
        $data = [
            'fields' => $fields
        ];
        $this->view->assign("fields", $fields);
        $this->view->assign("fieldlist", $this->fetch('vote/common/fields', $data));
        return parent::edit($ids);
    }

    /**
     * 导入
     */
    public function import()
    {
        return parent::import();
    }

    /**
     * 详情
     */
    public function detail()
    {
        $ids = $this->request->param('ids');
        $row = \app\admin\model\vote\Player::get($ids);
        if (!$row) {
            $this->error('未找到指定的用户');
        }

        $fields = Subject::getSubjectFields($row['id'], $row['applydata']);
        $data = [
            'fields' => $fields
        ];
        $subject['fieldslist'] = $this->fetch('common/fields', $data);
        $this->view->assign('subject', $subject);
        return $this->view->fetch();
    }
}

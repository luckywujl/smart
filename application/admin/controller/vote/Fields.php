<?php

namespace app\admin\controller\vote;

use addons\vote\library\Service;
use app\common\controller\Backend;
use app\common\model\Config;
use think\Exception;

/**
 * 投票报名字段管理
 *
 * @icon fa fa-circle-o
 */
class Fields extends Backend
{

    /**
     * Subject模型对象
     * @var \app\admin\model\vote\Fields
     */
    protected $model = null;

    protected $noNeedRight = ['rulelist'];
    protected $multiFields = 'isfilter,iscontribute';

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\vote\Fields;
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign('typeList', Config::getTypeList());
        $this->view->assign('regexList', Config::getRegexList());
    }

    /**
     * 查看
     */
    public function index()
    {
        $subject_id = $this->request->param('subject_id', 0);
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $list = $this->model
                ->where('subject_id', $subject_id)
                ->where($where)
                ->order($sort, $order)
                ->paginate($limit);

            $subject = \app\admin\model\vote\Subject::get($subject_id);
            $setting = $subject->setting;

            $fieldList = [
                ['name' => 'nickname', 'title' => $subject->playername . '名称', 'type' => 'string'],
                ['name' => 'image', 'title' => $subject->playername . '图片', 'type' => 'image'],
                ['name' => 'intro', 'title' => $subject->playername . '简介', 'type' => 'text'],
                ['name' => 'content', 'title' => $subject->playername . '内容', 'type' => 'text'],
            ];
            foreach ($fieldList as $index => $field) {
                $item = [
                    'id'           => $field['name'],
                    'state'        => false,
                    'subject_id'   => $subject_id,
                    'name'         => $field['name'],
                    'title'        => $field['title'],
                    'type'         => $field['type'],
                    'issystem'     => true,
                    'isfilter'     => 0,
                    'iscontribute' => isset($setting['contributefields']) && is_array($setting['contributefields']) && in_array($field['name'], $setting['contributefields']) ? 1 : 0,
                    'isorder'      => 0,
                    'status'       => 'normal',
                    'createtime'   => 0,
                    'updatetime'   => 0
                ];
                $list[] = $item;
            }
            $result = array("total" => count($list->items()), "rows" => $list->items());

            return json($result);
        }
        $this->assignconfig('subject_id', $subject_id);
        $this->view->assign('subject_id', $subject_id);

        $subject = \app\admin\model\vote\Subject::get($subject_id);
        $this->view->assign('model', $subject);

        return $this->view->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        $subject_id = $this->request->param('subject_id', 0);
        $this->view->assign('subject_id', $subject_id);
        $this->renderTable();
        return parent::add();
    }

    /**
     * 编辑
     */
    public function edit($ids = null)
    {
        $this->renderTable();
        return parent::edit($ids);
    }

    /**
     * 渲染表
     */
    protected function renderTable()
    {
        $tableList = [];
        $dbname = \think\Config::get('database.database');
        $list = \think\Db::query("SELECT `TABLE_NAME`,`TABLE_COMMENT` FROM `information_schema`.`TABLES` where `TABLE_SCHEMA` = '{$dbname}';");
        foreach ($list as $key => $row) {
            $tableList[$row['TABLE_NAME']] = $row['TABLE_COMMENT'];
        }
        $this->view->assign("tableList", $tableList);
    }


    /**
     * 批量操作
     * @param string $ids
     */
    public function multi($ids = "")
    {
        $params = $this->request->request('params');
        parse_str($params, $paramsArr);
        if (isset($paramsArr['isfilter'])) {
            $field = \app\admin\model\vote\Fields::get($ids);
            if (!$field || !in_array($field['type'], ['radio', 'checkbox', 'select', 'selects', 'array'])) {
                $this->error('只有类型为单选、复选、下拉列表、数组才可以加入列表筛选');
            }
        }
        if (isset($paramsArr['iscontribute']) && !is_numeric($ids)) {
            if (!$ids || !in_array($ids, ["nickname", "intro", "content", "image"])) {
                $this->error('参数错误');
            }
            $subject_id = $this->request->param('subject_id', 0);
            $model = \app\admin\model\vote\Subject::get($subject_id);
            if (!$model) {
                $this->error("模型未找到");
            }
            $setting = $model['setting'];
            $contributefields = $setting['contributefields'] ?? [];
            if ($paramsArr['iscontribute']) {
                $contributefields[] = $ids;
            } else {
                $contributefields = array_values(array_diff($contributefields, [$ids]));
            }
            $setting['contributefields'] = $contributefields;
            $model->setting = $setting;
            $model->save();
            $this->success("");
        }
        return parent::multi($ids);
    }

    /**
     * 规则列表
     * @internal
     */
    public function rulelist()
    {
        //主键
        $primarykey = $this->request->request("keyField");
        //主键值
        $keyValue = $this->request->request("keyValue", "");

        $keyValueArr = array_filter(explode(',', $keyValue));
        $regexList = Config::getRegexList();
        $list = [];
        foreach ($regexList as $k => $v) {
            if ($keyValueArr) {
                if (in_array($k, $keyValueArr)) {
                    $list[] = ['id' => $k, 'name' => $v];
                }
            } else {
                $list[] = ['id' => $k, 'name' => $v];
            }
        }
        return json(['list' => $list]);
    }

}

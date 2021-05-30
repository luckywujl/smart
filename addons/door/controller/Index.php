<?php

namespace addons\vote\controller;

use addons\vote\library\Ip2Region;
use addons\vote\library\Jssdk;
use addons\vote\library\Service;
use addons\vote\model\Comment;
use addons\vote\model\Record;
use fast\Pinyin;
use fast\Tree;
use think\App;
use think\Cache;
use think\Db;
use think\Exception;

class Index extends Base
{

   /**
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                ->where($where)
                ->order($sort, $order)
                ->paginate($limit);

            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        return $this->view->fetch();
    }



}

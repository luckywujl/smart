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

    public function index()
    {
        // 判断是否设定默认项目
        $config = get_addon_config('vote');
        if ($config['defaultprojectid']) {
            $project = \addons\vote\model\Subject::get($config['defaultprojectid']);
            if ($project) {
                $dispatch = $this->request->dispatch();
                $vars = array_merge($this->request->param(), $dispatch['var'], ['controller' => 'subject']);
                $this->request->route(["diyname" => $project['diyname']]);
                return App::invokeMethod($dispatch['method'], $vars);
            }
        }
        $this->error("未设定默认投票项目", "");
    }

    /**
     * 投票
     */
    public function vote()
    {
        $player_id = $this->request->post("player_id/d");
        $player = \addons\vote\model\Player::get($player_id);
        if (!$player) {
            $this->error("未找到请求的参赛者");
        }
        $subject = $player->subject;
        if (!$subject) {
            $this->error("未找到请求的投票");
        }
        if (!in_array($subject->status, ['normal', 'notstarted', 'expired'])) {
            if (!$this->auth->id || $subject->user_id != $this->auth->id) {
                $this->error("未找到请求的投票");
            }
        }
        if ($subject->status == 'notstarted') {
            $this->error("投票暂未开始");
        } elseif ($subject->status == 'expired') {
            $this->error("投票已结束");
        }
        $user_id = $this->auth->id;
        $ip = $this->getIp();
        //限制登录后才可以投票
        if ($subject->needlogin && !$this->auth->id) {
            $this->error("请登录后再进行投票", "index/user/login");
        }
        //只在微信中投票
        if ($subject->onlywechat && !$this->isWechat()) {
            $this->error("当前投票只对微信端开放");
        }
        //限制投票区域
        if ($subject->limitarea && !$this->isPrivateIp($ip)) {
            $region = new Ip2Region(ADDON_PATH . 'vote' . DS . 'data' . DS . 'ip2region.db');
            $location = function ($ip) use ($region) {
                $arr = $region->binarySearch($ip);
                return intval($arr['city_id']);
            };
            if (!in_array($location($ip), explode(',', $subject->limitarea))) {
                $this->error("当前投票地址区域限制");
            }
        }

        //会员或IP筛选
        $ipuser = function ($query) use ($user_id, $ip) {
            if ($user_id) {
                $query->where('user_id', $user_id);
            } else {
                $query->where('user_id', 0)->where('ip', $ip);
            }
        };

        //限制最大投票次数
        if ($subject->maxvotenums) {
            $count = Record::where($ipuser)->where('subject_id', $subject->id)->count();
            if ($count >= $subject->maxvotenums) {
                $this->error("最多可投{$subject->maxvotenums}票");
            }
        }
        //限制每天投票次数
        if ($subject->pervotenums) {
            $count = Record::where($ipuser)->whereTime('createtime', 'today')->where('subject_id', $subject->id)->count();
            if ($count >= $subject->pervotenums) {
                $this->error("每天最多可投{$subject->pervotenums}票");
            }
        }
        //限制最大投选手数
        if ($subject->maxvoteplayers) {
            $playersArr = Record::where($ipuser)->where('player_id', '<>', $player->id)->where('subject_id', $subject->id)->distinct('player_id')->column('player_id');
            if (count($playersArr) >= $subject->maxvoteplayers) {
                $this->error("最多可投{$subject->maxvoteplayers}个参选{$subject->playername}");
            }
        }
        //限制每天投选手数
        if ($subject->pervoteplayers) {
            $playersArr = Record::where($ipuser)->where('player_id', '<>', $player->id)->whereTime('createtime', 'today')->where('subject_id', $subject->id)->distinct('player_id')->column('player_id');
            if (count($playersArr) >= $subject->pervoteplayers) {
                $this->error("最多可投{$subject->pervoteplayers}个参选{$subject->playername}");
            }
        }
        //限制最大对同一选手次数
        if ($subject->maxvotelimit) {
            $count = Record::where($ipuser)->where('subject_id', $subject->id)->where('player_id', $player->id)->count();
            if ($count >= $subject->maxvotelimit) {
                $this->error("最多对同一参选{$subject->playername}投{$subject->maxvotelimit}票");
            }
        }
        //限制每天对同一选手次数
        if ($subject->pervotelimit) {
            $count = Record::where($ipuser)->where('subject_id', $subject->id)->where('player_id', $player->id)->whereTime('createtime', 'today')->count();
            if ($count >= $subject->pervotelimit) {
                $this->error("每天最多对同一参选{$subject->playername}投{$subject->pervotelimit}票");
            }
        }
        //分类投票限制
        if ($player->category_id) {
            $category = $player->category;
            //限制同一分类投票次数
            if ($subject->maxcatevotenums) {
                $count = Record::where($ipuser)->where('subject_id', $subject->id)->where('player_id', 'in', function ($query) use ($category) {
                    $query->name("vote_player")->where('category_id', $category->id)->field('id');
                })->count();
                if ($count >= $subject->maxcatevotenums) {
                    $this->error("最多对同一分类[{$category->name}]投{$subject->maxcatevotenums}票");
                }
            }
            //限制每天同一分类投票次数
            if ($subject->percatevotenums) {
                $count = Record::where($ipuser)->where('subject_id', $subject->id)->where('player_id', 'in', function ($query) use ($category) {
                    $query->name("vote_player")->where('category_id', $category->id)->field('id');
                })->whereTime('createtime', 'today')->count();
                if ($count >= $subject->percatevotenums) {
                    $this->error("每天最多对同一分类[{$category->name}]投{$subject->percatevotenums}票");
                }
            }
            //同一分类最大可投选手数
            if ($subject->maxcatevoteplayers) {
                $playersArr = Record::where($ipuser)->where('player_id', '<>', $player->id)->where('subject_id', $subject->id)->where('player_id', 'in', function ($query) use ($category) {
                    $query->name("vote_player")->where('category_id', $category->id)->field('id');
                })->distinct('player_id')->column('player_id');
                if (count($playersArr) >= $subject->maxcatevoteplayers) {
                    $this->error("每天最多对同一分类[{$category->name}]投{$subject->maxcatevoteplayers}个参选{$subject->playername}");
                }
            }
        }
        $exists = Record::where($ipuser)->where('subject_id', $subject->id)->find();

        Db::startTrans();
        try {
            $data = [
                'subject_id' => $subject->id,
                'player_id'  => $player->id,
                'ip'         => $this->request->ip(),
                'user_id'    => (int)$this->auth->id
            ];
            Record::create($data);
            //更新投票总数
            $subject->setInc("votes");
            if (!$exists) {
                //更新投票人数
                $subject->setInc("voters");
            }
            //更新参赛者得票数
            $player->setInc('votes');
            $player->votetime = time();
            $player->save();
            Cache::rm("ranklist-" . $subject->id);
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            $this->error("投票失败,请重试");
        }
        //$votenums = Record::where($ipuser)->where('subject_id', $subject->id)->where('player_id', $player->id)->count();
        //$todayvotenums = Record::where($ipuser)->where('subject_id', $subject->id)->where('player_id', $player->id)->whereTime('createtime', 'today')->count();
        $data = [
            'disabled' => false
        ];
        $this->success("投票成功", null, $data);
    }

    /**
     * 发表评论
     */
    public function comment()
    {
        if (!$this->auth->id) {
            $this->error("请登录后再发表评论", "index/user/login");
        }

        $this->token();
        $player_id = $this->request->post("player_id/d");
        $player = \addons\vote\model\Player::get($player_id);
        if (!$player) {
            $this->error("未找到请求的参赛信息");
        }
        $subject = $player->subject;
        if (!$subject) {
            $this->error("未找到请求的投票");
        }
        if (!in_array($subject->status, ['normal', 'notstarted', 'expired'])) {
            if (!$this->auth->id || $subject->user_id != $this->auth->id) {
                $this->error("未找到请求的投票");
            }
        }
        if ($subject->status == 'expired') {
            $this->error("投票已结束");
        }
        if (!$subject->iscomment) {
            $this->error("该投票不允许发表评论");
        }
        $content = $this->request->post("content");
        if (!$content) {
            $this->error("评论内容不能为空");
        }

        $config = get_addon_config('vote');

        $ip = $this->getIp();

        $data = [
            'subject_id' => $subject->id,
            'player_id'  => $player->id,
            'user_id'    => $this->auth->id,
            'content'    => $content,
            'ip'         => $ip,
        ];

        //审核状态
        $status = 'normal';
        if ($config['iscommentaudit'] == 1) {
            $status = 'hidden';
        } elseif ($config['iscommentaudit'] == 0) {
            $status = 'normal';
        } elseif ($config['iscommentaudit'] == -1) {
            if (!Service::isContentLegal($content)) {
                $status = 'hidden';
            }
        }
        $data['status'] = $status;

        Db::startTrans();
        try {
            Comment::create($data);
            $player->setInc('comments');
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            $this->error("评论失败，请重试");
        }
        $this->success($status == 'normal' ? "评论成功" : "评论成功，审核后才会展示");
    }

    /**
     * 分享
     */
    public function share()
    {
        $url = $this->request->request("url", "", "trim");
        $config = get_addon_config('third');
        if (!$config) {
            $this->error("请在后台插件管理安装配置《第三方登录》插件");
        }
        $jssdk = new Jssdk();
        $package = $jssdk->getSignedPackage($url);
        $this->success("请求成功", "", $package);
        return;
    }

    public function json()
    {
        $list = Db::table("area")->where('level', '<>', 4)->where('name', 'not like', '%县级行政区划%')->select();
        $list = Tree::instance()->init($list)->getTreeArray(1);
        $data = [];
        foreach ($list as $index => $item) {
//            $data[] = [
//                "id"        => $item['id'],
//                "name"      => $item['name'],
//                "parentId"  => $item['pid'],
//                "shortName" => $item['name'],
//                "letter"    => ucfirst(substr(Pinyin::get($item['name'], true), 0, 1)),
//                "cityCode"  => $item['id'],
//                "pinyin"    => ucfirst(Pinyin::get($item['name'], false))
//            ];
            foreach ($item['childlist'] as $index => $value) {
                $data[] = [
                    "id"        => $value['id'],
                    "name"      => $value['name'],
                    "parentId"  => $value['pid'],
                    "shortName" => $value['name'],
                    "letter"    => ucfirst(substr(Pinyin::get($value['name'], true), 0, 1)),
                    "cityCode"  => $value['id'],
                    "pinyin"    => ucfirst(Pinyin::get($value['name'], false))
                ];
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        return;
    }

}

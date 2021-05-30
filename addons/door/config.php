<?php

return [
    [
        'name'    => 'defaultprojectid',
        'title'   => '默认投票项目',
        'type'    => 'string',
        'content' => [
        ],
        'value'   => '',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '',
        'ok'      => '',
        'extend'  => 'class="form-control selectpage" data-source="vote/subject/index" data-field="title"',
    ],
    [
        'name'    => 'isnumber',
        'title'   => '是否显示编号',
        'type'    => 'radio',
        'content' => [
            1 => '是',
            0 => '否',
        ],
        'value'   => '1',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '是否显示昵称前面的编号',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'isipadv',
        'title'   => '是否进行高级模式获取IP',
        'type'    => 'radio',
        'content' => [
            1 => '是',
            0 => '否',
        ],
        'value'   => '0',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '如果有使用代理模式或CDN部署，请使用高级模式获取',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'commentorderway',
        'title'   => '评论排序',
        'type'    => 'radio',
        'content' => [
            'asc'  => '按时间升序',
            'desc' => '按时间降序',
        ],
        'value'   => 'desc',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '评论列表时的排序方式',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'commentpagesize',
        'title'   => '评论每页显示条数',
        'type'    => 'number',
        'content' => [],
        'value'   => '10',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '评论每页显示的评论条数',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'usersidebar',
        'title'   => '会员中心模块',
        'type'    => 'checkbox',
        'content' => [
            'subject' => '我创建的投票',
            'apply'   => '我报名的投票',
            'record'  => '我的投票记录',
        ],
        'value'   => 'subject,apply,record',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '评论列表时的排序方式',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'availablefields',
        'title'   => '可投稿字段',
        'type'    => 'checkbox',
        'content' => [
            'title'        => '标题',
            'image'        => '图片',
            'intro'        => '介绍',
            'content'      => '内容',
            'banner'       => '头部背景图',
            'pervotenums'  => '每天可投票数',
            'pervotelimit' => '每天可为同一选手投票数',
            'pagesize'     => '前台分页大小',
            'limitarea'    => '限制地区',
            'needlogin'    => '是否需要登录',
            'onlywechat'   => '是否只在微信',
            'diyname'      => '自定义名称',
            'playername'   => '参赛名称',
            'isapply'      => '是否开放报名',
            'iscomment'    => '是否允许评论',
            'begintime'    => '开始时间',
            'endtime'      => '结束时间',
            'applydata'    => '自定义字段',
            'category'     => '投票分类',
        ],
        'value'   => 'title,image,intro,content,pervotenums,pervotelimit,pagesize,limitarea,needlogin,onlywechat,diyname,playername,isapply,iscomment,begintime,endtime,applydata,category',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '前台创建投票可用的字段',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'wechatautologin',
        'title'   => '微信端自动登录',
        'type'    => 'radio',
        'content' => [
            1 => '是',
            0 => '否',
        ],
        'value'   => '1',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'domain',
        'title'   => '绑定二级域名前缀',
        'type'    => 'string',
        'content' => [],
        'value'   => '',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'rewrite',
        'title'   => '伪静态',
        'type'    => 'array',
        'content' => [],
        'value'   => [
            'index/index'   => '/vote/$',
            'subject/index' => '/vote/subject/[:diyname]',
            'player/index'  => '/vote/player/[:id]',
            'rank/index'    => '/vote/rank/[:diyname]',
            'apply/index'   => '/vote/apply/[:diyname]',
        ],
        'rule'    => 'required',
        'msg'     => '',
        'tip'     => '',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'urlsuffix',
        'title'   => 'URL后缀',
        'type'    => 'string',
        'content' => [
            1 => '开启',
            0 => '关闭',
        ],
        'value'   => 'html',
        'rule'    => '',
        'msg'     => '如果不需要后缀可以设置为空',
        'tip'     => '',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'iscommentaudit',
        'title'   => '发表评论审核',
        'type'    => 'radio',
        'content' => [
            1  => '全部审核',
            0  => '无需审核',
            -1 => '仅含有过滤词时审核',
        ],
        'value'   => '1',
        'rule'    => 'required',
        'msg'     => '',
        'tip'     => '',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'audittype',
        'title'   => '审核方式',
        'type'    => 'radio',
        'content' => [
            'local'    => '本地',
            'baiduyun' => '百度云',
        ],
        'value'   => 'local',
        'rule'    => 'required',
        'msg'     => '',
        'tip'     => '如果启用百度云，请输入百度云AI平台应用的AK和SK',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'nlptype',
        'title'   => '分词方式',
        'type'    => 'radio',
        'content' => [
            'local'    => '本地',
            'baiduyun' => '百度云',
        ],
        'value'   => 'local',
        'rule'    => 'required',
        'msg'     => '',
        'tip'     => '如果启用百度云，请输入百度云AI平台应用的AK和SK',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'aip_appid',
        'title'   => '百度AI平台应用Appid',
        'type'    => 'string',
        'content' => [],
        'value'   => '',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '百度云AI开放平台应用AppId',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'aip_apikey',
        'title'   => '百度AI平台应用Apikey',
        'type'    => 'string',
        'content' => [],
        'value'   => '',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '百度云AI开放平台应用ApiKey',
        'ok'      => '',
        'extend'  => '',
    ],
    [
        'name'    => 'aip_secretkey',
        'title'   => '百度AI平台应用Secretkey',
        'type'    => 'string',
        'content' => [],
        'value'   => '',
        'rule'    => '',
        'msg'     => '',
        'tip'     => '百度云AI开放平台应用Secretkey',
        'ok'      => '',
        'extend'  => '',
    ],
];
<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"/home/www/admin/localhost_9005/wwwroot/addons/vote/view/subject.html";i:1618148496;s:74:"/home/www/admin/localhost_9005/wwwroot/addons/vote/view/common/layout.html";i:1618148386;}*/ ?>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class=""> <!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="renderer" content="webkit">
    <title><?php echo isset($title)?$title:'投票'; ?></title>
    <meta name="keywords" content="<?php echo isset($keywords)?$keywords:''; ?>"/>
    <meta name="description" content="<?php echo isset($description)?$description:''; ?>"/>

    <link rel="stylesheet" media="screen" href="/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" media="screen" href="/assets/libs/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" media="screen" href="/assets/libs/fastadmin-layer/dist/theme/default/layer.css"/>
    <link rel="stylesheet" media="screen" href="/assets/addons/vote/css/swiper.min.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1150638_isdc60xczc.css">
    <link rel="stylesheet" media="screen" href="/assets/addons/vote/css/common.css?v=<?php echo $site['version']; ?>"/>
    <link rel="stylesheet" media="screen" href="/assets/addons/vote/css/main.css?v=<?php echo $site['version']; ?>">

    <!--分享-->
    <meta property="og:url" content="<?php echo isset($__player__)?$__player__['fullurl']:$__subject__['fullurl']; ?>"/>
    <meta property="og:title" content="<?php echo isset($__player__)?$__player__['nickname']:$__subject__['title']; ?>"/>
    <meta property="og:image" content="<?php echo cdnurl(isset($__player__)?$__player__['image']:$__subject__['image'],true); ?>"/>
    <meta property="og:description" content="<?php echo isset($__player__)?$__player__['intro']:$__subject__['intro']; ?>"/>

    {__STYLE__}

    <!--[if lt IE 9]>
    <script src="/libs/html5shiv.js"></script>
    <script src="/libs/respond.min.js"></script>
    <![endif]-->

</head>
<body class="group-page">
<div class="pix_section pix_nav_menu pix_scroll_header normal pix-over-header hidden-xs" data-scroll-bg="#444" id="nav" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 pix-inner-col column ui-droppable">
                <div class="pix-content">
                    <ul class="nav navbar-nav navbar-right media-middle pix-header-nav pix-adjust-height" id="pix-header-nav">
                        <li><a href="<?php echo $__subject__['url']; ?>" class="pix-light-white">首页</a></li>
                        <li><a href="<?php echo $__subject__['rank_url']; ?>" class="pix-light-white">排行榜</a></li>
                        <?php if($__subject__['isapply']): ?>
                        <li><a href="<?php echo $__subject__['apply_url']; ?>" class="pix-light-white">报名</a></li>
                        <?php endif; ?>
                        <li><a href="javascript:" class="pix-light-white btn-share">分享</a></li>
                        <?php if($user): ?>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎你! <?php echo $user['nickname']; ?><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="<?php echo url('index/user/index'); ?>">业主中心</a>
                                </li>
                                <!--li>
                                    <a href="<?php echo url('index/user/profile'); ?>">个人资料</a>
                                </li-->
                                <li>
                                    <a href="<?php echo url('index/user/logout'); ?>">退出登录</a>
                                </li>
                            </ul>
                        </li>
                        <?php else: ?>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">业主中心 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="<?php echo url('index/user/login'); ?>">登录</a>
                                </li>
                                <li>
                                    <a href="<?php echo url('index/user/register'); ?>">注册</a>
                                </li>
                            </ul>
                        </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if(true): ?>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top visible-xs" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-vote-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="bs-vote-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<?php echo $__subject__['url']; ?>" class="pix-light-white">首页</a></li>
                <li><a href="<?php echo $__subject__['rank_url']; ?>" class="pix-light-white">排行榜</a></li>
                <?php if($__subject__['isapply']): ?>
                <li><a href="<?php echo $__subject__['apply_url']; ?>" class="pix-light-white">报名</a></li>
                <?php endif; ?>
                <li><a href="javascript:" class="pix-light-white btn-share">分享</a></li>
                <?php if($user): ?>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎你! <?php echo $user['nickname']; ?><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<?php echo url('index/user/index'); ?>">业主中心</a>
                        </li>
                        <!--li>
                            <a href="<?php echo url('index/user/profile'); ?>">个人资料</a>
                        </li-->
                        <li>
                            <a href="<?php echo url('index/user/logout'); ?>">退出登录</a>
                        </li>
                    </ul>
                </li>
                <?php else: ?>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">业主中心 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<?php echo url('index/user/login'); ?>">登录</a>
                        </li>
                        <li>
                            <a href="<?php echo url('index/user/register'); ?>">注册</a>
                        </li>
                    </ul>
                </li>
                <?php endif; ?>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<?php endif; ?>



<div class="pix_section pix-padding-v-65 pix-cover-bg" id="header" style="background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('<?php echo cdnurl($__subject__['banner']); ?>');">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content text-center">
                    <div class="pix-margin-bottom-30 header-logo">
                        <img src="/assets/addons/vote/img/vote.png" width="120" alt="">
                    </div>
                    <h1 class="pix-white text-center secondary-font pix-small-width-text">
                        <span><strong><?php echo $__subject__['title']; ?></strong></span>
                    </h1>
                    <div>
                        <h5 class="pix-slight-white text-center pix-margin-bottom-50 pix-small-width-text">
                            <span><?php echo $__subject__['intro']; ?></span>
                        </h5>
                    </div>
                    <div>
                        <a href="javascript:" class="btn <?php echo $__subject__['status']=='notstarted'?'dark-yellow-bg':($__subject__['status']=='expired'?'gray-5-bg':'green-bg'); ?> btn-xl pix-white btn-startvote">
                            <i class="fa fa-thumbs-up"></i>
                            <!--@formatter:off-->
                            <?php if($__subject__['status']=='notstarted'): ?>
                                <span><strong>未开始</strong></span>
                            <?php elseif($__subject__['status']=='expired'): ?>
                                <span><strong>已结束</strong></span>
                            <?php else: ?>
                                <span><strong>开始投票</strong></span>
                            <?php endif; ?>
                            <!--@formatter:on-->
                        </a>
                        <a href="<?php echo $__subject__['rank_url']; ?>" class="btn blue-bg btn-xl pix-white">
                            <i class="fa fa-bar-chart"></i>
                            <span><strong><span class="hidden-xs">查看</span>排行榜</strong></span>
                        </a>
                    </div>

                    <?php if(!in_array($__subject__['status'], ['notstarted', 'expired'])): ?>
                    <div class="pix-padding-top-50 pix-white">
                        距离投票结束还有：
                    </div>
                    <div class="pix-padding-top-10 countdown" data-format="<i>%D</i>天<i>%H</i>时<i>%M</i>分<i>%S</i>秒" data-countdown="<?php echo $__subject__['remainseconds']; ?>" style="color:#fff;font-size:16px;">
                        <i>00</i>天<i>00</i>时<i>00</i>分<i>00</i>秒
                    </div>
                    <?php endif; if($__subject__['status']=='notstarted'): ?>
                    <div class="pix-padding-top-50 pix-white">
                        距离投票开始还有：
                    </div>
                    <div class="pix-padding-top-10 countdown" data-format="<i>%D</i>天<i>%H</i>时<i>%M</i>分<i>%S</i>秒" data-countdown="<?php echo max(0, $__subject__['begintime']-time()); ?>" style="color:#fff;font-size:16px;">
                        <i>00</i>天<i>00</i>时<i>00</i>分<i>00</i>秒
                    </div>
                    <?php endif; if($__subject__['status']!='expired' || $__subject__['endtime'] < time()): ?>
                    <div class="pix-padding-top-50" style="color:#fff;font-size:16px;">
                        投票时间：<?php echo date('Y年m月d日',$__subject__['begintime']); ?>~<?php echo date('Y年m月d日',$__subject__['endtime']); ?>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="pix_section gray-bg pix-padding bg-white" id="statistics" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content pix-padding-bottom-30">
                    <h2 class="pix-black-gray-dark text-center pix-no-margin-top secondary-font">
                        <span><b>统计报表</b></span>
                    </h2>
                    <p class="pix-black-gray-light big-text text-center">
                        <span>当前活动的实时统计信息和当前参选<?php echo $__subject__['playername']; ?>投票的实时信息</span>
                    </p>
                </div>
            </div>
            <div class="col-md-3 col-xs-6 col-sm-3 column">
                <div class="pix-content text-center pix-margin-v-20">
						<span class="">
							<i class="iconfont icon-chart big-icon-80 pix-black-gray-dark"></i>
						</span>
                    <h1 class="pix-yellow pix-margin-top-10 pix-no-margin-bottom number-count" data-to="<?php echo $__subject__['votes']; ?>">
                        <?php echo number_format($__subject__['votes']); ?>
                    </h1>
                    <h5 class="pix-black-gray-dark pix-no-margin-top">
							<span><strong>累积投票数</strong>
							</span>
                    </h5>
                </div>
            </div>
            <div class="col-md-3 col-xs-6 col-sm-3 column">
                <div class="pix-content text-center pix-margin-v-20">
						<span class="">
							<i class="iconfont icon-user big-icon-80 pix-black-gray-dark"></i>
						</span>
                    <h1 class="pix-yellow pix-margin-top-10 pix-no-margin-bottom number-count" data-to="<?php echo $__subject__['views']; ?>">
                        <?php echo number_format($__subject__['views']); ?>
                    </h1>
                    <h5 class="pix-black-gray-dark pix-no-margin-top">
							<span><strong>累积访问次数</strong>
							</span>
                    </h5>
                </div>
            </div>
            <div class="col-md-3 col-xs-6 col-sm-3 column">
                <div class="pix-content text-center pix-margin-v-20">
						<span class="">
							<i class="iconfont icon-calendar big-icon-80 pix-black-gray-dark"></i>
						</span>
                    <h1 class="pix-yellow pix-margin-top-10 pix-no-margin-bottom number-count" data-to="<?php echo $__subject__['players']; ?>">
                        <?php echo number_format($__subject__['players']); ?>
                    </h1>
                    <h5 class="pix-black-gray-dark pix-no-margin-top">
							<span><strong>选项数量</strong>
							</span>
                    </h5>
                </div>
            </div>
            <div class="col-md-3 col-xs-6 col-sm-3 column">
                <div class="pix-content text-center pix-margin-v-20">
						<span class="">
							<i class="iconfont icon-users big-icon-80 pix-black-gray-dark"></i>
						</span>
                    <h1 class="pix-yellow pix-margin-top-10 pix-no-margin-bottom number-count" data-to="<?php echo $__subject__['voters']; ?>">
                        <?php echo number_format($__subject__['voters']); ?>
                    </h1>
                    <h5 class="pix-black-gray-dark pix-no-margin-top">
                        <span><strong>累积投票人数</strong></span>
                    </h5>
                </div>
            </div>
        </div>
        <div class="pix-padding-top-50 text-center">
            以上数据为实时统计数据，数据真实有效
        </div>
    </div>
</div>

<div class="pix_section pix-padding-v-65" id="rules" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content text-center pix-margin-bottom-30">
                    <h2 class="pix-no-margin-top pix-black">
                        <span>活动规则</span>
                    </h2>
                    <p class="pix-black-gray-light big-text text-center pix-margin-bottom-30 pix-md-width-text">
                        请仔细阅读活动相关规则信息
                    </p>
                </div>
            </div>

            <div class="col-md-10 col-xs-12 col-sm-12 column col-md-offset-1">
                <div class="pix-content text-left">
                    <div class="pix-gray detail">
                        <?php echo $__subject__['content']; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="pix_section pix-padding-v-50 bg-white" id="players" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content pix-padding-bottom-30">
                    <h2 class="pix-black-gray-dark text-center pix-no-margin-top secondary-font">
                        <span><b>参选<?php echo $__subject__['playername']; ?></b></span>
                    </h2>
                    <p class="pix-black-gray-light big-text text-center">
                        <span>请为参选<?php echo $__subject__['playername']; ?>进行投票，感谢你的支持</span>
                    </p>
                </div>
            </div>
            <div class="col-md-6 col-xs-12 col-sm-12 col-md-offset-3 column">
                <div class="pix-content pix-padding-bottom-20">
                    <form class="pix-form-style pixfort-form form-round-lg ui-sortable" id="searchform" data-pagesize="<?php echo $__subject__['pagesize']; ?>" novalidate="true" action="#players">
                        <div class="form-group">
                            <input type="text" class="form-control text-center" id="searchinput" name="q" value="<?php echo (\think\Request::instance()->get('q') ?: ''); ?>" placeholder="请输入<?php echo $__subject__['playername']; ?>ID或名称进行搜索">
                            <span id="searchbtn" class="fa fa-search"></span>
                        </div>
                    </form>
                </div>
            </div>

            <?php if($categoryList): ?>
            <div class="col-xs-12">
                <div class="pix-content pix-padding-bottom-20">
                    <ul class="list-inline category-list">
                        <li><a href="?<?php if(\think\Request::instance()->get('q')): ?>q=<?php echo \think\Request::instance()->get('q'); endif; ?>#players" class="<?php echo \think\Request::instance()->get('category')==0?'active':''; ?>">全部</a></li>
                        <?php if(is_array($categoryList) || $categoryList instanceof \think\Collection || $categoryList instanceof \think\Paginator): if( count($categoryList)==0 ) : echo "" ;else: foreach($categoryList as $key=>$item): ?>
                        <li><a href="?category=<?php echo $item['id']; if(\think\Request::instance()->get('q')): ?>&q=<?php echo \think\Request::instance()->get('q'); endif; ?>#players" class="<?php echo \think\Request::instance()->get('category')==$item['id']?'active':''; ?>"><?php echo $item['name']; ?></a></li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
            <?php endif; ?>
        </div>
        <div class="row">
            <?php if(is_array($playerList) || $playerList instanceof \think\Collection || $playerList instanceof \think\Paginator): if( count($playerList)==0 ) : echo "" ;else: foreach($playerList as $key=>$item): ?>
            <div class="col-md-4 col-xs-6 col-sm-4 column player-item" data-id="<?php echo $item['id']; ?>" data-nickname="<?php echo $item['nickname']; ?>">
                <div class="pix-content pix-radius-3 gray-bg text-center pix-margin-v-10">
                    <div class="img-zoom pix-padding-h-20 pix-padding-v-30" style="display:block;">
                        <a href="<?php echo $item['url']; ?>" class="img-circle img-avatar">
                            <div class="embed-responsive embed-responsive-square">
                                <img src="<?php echo cdnurl($item['image']); ?>" alt="<?php echo $item['nickname']; ?>" class="embed-responsive-item">
                            </div>
                        </a>
                        <h5 class="pix-black-gray-dark pix-no-margin-bottom">
                            <span><strong><?php if($config['isnumber']): ?><?php echo $item['number']; ?>. <?php endif; ?><?php echo $item['nickname']; ?></strong></span>
                        </h5>
                        <h6 class="pix-brown pix-no-margin-top">
                            <span><strong><?php echo $item['intro']; ?></strong></span>
                        </h6>
                        <div class="pix-black-gray-light pix-margin-bottom-20" style="line-height:24px;">
                            <div>当前得票: <span class="text-danger" data-to="<?php echo $item['votes']; ?>"><?php echo $item['votes']; ?></span> 票</div>
                            <div>总排名: <?php echo $item['rank']; ?></div>
                            <!--<div>分类排名: <?php echo $item['category_rank']; ?></div>-->
                            <!--<div>占比: <?php echo $item->getPercent($__subject__['votes']); ?> %</div>-->
                        </div>
                        <div>
                            <a href="javascript:" class="btn blue-bg btn-md pix-white btn-vote <?php echo $__subject__['status']=='expired'?'disabled':''; ?>" data-id="<?php echo $item['id']; ?>">
                                <i class="fa fa-thumbs-up"></i>
                                <!--@formatter:off-->
                                <?php if($item['voted']): ?>
                                    <span><strong><?php if($__subject__['pervotelimit']==1): ?>已投票<?php else: ?>已投 <ins><?php echo $item['voted']; ?></ins> 票<?php endif; ?></strong></span>
                                <?php elseif($__subject__['status']=='expired'): ?>
                                    <span><strong>已结束</strong></span>
                                <?php else: ?>
                                    <span><strong>投一票</strong></span>
                                <?php endif; ?>
                                <!--@formatter:on-->
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; if(!$playerList->total()): ?>
            <div class="col-xs-12 text-center">暂未找到更多的<?php echo $__subject__['playername']; ?></div>
            <?php endif; ?>
        </div>
        <?php if($playerList->hasPages()): ?>
        <div class="pager pix-margin-top-30">
            <?php echo $playerList->render(); ?>
        </div>
        <?php endif; ?>
    </div>
</div>

<?php if($__subject__['isapply']): ?>
<div class="pix_section bg-white" id="apply" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-xs-12 col-sm-10 column col-md-offset-1">
                <div class="pix-content pix-padding-bottom-30 pix-margin-bottom-30 text-center">
                    <a href="<?php echo $__subject__['apply_url']; ?>" class="btn blue-bg btn-round-lg small-text btn-xl wide-2 pix-white pix-margin-right-10 wide pix-margin-top-10">
                        <i class="fa fa-pencil"></i>
                        <span>
                            <strong>立即报名</strong>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>


<div class="visible-xs">
    <div class="bottom">
        <a class="tab <?php echo $controllerName=='subject'?'current':''; ?>" href="<?php echo $__subject__['url']; ?>"><i class="fa fa-home"></i>首页</a>
        <a class="tab <?php echo $controllerName=='rank'?'current':''; ?>" href="<?php echo $__subject__['rank_url']; ?>"><i class="fa fa-bar-chart"></i>排行榜</a>
        <?php if($__subject__['isapply']): ?>
        <a class="tab <?php echo $controllerName=='apply'?'current':''; ?>" href="<?php echo $__subject__['apply_url']; ?>"><i class="fa fa-pencil-square-o"></i>报名</a>
        <?php endif; ?>
        <a class="tab <?php echo $controllerName=='share'?'current':''; ?> btn-share" data-type="timeline" href="javascript:"><i class="fa fa-share-alt"></i>分享</a>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; <?php echo $site['name']; ?> 2020</p>
                <p><a href="http://www.beian.miit.gov.cn/" target="_blank"><?php echo $site['beian']; ?></a></p>
            </div>
        </div>
    </div>
</footer>

<script id="sharetpl" type="text/html">
    <div id="sharenow" style="padding:20px;">
        <div class="row text-center">
            <div class="col-xs-12">
                <img src="<?php echo addon_url('vote/qrcode/build'); ?>?text=<%=url%>&logo=1&logosize=50&padding=0" width="120" alt="">
                <div class="my-2">
                    扫码分享到微信
                </div>
            </div>
        </div>
        <div class="row text-center mt-3 pt-2">
            <div class="col-xs-4">
                <a href="http://service.weibo.com/share/share.php?url=<%=url%>&title=<%=title%>" target="_blank">
                <span class="fa-stack fa-lg text-danger">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-weibo fa-stack-1x fa-inverse"></i>
                </span><br>
                    分享到微博
                </a>
            </div>
            <div class="col-xs-4">
                <a href="javascript:" class="btn-share-wechat">
                <span class="fa-stack fa-lg text-success">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-wechat fa-stack-1x fa-inverse"></i>
                </span><br>
                    分享到微信
                </a>
            </div>
            <div class="col-xs-4">
                <a href="https://connect.qq.com/widget/shareqq/index.html?url=<%=url%>&title=<%=title%>&desc=&summary=&site=<?php echo $site['name']; ?>" target="_blank">
                <span class="fa-stack fa-lg text-info">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-qq fa-stack-1x fa-inverse"></i>
                </span><br>
                    分享到QQ
                </a>
            </div>
        </div>
    </div>
</script>

<!--分享引导框开始-->
<script type="text/html" id="wxsharetpl">
    <div class="text-right">
        <img src="/assets/addons/vote/img/guide_tips.png" width="300px">
        <img src="/assets/addons/vote/img/guide_btn.png" width="100px" onclick="layer.closeAll();" style="margin-right:100px;">
    </div>
</script>
<!--分享引导框结束-->

<script type="text/javascript" src="/assets/libs/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/libs/fastadmin-layer/dist/layer.js"></script>
<script type="text/javascript" src="/assets/libs/art-template/dist/template-native.js"></script>
<script type="text/javascript" src="/assets/addons/vote/js/jquery.countdown.js"></script>
<script type="text/javascript" src="/assets/addons/vote/js/clipboard.min.js"></script>
<script type="text/javascript" src="/assets/addons/vote/js/swiper.min.js"></script>
<script type="text/javascript" src="/assets/addons/vote/js/vote.js?v=<?php echo $site['version']; ?>"></script>
<script type="text/javascript" src="/assets/addons/vote/js/common.js?v=<?php echo $site['version']; ?>"></script>

<?php if($isWechat): ?>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<?php endif; ?>

{__SCRIPT__}

</body>
</html>

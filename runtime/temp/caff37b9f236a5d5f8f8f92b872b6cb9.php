<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:67:"/home/www/admin/localhost_9005/wwwroot/addons/vote/view/player.html";i:1618147662;s:74:"/home/www/admin/localhost_9005/wwwroot/addons/vote/view/common/layout.html";i:1618148386;}*/ ?>
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



<div class="pix_section pix-padding-v-85 pix-cover-bg" id="header" style="background-image: linear-gradient(rgba(<?php echo implode($__player__['rgb'],','); ?>, 0.75), rgba(<?php echo implode($__player__['rgb'],','); ?>, 0.75)), url('<?php echo cdnurl($__player__['banner']); ?>');">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content text-center">
                    <div class="pix-margin-bottom-30 header-logo">
                        <a href="javascript:" class="pix-circle-btn">
                            <img src="<?php echo cdnurl($__player__['image']); ?>" class="img-circle" width="120" height="120" alt="">
                        </a>
                    </div>
                    <h2 class="pix-white text-center pix-no-margin-top secondary-font">
                        <span><strong><?php echo $__player__['nickname']; ?></strong></span>
                    </h2>
                    <h5 class="pix-white text-center">
                        <span><?php echo $__player__['intro']; ?></span>
                    </h5>
                    <div class="pix-content text-center player-item">
                        <h2 class="pix-white pix-no-margin-top">
                            <span><strong>当前票数：<span data-to="<?php echo $__player__['votes']; ?>" class="number-count"><?php echo number_format($__player__['votes']); ?></span> 票</strong></span>
                        </h2>
                        <p class="pix-white pix-padding-20">
                            <span class="pix-margin-right-10">排名：<?php echo $__player__['rank']; ?></span>
                            <!--<span class="pix-margin-right-10">分类排名：<?php echo $__player__['category_rank']; ?></span>-->
                            <span>得票占比：<?php echo $__player__->getPercent($__subject__['votes']); ?> %</span>
                        </p>
                        <a href="javascript:" data-id="<?php echo $__player__['id']; ?>" class="btn orange-bg btn-round-lg small-text btn-xl wide-2 pix-white pix-margin-right-10 wide pix-margin-top-10 btn-vote <?php echo $__subject__['status']=='expired'?'disabled':''; ?>">
                            <i class="fa fa-thumbs-up"></i>
                            <!--@formatter:off-->
                            <?php if($__player__['voted']): ?>
                                <span><strong><?php if($__subject__['pervotelimit']==1): ?>已投票<?php else: ?>已投 <ins><?php echo $__player__['voted']; ?></ins> 票<?php endif; ?></strong></span>
                            <?php elseif(($__subject__['status'] == 'expired')): ?>
                                <span><strong>已结束</strong></span>
                            <?php else: ?>
                                <span><strong>投一票</strong></span>
                            <?php endif; ?>
                            <!--@formatter:on-->
                        </a>
                    </div>
                    <div class="pix-margin-top-50">
                        <a href="javascript:" class="small-social btn-share" data-type="timeline">
                            <i class="iconfont icon-pengyouquan pix-light-white"></i>
                        </a>
                        <a href="javascript:" class="small-social btn-share" data-type="friend">
                            <i class="iconfont icon-weixin pix-light-white"></i>
                        </a>
                        <a href="javascript:" class="small-social btn-copylink" data-clipboard-text="<?php echo request()->url(true); ?>">
                            <i class="iconfont icon-copylink pix-light-white"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="pix_section pix-padding-v-65" id="intro" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content pix-padding-bottom-30">
                    <h2 class="pix-black-gray-dark text-center pix-no-margin-top secondary-font">
                        <span><strong><?php echo $__subject__['playername']; ?>介绍</strong></span>
                    </h2>
                    <div class="pix-black-gray-light big-text text-center">
                        <span>关于此参选<?php echo $__subject__['playername']; ?>的详细介绍</span>
                    </div>
                </div>
            </div>
            <div class="col-md-10 col-xs-12 col-sm-12 column col-md-offset-1">
                <div class="pix-content text-left">
                    <div class="pix-gray detail">
                        <?php echo $__player__['content']; ?>
                    </div>
                </div>
                <div class="pix-content text-center pix-margin-top-30">
                    <a href="javascript:" data-id="<?php echo $__player__['id']; ?>" class="btn orange-bg btn-round-lg small-text btn-xl wide-2 pix-white pix-margin-right-10 wide pix-margin-top-10 btn-vote">
                        <i class="fa fa-thumbs-up"></i>
                        <span>
                            <strong>立即投票</strong>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if($__subject__['iscomment']): ?>
<div class="pix_section pix-padding-v-40 bg-white" id="comment" style="display: block;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 column">
                <div class="pix-content pix-padding-bottom-30">
                    <h2 class="pix-black-gray-dark text-center pix-no-margin-top secondary-font">
                        <span><strong>评论列表</strong></span>
                    </h2>
                    <div class="pix-black-gray-light big-text text-center">
                        <span>你可以在此对参选<?php echo $__subject__['playername']; ?>进行评论</span>
                    </div>
                </div>
            </div>
            <div class="col-md-10 col-xs-12 col-sm-10 column col-md-offset-1">
                <div class="pix-content pix-margin-v-30">
                    <?php if(is_array($commentList) || $commentList instanceof \think\Collection || $commentList instanceof \think\Paginator): if( count($commentList)==0 ) : echo "" ;else: foreach($commentList as $key=>$item): ?>
                    <div class="media">
                        <div class="media-right media-top text-center media-box-area">
                            <div class="pix-inner">
                                <div class="pix-round-shape-80 pix-margin-h-10">
                                    <img src="<?php echo cdnurl($item['user']['avatar']); ?>" class="img-circle" width="80" height="80" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="media-body media-top media-box-area">
                            <div class="pix-inner">
                                <p class="pix-blue-light-2 small-text pix-no-margin-top">
                                    <span><b><?php echo $item['user']['nickname']; ?></b></span>
                                    <span>发布于 <b><?php echo human_date($item['createtime']); ?></b></span>
                                </p>
                                <p class="pix-black-gray-light small-text pix-margin-bottom-30">
                                    <span><?php echo $item['content']; ?></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; if($commentList->hasPages()): ?>
                        <div class="pager text-center pix-padding-top-30">
                            <?php echo $commentList->render();; ?>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
            <div class="col-md-10 col-xs-12 col-sm-10 column col-md-offset-1">
                <div class="pix-content pix-padding-bottom-30 pix-margin-v-30 text-center">
                    <a href="javascript:" class="btn blue-bg btn-round-lg small-text btn-xl wide-2 pix-white pix-margin-right-10 wide pix-margin-top-10" data-toggle="modal" data-target="#postcomment">
                        <i class="fa fa-comment"></i>
                        <span>
                            <strong>发表评论</strong>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="postcomment" class="modal pix_popup" role="dialog" aria-hidden="true" style="display: none;" data-name="postcomment">
    <div class="modal-dialog modal-sm-2">
        <div class="modal-content gray-bg">
            <div class="modal-header">
                <a href="#" class="close" data-dismiss="modal">×</a>
            </div>
            <div class="modal-body">
                <div class="pix_section animating modal-section popup_section" style="display: block;">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-xs-12 text-center col-sm-12 column">
                                <div class="pix-content text-center animating">
                                    <div class="pix-padding-bottom-20">
                                        <i class="pixicon-clipboard big-icon pix-orange"></i>
                                    </div>
                                    <h5 class="pix-black-gray-dark pix-no-margin-top">
                                        <span class="pix_edit_text"><strong>发表评论</strong></span>
                                    </h5>
                                    <p class="pix-black-gray pix-margin-bottom-30">
                                        <span class="pix_edit_text">
                                            感谢你对参选<?php echo $__subject__['playername']; ?>的支持！
                                        </span>
                                    </p>
                                    <div class="pix-margin-bottom-30">
                                        <form id="postform" class="pix-form-style pixfort-form pix-form-white-bg ui-sortable" action="<?php echo addon_url('vote/index/comment'); ?>" method="post">
                                            <?php echo token(); ?>
                                            <input type="hidden" name="player_id" value="<?php echo $__player__['id']; ?>">
                                            <div class="form-group">
                                                <textarea name="content" class="form-control" rows="15" placeholder="请输入你的评论内容"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-flat orange-bg pix-white btn-lg small-text btn-block"><span class="pix_edit_text"><strong>提交评论</strong></span></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>
<script data-render="script">
    $(function () {
        refresh_data();
    });
</script>


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

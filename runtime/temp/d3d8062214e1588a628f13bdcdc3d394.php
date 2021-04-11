<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:87:"/home/www/admin/localhost_9005/wwwroot/public/../application/index/view/vote/apply.html";i:1618145317;s:81:"/home/www/admin/localhost_9005/wwwroot/application/index/view/layout/default.html";i:1618145039;s:78:"/home/www/admin/localhost_9005/wwwroot/application/index/view/common/meta.html";i:1618145039;s:81:"/home/www/admin/localhost_9005/wwwroot/application/index/view/common/sidenav.html";i:1618145039;s:80:"/home/www/admin/localhost_9005/wwwroot/application/index/view/common/script.html";i:1618145039;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?> – <?php echo $site['name']; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<?php if(isset($keywords)): ?>
<meta name="keywords" content="<?php echo $keywords; ?>">
<?php endif; if(isset($description)): ?>
<meta name="description" content="<?php echo $description; ?>">
<?php endif; ?>

<link rel="shortcut icon" href="/assets/img/favicon.ico" />

<link href="/assets/css/frontend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config: <?php echo json_encode($config); ?>
    };
</script>
        <link href="/assets/css/user.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">
    </head>

    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?php echo url('/'); ?>"><?php echo $site['name']; ?></a>
                </div>
                <div class="collapse navbar-collapse" id="header-navbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<?php echo url('/'); ?>"><?php echo __('Home'); ?></a></li>
                        <li class="dropdown">
                            <?php if($user): ?>
                            <a href="<?php echo url('user/index'); ?>" class="dropdown-toggle" data-toggle="dropdown" style="padding-top: 10px;height: 50px;">
                                <span class="avatar-img"><img src="<?php echo cdnurl($user['avatar']); ?>" alt=""></span>
                            </a>
                            <?php else: ?>
                            <a href="<?php echo url('user/index'); ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo __('User center'); ?> <b class="caret"></b></a>
                            <?php endif; ?>
                            <ul class="dropdown-menu">
                                <?php if($user): ?>
                                <li><a href="<?php echo url('user/index'); ?>"><i class="fa fa-user-circle fa-fw"></i><?php echo __('User center'); ?></a></li>
                                <!--li><a href="<?php echo url('user/profile'); ?>"><i class="fa fa-user-o fa-fw"></i><?php echo __('Profile'); ?></a></li-->
                                <li><a href="<?php echo url('user/changepwd'); ?>"><i class="fa fa-key fa-fw"></i><?php echo __('Change password'); ?></a></li>
                                <li><a href="<?php echo url('user/logout'); ?>"><i class="fa fa-sign-out fa-fw"></i><?php echo __('Sign out'); ?></a></li>
                                <?php else: ?>
                                <li><a href="<?php echo url('user/login'); ?>"><i class="fa fa-sign-in fa-fw"></i> <?php echo __('Sign in'); ?></a></li>
                                <!--li><a href="<?php echo url('user/register'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Sign up'); ?></a></li-->
                                <?php endif; ?>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main class="content">
            <style>
    .panel-post {
        position: relative;
    }

    .btn-post {
        position: absolute;
        right: 0;
        bottom: 10px;
    }

    .img-border {
        border-radius: 3px;
        box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05);
    }
</style>
<div class="container mt-20">
    <div id="content-container" class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="sidebar-toggle"><i class="fa fa-bars"></i></div>
<div class="sidenav" id="sidebar-nav">
    <?php echo hook('user_sidenav_before'); ?>
    <ul class="list-group">
        <li class="list-group-heading"><?php echo __('Member center'); ?></li>
        <li class="list-group-item <?php echo check_nav_active('user/index'); ?>"> <a href="<?php echo url('user/index'); ?>"><i class="fa fa-user-circle fa-fw"></i> <?php echo __('User center'); ?></a> </li>
        <!--li class="list-group-item <?php echo check_nav_active('user/profile'); ?>"> <a href="<?php echo url('user/profile'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Profile'); ?></a> </li-->
        <li class="list-group-item <?php echo check_nav_active('user/changepwd'); ?>"> <a href="<?php echo url('user/changepwd'); ?>"><i class="fa fa-key fa-fw"></i> <?php echo __('Change password'); ?></a> </li>
        <li class="list-group-item <?php echo check_nav_active('user/logout'); ?>"> <a href="<?php echo url('user/logout'); ?>"><i class="fa fa-sign-out fa-fw"></i> <?php echo __('Sign out'); ?></a> </li>
    </ul>
    <?php echo hook('user_sidenav_after'); ?>
</div>

            </div>
            <div class="col-md-9">
                <div class="panel panel-default panel-user">
                    <div class="panel-body">
                        <div class="page-header panel-post">
                            <h2><?php echo $title; ?></h2>
                        </div>
                        <?php if(is_array($playerList) || $playerList instanceof \think\Collection || $playerList instanceof \think\Paginator): $i = 0; $__LIST__ = $playerList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                        <div class="row">
                            <div class="col-md-3 text-center">
                                <div style="padding:15px;">
                                    <a href="<?php echo $item['subject']['url']; ?>">
                                        <img class="img-responsive img-border" src="<?php echo $item['subject']['image']; ?>" onerror="this.src='/assets/addons/vote/img/noimage.jpg';this.onerror=null;">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <h4>
                                    <a href="<?php echo $item['subject']['url']; ?>" target="_blank"><?php echo $item['subject']['title']; ?></a>
                                </h4>
                                <p class="text-muted">报名时间：<?php echo datetime($item['createtime']); ?></p>
                                <div>
                                    <?php if($item['status'] == 'normal'): ?>
                                    <a class="btn btn-success" href="<?php echo $item['url']; ?>" target="_blank"><i class="fa fa-user"></i> 立即查看</a>
                                    <?php elseif($item['status'] == 'rejected'): ?>
                                    <a class="btn btn-danger" href="<?php echo $item['subject']['apply_url']; ?>?id=<?php echo $item['id']; ?>" data-toggle="tooltip" title="<?php echo $item['memo']; ?>"><i class="fa fa-pencil"></i> 被拒绝</a>
                                    <a class="btn btn-success" href="<?php echo $item['url']; ?>"><i class="fa fa-eye-slash"></i> 预览</a>
                                    <?php elseif($item['status'] == 'hidden'): ?>
                                    <a class="btn btn-info" href="<?php echo $item['subject']['apply_url']; ?>?id=<?php echo $item['id']; ?>" data-toggle="tooltip" title="请耐心等待后台审核,审核前你可以继续修改"><i class="fa fa-pencil"></i> 正在审核</a>
                                    <a class="btn btn-success" href="<?php echo $item['url']; ?>"><i class="fa fa-eye-slash"></i> 预览</a>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        <div class="text-center"><?php echo $playerList->isEmpty()?"暂未报名任何投票":""; ?></div>
                        <div class="pager"><?php echo $playerList->render(); ?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

        </main>

        <footer class="footer" style="clear:both">
            <p class="copyright">Copyright&nbsp;©&nbsp;2017-2020 <?php echo $site['name']; ?> All Rights Reserved <a href="https://beian.miit.gov.cn" target="_blank"><?php echo htmlentities($site['beian']); ?></a></p>
        </footer>

        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-frontend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>

    </body>

</html>

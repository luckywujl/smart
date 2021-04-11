<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:102:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/public/../application/index/view/vote/post.html";i:1618026862;s:97:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/application/index/view/layout/default.html";i:1618132724;s:94:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/application/index/view/common/meta.html";i:1618026862;s:97:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/application/index/view/common/sidenav.html";i:1618132569;s:91:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/application/index/view/vote/tpl.html";i:1618026862;s:96:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/application/index/view/common/script.html";i:1618026862;}*/ ?>
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
                            <h2><?php echo $row?'修改':'添加'; ?>投票</h2>
                        </div>
                        <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">
                            <?php echo token(); ?>
                            <div class="form-group <?php echo in_array('title', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Title'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <input id="c-title" data-rule="required" class="form-control" name="row[title]" type="text" value="<?php echo (isset($row['title']) && ($row['title'] !== '')?$row['title']:''); ?>">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('image', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Image'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <div class="input-group">
                                        <input id="c-image" data-rule="required" class="form-control" size="50" name="row[image]" type="text" value="<?php echo (isset($row['image']) && ($row['image'] !== '')?$row['image']:''); ?>">
                                        <div class="input-group-addon no-border no-padding">
                                            <span><button type="button" id="plupload-image" class="btn btn-danger plupload" data-input-id="c-image" data-mimetype="image/gif,image/jpeg,image/png,image/jpg,image/bmp" data-multiple="false" data-preview-id="p-image"><i class="fa fa-upload"></i> <?php echo __('Upload'); ?></button></span>
                                        </div>
                                        <span class="msg-box n-right" for="c-image"></span>
                                    </div>
                                    <ul class="row list-inline plupload-preview" id="p-image"></ul>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('intro', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Intro'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <textarea id="c-intro" data-rule="required" class="form-control" rows="5" name="row[intro]" cols="50"><?php echo (isset($row['intro']) && ($row['intro'] !== '')?$row['intro']:''); ?></textarea>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('content', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Content'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <textarea id="c-content" data-rule="required" class="form-control editor" rows="5" name="row[content]" cols="50"><?php echo (isset($row['content']) && ($row['content'] !== '')?$row['content']:''); ?></textarea>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('banner', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Banner'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <div class="input-group">
                                        <input id="c-banner" class="form-control" size="50" name="row[banner]" type="text" value="<?php echo (isset($row['banner']) && ($row['banner'] !== '')?$row['banner']:''); ?>">
                                        <div class="input-group-addon no-border no-padding">
                                            <span><button type="button" id="plupload-banner" class="btn btn-danger plupload" data-input-id="c-banner" data-mimetype="image/gif,image/jpeg,image/png,image/jpg,image/bmp" data-multiple="false" data-preview-id="p-banner"><i class="fa fa-upload"></i> <?php echo __('Upload'); ?></button></span>
                                            <span><button type="button" id="fachoose-banner" class="btn btn-primary fachoose" data-input-id="c-banner" data-mimetype="image/*" data-multiple="false"><i class="fa fa-list"></i> <?php echo __('Choose'); ?></button></span>
                                        </div>
                                        <span class="msg-box n-right" for="c-banner"></span>
                                    </div>
                                    <ul class="row list-inline plupload-preview" id="p-banner"></ul>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('pervotenums', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Pervotenums'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-pervotenums" data-rule="required" class="form-control" name="row[pervotenums]" type="number" value="<?php echo (isset($row['pervotenums']) && ($row['pervotenums'] !== '')?$row['pervotenums']:'5'); ?>">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('pervotelimit', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Pervotelimit'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-pervotelimit" data-rule="required" class="form-control" name="row[pervotelimit]" type="number" value="<?php echo (isset($row['pervotelimit']) && ($row['pervotelimit'] !== '')?$row['pervotelimit']:'1'); ?>">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('pagesize', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Pagesize'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-pagesize" data-rule="required" class="form-control" name="row[pagesize]" type="number" value="<?php echo (isset($row['pagesize']) && ($row['pagesize'] !== '')?$row['pagesize']:'0'); ?>" data-tip="为0表示一页显示全部">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('limitarea', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Limitarea'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <input id="c-limitarea" class="form-control" name="row[limitarea]" type="hidden" value="<?php echo (isset($row['limitarea']) && ($row['limitarea'] !== '')?$row['limitarea']:''); ?>">
                                    <div class="city-select" id="mcs" style="max-width:493px;"></div>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('needlogin', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Needlogin'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <?php echo Form::radios('row[needlogin]',[1=>__('Yes'), 0=>__('No')],$row?$row['needlogin']:0); ?>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('onlywechat', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Onlywechat'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <?php echo Form::radios('row[onlywechat]',[1=>__('Yes'), 0=>__('No')],$row?$row['onlywechat']:0); ?>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('diyname', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Diyname'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-diyname" data-rule="required; diyname" data-id="<?php echo (isset($row['id']) && ($row['id'] !== '')?$row['id']:0); ?>" class="form-control" name="row[diyname]" type="text" value="<?php echo (isset($row['diyname']) && ($row['diyname'] !== '')?$row['diyname']:''); ?>" data-tip="用于参赛项目的URL名称">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('playername', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Playername'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-playername" class="form-control" name="row[playername]" type="text" value="<?php echo (isset($row['playername']) && ($row['playername'] !== '')?$row['playername']:'选手'); ?>" data-tip="用于显示描述参赛信息的名称，常用：选手、作品">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('isapply', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Isapply'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <?php echo Form::radios('row[isapply]',[1=>__('Yes'), 0=>__('No')],$row?$row['isapply']:0); ?>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('iscomment', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Iscomment'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <?php echo Form::radios('row[iscomment]',[1=>__('Yes'), 0=>__('No')],$row?$row['iscomment']:0); ?>
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('begintime', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Begintime'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-begintime" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[begintime]" type="text" value="<?php echo $row&&$row['begintime']?datetime($row['begintime']):''; ?>">
                                </div>
                            </div>
                            <div class="form-group <?php echo in_array('endtime', $availableFields)?'':'hidden'; ?>">
                                <label class="control-label col-xs-12 col-sm-2"><?php echo __('Endtime'); ?>:</label>
                                <div class="col-xs-12 col-sm-4">
                                    <input id="c-endtime" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[endtime]" type="text" value="<?php echo $row&&$row['endtime']?datetime($row['endtime']):''; ?>">
                                </div>
                            </div>
                            <?php if(in_array('category', $availableFields)): ?>
                            <div class="form-group">
                                <label for="c-content" class="control-label col-xs-12 col-sm-2"><?php echo __('Category'); ?>:</label>
                                <div class="col-xs-12 col-sm-8">
                                    <input id="c-category" data-rule="" class="form-control" name="category" type="text" value="<?php echo (isset($row['category']) && ($row['category'] !== '')?$row['category']:''); ?>" data-tip="多个分类请以逗号进行分隔">
                                </div>
                            </div>
                            <?php endif; if(in_array('applydata', $availableFields)): ?>
                            <div class="form-group">
                                <label for="c-content" class="control-label col-xs-12 col-sm-2"><?php echo __('Fields'); ?>:</label>
                                <div class="col-xs-12 col-sm-10">
                                    <div id="itemcontent" class="row" style="padding:10px;background:#eee;margin-left:0;">
                                        <div class="col-xs-6">
                                           <a href="javascript:;" class="btn btn-append btn-success">追加</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>
                            <div class="form-group layer-footer">
                                <label class="control-label col-xs-12 col-sm-2"></label>
                                <div class="col-xs-12 col-sm-8">
                                    <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
                                    <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
                                </div>
                            </div>
                        </form>
                        <script>
    var typelist = <?php echo json_encode($typeList); ?>;
    var contentlist = <?php echo $row&&$row['applyfield_list']?json_encode($row['applyfield_list']):'[]'; ?>;
</script>
<style>
    .iteminner {margin-bottom:15px;border-bottom:1px solid #ddd;}
</style>
<script id="itemtpl" type="text/html">
    <div class="col-xs-6 iteminner">
        <input type="hidden" name="applyfield[<%=i%>][id]" value="<%=id?id:0%>">
        <div class="form-group">
            <div class="control-label col-xs-4"><span class="text-danger">*</span> 类型</div>
            <div class="col-xs-8">
                <select name="applyfield[<%=i%>][type]" <%=readonly?'readonly':''%> class="form-control">
                    <%for(var m in typelist){%>
                    <option value="<%=m%>" <%=m==type?'selected':''%>><%=typelist[m]%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="control-label col-xs-4"><span class="text-danger">*</span> 变量名</div>
            <div class="col-xs-8">
                <input type="text" name="applyfield[<%=i%>][name]" <%=readonly?'readonly':''%> class="form-control" value="<%=name%>" />
            </div>
        </div>
        <div class="form-group">
            <div class="control-label col-xs-4"><span class="text-danger">*</span> 标题</div>
            <div class="col-xs-8">
                <input type="text" name="applyfield[<%=i%>][title]" <%=readonly?'readonly':''%> class="form-control" value="<%=title%>" />
            </div>
        </div>
        <div class="form-group">
            <div class="control-label col-xs-4">默认值</div>
            <div class="col-xs-8">
                <input type="text" name="applyfield[<%=i%>][defaultvalue]" class="form-control" value="<%=defaultvalue%>" />
            </div>
        </div>
        <div class="form-group multiple">
            <div class="control-label col-xs-4">数据列表</div>
            <div class="col-xs-8">
                <textarea name="applyfield[<%=i%>][content]" <%=['select','selects','checkbox','radio'].indexOf(type)>-1?'':'readonly'%> cols="30" rows="3" class="form-control" data-rule="required"><%=content%></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="control-label col-xs-4"></div>
            <div class="col-xs-8">
                <a href="javascript:;" class="btn btn-primary btn-dragsort btn-xs"><i class="fa fa-arrows"></i></a> 
                <%if(['mobile', 'name', 'gender', 'ethnic'].indexOf(name)==-1){%>
                <a href="javascript:;" class="btn btn-danger btn-delone btn-xs"><i class="fa fa-trash"></i></a>
                <%}%>
            </div>
        </div>
    </div>
    <%if(line%2==0){%>
    <div class="clearfix"></div>
    <%}%>
</script>
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

<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:100:"/media/luckywujl/data/www/admin/localhost_9005/wwwroot/addons/vote/view/hook/user_sidenav_after.html";i:1618026862;}*/ ?>
<ul class="list-group">
    <li class="list-group-heading"><?php echo __('投票管理'); ?></li>
    <?php if(in_array('subject', $usersidebar)): ?>
    <li class="list-group-item <?php echo check_nav_active('vote/subject'); ?>"><a href="<?php echo url('index/vote/subject'); ?>"><i class="fa fa-pencil fa-fw"></i> <?php echo __('我创建的投票'); ?></a></li>
    <?php endif; if(in_array('apply', $usersidebar)): ?>
    <li class="list-group-item <?php echo check_nav_active('vote/apply'); ?>"><a href="<?php echo url('index/vote/apply'); ?>"><i class="fa fa-users fa-fw"></i> <?php echo __('我报名的投票'); ?></a></li>
    <?php endif; if(in_array('record', $usersidebar)): ?>
    <li class="list-group-item <?php echo check_nav_active('vote/record'); ?>"><a href="<?php echo url('index/vote/record'); ?>"><i class="fa fa-list fa-fw"></i> <?php echo __('我的投票记录'); ?></a></li>
    <?php endif; ?>
</ul>

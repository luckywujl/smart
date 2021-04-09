<?php

return [
    'autoload' => false,
    'hooks' => [
        'action_begin' => [
            'geetest',
        ],
        'config_init' => [
            'geetest',
            'third',
        ],
        'view_filter' => [
            'vote',
        ],
        'user_sidenav_after' => [
            'vote',
        ],
    ],
    'route' => [
        '/third$' => 'third/index/index',
        '/third/connect/[:platform]' => 'third/index/connect',
        '/third/callback/[:platform]' => 'third/index/callback',
        '/third/bind/[:platform]' => 'third/index/bind',
        '/third/unbind/[:platform]' => 'third/index/unbind',
        '/vote/$' => 'vote/index/index',
        '/vote/subject/[:diyname]' => 'vote/subject/index',
        '/vote/player/[:id]' => 'vote/player/index',
        '/vote/rank/[:diyname]' => 'vote/rank/index',
        '/vote/apply/[:diyname]' => 'vote/apply/index',
    ],
    'priority' => [],
];

define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'vote/player/index/subject_id/' + Config.subject_id + location.search,
                    add_url: 'vote/player/add/subject_id/' + Config.subject_id,
                    edit_url: 'vote/player/edit/subject_id/' + Config.subject_id,
                    del_url: 'vote/player/del/subject_id/' + Config.subject_id,
                    multi_url: 'vote/player/multi/subject_id/' + Config.subject_id,
                    import_url: 'vote/player/import/subject_id/' + Config.subject_id,
                    table: 'vote_player',
                }
            });

            var table = $("#table");

            var columns = [
                {checkbox: true},
                {field: 'id', title: __('Id')},
                {field: 'subject_id', title: __('Subject_id'), formatter: Table.api.formatter.search},
                {field: 'subject.title', title: __('Subject_title'), formatter: Table.api.formatter.search},
                {field: 'user_id', title: __('User_id'), formatter: Table.api.formatter.search},
                {field: 'user.nickname', title: __('Nickname'), formatter: Table.api.formatter.search},
                {field: 'category_id', title: __('Category_id'), formatter: Table.api.formatter.search},
                {field: 'category.name', title: __('Category_name'), formatter: Table.api.formatter.search},
                {field: 'number', title: __('Number')},
                {field: 'nickname', title: __('Player_Nickname')},
                {field: 'image', title: __('Image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                {field: 'bgcolor', title: __('Bgcolor'), visible: false},
                {field: 'banner', title: __('Banner'), visible: false, operate: false, formatter: Table.api.formatter.image},
                {field: 'votes', title: __('Votes'), sortable: true},
                {field: 'views', title: __('Views'), sortable: true},
                {field: 'comments', title: __('Comments'), sortable: true},
                {
                    field: 'url', title: __('Url'), operate: false, formatter: function (value, row, index) {
                        return '<a href="' + value + '" class="btn btn-xs btn-info" target="_blank"><i class="fa fa-link"></i></a>';
                    }
                },
                {field: 'createtime', title: __('Createtime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                {field: 'updatetime', title: __('Updatetime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime, visible: false},
                {field: 'votetime', title: __('Votetime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime, visible: false},
                {field: 'status', title: __('Status'), searchList: {"normal": __('Normal'), "hidden": __('Hidden')}, formatter: Table.api.formatter.status},
            ];

            console.log(Config.fields);
            if (typeof Config.fields !== 'undefined') {
                //动态追加字段
                $.each(Config.fields, function (i, j) {
                    var data = {field: "applydata." + j.name, title: j.title, operate: false, cellStyle: {classes: "applydata"}};
                    //如果是图片,加上formatter
                    if (j.type == 'image') {
                        data.events = Table.api.events.image;
                        data.formatter = Table.api.formatter.image;
                    } else if (j.type == 'images') {
                        data.events = Table.api.events.image;
                        data.formatter = Table.api.formatter.images;
                    } else if (j.type == 'radio' || j.type == 'checkbox' || j.type == 'select' || j.type == 'selects') {
                        data.formatter = Controller.api.formatter.content;
                        data.extend = j.content_list;
                        data.searchList = j.content_list;
                    }
                    columns.push(data);
                });
            }

            columns.push({
                field: 'operate', title: __('Operate'), width: 230, table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate, buttons: [
                    {
                        name: "recorddata",
                        title: function (row) {
                            return "获得投票数据" + "[" + row.nickname + "]";
                        },
                        icon: "fa fa-list-ul",
                        text: "投票数据",
                        classname: "btn btn-xs btn-warning btn-dialog",
                        url: "vote/record/index?player_id={ids}",
                        'extend': 'data-area=\'["95%","95%"]\''
                    },
                    {
                        name: "commentdata",
                        title: function (row) {
                            return "获得评论数据" + "[" + row.nickname + "]";
                        },
                        icon: "fa fa-list-ul",
                        text: "评论数据",
                        classname: "btn btn-xs btn-info btn-dialog",
                        url: "vote/comment/index?player_id={ids}",
                        'extend': 'data-area=\'["95%","95%"]\''
                    }
                ]
            });
            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    columns
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                $("#c-category_id").data("params", function (obj) {
                    return {custom: {subject_id: $("#c-subject_id").val()}};
                });
                $("#c-subject_id").data("eSelect", function (obj) {
                    //项目变更时需要重置分类
                    $("#c-category_id").selectPageClear();
                    $("#c-category_id_text").data("selectPageObject").option.data = "vote/category/index/subject_id/" + $("#c-subject_id").val();
                });
                Form.api.bindevent($("form[role=form]"));
            },
            formatter: {
                content: function (value, row, index) {
                    var extend = this.extend;
                    if (!value) {
                        return '';
                    }
                    var valueArr = value.toString().split(/,/);
                    var result = [];
                    $.each(valueArr, function (i, j) {
                        result.push(typeof extend[j] !== 'undefined' ? extend[j] : j);
                    });
                    return result.join(',');
                }
            },
        }
    };
    return Controller;
});

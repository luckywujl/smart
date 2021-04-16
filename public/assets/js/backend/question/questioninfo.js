define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'question/questioninfo/index' + location.search,
                    add_url: 'question/questioninfo/add',
                    edit_url: 'question/questioninfo/edit',
                    del_url: 'question/questioninfo/del',
                    multi_url: 'question/questioninfo/multi',
                    import_url: 'question/questioninfo/import',
                    table: 'question_info',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'question_id',
                sortName: 'question_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'question_id', title: __('Question_id')},
                        {field: 'question_title', title: __('Question_title'), operate: 'LIKE'},
                        {field: 'question_content', title: __('Question_content')},
                        {field: 'question_user_id', title: __('Question_user_id'), operate: 'LIKE',visable:false},
                        {field: 'question_user', title: __('Question_user'), operate: 'LIKE'},
                        {field: 'question_user_tel', title: __('Question_user_tel'), operate: 'LIKE'},
                        {field: 'question_type', title: __('Question_type'), operate: 'LIKE',formatter: Table.api.formatter.search},
                        {field: 'question_datetime', title: __('Question_datetime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'question_files', title: __('Question_files'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                       // {field: 'image', title: __('Image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'question_operaotr', title: __('Question_operaotr'), operate: 'LIKE'},
                        {field: 'question_operate_option', title: __('Question_operate_option'), operate: 'LIKE'},
                        {field: 'question_status', title: __('Question_status'), searchList: {"0":__('Question_status 0'),"1":__('Question_status 1'),"2":__('Question_status 2'),"3":__('Question_status 3'),"4":__('Question_status 4')}, formatter: Table.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
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
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
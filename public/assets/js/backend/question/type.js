define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'question/type/index' + location.search,
                    add_url: 'question/type/add',
                    edit_url: 'question/type/edit',
                    del_url: 'question/type/del',
                    multi_url: 'question/type/multi',
                    import_url: 'question/type/import',
                    table: 'question_type',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'question_type_id',
                sortName: 'question_type_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'question_type_id', title: __('Question_type_id')},
                        {field: 'question_type', title: __('Question_type'), operate: 'LIKE'},
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
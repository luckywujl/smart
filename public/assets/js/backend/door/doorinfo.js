define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'door/doorinfo/index' + location.search,
                    add_url: 'door/doorinfo/add',
                    edit_url: 'door/doorinfo/edit',
                    del_url: 'door/doorinfo/del',
                    multi_url: 'door/doorinfo/multi',
                    import_url: 'door/doorinfo/import',
                    table: 'door_info',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'door_id',
                sortName: 'door_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'door_id', title: __('Door_id')},
                        {field: 'door_code', title: __('Door_code'), operate: 'LIKE'},
                        {field: 'door_name', title: __('Door_name'), operate: 'LIKE'},
                        {field: 'IO_garden', title: __('Io_garden'), operate: 'LIKE'},
                        {field: 'door_type', title: __('Door_type'), searchList: {"0":__('Door_type 0'),"1":__('Door_type 1')}, formatter: Table.api.formatter.normal},
                        {field: 'door_ip', title: __('Door_ip'), operate: 'LIKE'},
                        {field: 'door_port', title: __('Door_port'), operate: 'LIKE'},
                        {field: 'door_username', title: __('Door_username'), operate: 'LIKE'},
                        {field: 'door_password', title: __('Door_password'), operate: 'LIKE'},
                        {field: 'door_channlno', title: __('Door_channlno'), operate: 'LIKE'},
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
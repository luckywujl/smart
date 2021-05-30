define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'door/doorrecord/index' + location.search,
                    add_url: 'door/doorrecord/add',
                    edit_url: 'door/doorrecord/edit',
                    del_url: 'door/doorrecord/del',
                    multi_url: 'door/doorrecord/multi',
                    import_url: 'door/doorrecord/import',
                    table: 'door_record',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'record_id',
                sortName: 'record_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'record_id', title: __('Record_id')},
                        //{field: 'record_door_id', title: __('Record_door_id'), operate: 'LIKE'},
                        {field: 'doorinfo.door_code', title: __('Doorinfo.door_code'), operate: 'LIKE'},
                        {field: 'doorinfo.door_name', title: __('Doorinfo.door_name'), operate: 'LIKE'},
                        {field: 'doorinfo.door_ip', title: __('Doorinfo.door_ip'), operate: 'LIKE'},
                        {field: 'doorinfo.IO_garden', title: __('Doorinfo.io_garden'), operate: 'LIKE'},
                        {field: 'record_user', title: __('Record_user'), operate: 'LIKE'},
                        {field: 'record_send_time', title: __('Record_send_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'record_excute_time', title: __('Record_excute_time'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'record_type', title: __('Record_type'), operate: 'LIKE'},
                        {field: 'record_status', title: __('Record_status'), searchList: {"0":__('Record_status 0'),"1":__('Record_status 1'),"2":__('Record_status 2')}, formatter: Table.api.formatter.status},
                        //{field: 'doorinfo.door_id', title: __('Doorinfo.door_id')},
                        
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
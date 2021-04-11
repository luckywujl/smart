define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'vote/fields/index/subject_id/' + Config.subject_id + '/' + location.search,
                    add_url: 'vote/fields/add/subject_id/' + Config.subject_id,
                    edit_url: 'vote/fields/edit/subject_id/' + Config.subject_id,
                    del_url: 'vote/fields/del/subject_id/' + Config.subject_id,
                    multi_url: 'vote/fields/multi/subject_id/' + Config.subject_id,
                    table: 'vote_fields',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                pagination: false,
                search: false,
                commonSearch: false,
                columns: [
                    [
                        {
                            field: 'state', checkbox: true, formatter: function (value, row, index) {
                                if (row.state === false) {
                                    return {
                                        disabled: true,
                                    }
                                } else {
                                    return {
                                        disabled: false,
                                    }
                                }
                            }
                        },
                        {
                            field: 'id', sortable: true, title: __('Id'), formatter: function (value, row, index) {
                                return isNaN(value) ? '-' : value;
                            }
                        },
                        {field: 'subject_id', visible: false, operate: false, title: __('Subject_id')},
                        {
                            field: 'name', title: __('Name'), formatter: function (value, row, index) {
                                return row.issystem ? "<span class='text-muted'>" + value + "</span>" : value;
                            }
                        },
                        {
                            field: 'type', title: __('Type'), formatter: function (value, row, index) {
                                return row.issystem ? "<span class='text-muted'>" + value + "</span>" : value;
                            }
                        },
                        {
                            field: 'title', title: __('Title'), formatter: function (value, row, index) {
                                return row.issystem ? "<span class='text-muted'>" + value + "</span>" : value;
                            }
                        },
                        {
                            field: 'iscontribute', title: __('Iscontribute'), searchList: {"1": __('Yes'), "0": __('No')}, formatter: function (value, row, index) {
                                return row.issystem && ["nickname", "intro", "content", "image"].indexOf(row.name) === -1 ? "-" : Table.api.formatter.toggle.call(this, value, row, index);
                            }
                        },
                        {field: 'weigh', title: __('Weigh'), visible: false},
                        {field: 'createtime', title: __('Createtime'), visible: false, operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), visible: false, operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {
                            field: 'status', title: __('Status'), formatter: function (value, row, index) {
                                return row.issystem ? "-" : Table.api.formatter.status.call(this, value, row, index);
                            }
                        },
                        {
                            field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,
                            formatter: function (value, row, index) {
                                return row.issystem ? "<div style='height:26px;line-height:26px;'>-</div>" : Table.api.formatter.operate.call(this, value, row, index);
                            }
                        }
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
                //渲染关联显示字段和存储字段
                var renderselect = function (id, data, defaultvalue) {
                    var html = [];
                    for (var i = 0; i < data.length; i++) {
                        html.push("<option value='" + data[i].name + "' " + (defaultvalue == data[i].name ? "selected" : "") + " data-subtext='" + data[i].title + "'>" + data[i].name + "</option>");
                    }
                    var select = $(id);
                    $(select).html(html.join(""));
                    select.trigger("change");
                    if (select.data("selectpicker")) {
                        select.selectpicker('refresh');
                    }
                };
                //关联表切换
                $(document).on('change', "#c-selectpage-table", function (e, first) {
                    var that = this;
                    Fast.api.ajax({
                        url: "vote/ajax/get_fields_list",
                        data: {table: $(that).val()},
                    }, function (data, ret) {
                        renderselect("#c-selectpage-primarykey", data.fieldList, first ? $("#c-selectpage-primarykey").data("value") : '');
                        renderselect("#c-selectpage-field", data.fieldList, first ? $("#c-selectpage-field").data("value") : '');
                        return false;
                    });
                    return false;
                });
                //如果编辑模式则渲染已知数据
                if (['selectpage', 'selectpages'].indexOf($("#c-type").val()) > -1) {
                    $("#c-selectpage-table").trigger("change", true);
                }

                //不可见的元素不验证
                $("form#add-form").data("validator-options", {ignore: ':hidden'});
                $(document).on("change", "#c-type", function () {
                    $(".tf").addClass("hidden");
                    $(".tf.tf-" + $(this).val()).removeClass("hidden");

                });
                Form.api.bindevent($("form[role=form]"));
                $("#c-type").trigger("change");
            }
        }
    };
    return Controller;
});

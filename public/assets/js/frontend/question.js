define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
      
        post: function () {
           // Controller.api.bindevent();
            Form.api.bindevent($("form[role=form]"), function(data, ret){//绑定时间
            //给表单绑定新的回调函数 接收 控制器 success(msg,url,data)或者error(msg,url,data)
            //
             
             Toastr.success(ret.msg);
                setTimeout(function () {
                    location.href = ret.url;
                }, 2000);
            return false;    
        	}, function(data, ret){
           console.error("错误");
        	});
        },
        record: function () {
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
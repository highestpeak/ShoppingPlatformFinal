<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单管理</title>

    <!-- 注意使用adminlte文件夹的css，js文件(教程视频有) -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <header class="main-header">

        <a href="index2.html" class="logo">
            <span class="logo-lg"><b>汤</b>达人</span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">User Name</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- 添加左侧功能区 -->
    <!-- 添加左侧功能区 -->
    <aside class="main-sidebar">
        <section class="sidebar" style="height: auto;">
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                    <i class="fa fa-search"></i>
                    </button>
                </span>
                </div>
            </form>

            <!-- 增加功能栏目 -->
            <ul class="sidebar-menu tree" data-widget="tree">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/">
                        <i class="fa fa-home"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">主页</font></font></span>
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/admin/classifyManage">
                        <i class="fa fa-book"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">分类管理</font></font></span>
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/admin/goodsManage">
                        <i class="fa fa-tag"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">商品管理</font></font></span>
                    </a>
                </li>

                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/orderManage">
                        <i class="fa fa-shopping-cart"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">订单管理</font></font></span>
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/admin/userManage">
                        <i class="fa fa-user"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">用户管理</font></font></span>
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/admin/storeInfoManage">
                        <i class="fa fa-info-circle"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">商店信息</font></font></span>
                    </a>
                </li>
            </ul>
        </section>
    </aside>

    <div class="content-wrapper" style="min-height: 1000px;">
        <!-- 在此处添加内容 -->
        <section class="content-header">
            <h1>
                订单列表
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">用户管理</li>
            </ol>


        </section>

        <!-- Main content -->
        <section class="content container-fluid">

            <div class="row">
                <div class="col-xs-12">

                    <!-- /.box -->

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">订单信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="example" class="table" >
                                        <thead>
                                        <tr>
                                            <input value="1" id="user_id">user_id</input>
                                            <th class="sorting_asc" tabindex="0" aria-controls="example"
                                                aria-sort="ascending"
                                                aria-label="订单号: activate to sort column descending">订单号
                                            </th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="example"
                                                aria-sort="ascending"
                                                aria-label="买家ID: activate to sort column descending">买家ID
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="付款金额: activate to sort column ascending">付款金额
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="是否支付: activate to sort column ascending">是否支付
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="支付时间: activate to sort column ascending">支付时间
                                            </th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="example"
                                                aria-sort="ascending"
                                                aria-label="快递单号: activate to sort column descending">快递单号
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="订单状态: activate to sort column ascending">订单状态
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="创建时间: activate to sort column ascending">创建时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="更新时间: activate to sort column ascending">更新时间
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="评论: activate to sort column ascending">评论
                                            </th>
                                            <th width="120px">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbodyId">
                                        <tr>
                                            <td><button type="button" class="btn_mod">测试用，属性没放齐导致快速搜索等功能失效</button></td>
                                        </tr>
                                        </tbody>
                                    </table>



                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->

    </div>

</div>

<!-- 修改订单表格 -->
<div class="box box-info" id="order_info_modify_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">修改订单</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">订单号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="order_id">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">买家id</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="buyer_id">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">付款金额</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="pay_price">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">是否支付</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="is_pay">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">支付时间</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="pay_time">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">快递单号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="express_id">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">订单状态</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="status">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">创建时间</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="create_time">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">更新时间</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="update_time">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">评论</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="comment">
                </div>
            </div>
        </div>


        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="order_info_mod_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="order_info_mod_sumbit">提交</button>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/layer/layer.js"></script>

<script>
    $(function(){
        var dataSend = {
            store_id:"0000"
        };

        $.ajax({
            type: "GET",
            url: "http://localhost:8080/orders/",//请求controller方法   
            data: JSON.stringify(dataSend),//发送的数据  
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false, //同步请求，注意此字段    
            success: function (data) {
                if(data.success == true){

                    var $tbody = $("#tbodyId");
                    var gl = data.cartList;
                    $.each(gl,function (i,e) {
                        var $tr = $("<tr>")
                            .append($("<td>").html(e["order_id"]))
                            .append($("<td>").html(e["buyer_id"]))
                            .append($("<td>").html(e["pay_price"]))
                            .append($("<td>").html(e["is_pay"]))
                            .append($("<td>").html(e["express_id"]))
                            .append($("<td>").html(e["status"]))
                            .append($("<td>").html(e["create_time"]))
                            .append($("<td>").html(e["update_time"]))
                            .append($("<td>").html(e["comment"]));
                        var $button_1 = document.createElement("a");
                        $button_1.text = "修改";
                        $button_1.className = "btn_mod";
                        var $button_2 = document.createElement("a");
                        $button_2.text = "删除";
                        $button_2.className = "btn_del";
                        $button_2.style = "margin-left:10px";
                        var $td = $("<td>").append($button_1).append($button_2);
                        $tr.append($td);
                        $tbody.append($tr);
                    });
                }else{
                    layer.alert("数据请求失败！");
                }
            }
        });
    })
</script>
<script type="text/javascript">
    $(function () {
        $(".content").on("click", ".btn_del", function () {
            var $tr = $(this).parents("tr");
            var order_id = $tr.find("td:eq(0)").html();
            var dataSend = {
                order_id:order_id
            };
            layer.confirm('确定删除: '+order_id+"?", {icon: 3, title:'提示'}, function(index){
                $.ajax({
                    type: "DELETE",
                    url: "http://localhost:8080/goods/orders/",
                    data: JSON.stringify(dataSend),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if(data.success == true){
                            layer.alert('删除成功！', { icon: 1, closeBtn: 0 }, function (index) {
                                window.location.reload();
                            });

                        }else{
                            layer.alert('修改失败！', { icon: 2, closeBtn: 0 });
                        }
                    }
                });
            });
        });
        $(".content").on("click", ".btn_mod", function () {
            layer.open({
                type: 1,
                title: "",
                shadeClose: true,
                shade: 0.5,
                area: ["500px", "500px"],
                content: $("#order_info_modify_table")
            });

            var $tr = $(this).parents("tr");

            $("#order_id").attr("value", $tr.find("td:eq(0)").html());
            $("#buyer_id").attr("value", $tr.find("td:eq(1)").html());
            $("#pay_price").attr("value", $tr.find("td:eq(2)").html());
            $("#is_pay").attr("value", $tr.find("td:eq(3)").html());
            $("#pay_time").attr("value", $tr.find("td:eq(4)").html());
            $("#express_id").attr("value", $tr.find("td:eq(5)").html());
            $("#status").attr("value", $tr.find("td:eq(6)").html());
            $("#create_time").attr("value", $tr.find("td:eq(7)").html());
            $("#comment").attr("value", $tr.find("td:eq(8)").html());
        });

        $("#order_info_mod_sumbit").click(function(){
            var dataSend = {
                order_id:$("#order_id").val(),
                buyer_id:$("#buyer_id").val(),
                pay_price:$("#pay_price").val(),
                is_pay:$("#is_pay").val(),
                pay_time:$("#pay_time").val(),
                express_id:$("#express_id").val(),
                status:$("#status").val(),
                create_tiem:$("#create_time").val(),
                update_time:$("#update_time").val(),
                comment:$("#comment").val()
            };

            console.log(dataSend);

            $.ajax({
                type: "POST",
                url: "http://localhost:8080/??",
                data: JSON.stringify(dataSend),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    if(data.success == true){
                        layer.alert('修改成功！', { icon: 1, closeBtn: 0 }, function (index) {
                            window.location.reload();
                        });

                    }else{
                        layer.alert('修改失败！', { icon: 2, closeBtn: 0 });
                    }
                }
            });
        });

        $("#order_info_mod_cancel").click(function(){
            layer.closeAll();
        });

        $("#example").DataTable({
            'paging'      : true,
            'lengthChange': true,
            'searching'   : true,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : true,
            'stateSave':true,
            "language": {
                "paginate": {
                    "next": "下一页",
                    "previous":"上一页"

                },
                "search":"快速搜索",
                "info": "第_PAGE_页(共_PAGES_页)",
                "emptyTable":"无可用数据",
                "lengthMenu": "_MENU_ 条/页"
            }

         })
    })

</script>
</body>
</html>
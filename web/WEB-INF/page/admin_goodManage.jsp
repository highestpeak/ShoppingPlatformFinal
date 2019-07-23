<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>userManage</title>

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

                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/goodsManage">
                        <i class="fa fa-tag"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">商品管理</font></font></span>
                    </a>
                </li>

                <li>
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
                    商品管理
    
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li class="active">商品管理</li>
                </ol>
    
    
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">商品信息</h3>
                            <button class="btn btn_add" style="float:right; margin-right:10px; background:green; color:white">添加商品</button>                           
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="goodTable" class="table">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%">ID</th>
                                                <th>Store ID</th>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Pic</th>
                                                <th>Status</th>
                                                <th>Old Level</th>
                                                <th>Create Time</th>
                                                <th>Update Time</th>
                                                <th>Operation</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyId">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

</div>

<!-- 修改商品表格 -->
<div class="box box-info" id="good_info_modify_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">修改商品</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">good name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">description</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_description">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">status</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_status">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">old level</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_oldlevel">
                </div>
            </div>


            <div class="form-group">
                <label for="exampleInputFile"  class="col-sm-2 control-label">picture</label>
                <div class="col-sm-10">
                    <input type="file" id="mod_pic">
                </div>
            </div>

        </div>
    

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_info_mod_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="good_info_mod_sumbit">提交</button>
        </div>
    </form>
</div>

<!-- 添加商品表格 -->
<div class="box box-info" id="good_info_add_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">添加商品</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">store id</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_store_id"">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">good name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">description</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_description">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">status</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_status">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">old level</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_oldlevel">
                </div>
            </div>


            <div class="form-group">
                <label for="exampleInputFile"  class="col-sm-2 control-label">picture</label>
                <div class="col-sm-10">
                    <input type="file" id="add_pic">
                </div>
            </div>

        </div>

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_info_add_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="good_info_add_sumbit">提交</button>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>

<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- 添加数据 -->
<script>
    $(function(){
        var dataSend = {
            store:{
                store_id: "0000"
            },
            goodsClassify:{
                classify_name: "all"
            }
        }

        $.ajax({    
            type: "POST",    
            url: "http://localhost:8080/goods/getByClassify",//请求controller方法   
            data: JSON.stringify(dataSend),//发送的数据  
            contentType: "application/json; charset=utf-8",    
            dataType: "json",    
            async: false, //同步请求，注意此字段    
            success: function (data) {        
                if(data.success == true){

                    var $tbody = $("#tbodyId");
                    var gl = data.goodsList;
                    $.each(gl,function (i,e) {
                        var $tr = $("<tr>")
                            .append($("<td>").html(e["goods_id"]))
                            .append($("<td>").html(e["store_id"]))
                            .append($("<td>").html(e["goods_name"]))
                            .append($("<td>").html(e["description"]))
                            .append($("<td>").html(e["pic_url"]))
                            .append($("<td>").html(e["status"]))
                            .append($("<td>").html(e["old_level"]))
                            .append($("<td>").html(e["create_time"]))
                            .append($("<td>").html(e["update_time"]));
                        var $button_1 = document.createElement("a");
                        $button_1.text = "修改";
                        $button_1.className = "btn btn-xs btn-info btn_mod";
                        var $button_2 = document.createElement("a");
                        $button_2.text = "删除";
                        $button_2.className = "btn btn-xs btn-danger btn_del";
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

<script>
    $(function(){

        $("#goodTable").DataTable({
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
        });


        // 删除商品按钮
        $(".content-wrapper").on("click", ".btn_del", function(){
            var $tr = $(this).parents("tr");
            var goods_id = $tr.find("td:eq(0)").html();
            var goods_name = $tr.find("td:eq(2)").html();
            var store_id = $tr.find("td:eq(1)").html();

            var dataSend = {
                store: {
                    store_id: store_id
                },
                goodsToDel: [
                    {
                        goods_id: goods_id,
                        goods_name: goods_name
                    }
                ]
            };

            layer.confirm('确定删除: '+goods_name+"?", {icon: 3, title:'提示'}, function(index){
                $.ajax({    
                    type: "POST",    
                    url: "http://localhost:8080/goods/del",
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
                            layer.alert('删除失败！', { icon: 2, closeBtn: 0 });
                        }
                    } 
                });
            });
        });

        // 修改商品按钮
        $(".content-wrapper").on("click", ".btn_mod", function(){
            layer.open({
                type: 1,
                title: "",
                shadeClose: true,
                shade: 0.5,
                area: ["500px","500px"],
                content: $("#good_info_modify_table")
            });

            var $tr = $(this).parents("tr");
            var store_id = $tr.find("td:eq(1)").html();
            var old_goods_id = $tr.find("td:eq(0)").html();
            var old_goods_name = $tr.find("td:eq(2)").html();

            $("#mod_name").attr("value", $tr.find("td:eq(2)").html());
            $("#mod_description").attr("value", $tr.find("td:eq(3)").html());
            $("#mod_status").attr("value", $tr.find("td:eq(5)").html());
            $("#mod_oldlevel").attr("value", $tr.find("td:eq(6)").html());

            $("#good_info_mod_sumbit").click(function(){
                var dataSend = {
                    store: {
                        store_id: store_id
                    },
                    oldGoods: {
                        goods_id: old_goods_id,
                        goods_name: old_goods_name
                    },
                    newGoods: {
                        goods_id: old_goods_id,
                        goods_name: $("#mod_name").val(),
                        description: $("#mod_description").val(),
                        status: $("#mod_status").val(),
                        old_level: $("#mod_oldlevel").val()
                    }
                };

                console.log(dataSend);

                $.ajax({    
                    type: "POST",    
                    url: "http://localhost:8080/goods/modify",
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

        });

        $("#good_info_mod_cancel").click(function(){
            layer.closeAll();
        });

        // 添加商品按钮
        $(".content-wrapper").on("click", ".btn_add", function(){

            layer.open({
                type: 1,
                title: "",
                shadeClose: true,
                shade: 0.5,
                area: ["500px","500px"],
                content: $("#good_info_add_table")
            });

        });

        $("#good_info_add_cancel").click(function(){
            layer.closeAll();
        });

        $("#good_info_add_sumbit").click(function(){
            var dataSend = {
                store: {
                    store_id: $("#add_store_id").val()
                },
                goodsToAdd: [
                    {
                        goods_name:$("#add_name").val(),
                        description:$("#add_description").val(),
                        status:$("#add_status").val(),
                        old_level:$("#add_oldlevel").val(),
                    }
                ]
            };
            if(dataSend.store.store_id == '' || dataSend.goodsToAdd[0].goods_name == '')
            {
                layer.alert("请填入必要内容！");
            }else{
                $.ajax({    
                    type: "POST",    
                    url: "http://localhost:8080/goods/add",
                    data: JSON.stringify(dataSend),
                    contentType: "application/json; charset=utf-8",    
                    dataType: "json",    
                    async: false,   
                    success: function (data) {        
                        if(data.success == true){                            
                            layer.alert('添加成功！', { icon: 1, closeBtn: 0 }, function (index) {
                                window.location.reload();
                            });

                        }else{
                            layer.alert('添加失败！', { icon: 2, closeBtn: 0 });
                        }
                    } 
                });
            }
        });

    })
</script>

</body>
</html>
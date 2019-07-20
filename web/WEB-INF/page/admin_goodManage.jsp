<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品信息</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/_all-skins.min.css">

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
                            <img src="${pageContext.request.contextPath}/localLib/images/user2-160x160.jpg" class="user-image" alt="User Image">
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

            <ul class="sidebar-menu tree" data-widget="tree">
                <li class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">主要导航</font></font></li>

                <!-- 左侧功能框 -->
                <li class="active">
                    <a href="#">
                        <i class="fa fa-th"></i> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">商品管理</font></font></span>
                        <font style="vertical-align: inherit;"><span class="pull-right-container"><small class="label pull-right bg-green"></small></span></font>
                    </a>
                </li>

            </ul>

        </section>
    </aside>


    <div class="content-wrapper" style="min-height: auto;" id="content">

        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="goodTable">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>picture</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Classify</th>
                        <th>Number</th>
                        <th>Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allGood}" var="good">
                        <tr>
                            <td>${good.id}</td>
                            <td>${good.pic}</td>
                            <td>${good.name}</td>
                            <td>${good.price}</td>
                            <td>${good.classify}</td>
                            <td>${good.number}</td>
                            <td style="word-break:break-all;width: 200px">${good.description}</td>
                            <td>
                                <button class="btn btn_del" id="del" style="float:right; margin-right:10px; background:red; color:white">删除</button>
                                <button class="btn btn_mod" style="float:right; margin-right:10px; background:yellowgreen; color:white">修改</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <button class="btn btn_add" style="float:right; margin-right:10px; background:green; color:white">添加商品</button>

    </div>

</div>

</body>
<script src="${pageContext.request.contextPath}/localLib/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/demo.js"></script>
<!-- layer.js -->
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>


<script>
    $(function(){

        // 分页
        $("#goodTable").DataTable();

        // 删除商品按钮
        $(".content-wrapper").on("click", ".btn_del", function(){
            var $tr = $(this).parents("tr");
            var id = $tr.attr("id");

            layer.confirm('确定删除?', {icon: 3, title:'提示'}, function(index){
                $.ajax({
                    type: "post",
                    url: "/deleteGood",
                    data: id,
                    success: function(status){
                        layer.alert("删除成功!");
                        window.location.reload();
                    }
                });

                layer.close(index);
            });
        })

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

        });

        $("#good_info_mod_cancel").click(function(){
            layer.closeAll();
        });

        // 添加商品按钮
        $(".content-wrapper").on("click", ".btn_add", function(){
            var $div = $(this).parent().parent().parent();
            var id = $div.attr("id");

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

    });

</script>

<!-- 修改商品表格 -->
<div class="box box-info" id="good_info_modify_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">修改商品</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal" action="###" method="post">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_id" name="mod_id">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">商品名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_name" name="mod_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">价格</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_price" name="mod_price">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">分类</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_clasiify" name="mod_clasiify">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">库存</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_number" name="mod_number">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_description" name="add_number">
                </div>
            </div>

            <div class="form-group">
                <label for="exampleInputFile"  class="col-sm-2 control-label">图片</label>
                <div class="col-sm-10">
                    <input type="file" id="mod_pic" name="mod_pic">
                </div>
            </div>

        </div>

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_info_mod_cancel">取消</button>
            <button type="submit" class="btn btn-info pull-right" id="good_info_mod_sumbit">提交</button>
        </div>
    </form>
</div>

<!-- 添加商品表格 -->
<div class="box box-info" id="good_info_add_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">添加商品</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal"  action="###" method="post">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_id" name="add_id">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">商品名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_name" name="add_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">价格</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_price" name="add_price">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">分类</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_clasiify" name="add_clasiify">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">库存</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_number" name="add_number">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_description" name="add_number">
                </div>
            </div>

            <div class="form-group">
                <label for="exampleInputFile"  class="col-sm-2 control-label">图片</label>
                <div class="col-sm-10">
                    <input type="file" id="add_pic" name="add_pic">
                </div>
            </div>

        </div>

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_info_add_cancel">取消</button>
            <button type="submit" class="btn btn-info pull-right" id="good_info_add_sumbit">提交</button>
        </div>
    </form>
</div>

</html>

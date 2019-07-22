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

                <li>
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
                用户列表

            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">用户管理</li>
            </ol>


        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <section class="col-md-12 connectedSortable ui-sortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom" style="cursor: move;">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right ui-sortable-handle">
                            <li class="pull-left header"><i class="fa fa-inbox"></i> 用户统计</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->
                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                <svg height="300" version="1.1" width="1200" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;">
                                    <desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
                                    <defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
                                <text x="51.6875" y="258.5" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
                                    <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan>
                                </text>
                                <path fill="none" stroke="#aaaaaa" d="M64.1875,258.5H710" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                <text x="51.6875" y="200.125" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
                                    <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">7,500</tspan>
                                </text>
                                <path fill="none" stroke="#aaaaaa" d="M64.1875,200.125H710" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                <text x="51.6875" y="141.75" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
                                    <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">15,000</tspan>
                                </text>
                                <path fill="none" stroke="#aaaaaa" d="M64.1875,141.75H710" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                <text x="51.6875" y="83.375" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
                                    <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">22,500</tspan>
                                </text>
                                <path fill="none" stroke="#aaaaaa" d="M64.1875,83.375H710" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                <text x="51.6875" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
                                    <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30,000</tspan>
                                </text>
                                <path fill="none" stroke="#aaaaaa" d="M64.1875,25H710" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                <text x="591.509492709599" y="271" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8.25)">
                                <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2019/8</tspan>
                                </text>
                                <text x="304.30733596597815" y="271" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8.25)">
                                    <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2019/7</tspan>
                                </text>
                                <path fill="none" stroke="#3c8dbc" d="M64.1875,216.99926666666667C82.23572296476306,217.50518333333332,118.3321688942892,220.52998125,136.38039185905225,219.02293333333333C154.4286148238153,217.51588541666666,190.52506075334145,207.18499371584699,208.5732837181045,204.94288333333333C226.42533034629406,202.725143715847,262.1294236026731,202.97661875,279.98147023086267,201.18353333333334C297.8335168590522,199.3904479166667,333.53761011543133,193.1129928734062,351.3896567436209,190.59820000000002C369.43787970838395,188.0557720400729,405.53432563791006,180.84860208333336,423.5825486026731,180.95465000000002C441.63077156743617,181.06069791666667,477.72721749696234,202.2824719489982,495.7754404617254,191.44658333333334C513.6274870899149,180.72847611566485,549.331580346294,101.12886933701657,567.1836269744836,94.73866666666666C584.8394972660997,88.41868600368323,620.1512378493317,133.97130673076924,637.8071081409478,140.60585C655.8553311057108,147.38782756410257,691.951777035237,146.455025,710,148.40475" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                <circle cx="64.1875" cy="216.99926666666667" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="136.38039185905225" cy="219.02293333333333" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="208.5732837181045" cy="204.94288333333333" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="279.98147023086267" cy="201.18353333333334" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="351.3896567436209" cy="190.59820000000002" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="423.5825486026731" cy="180.95465000000002" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="495.7754404617254" cy="191.44658333333334" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="567.1836269744836" cy="94.73866666666666" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="637.8071081409478" cy="140.60585" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                <circle cx="710" cy="148.40475" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>



                                    <path fill="none" stroke="#aaaaaa" d="M64.1875,25H710" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                    <text x="591.509492709599" y="271" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8.25)">
                                        <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2019/8</tspan>
                                    </text>
                                    <text x="304.30733596597815" y="271" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8.25)">
                                        <tspan dy="4.25" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2019/7</tspan>
                                    </text>
                                    <path fill="none" stroke="#3c8dbc" d="M64.1875,216.99926666666667C82.23572296476306,217.50518333333332,118.3321688942892,220.52998125,136.38039185905225,219.02293333333333C154.4286148238153,217.51588541666666,190.52506075334145,207.18499371584699,208.5732837181045,204.94288333333333C226.42533034629406,202.725143715847,262.1294236026731,202.97661875,279.98147023086267,201.18353333333334C297.8335168590522,199.3904479166667,333.53761011543133,193.1129928734062,351.3896567436209,190.59820000000002C369.43787970838395,188.0557720400729,405.53432563791006,180.84860208333336,423.5825486026731,180.95465000000002C441.63077156743617,181.06069791666667,477.72721749696234,202.2824719489982,495.7754404617254,191.44658333333334C513.6274870899149,180.72847611566485,549.331580346294,101.12886933701657,567.1836269744836,94.73866666666666C584.8394972660997,88.41868600368323,620.1512378493317,133.97130673076924,637.8071081409478,140.60585C655.8553311057108,147.38782756410257,691.951777035237,146.455025,710,148.40475" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                                    <circle cx="64.1875" cy="216.99926666666667" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="136.38039185905225" cy="219.02293333333333" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="208.5732837181045" cy="204.94288333333333" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="279.98147023086267" cy="201.18353333333334" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="351.3896567436209" cy="190.59820000000002" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="423.5825486026731" cy="180.95465000000002" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="495.7754404617254" cy="191.44658333333334" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="567.1836269744836" cy="94.73866666666666" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="637.8071081409478" cy="140.60585" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
                                    <circle cx="710" cy="148.40475" r="4" fill="#3c8dbc" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>



                                </svg>
                            </div>

                        </div>
                    </div>                    <!-- /.nav-tabs-custom -->

                </section>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->

        <!-- Main content -->
        <section class="content container-fluid">

            <div class="row">
                <div class="col-xs-12">

                    <!-- /.box -->

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">用户信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="userTable" class="table" >
                                        <thead>
                                        <tr>
                                            <!-- 全选
                                            <th>全选 <input type="checkbox"></th> -->

                                            <th class="sorting_asc" tabindex="0" aria-controls="example"
                                                aria-sort="ascending"
                                                aria-label="ID: activate to sort column descending">ID
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="用户名: activate to sort column ascending">用户名
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="性别: activate to sort column ascending">性别
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="密码: activate to sort column ascending">密码
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="电子邮箱: activate to sort column ascending">电子邮箱
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="用户身份: activate to sort column ascending">用户身份
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="example"
                                                aria-label="创建日期: activate to sort column ascending">创建日期
                                            </th>
                                            <th width="120px">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbodyId">
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

<!-- 修改用户信息表格 -->
<div class="box box-info" id="user_info_modify_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">修改用户信息</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_sex">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_password">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">电子邮箱</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_email">
                </div>
            </div>


        </div>


        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="user_info_mod_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="user_info_mod_sumbit">提交</button>
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
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>


<script>
    $(function(){
        var dataSend = {
            user_id: "654321"

        }

        $.ajax({
            type: "POST",
            url: "http://localhost:8080/user/getInfo",//请求controller方法   
            data: JSON.stringify(dataSend),//发送的数据  
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false, //同步请求，注意此字段    
            success: function (data) {
                if(data.success == true){

                    var $tbody = $("#tbodyId");
                    var uf = data["userFind"];
                    $.each(function (uf) {
                        var $tr = $("<tr>")
                            .append($("<td>").html(uf["user_id"]))
                            .append($("<td>").html(uf["nickname"]))
                            .append($("<td>").html(uf["sex"]))
                            .append($("<td>").html(uf["verify"]))
                            .append($("<td>").html(uf["email"]))
                            .append($("<td>").html(uf["identity"]))
                            .append($("<td>").html(uf["create_time"]))
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
    $(function () {
        $(".content-wrapper").on("click", ".btn_del", function () {
            var $tr = $(this).parents("tr");
            var id = $tr.find("td:eq(0)").html();
            var name = $tr.find("td:eq(1)").html();
            var dataSend = {
                user_id: id

            };

            layer.confirm('确定删除: '+name+"?", {icon: 3, title:'提示'}, function(index){
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/user/drop",
                    data: JSON.stringify(dataSend),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if(data.success == true){
                            layer.alert("删除成功!");
                            layer.closeAll();
                            window.location.reload();
                        }else{
                            layer.alert("删除失败！");
                        }
                    }
                });
            });

        });
        // 修改用户信息
        $(".content-wrapper").on("click", ".btn_mod", function () {
            layer.open({
                type: 1,
                title: '修改用户信息',
                shadeClose: true,
                shade: 0.5,
                area: ['500px', '600px'],
                content: $("#user_info_modify_table")
            })
            var $tr = $(this).parents("tr");
            var user_id = $tr.find("td:eq(0)").html();
            var old_user_name = $tr.find("td:eq(1)").html();
            var old_user_sex = $tr.find("td:eq(2)").html();
            var old_user_password = $tr.find("td:eq(3)").html();
            var old_user_email = $tr.find("td:eq(4)").html();

            $("#mod_name").attr("value", $tr.find("td:eq(1)").html());
            $("#mod_sex").attr("value", $tr.find("td:eq(2)").html());
            $("#mod_password").attr("value", $tr.find("td:eq(3)").html());
            $("#mod_email").attr("value", $tr.find("td:eq(4)").html());

            $("#user_info_mod_sumbit").click(function(){
                var dataSend = {
                    olduser: {
                        user_id: user_id,
                        nickname: old_user_name,
                        sex:old_user_sex,
                        verify:old_user_password,
                        email:old_user_email,
                    },
                    newuser: {
                        user_id: user_id,
                        nickname: $("#mod_name").val(),
                        sex: $("#mod_sex").val(),
                        verify: $("#mod_password").val(),
                        email: $("#mod_email").val(),
                    }
                };

                console.log(dataSend);

                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/user/modify",
                    data: JSON.stringify(dataSend),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if(data.success == true){
                            layer.alert("修改成功!");
                            layer.closeAll();
                            window.location.reload();
                        }else{
                            layer.alert("修改失败！");
                        }
                    }
                });

            });


        });
        $("#user_info_mod_cancel").click(function(){
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

        });
    })

</script>
</body>
</html>
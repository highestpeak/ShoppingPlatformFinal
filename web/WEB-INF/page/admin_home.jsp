<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style type="text/css">
        #i1{
            transform:scale(0.6,0.6) translate(40px,10px);
        }
        #i2{
            transform:scale(0.6,0.6) translate(30px,10px);
        }
        #i3{
            transform:scale(0.6,0.6) translate(40px,10px);
        }
        #i4{
            transform:scale(0.6,0.6) translate(40px,10px);
        }
        #i5{
            transform:scale(0.6,0.6) translate(40px,10px);
        }
    </style>
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

            <!-- 增加功能栏目 -->
            <ul class="sidebar-menu tree" data-widget="tree">
                <li class="active">
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

    <div class="content-wrapper" style="min-height: 915.8px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                &nbsp&nbsp&nbsp&nbsp管理员主界面
                <%--<small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <%--<li class="active">Dashboard</li>--%>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div style="display: flex">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <br>
                            <br>
                            <h3>订单管理</h3>

                            <p>&nbsp</p>
                        </div>
                        <div class="icon">
                            <p>&nbsp</p>
                            <i id="i1" class="ion ion-bag"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/orderManage" class="small-box-footer">点击跳转 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>

                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <br>
                            <br>
                            <h3>商品管理<sup style="font-size: 20px"></sup></h3>

                            <p>&nbsp</p>
                        </div>
                        <div class="icon">
                            <p>&nbsp</p>
                            <i id="i2" class="ion ion-stats-bars"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/goodsManage" class="small-box-footer">点击跳转 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <br>
                            <br>
                            <h3>用户管理</h3>

                            <p>&nbsp</p>
                        </div>
                        <div class="icon">
                            <p>&nbsp</p>
                            <i id="i3" class="ion ion-person-add"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/userManage" class="small-box-footer">点击跳转 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <br>
                            <br>
                            <h3>分类管理</h3>

                            <p>&nbsp</p>
                        </div>
                        <div class="icon">
                            <p>&nbsp</p>
                            <i id="i4" class="ion ion-pie-graph"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/classifyManage" class="small-box-footer">点击跳转 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <br>
                            <br>
                            <h3>商店信息</h3>

                            <p>&nbsp</p>
                        </div>
                        <div class="icon">
                            <p>&nbsp</p>
                            <i id="i5" class="ion ion-bag"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/storeInfoManage" class="small-box-footer">点击跳转 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">新品上市</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body" id="new_goods_box">
                            <ul class="products-list product-list-in-box">

                                <!-- <div class="col-md-6" v-for="good in goods">
                                    <li class="item">
                                        <div class="product-img">
                                            <img v-bind:src="good.pic_url" v-bind:style="{height:50 + 'px', width:50 + 'px'}" alt="Product Image">
                                        </div>
                                        <div class="product-info">
                                            <span class="product-description">{{good.goods_name}}</span>
                                            <span class="label label-warning pull-right" id="good_price">{{good.price+' ￥'}}</span>
                                            <span class="product-description">{{good.description}}</span>
                                        </div>
                                    </li>
                                </div> -->

                                <li class="col-md-6 item" v-for="good in goods">
                                    <div class="product-img">
                                        <img v-bind:src="good.pic_url" v-bind:style="{height:50 + 'px', width:50 + 'px'}" alt="Product Image">
                                    </div>
                                    <div class="product-info">
                                        <span class="product-description">{{good.goods_name}}</span>
                                        <span class="label label-warning pull-right" style="margin-right: 50px" id="good_price">{{good.price+' ￥'}}</span>
                                        <span class="product-description">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
                                        <!-- <span class="product-description">{{good.description}}</span> -->
                                    </div>
                                </li>
                               
                            </ul>
                        </div>
                        <!-- /.box-body -->

                    </div>
                </div>

            </div>
        </section>
        <!-- /.content -->
    </div>

</div>

<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/localLib/vue.js"></script>

<script>
$(function(){
    var dataSend = {
        store_id: "0000"
    };
    var vm = new Vue({
        el: '#new_goods_box',
        data: {
            goods: [],
            info:[] //触发更新用
        }
    });

    $.ajax({    
        type: "POST",    
        url: "http://localhost:8080/store/getTopTenGoods",
        data: JSON.stringify(dataSend),
        contentType: "application/json; charset=utf-8",    
        dataType: "json",    
        async: false,   
        success: function (data) {        
            if(data.success == true){                            
                vm.goods = data.goodsList;
                vm.info.push({
                    a:"a"
                });
            }else{
                layer.alert('数据拉取失败！', { icon: 2, closeBtn: 0 });
            }
        } 
    });
});
</script>

</body>
</html>
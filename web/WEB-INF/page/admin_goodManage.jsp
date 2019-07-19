<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品信息</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../adminlte/dist/css/skins/_all-skins.min.css">

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
                  <img src="../../adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
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

            <div>
                    <br>
                    <input id="add" style="float:right; margin-right:10px; background:green; color:white" class="btn" type="button" style="float:right" value="添加商品" />
                    <br>
                    <br>
            </div>

            <!-- 循环排列商品 -->
            <c:forEach items = "goodList" var = "good">

            <div class="col-md-3">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title"><font style="vertical-align: inherit;">商品名：${goods.name}</font></h3>
                    </div>
                    
                    <div class="box-body">
                        <!-- 图片链接 -->
                        <img src="images/product-1.jpg" alt="图片">
                        <font style="vertical-align: inherit;">价格：${goods.price}</font><br>
                        <font style="vertical-align: inherit;">分类：${goods.goods_classify}</font><br>
                        <font style="vertical-align: inherit;">库存：${goods.number}</font><br>
                        <div>
                            <input id="delete" style="float:right; margin-right:10px; background:red; color:white" class="btn" type="button" style="float:right" value="删除" />
                        </div>
                        <div>
                            <input id="modify" style="float:right; margin-right:10px; background:yellowgreen; color:white" class="btn" type="button" style="float:right" value="修改" />
                        </div>
                    </div>
                </div>
            </div>
                  
            </c:forEach>
    
    </div>

</div>

<script>
    $("#delete").click(function(){

    })

    $("#modify").click(function(){

    })

    $("#add").click(function(){

    })
</script>

<script src="../../adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="../../adminlte/bower_components/jquery/dist/js/bootstrap.js"></script>
<script src="../../adminlte/dist/js/adminlte.min.js"></script>

</body>
</html>

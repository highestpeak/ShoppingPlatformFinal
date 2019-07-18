<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>frame</title>

    <!-- 注意使用adminlte文件夹的css，js文件(教程视频有) -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../Adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../Adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../Adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../Adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../Adminlte/dist/css/skins/_all-skins.min.css">

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
                  <img src="../../Adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
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
          <!-- 有子功能的功能项 -->  
          <li class="treeview">
              <!-- 母功能 -->
              <a href="#">
                  <i class="fa fa-dashboard"></i> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">功能1</font></font></span>
                  <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                  </span>
              </a>
              <!-- 子功能 -->
              <ul class="treeview-menu" style="display: none;">
                  <li><a href="index.html"><i class="fa fa-circle-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 子功能1</font></font></a></li>
                  <li class="active"><a href="index2.html"><i class="fa fa-circle-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 子功能2</font></font></a></li>
              </ul>
            </li>
            
            <!-- 没有子功能的功能项 -->
            <!-- li标签加上class="active"或在已有class前加active(如class="active treeview")，保证标签为被选中 -->
            <li class="active">
            <a href="pages/widgets.html">
                <i class="fa fa-th"></i> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">功能2</font></font></span>
            </a>
            </li>

            <!-- 没有子功能的功能项 -->
            <li>
            <a href="pages/widgets.html">
                <i class="fa fa-th"></i> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">功能3</font></font></span>
            </a>
            </li> 
        </ul>
        </section>
    </aside>

    <div class="content-wrapper" style="min-height: auto;">
    <!-- 在此处添加内容 --><section class="content-header">
      <h1>
        用户列表
        
      </h1>
      
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          
          <!-- /.box -->

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">用户信息</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="row"><div class="col-sm-6"><div class="dataTables_length" id="example1_length"><label>Show <select name="example1_length" aria-controls="example1" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-6"><div id="example1_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1"></label></div></div></div><div class="row"><div class="col-sm-12"><table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 88px;">ID</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="姓名: activate to sort column ascending" style="width: 113px;">姓名</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="性别: activate to sort column ascending" style="width: 98px;">性别</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="密码: activate to sort column ascending" style="width: 74px;">密码</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="电子邮箱: activate to sort column ascending" style="width: 49px;">电子邮箱</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="用户身份: activate to sort column ascending" style="width: 49px;">用户身份</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="创建日期: activate to sort column ascending" style="width: 49px;">创建日期</th></tr>
                </thead>
                <tbody>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                <tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.5</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 2.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 3.0</td>
                  <td>Win 2k+ / OSX.3+</td>
                  <td>1.9</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Camino 1.0</td>
                  <td>OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Camino 1.5</td>
                  <td>OSX.3+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape 7.2</td>
                  <td>Win 95+ / Mac OS 8.6-9.2</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape Browser 8</td>
                  <td>Win 98SE+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape Navigator 9</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Mozilla 1.0</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1</td>
                  <td>A</td>
                </tr></tbody>
                
              </table></div></div><div class="row"><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="example1_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="example1_previous"><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">上一页</a></li><li class="paginate_button active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li><li class="paginate_button next" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">下一页</a></li></ul></div></div></div></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    
    </div>

</div>

<script src="../../Adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="../../Adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../../Adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../Adminlte/bower_components/fastclick/lib/fastclick.js"></script>
<script src="../../Adminlte/dist/js/adminlte.min.js"></script>
<script src="../../Adminlte/dist/js/demo.js"></script>


</body></html>
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
                    <button type="submit" name="search" selled_id="search-btn" class="btn btn-flat">
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
                                    <table selled_id="example" class="table" >
                                        <thead>
                                        <tr>
                                            <th>全选 <input type="checkbox"></th>
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
                                            <th width="120px">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000005</td>
                                            <td class="sorting_1">0000004</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000002</td>
                                            <td class="sorting_1">0000003</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000007</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td class="sorting_1">0000001</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>9999</td>
                                            <td>已支付</td>
                                            <td>2019/7/17</td>
                                            <td class="sorting_1">0000001</td>
                                            <td>1</td>
                                            <td>2019/7/17</td>
                                            <td>2019/7/17</td>
                                            <td><a class="btn btn-xs btn-info btn_update_user">修改</a> <a
                                                    class="btn btn-xs btn-danger btn_del_user">删除</a></td>
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

<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/layer/layer.js"></script>

<script type="text/javascript">
    $(function () {
        $(".content").on("click", ".btn_del_user", function () {
            var $tr = $(this).parents("tr");
            var name = $tr.find("td:eq(1)").html();

            layer.confirm('是否删除:' + name, {icon: 3, title: '提示'}, function (index) {
                $tr.remove();
                layer.close(index);
            })
        });
        $(".content").on("click", ".btn_update_user", function () {
            layer.open({
                type: 2,
                title: '修改用户信息',
                shadeClose: true,
                shade: 0.8,
                area: ['500px', '600px'],
                content: 'admin_orderManage_OrderInfoLayer.jsp'
            })

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
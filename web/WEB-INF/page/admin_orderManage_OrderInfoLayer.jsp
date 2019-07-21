<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>frame</title>

    <!-- 注意使用adminlte文件夹的css，js文件(教程视频有) -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <div class="content-wrapper" style="min-height: 1000px;">
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
                        <!-- general form elements disabled -->
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">General Elements</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <form role="form">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label>订单号</label>
                                        <input type="text" class="form-control" placeholder="XXXXXX" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>买家ID</label>
                                        <input type="text" class="form-control" placeholder="买家ID">
                                    </div>
                                    <div class="form-group">
                                        <label>付款金额</label>
                                        <input type="text" class="form-control" placeholder="付款金额">
                                    </div>
                                    <div class="form-group">
                                        <label>是否支付</label>
                                        <select class="form-control">
                                            <option>已支付</option>
                                            <option>未支付</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>支付时间</label>
                                        <input type="text" class="form-control" placeholder="支付时间">
                                    </div>
                                    <div class="form-group">
                                        <label>快递单号</label>
                                        <input type="text" class="form-control" placeholder="快递单号">
                                    </div>
                                    <div class="form-group">
                                        <label>订单状态</label>
                                        <input type="text" class="form-control" placeholder="订单状态">
                                    </div>
                                    <div class="form-group">
                                        <label>创建时间</label>
                                        <input type="text" class="form-control" placeholder="创建时间">
                                    </div>
                                    <div class="form-group">
                                        <label>更新时间</label>
                                        <input type="text" class="form-control" placeholder="更新时间">
                                    </div>
                                </form>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-default btn_cancel">取消</button>
                                <button type="button" class="btn btn-info pull-right btn_submit">提交</button>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                </div>    <!-- /.col -->
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
        $(".btn_cancel").click(function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
        $(".btn_submit").click(function() {
            layer.msg('操作成功',{time:700},function(){
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });

        });

    });

</script>
</body>
</html>
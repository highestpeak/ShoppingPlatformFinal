<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品管理</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/css/bootstrap-treeview.min.css" rel="stylesheet">
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
            <li class="active">
                <a href="${pageContext.request.contextPath}/goods/toClassify">
                    <!-- 请求url -->
                    <i class="fa fa-th" href="###"></i> <span>商品管理</span>
                </a>
            </li>
            </ul>
        </section>
    </aside>

    <div class="content-wrapper" style="min-height: auto;" id="content">

        <br><br><br><br>

        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Donut Chart</h3>
                </div>

                <div class="box-body">
                    <canvas id="pieChart" style="height: 351px; width: 703px;" width="500" height="438"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">

            <div id="tree"></div>

            <div>
                <input id="delete" style="float:right; margin-right:10px; background:red; color:white" class="btn" type="button" style="float:right" value="删除" />
            </div>

            <div>
                <input id="modify" style="float:right; margin-right:10px; background:yellowgreen; color:white" class="btn" type="button" style="float:right" value="修改" />
            </div>

            <div>
                <input id="add" style="float:right; margin-right:10px; background:greenyellow; color:white" class="btn" type="button" style="float:right" value="添加" />
            </div>
        </div>

    </div>

</div>
<script src="${pageContext.request.contextPath}/localLib/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/bootstrap-treeview.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/localLib/js/Chart.js"></script>
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>

<script>
    $(function(){
        function listToTree(data, pid) {
            var result = [], temp;
            for (var i = 0; i < data.length; i++) {
                if (data[i].pid == pid) {
                    var obj = data[i];
                    temp = listToTree(data, data[i].id);
                    if (temp.length > 0) {
                        obj["nodes"] = temp;
                    }
                    result.push(obj);
                }
            }
            return result;
        }

        function getTree() {
            var result;
            $.ajax({
                type:"post",
                url:"http://localhost:8080/goods/classifyOfStore",
                data:{"store_id":"0000"},
                dataType:'json',
                async: false,//禁止异步请求，变为同步请求
                success:function(data) {
                    var list=data.classifyList;
                    var obj = [];
                    for(var i=0; i<list.length; i++){
                        var item = {
                            text: list[i][1],
                            id: list[i][0],
                            pid:list[i][2],
                            href: "/goods/classify/" + list[i][0]
                        }
                        obj.push(item);
                    }
                    result= listToTree(obj, 0);
                }
            });
            return result;
        }

        $('#tree').treeview({
            data: getTree(),
            showCheckbox: true,
            enableLinks: true
        });

        $("#delete").click(function(){
            arr=$("#tree").treeview("getChecked");
            if(arr.length ==0){
                layer.alert("请勾选!");
                return;
            }
            var ids=[];
            for(var i=0; i<arr.length; i++){
                ids.push(arr[i].id);
            }

            // 向deleteClassify功能发送要删除的分类的id的数组，[1,2,3,4]
            if(confirm("确认删除？")){
                $.ajax({
                    type:"post",
                    url:"/deleteClassify",
                    data: {ids:ids},
                    success:function(data,status){
                        layer.alert("删除“"+data+"”成功！(status:"+status+".)");
                        $('#tree').treeview('removeNode', [ arr, { silent: true } ]);
                        window.location.reload();
                    }
                });
            }else{
                return;
            }
        });

        $("#modify").click(function(){
            arr=$("#tree").treeview("getChecked");
            if(arr.length != 1){
                layer.alert("请正确勾选!");
                return;
            }

            layer.open({
                type: 1,
                title: "",
                shadeClose: true,
                shade: 0.5,
                area: ["400px","300px"],
                content: $("#good_classify_mod_table")
            });

        });

        $("#good_classify_mod_cancel").click(function(){
            layer.closeAll();
        });

        $("#good_classify_mod_submit").click(function(){
            var id = document.getElementById("mod_id").value;
            var name = document.getElementById("mod_name").value;
            var pid = document.getElementById("mod_pid").value;

            var temp = {
                text: name,
                id: id,
                pid: pid
            }

            arr = $("#tree").treeview("getChecked");
            if(temp){
                $.ajax({
                    type: "post",
                    url: "/modifyClassify",
                    data: temp,
                    success: function(data, status){
                        layer.alert("添加“"+data+"”成功！(status:"+status+".)");
                        $("#tree").treeview("addNode", [data,arr]);
                        window.location.reload();
                    }
                });
            }
            layer.closeAll();
        });


        $("#add").click(function(){
            layer.open({
                type: 1,
                title: "",
                shadeClose: true,
                shade: 0.5,
                area: ["400px","300px"],
                content: $("#good_classify_add_table")
            });

        });

        $("#good_classify_add_cancel").click(function(){
            layer.closeAll();
        });

        $("#good_classify_add_submit").click(function(){
            var id = document.getElementById("add_id").value;
            var name = document.getElementById("add_name").value;
            var pid = document.getElementById("add_pid").value;

            var temp = {
                text: name,
                id: id,
                pid: pid
            }

            arr = $("#tree").treeview("getChecked");
            if(temp){
                $.ajax({
                    type: "post",
                    url: "/addClassify",
                    data: temp,
                    success: function(data, status){
                        layer.alert("添加“"+data+"”成功！(status:"+status+".)");
                        $("#tree").treeview("addNode", [data,arr]);
                        window.location.reload();
                    }
                });
            }
            layer.closeAll();
        });

    })

</script>

<!-- Chart -->
<script>
    $(function(){
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
        var pieChart       = new Chart(pieChartCanvas);
        var PieData        = [
            {
                value    : 700,
                color    : '#f56954',
                highlight: '#f56954',
                label    : 'Chrome'
            },
            {
                value    : 500,
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : 'IE'
            },
            {
                value    : 400,
                color    : '#f39c12',
                highlight: '#f39c12',
                label    : 'FireFox'
            },
            {
                value    : 600,
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : 'Safari'
            },
            {
                value    : 300,
                color    : '#3c8dbc',
                highlight: '#3c8dbc',
                label    : 'Opera'
            },
            {
                value    : 100,
                color    : '#d2d6de',
                highlight: '#d2d6de',
                label    : 'Navigator'
            }
        ];
        var pieOptions     = {
            segmentShowStroke    : true,
            segmentStrokeColor   : '#fff',
            segmentStrokeWidth   : 2,
            percentageInnerCutout: 50,
            animationSteps       : 100,
            animationEasing      : 'easeOutBounce',
            animateRotate        : true,
            animateScale         : false,
            responsive           : true,
            maintainAspectRatio  : true,
            <%--legendTemplate       : '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<segments.length; i++){%><li><span style="background-color:<%=segments[i].fillColor%>"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>'--%>
        }
        pieChart.Doughnut(PieData, pieOptions);
    })
</script>

<!-- 添加商品表格 -->
<div class="box box-info" id="good_classify_add_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">添加分类</h3>
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
                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_name" name="add_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">PID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_pid" name="add_pid">
                </div>
            </div>

        </div>

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_classify_add_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="good_classify_add_submit">提交</button>
        </div>
    </form>
</div>

<!-- 添加商品表格 -->
<div class="box box-info" id="good_classify_mod_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">添加分类</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal"  action="###" method="post">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_id" name="mod_id">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_name" name="mod_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">PID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_pid" name="mod_pid">
                </div>
            </div>

        </div>

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_classify_mod_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="good_classify_mod_submit">提交</button>
        </div>
    </form>
</div>

</body>
</html>

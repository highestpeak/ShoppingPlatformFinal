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

                <li class="active">
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
                分类信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">分类管理</li>
            </ol>  
        </section>

        <section class="content container-fluid">
            <div class="row">

                <div class="col-xs-6">
                    <div class="box" style="height: 500px">
                        <div class="box-header">
                            <h3 class="box-title">统计</h3>
                        </div>
                        <div class="box-body">
                            <canvas id="pieChart"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-xs-6">
                    <div class="box" style="height: 500px">
                        <div class="box-header">
                            <h3 class="box-title">分类树</h3>
                            <div>
                                <input id="delete" style="float:right; margin-right:10px;background:red; color:white" class="btn" type="button" style="float:right" value="删除" />
                            </div>
                
                            <div>
                                <input id="modify" style="float:right; margin-right:10px; background:yellowgreen; color:white" class="btn" type="button" style="float:right" value="修改" />
                            </div>
                
                            <div>
                                <input id="add" style="float:right; margin-right:10px; background:greenyellow; color:white" class="btn" type="button" style="float:right" value="添加" />
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="tree"></div>
                        </div>
                    </div>
                </div>

            </div>
        </section>>

    </div>

</div>

<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/chart.js/Chart.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/fastclick/lib/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/localLib/bootstrap-treeview.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
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

    var obj = [];
    function getTree() {
        var result;
        var dataSend = {
            store_id: "0000"
        };
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/classify/classifyOfStore",
            data:JSON.stringify(dataSend),
            contentType: "application/json; charset=utf-8",    
            dataType:'json',
            async: false,//禁止异步请求，变为同步请求
            success:function(data) {
                var list=data.classifyList;
                for(var i=0; i<list.length; i++){
                    var item = {
                        text: list[i][1],
                        id: list[i][0],
                        pid: list[i][2],
                    };
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
            layer.alert('请勾选！', { icon: 2, closeBtn: 0 });
            return;
        }
        var delID = [];
        for(var i=0; i<arr.length; i++){
            delID.push({
                classify_id: arr[i].id
            });
        }

        var dataSend = {
            store: {
                store_id: "0000"
            },
            classifiesToDel: delID
        }

        console.log(dataSend);

        if(layer.confirm("确认删除？")){
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/classify/deleteClassifyOfStore",
                data: JSON.stringify(dataSend),
                contentType: "application/json; charset=utf-8",    
                dataType: "json",    
                async: false,  
                success:function(data){
                    if(data.success == true){                            
                        layer.alert('删除成功！', { icon: 1, closeBtn: 0 }, function (index) {
                            window.location.reload();
                        });

                    }else{
                        layer.alert('修改失败！', { icon: 2, closeBtn: 0 });
                    }
                }
            });
        }else{
            return;
        }
    });

    var mod_son;

    $("#modify").click(function(){
        arr=$("#tree").treeview("getChecked");
        if(arr.length != 1){
            layer.alert("请正确勾选!");
            return;
        }

        mod_son = $("#tree").treeview("getChecked")[0];
        $("#mod_name").attr("value", mod_son.text);
        var p_index = obj.findIndex((v)=>{return mod_son.pid == v.id});
        var p_name = "";

        if( p_index == -1){
            $("#mod_pname").attr("value", "");
        }else{
            p_name = obj[p_index].text;
            $("#mod_pname").attr("value", p_name);
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
        var mod_id = mod_son.id;
        var new_name = $("#mod_name").val();
        var new_p_name = $("#mod_pname").val();
        var new_p_id = -1;

        if(new_name == ""){
            new_p_id = 0;
        }
        else if(obj.findIndex((v)=>{return v.text == new_p_name}) != -1){
            var new_p_index = obj.findIndex((v)=>{return v.text == new_p_name});
            new_p_id = obj[new_p_index].id;
        }
        else{
            layer.alert('父类错误！', { icon: 2, closeBtn: 0 });
        }

        if(new_p_id != -1){
            var dataSend = {
                store: {
                    store_id: "0000"
                },
                classify_id:"",
                new_name:"",
                new_p_id:""
            };
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/classify/modifyClassifyOfStore",
                data: JSON.stringify(dataSend),
                contentType: "application/json; charset=utf-8",    
                dataType: "json",    
                async: false,  
                success:function(data){
                    if(data.success == true){                            
                        layer.alert('修改成功！', { icon: 1, closeBtn: 0 }, function (index) {
                            window.location.reload();
                        });

                    }else{
                        layer.alert('修改失败！', { icon: 2, closeBtn: 0 });
                    }
                }
            });
        }
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
        var new_name = $("#add_name").val();
        var new_p_name = $("add_pname").val();
        var new_p_id = -1;

        if(new_name == ""){
            new_p_id = 0;
        }
        else if(obj.findIndex((v)=>{return v.text == new_p_name}) != -1){
            var new_p_index = obj.findIndex((v)=>{return v.text == new_p_name});
            new_p_id = obj[new_p_index].id;
        }
        else{
            layer.alert('父类错误！', { icon: 2, closeBtn: 0 });
        }

        if(new_p_id != -1){
            var dataSend = {
                store: {
                    store_id: "0000"
                },
                new_name:"",
                new_p_id:""
            }
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/classify/addClassifyOfStore",
                data: JSON.stringify(dataSend),
                contentType: "application/json; charset=utf-8",    
                dataType: "json",    
                async: false,  
                success:function(data){
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

<script>
$(function () {

    var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
    var pieChart       = new Chart(pieChartCanvas);
    var PieData        = [];

    var color = [
        {
            color    : '#f56954',
            highlight: '#f56954'
        },
        {
            color    : '#00a65a',
            highlight: '#00a65a'
        },
        {
            color    : '#f39c12',
            highlight: '#f39c12'
        },
        {
            color    : '#00c0ef',
            highlight: '#00c0ef'
        },
        {
            color    : '#3c8dbc',
            highlight: '#3c8dbc'
        },
        {
            color    : '#d2d6de',
            highlight: '#d2d6de'
        }
    ];

    var dataSend = {
        store_id: "0000"
    };

    $.ajax({
        type:"POST",
        url:"http://localhost:8080/store/getChartOfClassify",
        data:JSON.stringify(dataSend),
        contentType: "application/json; charset=utf-8",    
        dataType:'json',
        async: false,
        success:function(data) {
            var list=data.classifyMap;
            var item = {};
            var i = 0;
            for(var val in list){
                item.label = val;
                item.color = color[i%6].color;
                item.highlight = color[i%6].highlight;
                item.value = list[val];
                i++;
                PieData.push(JSON.parse(JSON.stringify(item)));
            } 
        }
    });

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
        legendTemplate       : '<ul class="<=name.toLowerCase()>-legend">< for (var i=0; i<segments.length; i++){><li><span style="background-color:<=segments[i].fillColor>"></span><if(segments[i].label){><=segments[i].label><}></li><}></ul>'
    }

    pieChart.Doughnut(PieData, pieOptions)
})
</script>

<!-- 添加分类表格 -->
<div class="box box-info" id="good_classify_add_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">添加分类</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_name" name="add_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Parent</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="add_pname" name="add_pname">
                </div>
            </div>

        </div>

        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_classify_add_cancel">取消</button>
            <button type="button" class="btn btn-info pull-right" id="good_classify_add_submit">提交</button>
        </div>
    </form>
</div>

<!-- 修改分类表格 -->
<div class="box box-info" id="good_classify_mod_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">添加分类</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">           

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_name" name="mod_name">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Parent</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="mod_pname" name="mod_pname">
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/storeInfoManage">
                        <i class="fa fa-info-circle"></i> <span><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">商店信息</font></font></span>
                    </a>
                </li>
            </ul>
        </section>
    </aside>

    <div class="content-wrapper" style="min-height: 1300px;">
        <!-- 在此处添加内容 -->
        <section class="content-header">
            <h1>
                商店信息

            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">商店管理</li>
            </ol>  
        </section>
    
        <!-- Main content -->
        <section class="content container-fluid">   
            <div class="row">
                <div class="col-xs-12">

                    <!-- /.box -->

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">商店信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3" id="store_info">
                                    <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/localLib/images/user2-160x160.jpg" alt="User profile picture">

                                    <h3 id="store_id" class="profile-username text-center">{{store_id}}</h3>
                    
                                    <p id="store_note" class="text-muted text-center">{{note}}</p>
                    
                                    <ul class="list-group list-group-unbordered">
                                        <li class="list-group-item">
                                            <b>Pic Url</b> <a class="pull-right" id="store_pic" v-bind:href="store_pic_url">{{store_pic_url}}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Classify</b> <a id="store_classify" class="pull-right">{{store_classify}}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Level</b> <a id="store_level" class="pull-right">{{level}}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Certification</b> <a id="store_certi" class="pull-right">{{certification}}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Create Time</b> <a id="store_time" class="pull-right">{{create_time}}</a>
                                        </li>
                                    </ul>
                    
                                    <button class="btn btn-primary btn-block" id="modify"><b>Modify</b></button>
                                </div>
                            </div>       
                        </div>
                        <div class="box-footer"><br><br><br><br></div>
                    </div>
                </div>
            </div>
        </section>

    </div>

</div>


<!-- 修改商店信息 -->
<div class="box box-info" id="store_info_modify_table" style="display: none">
        <div class="box-header with-border">
            <h3 class="box-title">修改信息</h3>
        </div>
    
        <!-- 提交表单 -->
        <form class="form-horizontal">
            <div class="box-body">
    
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Note</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="mod_note">
                    </div>
                </div>
    
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Classify</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="mod_classify">
                    </div>
                </div>
    
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Level</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="mod_level">
                    </div>
                </div>
    
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Certification</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="mod_certification">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Pic Url</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="mod_picurl">
                    </div>
                </div>
    
    
            </div>
        
    
            <div class="box-footer">
                <button type="button" class="btn btn-default pull-left" id="store_info_mod_cancel">取消</button>
                <button type="button" class="btn btn-info pull-right" id="store_info_mod_sumbit">提交</button>
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

<script src="${pageContext.request.contextPath}/localLib/vue.js"></script>


<script>
    $(function(){
        var dataSend = {
            store_id: "0000"
        }

        var vm = new Vue({
            el: '#store_info',
            data: {
                store_id: "",
                note: "",
                store_pic_url: "",
                store_classify: "",
                level: "",
                certification: "",
                create_time:"",
                
                info:[] //触发更新用
            }
        });

        $.ajax({    
            type: "POST",    
            url: "http://localhost:8080/store/getInfo",//请求controller方法   
            data: JSON.stringify(dataSend),//发送的数据  
            contentType: "application/json; charset=utf-8",    
            dataType: "json",    
            async: false, //同步请求，注意此字段    
            success: function (data) {        
                if(data.success == true){
                    var info = data.store;

                    vm.store_id = info.store_id;
                    vm.note = info.note;
                    vm.store_pic_url = info.store_pic_url;
                    vm.store_classify = info.store_classify;
                    vm.level = info.level;
                    vm.certification = info.certification;
                    vm.create_time = info.create_time;

                    vm.info.push({
                        a:"a"
                    });
                    
                }else{
                    layer.alert('数据请求失败！', { icon: 3, closeBtn: 0 });
                }
            } 
        });

        $(".content-wrapper").on("click", ".btn-block", function(){
            $("#mod_note").attr("value", vm.note);
            $("#mod_classify").attr("value", vm.store_classify);
            $("#mod_level").attr("value", vm.level);
            $("#mod_certification").attr("value", vm.certification);
            $("#mod_picurl").attr("value", vm.store_pic_url);

            layer.open({
                type: 1,
                title: "",
                shadeClose: true,
                shade: 0.5,
                area: ["500px","500px"],
                content: $("#store_info_modify_table")
            });


            $("#store_info_mod_sumbit").click(function(){
                var dataSend = {
                    oldStore: {
                        store_id: vm.store_id
                    },
                    newStore: {
                        note: $("#mod_note").val(),
                        store_pic_url: $("#mod_picurl").val(),
                        store_classify: $("#mod_classify").val(),
                        level: $("#mod_level").val(),
                        certification: $("#mod_certification").val()
                    }
                };

                $.ajax({    
                    type: "POST",    
                    url: "http://localhost:8080/store/modify",
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
    });
</script>


</body>
</html></html>
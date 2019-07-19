
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品管理</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/localLib/bootstrap-treeview.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/skins/_all-skins.min.css">

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
            <li class="active">
                <a href="#">
                    <!-- 请求url -->
                    <i class="fa fa-fw fa-wrench" href="###"></i> <span>商品管理</span>
                </a>
            </li>
            </ul>
        </section>
    </aside>


    <div class="content-wrapper" style="min-height: auto;" id="content">
        <div id="tree"></div>

        <div>
            <input id="delete" style="float:right; margin-right:10px; background:red; color:white" class="btn" type="button" style="float:right" value="删除" />
        </div>

        <div>
            <input id="modify" style="float:right; margin-right:10px; background:yellow; color:white" class="btn" type="button" style="float:right" value="修改" />
        </div>

        <div>
            <input id="add" style="float:right; margin-right:10px; background:greenyellow; color:white" class="btn" type="button" style="float:right" value="添加" />
        </div>
    </div>

</div>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/bootstrap-treeview.min.js"></script>
<script>
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

    // getTree();
    // var re=getTree();
    $('#tree').treeview({
        data: getTree(),
        showCheckbox: true,
        enableLinks: true
    });

    $("#delete").click(function(){
        arr=$("#tree").treeview("getChecked");
        if(arr.length ==0){
            alert("请勾选!");
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
                    alert("删除“"+data+"”成功！(status:"+status+".)");
                    $('#tree').treeview('removeNode', [ arr, { silent: true } ]);
                }
            });
        }else{
            return;
        }
    })

    $("#modify").click(function(){
        var id = prompt("id","");
        var name = prompt("realname","");
        var pid = prompt("pid","");
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
                    alert("编辑成功！(status:"+status+".)");
                    $("#tree").treeview("updateNode", [arr, data, {silent: true}]);
                }
            });
        }
    })

    $("add").click(function(){
        var id = prompt("id","");
        var name = prompt("realname","");
        var pid = prompt("pid","");
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
                    alert("添加“"+data+"”成功！(status:"+status+".)");
                    $("#tree").treeview("addNode", [data,arr]);
                }
            });
        }
    })


</script>

<script src="${pageContext.request.contextPath}/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/bower_components/fastclick/lib/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/adminlte/dist/js/demo.js"></script>

</body>
</html>

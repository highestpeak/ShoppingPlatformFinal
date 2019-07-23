<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登陆</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/plugins/iCheck/square/blue.css">

    <style type="text/css">
        #leftDiv
        {
            float:left;
            width:40%;
        }
        #rightDiv
        {
            float:right;
            width:30%;
        }
    </style>

    <script type="text/javascript">
        function loginCheck() {
            var oUser_id =document.getElementById("user_id");
            var oVerify = document.getElementById("verify");
            var oVerificationCode = document.getElementById("verificationCode");
            var oError = document.getElementById("error_box");
            if(oUser_id.value.length == 0){
                oError.innerHTML ="请输入用户名。";
                return false;
            }
            else if (oUser_id.value.length < 6) {
                oError.innerHTML ="用户名不存在。";
                return false;
            }
            else if (oUser_id.value.length > 32) {
                oError.innerHTML = "用户名不存在。";
                return false;
            }
            else if (oVerify.value.length == 0) {
                oError.innerHTML = "请输入密码。";
                return false;
            }
            else if (oVerify.value.length < 6) {
                oError.innerHTML = "密码错误。";
                return false;
            }
            else if (oVerify.value.length > 16) {
                oError.innerHTML = "密码错误。";
                return false;
            }
            else if(oVerificationCode.value.length == 0){
                oError.innerHTML = "请输入验证码。";
                return false;
            }
            return true;
        }
        function submitLoginList() {
            if(loginCheck()){
                var oUser_id =document.getElementById("user_id").value;
                var oVerify = document.getElementById("verify").value;
                var dataSend={
                    user_id:oUser_id,
                    verify:oVerify
                };
                $.ajax({
                    type:"POST",
                    url:"http://localhost:8080/user/login",
                    data: JSON.stringify(dataSend),//放置数据的字段    
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false, //同步请求，注意此字段    
                    success: function (data) {
                        console.log(data);
                        if(data["user existed"] == false){
                            layer.alert("用户名不存在");
                        }
                        else if(data["password wrong"] == true){
                            layer.alert("密码错误");
                        }
                        else if(data["already login"] == true){
                            layer.alert("已经登陆");
                        }
                        else if(data["success"] == false){
                            layer.alert("登陆失败");
                        }
                        else{
                            layer.alert("登陆成功");
                        }

                        // 在这里取出数据  
                    }
                })
            }

        }
    </script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>汤</b>达人</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">

        <form>
            <div class="form-group has-feedback">
                <input id="user_id" type="text" class="form-control" maxlength=32 placeholder="用户名" name="user_id">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="verify" type="password" class="form-control" maxlength=16 placeholder="密码" name="verify">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <div id="leftDiv">
                    <input id="verificationCode" type="text" class="form-control" placeholder="验证码" name="verificationCode">
                </div>
                <div id="rightDiv">
                    此处放图片
                </div>
                <br><br>
            </div>
            <div class="row">

                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="button" class="btn btn-primary btn-block btn-flat" onclick="submitLoginList()">登陆</button>
                </div>
                <!-- /.col -->
            </div>
        </form>
        <!-- /.social-auth-links -->
        <br>
        <div id="error_box"><br></div>
        <br>
        <a href="${pageContext.request.contextPath}/user/toNewPassword">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/user/toRegister" class="text-center">注册</a>


    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/adminlte/plugins/iCheck/icheck.min.js"></script>

<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</body>
</html>

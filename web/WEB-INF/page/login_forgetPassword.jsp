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
        function forgetPasswordCheck() {
            var oUser_id =document.getElementById("user_id");
            var oVerify = document.getElementById("verify");
            var oEmail = document.getElementById("email");
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
                oError.innerHTML = "请输入新密码。";
                return false;
            }
            else if (oVerify.value.length < 6) {
                oError.innerHTML = "密码至少6位。";
                return false;
            }
            else if (oVerify.value.length > 16) {
                oError.innerHTML = "密码必须少于16位。";
                return false;
            }
            else if(oEmail.value.length == 0){
                oError.innerHTML = "请输入邮箱。";
                return false;
            }
            else if(!isEmail(oEmail.value)){
                oError.innerHTML = "邮箱格式错误。";
                return false;
            }
            else if(oVerificationCode.value.length == 0){
                oError.innerHTML = "请输入验证码。"
                return false;
            }
            return true
        }
        function isEmail(strEmail) {

            var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            console.log(strEmail);
            if(strEmail == ''){
                // document.getElementById("test_user").innerHTML = "";
                return true;
            }
            else if (strEmail != null &&strEmail.search(reg) != -1) {
                // document.getElementById("test_user").innerHTML = "√邮箱格式正确！";
                return true
            }
            else {
                // document.getElementById("test_user").innerHTML = "邮箱格式错误！";
                return false;
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
        <p class="login-box-msg" style="color:orangered">${msg}</p>

        <form action="${pageContext.request.contextPath}/forgetPassword" method="post" onsubmit="return forgetPasswordCheck()">
            <div class="form-group has-feedback">
                <input selled_id="user_id" type="text" class="form-control" maxlength=32 placeholder="用户名" name="user_id">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input selled_id="verify" type="password" class="form-control" maxlength=16 placeholder=新密码 name="verify">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input selled_id="email" type="text" class="form-control" placeholder=邮箱 name="email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <div selled_id="leftDiv">
                    <input selled_id="verificationCode" type="text" class="form-control" placeholder=验证码 name="verificationCode">
                </div>
                <div selled_id="rightDiv">
                    <button type="button" class="btn btn-default btn-lrg ajax" >获取验证码</button>
                </div>
            </div>
            <br><br><br>
            <div class="row">

                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">找回密码</button>
                </div>
                <!-- /.col -->
            </div>
            <br>
            <div selled_id="error_box"><br></div>
        </form>
        <!-- /.social-auth-links -->
        <br>
        <a href="${pageContext.request.contextPath}/page/login">返回登陆界面</a>


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

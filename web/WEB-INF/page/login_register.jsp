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
            width:50%;
        }
        #rightDiv
        {
            float:right;
            width:30%;
        }
    </style>

    <script type="text/javascript">
        function registerCheck() {
            var oUser_id =document.getElementById("user_id");
            var oVerify = document.getElementById("verify");
            var oPasswordCheck = document.getElementById("passwordCheck");
            var oEmail = document.getElementById("email");
            var oVerificationCode = document.getElementById("verificationCode");
            var oError = document.getElementById("error_box");
            if(oUser_id.value.length == 0){
                oError.innerHTML ="请输入用户名。";
                return false;
            }
            else if (oUser_id.value.length < 6) {
                oError.innerHTML ="用户名至少6位。";
                return false;
            }
            else if (oUser_id.value.length > 32) {
                oError.innerHTML = "用户名必须少于32位。";
                return false;
            }
            else if (oVerify.value.length == 0) {
                oError.innerHTML = "请输入密码。";
                return false;
            }
            else if (oVerify.value.length < 6) {
                oError.innerHTML = "密码至少6位。";
                return false;
            }
            else if (oVerify.value.length > 16) {
                oError.innerHTML = "密码必须少于16位。";
                return false;
            }else if(oPasswordCheck.value.length == 0)
            {
                oError.innerHTML = "请确认密码。";
                return false;
            }
            else if(oPasswordCheck.value != oVerify.value){
                oError.innerHTML = "两次输入的密码不同。";
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
            else if(isEmail(oEmail.value) && oEmail.value.length != 0){
                if(oVerificationCode.value.length == 0){
                    oError.innerHTML = "请输入验证码。"
                    return false;
                }
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

        <form  action="${pageContext.request.contextPath}/register" method="post" onsubmit="return registerCheck()">
            <div class="form-group has-feedback">
                <input id="user_id" type="text" class="form-control" maxlength=32 placeholder="用户名（必填）" name="user_id">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="verify" type="password" class="form-control" maxlength=16 placeholder="密码（必填）" name="verify">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="passwordCheck" type="text" class="form-control" maxlength=16 placeholder="确认密码（必填）" name="passwordCheck">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="性别" maxlength=1 name="sex">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="姓名" name="realname">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="identity" name="identity">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="email" type="text" class="form-control" placeholder=邮箱（必填） name="email" onclick="email.value=''" >
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <div id="leftDiv">
                    <input id="verificationCode" type="password" class="form-control" placeholder=验证码(必填) name="verificationCode">
                </div>
                <div id="rightDiv">
                    <button type="button" class="btn btn-default btn-lrg ajax" >获取验证码</button>
                </div>

            </div>
            <br><br><br>
            <div class="row">

                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat" onclick="return registerCheck" >注册</button>
                </div>
                <!-- /.col -->
            </div>
            <br>
            <div id="error_box"><br></div>
            <%--<br>--%>
            <%--<div id="test_user"><br></div>--%>
        </form>
        <!-- /.social-auth-links -->
        <br>
        <a href="${pageContext.request.contextPath}/page/login">已有账号</a>


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

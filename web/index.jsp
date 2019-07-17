
<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/6/27
  Time: 1:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>首页</title>
</head>
<body>
${ctx}
<%--注册--%>
<a href="${pageContext.request.contextPath}/addBuyer?user_id=654987321&verify=123456&email=123@126.com">添加一个buyer</a>
<br/>
<a href="${pageContext.request.contextPath}/addAdmin?user_id=111111111&verify=123456&email=123@126.com">添加一个admin</a>
<br/>
<br/>
<%--登录--%>
<a href="${pageContext.request.contextPath}/login?user_id=111111111&verify=123456">登录一个用户</a>

<br/>
<a href="${pageContext.request.contextPath}/login?user_id=963852741&verify=123456">登录</a>
<a href = "${pageContext.request.contextPath}/toLogin">点击登录</a>
<a href="${pageContext.request.contextPath}/toRegister">点击注册</a>
<a href="${pageContext.request.contextPath}/toNewPassword">点击忘记密码</a>
<br/>
</body>
</html>
<%--edit test55--%>
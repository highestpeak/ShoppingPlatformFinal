
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>首页</title>
</head>
<body>
${ctx}
&lt;%&ndash;注册测试&ndash;%&gt;
<a href="${pageContext.request.contextPath}/addBuyer?user_id=654987321&verify=123456&email=123@126.com">添加一个buyer</a>
<br/>
<a href="${pageContext.request.contextPath}/addAdmin?user_id=111111111&verify=123456&email=123@126.com">添加一个admin</a>
<br/>
<br/>
&lt;%&ndash;登录测试&ndash;%&gt;
<a href="${pageContext.request.contextPath}/login?user_id=111111111&verify=123456">登录一个用户</a>
&lt;%&ndash;登录注册页面&ndash;%&gt;
<br/>
<a href="${pageContext.request.contextPath}/login?user_id=963852741&verify=123456">登录</a>
<a href = "${pageContext.request.contextPath}/toLogin">点击登录</a>
<a href="${pageContext.request.contextPath}/toRegister">点击注册</a>
<a href="${pageContext.request.contextPath}/toNewPassword">点击忘记密码</a>
<br/>
<a href = "${pageContext.request.contextPath}/classifyOfStore?store_id=0000">点击查询商店0000商品分类</a>
${classify}
<a href="${pageContext.request.contextPath}/classify/toClassify">商品分类管理</a>
<a href="${pageContext.request.contextPath}/classify/toGoodManage">商品管理</a>
</body>
</html>--%>
<%--edit test55--%>

<jsp:forward page="/front/home"/>
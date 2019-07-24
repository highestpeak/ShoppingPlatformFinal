<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <style>
        div {
            display: block;
        }
        * {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0
        }

        ul,
        li {
            list-style: none;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            cursor: pointer;
            text-decoration: none;
        }

        a:link {
            text-decoration: none;
        }

        img {
            vertical-align: middle;
        }

        .btn-numbox {
            overflow: hidden;
            margin-top: 20px;
        }

        .btn-numbox li {
            float: left;
        }

        .btn-numbox li .number,
        .kucun {
            display: inline-block;
            font-size: 12px;
            color: #808080;
            vertical-align: sub;
        }

        .btn-numbox .count {
            overflow: hidden;
            margin: 0 16px 0 -20px;
        }

        .btn-numbox .count .num-jian,
        .input-num,
        .num-jia {
            display: inline-block;
            width: 28px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            font-size: 18px;
            color: #999;
            cursor: pointer;
            border: 1px solid #e6e6e6;
        }
        .btn-numbox .count .input-num {
            width: 58px;
            height: 26px;
            color: #333;
            border-left: 0;
            border-right: 0;
        }
    </style>

    <title>商品详情</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/revolution/css/navigation.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/libraries/lib.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/css/navigation-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/css/shortcode.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/HomeStyle.css">


</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
<div class="main-container">

    <!-- Header -->
    <header class="header-section container-fluid no-padding">

        <div class="container-fluid no-padding menu-block">
            <!-- Container -->
            <div class="container">
                <!-- nav -->
                <nav class="navbar navbar-default ow-navigation">
                    <div class="navbar-header">
                        <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="${pageContext.request.contextPath}/front/home" class="navbar-brand">汤 <span>达人</span></a>
                    </div>
                    <!-- Menu Icon -->
                    <div class="menu-icon">
                        <div class="search">
                            <a href="#" id="search" title="Search"><i class="icon icon-Search"></i></a>
                        </div>
                        <ul class="cart">
                            <%--<li>--%>
                                <%--<a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="Add To Cart" href="#"><i class="icon icon-ShoppingCart"></i></a>--%>
                                <%--<ul class="dropdown-menu no-padding">--%>
                                    <%--&lt;%&ndash;购物车一个商品项目&ndash;%&gt;--%>
                                    <%--<li class="mini_cart_item">--%>
                                        <%--<a title="Remove this item" class="remove" href="#">&#215;</a>--%>
                                        <%--<a href="#" class="shop-thumbnail">--%>
                                            <%--<img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/localLib/images/product-wishlist-1.jpg">Flying Ninja--%>
                                        <%--</a>--%>
                                        <%--<span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>--%>
                                    <%--</li>--%>

                                    <%--&lt;%&ndash;购物车一个商品项目&ndash;%&gt;--%>
                                    <%--<li class="mini_cart_item">--%>
                                        <%--<a title="Remove this item" class="remove" href="#">&#215;</a>--%>
                                        <%--<a href="#" class="shop-thumbnail">--%>
                                            <%--<img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/localLib/images/product-wishlist-2.jpg">Flying Ninja--%>
                                        <%--</a>--%>
                                        <%--<span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>--%>
                                    <%--</li>--%>

                                    <%--&lt;%&ndash;购物车提交按钮&ndash;%&gt;--%>
                                    <%--<li class="button">--%>
                                        <%--<a href="#" title="View Cart">查看购物车</a>--%>
                                        <%--<a href="#" title="Check Out">刷新购物车</a>--%>
                                        <%--<a href="#" title="Check Out">购买</a>--%>
                                    <%--</li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                        </ul>

                        <c:if test="${isLogin==false}">
                            <div>
                                <!-- <a href="${pageContext.request.contextPath}/front/personalCenter" title="User"><i class="icon icon-User"></i></a> -->
                                <a href="javascript:judgeIsLogin()" title="User"><i class="icon icon-User"></i></a>
                            </div>
                        </c:if>

                        <c:if test="${isLogin==true}">
                            <div>
                                <a title="User" class="btn_login"><i class="icon icon-User"></i></a>
                            </div>
                        </c:if>

                    </div>
                    <!-- Menu Icon /- -->
                    <div class="navbar-collapse collapse navbar-right" id="navbar">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/front/home">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/front/cart"><i class="icon icon-ShoppingCart"></i>购物车</a></li>
                            <li><a href="${pageContext.request.contextPath}/front/order"><i class="icon icon-Heart"></i>我的订单</a></li>
                            <li><a href="${pageContext.request.contextPath}/front/myEvaluation"><i class="fa fa-tumblr"></i>我的评价</a></li>
                            <li><a href="${pageContext.request.contextPath}/front/history"><i class="fa fa-vimeo"></i>游览历史</a></li>
                            <li><a href="${pageContext.request.contextPath}/front/sysNotice"><i class="fa fa-twitter"></i>系统通知</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </nav><!-- nav /- -->
                <!-- Search Box -->
                <div class="search-box">
                    <span><i class="icon_close"></i></span>
                    <form><input type="text" class="form-control" placeholder="输入关键词……" /></form>
                </div><!-- Search Box /- -->
            </div><!-- Container /- -->
        </div><!-- Menu Block /- -->
    </header><!-- Header /- -->


    <!-- 内容 -->
    <div class="main-container" id="container">
        <div class="col-md-6">
            <!-- 图片链接 -->
            <img v-bind:src="pic_url" alt="商品" width="400px" style="float:left; margin-left: 50%; margin-top: 200px">
        </div>

        <div class="col-md-6 good" style="padding: 80px" v-bind:id="goods_id">
            <br>
            <br>
            <h1 id="goodName">{{goods_name}}</h1>
            <br>
            <a>{{oldlevel}}</a>
            <br>
            <h3 style="display: inline;">￥: </h3><h3 style="display: inline;">{{goods_price}}</h3>
            <HR align=left width=300 color=#987cb9 SIZE=1>
            <pre style="width: 300px; height: 100px">{{description}}</pre>
            <ul class="btn-numbox">
                <li>
                    <ul class="count" style="margin-left: 5px">
                        <li><span id="num-jian" class="num-jian">-</span></li>
                        <li><input type="text" class="input-num" id="input-num" value="0" /></li>
                        <li><span id="num-jia" class="num-jia">+</span></li>
                    </ul>
                </li>
            </ul>
            <button type="button" class="btn btn-block btn-success" id="btn_cart" style="width: 150px">Add to cart</button>
            <br>
            <button type="button" class="btn btn-block btn-warning" id="btn_collection" style="width: 150px">Add to collection</button>
        </div>
    </div>

    <br><br><br><br><br>

    <footer id="footer-main" class="footer-main container-fluid">
        <!-- Container -->
        <div class="container">
            <div class="row">
                <!-- Widget About -->
                <aside class="col-md-12 col-sm-12 col-xs-12 ftr-widget widget_about">
                    <a href="${pageContext.request.contextPath}/front/home" title="Max Shop">汤 <span>达人</span></a>
                    <p>On the most sensational inspirational celbrational Muppetational... This is what we call Show. I have always wanted to have a neighbor just like you.</p>

                    <div class="info">
                        <p><i class="icon icon-Phone2"></i><a href="tel:(11)1234567890" title="Phone" class="phone">(11) 123 456 7890</a></p>
                        <p><i class="icon icon-Imbox"></i><a href="mailto:info@maxshop.com" title="info@maxshop.com">info@maxshop.com</a></p>
                    </div>

                </aside><!-- Widget About /- -->
            </div>
            <div class="copyright-section">
                <div class="coyright-content">
                    <p>Copyright &copy; 2017.Tang Shop All rights reserved.</p>
                </div>
            </div>
        </div><!-- Container /- -->
    </footer><!-- Footer Main /- -->

</div>

<script src="${pageContext.request.contextPath}/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/localLib/vue.js"></script>

<script>
    //数字加减框
    $("body").on("click",".num-jian",function (m) {
        var obj = $(this).closest("ul").find(".input-num");
        if (obj.val() <= 0) {
            obj.val(0);
        } else {
            obj.val(parseInt(obj.val()) - 1);
        }
        obj.change();
    });
    $("body").on("click",".num-jia",function (m) {
        var obj = $(this).closest("ul").find(".input-num");
        obj.val(parseInt(obj.val()) + 1);
        obj.change();
    });
</script>

<script>
$(function(){
    // 页面加载
    var url = window.location.pathname;
    var store_id = (url.split("/"))[3];
    var goods_id = (url.split("/"))[4];
    var user_idGet;
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/user/checkIfLogin",
        dataType: "json",
        async: false,
        success: function (data) {
            if(data.success == true){
                if(data.Login == true){//已经登陆
                    user_idGet=data.user_id;
                }else{//没有登录
                    // layer.alert('没有登录', {icon: 2, closeBtn: 0});
                    if (confirm("没有登录")) {
                        window.location.href= "http://localhost:8080/user/toLogin";
                    }
                }
            }else{
                layer.alert('查询登陆状态失败', { icon: 2, closeBtn: 0 });
            }
        }
    });

    var urlSend = "http://localhost:8080/goods/getGoodsInfo?store_id=" + store_id + "&goods_id="+ goods_id+"&user_id="+user_idGet;

    var vm = new Vue({
        el: '#container',
        data: {
            goods_id: goods_id,
            goods_name: "",
            goods_price: "",
            oldlevel: "",
            description: "",
            pic_url: "",
            
            info:[] //触发更新用
        }
    });

    $.ajax({    
        type: "POST",    
        url: urlSend,
        contentType: "application/json; charset=utf-8",    
        dataType: "json",    
        async: false, //同步请求，注意此字段    
        success: function (data) {        
            if(data.success == true){
                var info = data.goodsGet;

                vm.goods_name = info.goods_name;
                vm.goods_price = info.price;
                vm.description = info.description;
                vm.pic_url = info.pic_url;                    

                vm.info.push({
                    a:"a"
                });
                
            }else{
                layer.alert("数据请求失败！");
            }
        } 
    });

    // 添加至购物车按钮
    $("#btn_cart").click(function(){

        var user_id;
        $.ajax({
            type: "POST",    
            url: "http://localhost:8080/user/checkIfLogin",
            dataType: "json",    
            async: false,   
            success: function (data) {        
                if(data.success == true){ 
                    if(data.Login == true){//已经登陆
                        user_id=data.user_id;
                    }else{//没有登录
                        // layer.alert('没有登录', {icon: 2, closeBtn: 0});
                        if (confirm("没有登录")) { 
                            window.location.href= "http://localhost:8080/user/toLogin";
                        }
                    }
                }else{
                    layer.alert('查询登陆状态失败', { icon: 2, closeBtn: 0 });
                }
            } 
        });

        var dataSend = {
            user_id: user_id,
            goods_id: vm.goods_id,
            quantity: parseInt($("#input-num").val())
        }
  
        $.ajax({    
            type: "POST", 
            // xhrFields: {
            //     withCredentials: true
            // },   
            url: "http://localhost:8080/shoppingCart/",
            data: JSON.stringify(dataSend),
            contentType: "application/json; charset=utf-8",    
            dataType: "json",    
            async: false,   
            success: function (data) {        
                if(data.success == true){                            
                    layer.alert('添加成功！', { icon: 1, closeBtn: 0 });
                }else{
                    layer.alert('添加失败！', { icon: 2, closeBtn: 0 });
                }
            } 
        });
    });


    // 添加至收藏按钮
    $("#btn_collection").click(function(){
        var number = $("#input-num").attr("value");
        var id = $(".good").attr("id");
        var dataSend = {
            id: id,
            number: number
        };

        $.ajax({    
            type: "POST",    
            url: "http://localhost:8080/star/set",
            data: JSON.stringify(dataSend),
            contentType: "application/json; charset=utf-8",    
            dataType: "json",    
            async: false,   
            success: function (data) {        
                if(data.success == true){                            
                    layer.alert('添加成功！', { icon: 1, closeBtn: 0 });
                }else{
                    layer.alert('添加失败！', { icon: 2, closeBtn: 0 });
                }
            } 
        });
    });
});
</script>


</body>
</html>


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

    <header class="header-section container-fluid no-padding">
        <!-- Top Header -->
        <div class="top-header container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="col-md-7 col-sm-7 col-xs-7 dropdown-bar">
                    <h5>Welcome To Tang Shop</h5>
                    <div class="language-dropdown dropdown">
                        <button aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" title="languages" id="language" type="button" class="btn dropdown-toggle">English <span class="caret"></span></button>
                        <ul class="dropdown-menu no-padding">
                            <li><a title="Danish" href="#">Danish</a></li>
                            <li><a title="German" href="#">German</a></li>
                            <li><a title="French" href="#">French</a></li>
                        </ul>
                    </div>
                    <div class="language-dropdown dropdown">
                        <button aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" title="currency" id="currency" type="button" class="btn dropdown-toggle">US Dollar<span class="caret"></span></button>
                        <ul class="dropdown-menu no-padding">
                            <li><a title="Danish" href="#">Usd</a></li>
                            <li><a title="German" href="#">Ora</a></li>
                            <li><a title="French" href="#">Riyal</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Social -->
                <div class="col-md-5 col-sm-5 col-xs-5 header-social">
                    <ul>
                        <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                        <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                        <li><a href="#" title="Pinterest"><i class="fa fa-pinterest-p"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="container-fluid no-padding menu-block">
            <div class="container">
                <nav class="navbar navbar-default ow-navigation">
                    <div class="navbar-header">
                        <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="index.html" class="navbar-brand">Tang <span>shop</span></a>
                    </div>
                    <div class="menu-icon">
                        <div class="search">
                            <a href="#" id="search" title="Search"><i class="icon icon-Search"></i></a>
                        </div>
                        <ul class="cart">
                            <li>
                                <a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="Add To Cart" href="#"><i class="icon icon-ShoppingCart"></i></a>
                                <ul class="dropdown-menu no-padding">
                                    <li class="mini_cart_item">
                                        <a title="Remove this item" class="remove" href="#">&#215;</a>
                                        <a href="#" class="shop-thumbnail">
                                            <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/localLib/images/product-wishlist-1.jpg">Flying Ninja
                                        </a>
                                        <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                    </li>
                                    <li class="mini_cart_item">
                                        <a title="Remove this item" class="remove" href="#">&#215;</a>
                                        <a href="#" class="shop-thumbnail">
                                            <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/localLib/images/product-wishlist-2.jpg">Flying Ninja
                                        </a>
                                        <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                    </li>
                                    <li class="button">
                                        <a href="#" title="View Cart">View Cart</a>
                                        <a href="#" title="Check Out">Check out</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#" title="Like"><i class="icon icon-Heart"></i></a></li>
                            <li><a href="#" title="User"><i class="icon icon-User"></i></a></li>
                        </ul>
                    </div><!-- Menu Icon /- -->
                    <div class="navbar-collapse collapse navbar-right" id="navbar">
                        <ul class="nav navbar-nav">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="cart.html">Cart</a></li>
                            <li><a href="checkout.html">Checkout</a></li>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="contact-us.html">Contact Us</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </nav><!-- nav /- -->
                <!-- Search Box -->
                <div class="search-box">
                    <span><i class="icon_close"></i></span>
                    <form><input type="text" class="form-control" placeholder="Enter a keyword and press enter..." /></form>
                </div><!-- Search Box /- -->
            </div><!-- Container /- -->
        </div><!-- Menu Block /- -->
    </header>

    <!-- 内容 -->
    <div class="main-container" id="container">
        <div class="col-md-6">
            <!-- 图片链接 -->
            <img src="${pageContext.request.contextPath}/localLib/images/category-1.jpg" alt="商品" width="400px" style="float:left; margin-left: 50%; margin-top: 200px">
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

    <footer id="footer-main" class="footer-main footer-main-1 services-section container-fluid">
        <!-- Container -->
        <div class="container">
            <div class="services-item">
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Truck"></i><h5>Free delivery</h5><i class="icon icon-Dollar"></i>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Goto"></i><h5>Money Back</h5><i class="icon icon-Dollars"></i>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Headset"></i><h5>24/7 support</h5><i class="icon icon-Timer"></i>
                    </div>
                </div>
            </div>
            <!-- Widget About -->
            <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_about">
                <a href="index.html" title="Max Shop">Max <span>Shop</span></a>
                <p>On the most sensational inspirational celbrational Muppetational... This is what we call Show. I have always wanted to have a neighbor just like you.</p>
                <ul class="social">
                    <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                    <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                </ul>
            </aside><!-- Widget About /- -->
            <!-- Widget Links -->
            <aside class="col-md-2 col-sm-6 col-xs-6 ftr-widget widget_links">
                <h3 class="widget-title">Popular Links</h3>
                <ul>
                    <li><a href="index.html#product-section" title="Popular Products">Popular Products</a></li>
                    <li><a href="index.html#selling" title="Best Selling">Best Selling</a></li>
                    <li><a href="about.html" title="About Us">About Us</a></li>
                    <li><a href="index.html#dealing" title="Deal Of The Day">Deal Of The Day</a></li>
                    <li><a href="index.html#collection" title="Product Collections">Product Collections</a></li>
                    <li><a href="contact-us.html" title="Contact Us">Contact Us</a></li>
                </ul>
            </aside><!-- Widget Links /- -->
            <!-- Widget Account -->
            <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_links widget_account">
                <h3 class="widget-title">my account</h3>
                <ul>
                    <li><a href="#" title="My Order Details">My Order Details</a></li>
                    <li><a href="#" title="My credit Offers">My credit Offers</a></li>
                    <li><a href="#" title="My addresses">My addresses</a></li>
                    <li><a href="#" title="My Personal Details">My Personal Details</a></li>
                    <li><a href="#" title="My Account Details">My Account Details</a></li>
                </ul>
            </aside><!-- Widget Account /- -->
            <!-- Widget Gallery -->
            <aside class="col-md-4 col-sm-6 col-xs-6 ftr-widget widget_gallery">
                <h3 class="widget-title">collections</h3>
                <ul>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/localLib/images/ftr-latestpost-1.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/localLib/images/ftr-latestpost-2.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/localLib/images/ftr-latestpost-3.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/localLib/images/ftr-latestpost-4.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/localLib/images/ftr-latestpost-5.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/localLib/images/ftr-latestpost-6.jpg" alt="ftr-latestpost"></a></li>
                </ul>
            </aside><!-- Widget Gallery -->
            <div class="copyright-section">
                <div class="coyright-content">
                    <p>Copyright © 2017.Company name All rights reserved.</p>
                </div>
                <ul>
                    <li><a href="#" title="Delivery Information">Delivery Information</a></li>
                    <li><a href="#" title="Privacy Policy">Privacy Policy</a></li>
                    <li><a href="#" title="Terms &amp; Condition">Terms &amp; Condition</a></li>
                </ul>
            </div>
        </div><!-- Container /- -->
    </footer>

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

    var urlSend = "http://localhost:8080/goods/getGoodsInfo?store_id=" + store_id + "&goods_id="+ goods_id;

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


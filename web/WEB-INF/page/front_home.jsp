<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>汤达人</title>

    <!-- Standard Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/localLib/images//favicon.ico" />

    <!-- For iPhone 4 Retina display: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images//apple-touch-icon-114x114-precomposed.png">

    <!-- For iPad: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images//apple-touch-icon-72x72-precomposed.png">

    <!-- For iPhone: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images//apple-touch-icon-57x57-precomposed.png">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/revolution/css/settings.css">

    <!-- RS5.0 Layers and Navigation Styles -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/revolution/css/navigation.css">

    <!-- Library - Bootstrap v3.3.5 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/libraries/lib.css">

    <!-- Custom - Common CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/css/navigation-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/css/shortcode.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/HomeStyle.css">
</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
<div class="main-container">

    <section class="content container-fluid">
    <!-- Header -->
    <header class="header-section container-fluid no-padding">
        <!-- Top Header -->
        <!--<div class="top-header top-header1 container-fluid no-padding">-->
            <!--&lt;!&ndash; Container &ndash;&gt;-->
            <!--<div class="container">-->
                <!--<div class="col-md-7 col-sm-7 col-xs-7 dropdown-bar">-->
                    <!--<h5>Welcome To Tang Shop</h5>-->
                <!--</div>-->
            <!--</div>&lt;!&ndash; Container /- &ndash;&gt;-->
        <!--</div>&lt;!&ndash; Top Header /- &ndash;&gt;-->
        <!-- Menu Block -->
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
                                <a href="${pageContext.request.contextPath}/front/personalCenter" title="User"><i class="icon icon-User"></i></a>
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
                            <li><a href="cart.html"><i class="icon icon-ShoppingCart"></i>购物车</a></li>
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

    </section>

    <main>
        <!-- Slider Section 1 -->
        <div id="home-revslider" class="slider-section container-fluid no-padding">
            <!-- START REVOLUTION SLIDER 5.0 -->
            <div class="rev_slider_wrapper">
                <div id="home-slider1" class="rev_slider" data-version="5.0">
                    <ul>
                        <li data-transition="zoomout" data-slotamount="default"  data-easein="easeInOut" data-easeout="easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7">
                            <img src="${pageContext.request.contextPath}/localLib/images/slider-1.jpg" alt="slider" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-1"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-200','-130','-110','-80']"
                                 data-fontsize="['38','30','25','16']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="y:-50px;opacity:0;s:1000;e:Power4.easeOut;"
                                 data-transform_out="opacity:0;s:3000;e:Power4.easeIn;s:3000;e:Power4.easeIn;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 3.04px; color:#333; font-weight: 700; font-family: 'Montserrat', sans-serif; text-transform: uppercase;">new way to purchase your products
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-2"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-135','-80','-60','-50']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-width="['750','750','738','450']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">The weather started getting rough the tiny ship was tossed. If not for the courage of the fearless
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-3"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-110','-50','-35','-30']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">crew the Minnow would be lost. our dreams come true for me and you.
                            </div>
                            <div class="tp-caption NotGeneric-Button rev-btn  rs-parallaxlevel-0" id="slide-layer-4"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-30','20','40','30']"
                                 data-fontsize="['14','14','14','12']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
                                 data-style_hover="c:rgb(255, 255, 255);bg:rgba(182, 121, 95);"
                                 data-transform_in="x:[-100%];z:0;rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2500;e:Power3.easeInOut;"
                                 data-transform_out="auto:auto;s:1000;e:Power2.easeInOut;"
                                 data-start="2000"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-actions='[{"event":"click","action":"scrollbelow","offset":"0px"}]'
                                 data-responsive_offset="on"
                                 data-responsive="off"
                                 style="z-index: 10; padding:8px 38px; letter-spacing:0.56px; color: #b6795f; border-color: #b6795f; font-family: 'Montserrat', sans-serif; text-transform:uppercase; background-color:transparent; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">Shop Now
                            </div>
                        </li>

                        <li data-transition="zoomout" data-slotamount="default"  data-easein="easeInOut" data-easeout="easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7">
                            <img src="${pageContext.request.contextPath}/localLib/images/slider-1.jpg" alt="slider" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-5"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-200','-130','-110','-80']"
                                 data-fontsize="['38','30','25','16']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="y:-50px;opacity:0;s:1000;e:Power4.easeOut;"
                                 data-transform_out="opacity:0;s:3000;e:Power4.easeIn;s:3000;e:Power4.easeIn;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 3.04px; color:#333; font-weight: 700; font-family: 'Montserrat', sans-serif; text-transform: uppercase;">new way to purchase your products
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-6"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-135','-80','-60','-50']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-width="['750','750','738','450']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">The weather started getting rough the tiny ship was tossed. If not for the courage of the fearless
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-7"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-110','-50','-35','-30']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">crew the Minnow would be lost. our dreams come true for me and you.
                            </div>
                            <div class="tp-caption NotGeneric-Button rev-btn  rs-parallaxlevel-0" id="slide-layer-8"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-30','20','40','30']"
                                 data-fontsize="['14','14','14','12']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
                                 data-style_hover="c:rgb(255, 255, 255);bg:rgba(182, 121, 95);"
                                 data-transform_in="x:[-100%];z:0;rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2500;e:Power3.easeInOut;"
                                 data-transform_out="auto:auto;s:1000;e:Power2.easeInOut;"
                                 data-start="2000"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-actions='[{"event":"click","action":"scrollbelow","offset":"0px"}]'
                                 data-responsive_offset="on"
                                 data-responsive="off"
                                 style="z-index: 10; padding:8px 38px; letter-spacing:0.56px; color: #b6795f; border-color: #b6795f; font-family: 'Montserrat', sans-serif; text-transform:uppercase; background-color:transparent; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">Shop Now
                            </div>
                        </li>
                    </ul>
                </div><!-- END REVOLUTION SLIDER -->
            </div><!-- END OF SLIDER WRAPPER -->
            <div class="goto-next"><a href="#category-section"><i class="icon icon-Mouse bounce"></i></a></div>
        </div><!-- Slider Section 1 /- -->
        <!-- Product Section -->
        <div id="product-section" class="product-section container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="row">
                    <!-- Section Header -->
                    <div class="section-header">
                        <h3>商品</h3>
                        <img src="${pageContext.request.contextPath}/localLib/images/section-seprator.png" alt="section-seprator" />
                    </div><!-- Section Header /- -->
                    <ul id="filters" class="products-categories no-left-padding">
                        <li><a data-filter="*" class="active" href="#">全部</a></li>
                        <li><a data-filter=".design" href="#">美妆</a></li>
                        <li><a data-filter=".video" href="#">书籍</a></li>
                        <li><a data-filter=".photography" href="#">配饰</a></li>
                        <li><a data-filter=".web" href="#">鞋类</a></li>
                        <li><a data-filter=".design" href="#">服装</a></li>
                        <li><a data-filter=".photography" href="#">数码</a></li>
                        <li><a data-filter=".video" href="#">更多<i class="fa fa-angle-down"></i></a></li>
                    </ul>
                    <div class="input-group">
                        <input class="form-control" placeholder="搜索" type="text">
                        <span class="input-group-btn">
								<button class="btn btn-search" title="Search" type="button"><i class="icon icon-Search"></i></button>
							</span>
                    </div>
                    <!-- Products -->
                    <ul class="products">
                        <!-- Product -->
                        <li class="product design">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-1.jpg" alt="Product" />
                                <h5>Stylish Chair</h5>
                                <span class="price"><del>$200</del>$139</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product video">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-2.jpg" alt="Product" />
                                <h5>men's casual shoes</h5>
                                <span class="price"><del>$150</del>$85</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product photography">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-3.jpg" alt="Product" />
                                <h5>Sun glass</h5>
                                <span class="price"><del>$100</del>$35</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product web">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-4.jpg" alt="Product" />
                                <h5>tourist bags</h5>
                                <span class="price"><del>$350</del>$279</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product design">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-5.jpg" alt="Product" />
                                <h5>mobile phone</h5>
                                <span class="price"><del>$450</del>$359</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product video">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-6.jpg" alt="Product" />
                                <h5>men's winter coat</h5>
                                <span class="price"><del>$220</del>$129</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product photography">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-7.jpg" alt="Product" />
                                <h5>Model x12 computer</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->

                        <!-- Product -->
                        <li class="product web">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/localLib/images/product-8.jpg" alt="Product" />
                                <h5>Stylish headset</h5>
                                <span class="price"><del>$50</del>$29</span>
                            </a>
                            <a href="#" class="addto-cart" title="Add To Cart">加入购物车</a>
                        </li><!-- Product /- -->
                    </ul><!-- Products /- -->
                </div><!-- Row /- -->
                <nav class="ow-pagination">
                    <ul class="pager">
                        <li class="load-more"><a href="#">更多</a></li>
                        <li class="previous"><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        <li class="next"><a href="#"><i class="fa fa-angle-left"></i></a></li>
                    </ul>
                </nav>
            </div><!-- Container /- -->
        </div><!-- Product Section /- -->

        <!-- Dealing Section2 -->
        <div id="dealing" class="dealing-section2 shop-single dealing-section container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>Deals Of The Day</h3>
                    <p>our vision is to be Earth's most customer centric company</p>
                    <img src="${pageContext.request.contextPath}/localLib/images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="accessories-block">
                        <h5>mens accessories</h5>
                        <p>The weather started getting rough the tossed. If not for the courage of the fearless crew the Minnow would be lost. would be lost.</p>
                        <ul>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/deal-3.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/deal-4.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/deal-5.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/deal-6.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/deal-7.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/deal-8.jpg" alt="deal"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12 saleup-img">
                    <div class="carousel-item">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/localLib/images/deal-9.jpg" alt="deal" />
                            <a href="#" class="product-del">
                                <h5>mens casual shoes</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/localLib/images/deal-9.jpg" alt="deal" />
                            <a href="#" class="product-del">
                                <h5>mens casual shoes</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/localLib/images/deal-9.jpg" alt="deal" />
                            <a href="#" class="product-del">
                                <h5>mens casual shoes</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                        </div>
                    </div>
                    <div data-date="2017/04/04" id="clock-2" class="clock"></div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Dealing Section2 -->
    </main>

    <!-- Footer Main -->
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


<!-- JQuery v1.12.4 -->
<script src="${pageContext.request.contextPath}/localLib/js/jquery.min.js"></script>

<!-- Library - Js -->
<script src="${pageContext.request.contextPath}/localLib/libraries/lib.js"></script>

<script src="${pageContext.request.contextPath}/localLib/libraries/jquery.countdown.min.js"></script>

<!-- RS5.0 Core JS Files -->
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/localLib/revolution/js/extensions/revolution.extension.actions.min.js"></script>

<!-- Library - Theme JS -->
<script src="${pageContext.request.contextPath}/localLib/js/functions.js"></script>

<!--layer 引入-->
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>

<script>

    $(function () {
        $(".content").on("click", ".btn_login", function () {
            layer.open({
                type: 2,
                title: '修改用户信息',
                shadeClose: true,
                shade: 0.8,
                area: ['500px', '600px'],
                content:"${pageContext.request.contextPath}/toLogin"
            })
        });
    });

</script>

</body>
</html>

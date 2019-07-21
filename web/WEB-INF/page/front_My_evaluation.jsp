<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Myevaluation</title>

    <!-- Standard Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/localLib/images/favicon.ico" />

    <!-- For iPhone 4 Retina display: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images/apple-touch-icon-114x114-precomposed.png">

    <!-- For iPad: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images/apple-touch-icon-72x72-precomposed.png">

    <!-- For iPhone: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images/apple-touch-icon-57x57-precomposed.png">

    <!-- Library - Google Font Familys
    <link href="https://fonts.googleapis.com/css?family=Arizonia|Crimson+Text:400,400i,600,600i,700,700i|Lato:100,100i,300,300i,400,400i,700,700i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    -->
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
                        <div>
                            <a href="${pageContext.request.contextPath}/front/personalCenter" title="User"><i class="icon icon-User"></i></a>
                        </div>
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
    <main>

    <div class="page-banner container-fluid no-padding">
        <!-- Container -->
        <div class="container">
            <div class="section-header">
                <h3>我的评价</h3>
                <img src="${pageContext.request.contextPath}/localLib/images/section-seprator.png" alt="section-seprator">
            </div>
        </div>
    </div>

    <div id="selling" class="container-fluid no-left-padding no-right-padding woocommerce-selling">
        <!-- Container -->
        <div class="container">
            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom:30px;">
                <div class="selling-box">
                    <img src="${pageContext.request.contextPath}/localLib/images/selling-1.jpg" alt="selling">
                    <div class="selling-content">
                        <span class="price">￥49</span>
                        <div class="star-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h6><a href="#">mens casual belts······</a></h6>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom:30px;">
                <div class="selling-box">
                    <img src="${pageContext.request.contextPath}/localLib/images/selling-2.jpg" alt="selling">
                    <div class="selling-content">
                        <span class="price">￥149</span>
                        <div class="star-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h6><a href="#">attractive chains······</a></h6>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom:30px;">
                <div class="selling-box">
                    <img src="${pageContext.request.contextPath}/localLib/images/selling-3.jpg" alt="selling">
                    <div class="selling-content">
                        <span class="price">￥249</span>
                        <div class="star-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h6><a href="#">ladies bags······</a></h6>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom:30px;">
                <div class="selling-box">
                    <img src="${pageContext.request.contextPath}/localLib/images/selling-4.jpg" alt="selling">
                    <div class="selling-content">
                        <span class="price">￥179</span>
                        <div class="star-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h6><a href="#">casual shirts······</a></h6>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom:30px;">
                <div class="selling-box">
                    <img src="${pageContext.request.contextPath}/localLib/images/selling-5.jpg" alt="selling">
                    <div class="selling-content">
                        <span class="price">￥79</span>
                        <div class="star-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h6><a href="#">ladies wallets······</a></h6>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom:30px;">
                <div class="selling-box">
                    <img src="${pageContext.request.contextPath}/localLib/images/selling-6.jpg" alt="selling">
                    <div class="selling-content">
                        <span class="price">￥550</span>
                        <div class="star-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h6><a href="#">huvai chappals······</a></h6>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Container /- -->

    <div class="map container-fluid no-padding">
        <div class="map-canvas" id="map-canvas-contact" data-lat="-32.559356" data-lng="149.564237" data-string="Max Shop, 65 Huge Street Melbourne,  2850 Australia." data-zoom="12"></div>
        <a href="#">Tang <span>Shop</span></a>
    </div>

    </main>

    <footer id="footer-main" class="footer-main container-fluid">
        <!-- Container -->
        <div class="container">
            <div class="row">
                <!-- Widget About -->
                <aside class="col-md-12 col-sm-12 col-xs-12 ftr-widget widget_about">
                    <a href="/front/home" title="Max Shop">汤 <span>达人</span></a>
                    <p>On the most sensational inspirational celbrational Muppetational... This is what we call Show. I have always wanted to have a neighbor just like you.</p>

                    <div class="info">
                        <p><i class="icon icon-Phone2"></i><a href="tel:(11)1234567890" title="Phone" class="phone">(11) 123 456 7890</a></p>
                        <p><i class="icon icon-Imbox"></i><a href="mailto:info@maxshop.com" title="info@maxshop.com">info@maxshop.com</a></p>
                    </div>

                </aside><!-- Widget About /- -->
            </div>
            <div class="copyright-section">
                <div class="coyright-content">
                    <p>Copyright © 2017.Tang Shop All rights reserved.</p>
                </div>
            </div>
        </div><!-- Container /- -->
    </footer>
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

<!-- Library - Google Map API -->
<!---<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script>--->

<!-- Library - Theme JS -->
<script src="${pageContext.request.contextPath}/localLib/js/functions.js"></script>

</body>
</html>
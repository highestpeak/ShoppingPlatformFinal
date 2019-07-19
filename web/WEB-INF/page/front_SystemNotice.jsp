<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Systemnotice</title>

    <!-- Standard Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/localLib/images//favicon.ico" />

    <!-- For iPhone 4 Retina display: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images//apple-touch-icon-114x114-precomposed.png">

    <!-- For iPad: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images//apple-touch-icon-72x72-precomposed.png">

    <!-- For iPhone: -->
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/localLib/images//apple-touch-icon-57x57-precomposed.png">

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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/localLib/HomeStyle.css">


</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
<div class="main-container">
    <!-- Loader -->
    <div id="site-loader" class="load-complete">
        <div class="loader">
            <div class="loader-inner ball-clip-rotate">
                <div></div>
            </div>
        </div>
    </div><!-- Loader /- -->

    <!-- Header -->
    <header class="header-section header-section-1 container-fluid no-padding">
        <!-- Top Header -->
        <div class="top-header top-header1 container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="col-md-7 col-sm-7 col-xs-7 dropdown-bar">
                    <h5>Welcome To Tang Shop</h5>
                </div>
            </div><!-- Container /- -->
        </div><!-- Top Header /- -->

        <!-- Middel Header -->
        <div class="middel-header">
            <!-- Container -->
            <div class="container">
                <!-- Logo Block -->
                <div class="col-md-4 col-sm-6 col-xs-12 logo-block">
                    <a href="front_home.jsp" class="navbar-brand">汤 <span>达人</span></a>
                </div><!-- Logo Block /- -->
                <!-- Search Block -->
                <div class="col-md-5 col-sm-6 col-xs-6 search-block">
                    <div class="input-group">
                        <input class="form-control" placeholder="搜索 . . ." type="text">
                        <span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="icon icon-Search"></i></button>
							</span>
                    </div>
                </div><!-- Search Block /- -->
                <!-- Menu Icon -->
                <div class="col-md-3 col-sm-6 col-xs-6 menu-icon">
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
                    </ul>
                </div><!-- Menu Icon /- -->
            </div><!-- Container /- -->
        </div><!-- Middel Header /- -->

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
                        <a href="front_home.jsp" class="navbar-brand">汤 <span>达人</span></a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbar">
                        <ul class="nav navbar-nav">
                            <li><a href="front_My_Personalcenter.jsp"><i class="icon icon-User"></i>个人资料</a></li>
                            <li><a href="front_history.jsp"><i class="fa fa-vimeo"></i>游览历史</a></li>
                            <li><a href="front_My_order.jsp"><i class="icon icon-Heart"></i>我的订单</a></li>
                            <li><a href="front_My_evaluation.html"><i class="fa fa-tumblr"></i>我的评价</a></li>
                            <li><a href="front_SystemNotice.jsp"><i class="fa fa-twitter"></i>系统通知</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </nav><!-- nav /- -->
            </div><!-- Container /- -->
        </div><!-- Menu Block /- -->
    </header><!-- Header /- -->

    <main>
        <!-- Page Banner -->
        <div class="page-banner container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="banner-content">
                    <h3>个人中心</h3>
                </div>
                <ol class="breadcrumb">
                    <li><a href="front_home.jsp" title="Home">首页</a></li>
                    <li class="active">个人中心</li>
                </ol>
            </div><!-- Container /- -->
        </div><!-- Page Banner /- -->

        <div class="blog-section latest-blog container-fluid">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>系统通知</h3>
                    <img src="${pageContext.request.contextPath}/localLib/images/section-seprator.png" alt="section-seprator">
                </div><!-- Section Header /- -->
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="type-post">
                        <div class="entry-cover">
                            <a href="#"><img src="${pageContext.request.contextPath}/localLib/images/blog-1.jpg" alt="blog"></a>
                            <span class="post-date"><a href="#"><i class="fa fa-calendar-o"></i>2019/7/20</a></span>
                        </div>
                        <div class="blog-content">
                            <h3 class="entry-title"><a href="#" title="new Collectios are imported In Our shop.">new Collectios are<span>imported</span> In Our shop.</a></h3>
                            <div class="entry-content">
                                <p>The weather started getting rough - the tiny ship was tossed. If not for the courage of the fearless crew the Minnow would be lost.</p>
                                <a href="#" title="Read More" class="read-more">详情<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="type-post">
                        <div class="entry-cover">
                            <a href="#"><img src="${pageContext.request.contextPath}/localLib/images/blog-3.jpg" alt="blog"></a>
                            <span class="post-date"><a href="#"><i class="fa fa-calendar-o"></i>2019/3/14</a></span>
                        </div>
                        <div class="blog-content">
                            <h3 class="entry-title"><a href="#" title="buyers are saying it's good shop">buyers are saying it's <span>good shop</span></a></h3>
                            <div class="entry-content">
                                <p>The weather started getting rough - the tiny ship was tossed. If not for the courage of the fearless crew the Minnow would be lost.</p>
                                <a href="#" title="Read More" class="read-more">详情<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="type-post">
                        <div class="entry-cover">
                            <a href="#"><img src="${pageContext.request.contextPath}/localLib/images/blog-2.jpg" alt="blog"></a>
                            <span class="post-date"><a href="#"><i class="fa fa-calendar-o"></i>2019/6/26</a></span>
                        </div>
                        <div class="blog-content">
                            <h3 class="entry-title"><a title="Best Solds in the this year was watches" href="#">Best Solds in the this year was <span>watches</span></a></h3>
                            <div class="entry-content">
                                <p>The weather started getting rough - the tiny ship was tossed. If not for the courage of the fearless crew the Minnow would be lost.</p>
                                <a href="#" title="Read More" class="read-more">详情<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Container /- -->
        </div>
        <!-- Container /- -->
        <div class="map container-fluid no-padding">
            <div class="map-canvas" id="map-canvas-contact" data-lat="-32.559356" data-lng="149.564237" data-string="Max Shop, 65 Huge Street Melbourne,  2850 Australia." data-zoom="12"></div>
            <a href="#">Tang <span>Shop</span></a>
        </div>
    </main>
    <footer id="footer-main" class="footer-main footer-main-1 services-section container-fluid">
        <!-- Container -->
        <div class="container">

            <!-- Widget About -->
            <aside class="col-md-12 col-sm-12 col-xs-12 ftr-widget widget_about">
                <a href="front_home.jsp" title="汤 达人">汤 <span>达人</span></a>
                <p>On the most sensational inspirational celbrational Muppetational... This is what we call Show. I have always wanted to have a neighbor just like you.</p>

            </aside>
            <div class="copyright-section">
                <div class="coyright-content">
                    <p>Copyright © 2017.Tang Shop All rights reserved.</p>
                </div>

            </div>
        </div><!-- Container /- -->
    </footer></div>

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

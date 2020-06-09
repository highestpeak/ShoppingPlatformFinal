<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cart</title>


    <!-- Standard Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/localLib/images/favicon.ico" />

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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/localLib/HomeStyle.css">


    <script src="${pageContext.request.contextPath}/localLib/js/html5/respond.min.js"></script>

    <style type="text/css">
        .item-id{
            display:none;
        }
        .user-id{
            display:none;
        }
        /*#a1*/
        /*{*/
            /*float:left;*/
            /*width:50%;*/
        /*}*/
        /*#a2*/
        /*{*/
            /*float:right;*/
            /*width:50%;*/
        /*}*/
        #trbig{
            transform:scale(1,1)
        }
    </style>



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
        <!-- Page Banner -->
        <div class="page-banner container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="section-header">
                    <h3>购物车</h3>
                    <img src="${pageContext.request.contextPath}/localLib/images/section-seprator.png" alt="section-seprator">
                </div>
            </div><!-- Container /- -->
        </div><!-- Page Banner /- -->
        <!-- Cart -->
        <div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
            <!-- Container -->
            <div class="container">
                <!-- Cart Table -->
                <div class="col-md-12 col-sm-12 col-xs-12 cart-table">
                    <form name="form1">
                        <%--<c:if test="${!empty(list)}">--%>
                        <input id="user_id" name="user_id" value="2017" class="user-id" type="text" >
                        <input id="remove_id" name="remove_id" value="" class="item-id" type="text" >
                        <input id="update_id" name="update_id" value="" class="item-id" type="text" >
                        <input id="quantity" name="quantity" value="" class="item-id" type="text" >
                        <table class="table table-bordered table-responsive">
                            <thead>
                            <tr>
                                <th class="item-id">Select</th>
                                <th class="product-thumbnail">Select</th>
                                <%--<th class="product-thumbnail">Item</th>--%>
                                <th class="product-name">Product Name</th>
                                <th class="product-quantity">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspQuantity&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
                                <th class="product-unit-price">Unit Price</th>
                                <th class="product-subtotal">Total</th>
                                <th class="product-remove">保存</th>
                                <th class="product-remove">删除</th>
                            </tr>
                            </thead>
                            <tbody id="tbodyId">

                            <%--<c:forEach var="me" items="${list}" varStatus="cou">--%>
                                <%--<tr class="cart_item">--%>
                                    <%--<input name="item${cou.count}" value="${cou.count}" class="item-id" type="text" id="item${cou.count}">--%>
                                    <%--<td data-title="Item" class="product-thumbnail"><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/product-item.jpg" alt="Product" /></a></td>--%>
                                    <%--<td data-title="Product Name" class="product-name"><a href="#">aaa</a></td>--%>
                                    <%--<td data-title="Quantity" class="product-quantity">--%>
                                        <%--<div class="prd-quantity" data-title="Quantity">--%>
                                            <%--<input value="-" class="qtyminus btn" data-field="quantity1" type="button">--%>
                                            <%--<input id="quantity${cou.count}" name="quantity${cou.count}" value="0" class="qty" type="text" >--%>
                                            <%--<input value="+" class="qtyplus btn" data-field="quantity1" type="button">--%>
                                        <%--</div>--%>
                                    <%--</td>--%>
                                    <%--<td data-title="Unit Price" class="product-unit-price">aaa</td>--%>
                                    <%--<td data-title="Total" class="product-subtotal">aaa</td>--%>
                                    <%--<td>--%>
                                        <%--<button type="button" class="btn_mod" >保存</button>--%>
                                        <%--<button type="button" class="btn_del" >删除</button>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                            <%--</c:forEach>--%>

                            <%--<c:forEach var="x" begin="1" end="5">--%>
                            <%--<tr class="cart_item">--%>
                                <%--<td><input type="checkbox"></td>--%>
                                <%--<td data-title="Item" class="product-thumbnail"><a href="#"><img src="${pageContext.request.contextPath}/localLib/images/product-item.jpg" alt="Product" /></a></td>--%>
                                <%--<td data-title="Product Name" class="product-name"><a href="#">mens casual shoe</a></td>--%>
                                <%--<td data-title="Quantity" class="product-quantity">--%>
                                <%--<div class="prd-quantity" data-title="Quantity">--%>
                                <%--<input value="-" class="qtyminus btn" data-field="quantity1" type="button">--%>
                                <%--<input id="quantity1" name="quantity1" value="0" class="qty" type="text">--%>
                                <%--<input value="+" class="qtyplus btn" data-field="quantity1" type="button">--%>
                                <%--</div>--%>
                                <%--</td>--%>
                                <%--<td data-title="Unit Price" class="product-unit-price">$550</td>--%>
                                <%--<td data-title="Total" class="product-subtotal">$550</td>--%>
                                <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<button type="button" class="btn_mod" >保存</button>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<button type="button" class="btn_del" >删除</button>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                    <%--<td><a id="a1" class="btn btn-xs btn-info btn_mod" >保存</a></td>--%>
                                    <%--<td><a id="a2" class="btn btn-xs btn-danger btn_del" >删除</a></td>--%>
                            <%--</tr>--%>
                            <%--</c:forEach>--%>
                            <tr id="trbig" >
                                <td class="action" colspan="6">
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    <a href="${pageContext.request.contextPath}/front/home"  title="Continue shopping" >Continue shopping</a>

                                    <a href="javascript:void(0);"  title="Submit Order" onclick="submitOrder()">Submit Order</a>
                                </td>

                            </tr>
                            <%--</c:if>--%>


                            </tbody>
                        </table>
                    </form>
                </div><!-- Cart Table /- -->
                <!-- Coupon -->

            </div><!-- Container /- -->
        </div><!-- Cart /- -->

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

<div class="box box-info" id="order_submit_table" style="display: none">
    <div class="box-header with-border">
        <h3 class="box-title">填写收货地址</h3>
    </div>

    <!-- 提交表单 -->
    <form class="form-horizontal">
        <div class="box-body">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">consignee</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="consignee">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">phone</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="phone">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">address</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="address">
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">post_code</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="post_code">
                </div>
            </div>

        </div>
        <div class="box-footer">
            <button type="button" class="btn btn-default pull-left" id="good_info_mod_cancel" onclick="submit_cancel()">取消</button>
            <button type="button" class="btn btn-info pull-right" id="good_info_mod_sumbit" onclick="submit_next()">提交</button>
        </div>
    </form>
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
<script src="${pageContext.request.contextPath}/localLib/layer/layer.js"></script>


<script>
    $(function(){
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
                        var record = document.getElementById("user_id");
                        record.value = user_id;
                        console.log(user_id);
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
        var user_id = document.getElementById("user_id").value;
        var urlSend="http://localhost:8080/shoppingCart/?user_id="+user_id;
        $.ajax({
            type: "GET",
            url:urlSend,//请求controller方法
            dataType: "json",
            async: false, //同步请求，注意此字段
            success: function (data) {
                console.log(data);
                if(data.success == true){

                    var $tbody = $("#tbodyId");
                    var gl = data.result;
                    $.each(gl,function (i,e) {
                        if(gl.length == 0){
                            var $trError = $("<tr>").append('<input value="您还没有加入任何商品">');
                            $tbody.prepend($trError);
                        }else{

                        }
                        var $tda = $("<td >").append('<input type="checkbox" name="ID">');
                        var $input2 = $("<input>");
                        $input2.attr("value",e["relationId"]);
                        var $tdc = $("<td class=\"item-id\">").append($input2);
                        var $tdProductName = $("<td data-title=\"Product Name\" class=\"product-name\">").append("<a>").html(e["name"]);
                        // var url = e["pictureUrl"];
                        // var $tdUrl = $("<td >").append('<a href=url>');
                        var $input = $("<input name=\"quantity1\" class=\"qty\" type=\"text\">");
                        $input.attr("value",e["quantity"]);
                        var $div = $("<div class=\"prd-quantity\" data-title=\"Quantity\">")
                            .append("<input value=\"-\" class=\"qtyminus btn\" data-field=\"quantity1\" type=\"button\" >")
                            .append($input)
                            .append("<input value=\"+\" class=\"qtyplus btn\" data-field=\"quantity1\" type=\"button\" >");
                        var $tdQuantity = $("<td data-title=\"Quantity\" class=\"product-quantity\">").append($div);
                        var $tr = $("<tr class=\"cart_item\">")
                            .append($tdc)
                            .append($tda)
                            // .append($("<td>").html("a"))
                            .append($tdProductName)
                            // .append($("<td>").html("Mens Causual Shoe"))
                            .append($tdQuantity)
                            // .append($("<td>").html("a"))
                            .append($("<td data-title=\"Unit Price\" class=\"product-unit-price\">").html(e["unitPrice"]))
                            .append($("<td data-title=\"Total\" class=\"product-subtotal\">").html(e["totalPrice"]));
                        var $button_1 = document.createElement("a");
                        $button_1.text = "保存";
                        $button_1.className = "btn btn-xs btn-info btn_mod";
                        var $button_2 = document.createElement("a");
                        $button_2.text = "删除";
                        $button_2.className = "btn btn-xs btn-danger btn_del";
                        var $td1 = $("<td>").append($button_1);
                        var $td2 = $("<td>").append($button_2)
                        $tr.append($td1).append($td2);
                        $tbody.prepend($tr);
                    });
                }else{
                    layer.alert("数据请求失败！");
                }
            }
        });
    });
</script>
<script>
    $(function(){
        $(".main-container").on("click", ".qtyminus", function() {
            var $tr = $(this).parents("tr");
            var quantity = parseInt($tr.find('td').eq(3).find('div').eq(0).find('input').eq(1).val());
            console.log(quantity);
            var newQuantity = quantity - 1;
            $tr.find('td').eq(3).find('div').eq(0).find('input').eq(1).attr("value",newQuantity);
        });
        $(".main-container").on("click", ".qtyplus", function() {
            var $tr = $(this).parents("tr");
            var quantity = parseInt($tr.find('td').eq(3).find('div').eq(0).find('input').eq(1).val());
            console.log(quantity);
            var newQuantity = quantity + 1;
            console.log(newQuantity);
            $tr.find('td').eq(3).find('div').eq(0).find('input').eq(1).attr("value",newQuantity);
        });

        $(".main-container").on("click", ".btn_del", function() {
            var $tr = $(this).parents("tr");
            var goods_id = $tr.find("td:eq(0)").html();
            var goods_name = $tr.find("td:eq(2)").html();
            var dataSend = {
                id: goods_id
            };
            var relation_id = $tr.find('td').eq(0).find('input').eq(0).val();
            var urlSend = "http://localhost:8080/shoppingCart/"+relation_id;
            layer.confirm('确定删除: ' + goods_name + "?", {icon: 3, title: '提示'}, function (index) {

                $.ajax({
                    type: "DELETE",
                    url: urlSend,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        console.log(data);
                        if (data.success == true) {
                            layer.alert('删除成功！', {icon: 1, closeBtn: 0}, function (index) {
                                window.location.reload();
                            });

                        } else {
                            layer.alert('删除失败！', {icon: 2, closeBtn: 0});
                        }
                    }
                });
                layer.close(index);
            });
        });
        $(".main-container").on("click", ".btn_mod", function(){

            var $tr = $(this).parents("tr");
            var goods_id = "1";
            var goods_name = $tr.find("td:eq(1)").html();
            var quantity = $tr.find('td').eq(3).find('div').eq(0).find('input').eq(1).val();
            // var id = $tr.find('td').eq(0).find('input').eq(0).val();
            // var quantity = document.getElementById("quantity1").value;

            // console.log(dataSend);
            layer.confirm('是否保存 ', function (index) {
                layer.close(index);
                var relation_id = $tr.find('td').eq(0).find('input').eq(0).val();
                console.log(relation_id);
                var dataSend = {
                    new_quantity:quantity
                };
                var urlSend="http://localhost:8080/shoppingCart/"+relation_id;
                console.log(urlSend);
                $.ajax({
                    type: "PUT",
                    url: urlSend,
                    data: JSON.stringify(dataSend),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        console.log(data);
                        if (data.success == true) {
                            layer.alert('保存成功！', {icon: 1, closeBtn: 0}, function (index) {
                                window.location.reload();
                            });
                        } else {
                            layer.alert('保存失败！', {icon: 2, closeBtn: 0});
                        }
                    }
                });

            });
        });
    })
</script>
<script type="text/javascript">

    function submitOrder(){
        layer.open({
            type: 1,
            title: "",
            shadeClose: true,
            shade: 0.5,
            area: ["550px", "300px"],
            content: $("#order_submit_table")
        });
    }
    function submit_next(){
        var ID = document.getElementsByName("ID");
        console.log(ID);
        var array= new Array();
        for (var i = 0; i < ID.length; i++) {
            if(ID[i].checked){
                var $tr = $(ID[i]).parents("tr");                     //
                var id = $tr.find('td').eq(0).find('input').eq(0).val();
                console.log(id);
                array.push(id);
                console.log(array);
            }
        }

        var oUser_id = document.getElementById(user_id);
        var dataSend={
            relation_id_list:array,
            consignee:$("#consignee").val(),
            phone:$("#phone").val(),
            address:$("#address").val(),
            post_code:$("#post_code").val()
        };
        console.log(dataSend);
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/orders/",
            data: JSON.stringify(dataSend),//放置数据的字段    
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false, //同步请求，注意此字段    
            success: function (data) {
                console.log(data);
                if(data["success"]){
                    layer.alert("提交成功");
                    window.location.reload();
                }
                else if(!data["success"]){
                    layer.alert("提交失败");
                }
            }
        });
    }
    function submit_cancel(){
        layer.closeAll();
    }

</script>

</body>
</html>



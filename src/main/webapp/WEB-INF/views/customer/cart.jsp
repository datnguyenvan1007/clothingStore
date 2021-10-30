<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/lib.jsp"></jsp:include>
    <link rel="stylesheet" href="${base }/css/cart.css">
    <link rel="stylesheet" href="${base }/css/header_footer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <nav>
        <ul class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="${base }/home">Trang chủ</a>
            </li>
            <li class="breadcrumb-item">
                Giỏ hàng
            </li>
        </ul>
    </nav>
    <section>
        <p>Giỏ hàng của bạn</p>
        <c:forEach items="${cart.cartItems }" var="item">
        	<div class="container-product d-flex">
	            <span onclick="deleteCart(${item.productId})" class="delete"><i class="fal fa-times"></i></span>
	            <img src="${base }/upload/${item.path}" alt="" width="120px">
	            <div class="content">
	                <h6 class="">${item.productName }</h6>
	                <span class="priceUnit">
	                	<fmt:setLocale value="vi_VN" scope="session" />
                        <fmt:formatNumber value="${item.priceUnit }" type="currency" />
	                </span><br>
	                <div class="quantity btn-group">
	                    <button type="button" value="-" onclick="changeQuantity(${item.productId}, ${item.priceUnit }, this)">-</button>
	                    <input type="text" name="quantity" value="${item.quantity }" readonly>
	                    <button type="button" value="+" onclick="changeQuantity(${item.productId}, ${item.priceUnit }, this)">+</button>
	                </div>
	                <div class="sub-total">
	                	<fmt:setLocale value="vi_VN" scope="session" />
                        <fmt:formatNumber value="${item.priceUnit * item.quantity }" type="currency" />
	                </div>
	            </div>
	        </div>
        </c:forEach>
        <div class="total">
            Tổng tiền:
            <span>
            </span>
        </div>
        <div class="cart-control">
            <a href="${base }/home" type="button"><i class="fas fa-reply"></i> TIẾP TỤC MUA HÀNG</a>
            <a href="${base }/cart/checkout" type="button">THANH TOÁN</a>
        </div>
    </section>
    <hr style="margin: 100px 0;">
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${base }/js/cart.js"></script>
<script type="text/javascript" src="${base }/js/home.js"></script>
</html>
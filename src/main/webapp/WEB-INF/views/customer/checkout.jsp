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
    <title>Thanh toán</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/lib.jsp"></jsp:include>
    <link rel="stylesheet" href="${base }/css/cart.css">
    
</head>
<body>
    <main class="container d-flex">
    	<div id="message"></div>
        <div class="col-6 checkout">   
            <div class="col-12">Shop thời trang</div>
            <div class="col-12">Thông tin giao hàng</div>
            <form action="${base }/cart/checkout" method="POST" id="checkout-form">
            	<c:if test="${userLogined != null }">
            		<div class="col-12">
                    <input type="text" class="form-control" name="fullname" placeholder="Họ và tên" value="${userLogined.fullname }" required>
                    <div class="fullname-error" style="color:red; font-size:12px"></div>
	                </div>
	                <div class="col-12">
	                    <input type="email" class="form-control" name="email" placeholder="Email" value="${userLogined.email }" required>
	                    <div class="email-error" style="color:red; font-size:12px"></div>
	                </div>
            	</c:if>
            	<c:if test="${userLogined == null }">
            		<div class="col-12">
                    <input type="text" class="form-control" name="fullname" placeholder="Họ và tên" required>
                    <div class="fullname-error" style="color:red; font-size:12px"></div>
	                </div>
	                <div class="col-12">
	                    <input type="email" class="form-control" name="email" placeholder="Email" required>
	                    <div class="email-error" style="color:red; font-size:12px"></div>
	                </div>
            	</c:if>
            	<div class="col-7">
                    <input type="text" class="form-control" name="phonenumber" placeholder="Số điện thoại" required>
                    <div class="phonenumber-error" style="color:red; font-size:12px"></div>
                </div>
                <div class="col-12">
                    <input type="text" class="form-control" name="address" placeholder="Địa chỉ" required>
                    <div class="address-error" style="color:red; font-size:12px"></div>
                </div>
                <div class="d-flex align-items-center justify-content-between col-12">
                    <a href="${base }/cart"><i class="far fa-chevron-left"></i> Giỏ hàng</a>
                    <button  class="btn btn-primary" id="checkout">Hoàn tất đơn hàng</button>
                </div>
            </form>
        </div>
        <div class="col-6 checkout-list-product">
	        <c:forEach items="${cart.cartItems }" var="item">
	        	<div class="checkout-product d-flex justify-content-between col-12 align-items-center">
		            <img src="${base }/upload/${item.path}" alt="" height="100%">
	                <div style="width:200px">${item.productName }</div>
	                <div>
	                	<fmt:setLocale value="vi_VN" scope="session" />
                        <fmt:formatNumber value="${item.priceUnit * item.quantity}" type="currency" />
	                </div>
	                <div class="checkout-quantity">${item.quantity }</div>
		        </div>
	        </c:forEach>
	        <div class="ckeckout-total d-flex justify-content-between col-12">
	            <div>Tổng cộng:</div>
	            <div>
	            	<fmt:setLocale value="vi_VN" scope="session" />
                    <fmt:formatNumber value="${totalPrice }" type="currency" />
	            </div>
	        </div>
        </div>
    </main>
</body>
<script type="text/javascript" src="${base }/js/cart.js"></script>
</html>
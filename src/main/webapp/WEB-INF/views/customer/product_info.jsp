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
    <title>Trang chủ</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/lib.jsp"></jsp:include>
    <link rel="stylesheet" href="${base }/css/product_info.css">
    <link rel="stylesheet" href="${base }/css/header_footer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <nav>
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="${base }/home">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">${category.name}</a></li>
        </ul>
    </nav>
    <section>
        <div class="d-flex content">
            <div class="left-info">
                <img src="${base }/upload/${product.avatar}" alt="" width="100%" class="sub-img">
                <c:forEach var="picture" items="${pictures}">
                    <img src="${base }/upload/${picture.path}" alt="" width="100%" class="sub-img">
                </c:forEach>
            </div>
            <div class="middle-info">
                <img src="${base }/upload/${product.avatar}" alt="" width="100%" class="main-img">
            </div>
            <div class="right-info">
                <div class="product-name">
                    ${product.title}
                </div>
                <div class="product-id">
                </div>
                <div class="product-price">
                    <fmt:setLocale value="vi_VN" scope="session" />
                    <fmt:formatNumber value="${product.price }" type="currency" />
                </div>
                <hr>
                <div class="product-color">
                    Màu Sắc: <br>
                    <button type="button">
                        <img src="${base }/upload/${product.avatar}" alt="" width="40px">
                        Đen
                    </button>
                </div>
                <div class="product-size">
                    Size: <br>
                    <button type="button" >L</button>
                    <button type="button" >M</button>
                </div>
                Số Lượng: <br>
                <div class="product-quantity btn-group">
                    <button type="button" value="-">-</button>
                    <input type="text" name="quantity" value="1" readonly>
                    <button type="button" value="+">+</button>
                </div>
                <br>
                <div class="product-order">
                    <button type="button" class="btn-warning btn" onclick="productInfoToCart(${product.id}, this)">Đặt hàng</button>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<script src="${base }/js/home.js"></script>
</html>
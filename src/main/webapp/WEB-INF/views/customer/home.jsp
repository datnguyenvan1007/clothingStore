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
    <link rel="stylesheet" href="${base }/css/home.css">
    <link rel="stylesheet" href="${base }/css/header_footer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>


    <div>
        <img src="${base }/image/banner/banner.png" alt="Banner" width="100%">
    </div>


    <section>
        <div class="new-product container-fluid ">   
            <p class="text-center"><a href="${base }/category/san-pham-moi" class="product-title">SẢN PHẨM MỚI</a></p>
            <div>
                <div class="row-product">
                	<c:set var = "loop" value = "${0}"/>
                	<c:forEach var="item" items="${product }">
                	    <c:if test="${item.isHotNew == 2 && item.status == true && loop < 10}">
                	    	<c:set var = "loop" value = "${loop + 1}"/>
                            <div>
                                <div class="product">
                                    <a href="${base }/product_info/${item.seo}"><img src="${pageContext.servletContext.contextPath}/upload/${item.avatar }" alt="" width="100%"></a>
                                    <a href="${base }/product_info/${item.seo}">
                                        <p>
                                            ${item.title }
                                        </p>
                                    </a>
                                    <div class="price">
                                        <fmt:setLocale value="vi_VN" scope="session" />
                                        <fmt:formatNumber value="${item.price }" type="currency" />
                                    </div>
                                </div>
                                <div class="detail">
                                    <button type="button" onclick="cart(${item.id}, 1)"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</button>
                                    <button type="button"><a href="${base }/product_info/${item.seo}"><i class="fa fa-eye"></i> Xem chi tiết</a></button>
                                </div>
                            </div>
                	    </c:if>

                	</c:forEach>
                </div>
            </div>
        </div>
        <div class="hot-product container-fluid">   
            <p class="text-center"><a href="${base }/category/san-pham-ban-chay" class="product-title">SẢN PHẨM BÁN CHẠY</a></p>
            <div>
                <div class="row-product">
                	<c:set var = "loop" value = "${0}"/>
                	<c:forEach var="item" items="${product }">
                	    <c:if test="${item.isHotNew == 1 && item.status == true && loop < 10}">
                	    	<c:set var = "loop" value = "${loop + 1}"/>
                            <div>
                                <div class="product">
                                    <a href="${base }/product_info/${item.seo}"><img src="${pageContext.servletContext.contextPath}/upload/${item.avatar }" alt="" width="100%"></a>
                                    <a href="${base }/product_info/${item.seo}">
                                        <p>
                                            ${item.title }
                                        </p>
                                    </a>
                                    <div class="price">
                                        <fmt:setLocale value="vi_VN" scope="session" />
                                        <fmt:formatNumber value="${item.price }" type="currency" />
                                    </div>
                                </div>
                                <div class="detail">
                                    <button type="button" onclick="cart(${item.id}, 1)"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</button>
                                    <button type="button"><a href="${base }/product_info/${item.seo}"><i class="fa fa-eye"></i> Xem chi tiết</a></button>
                                </div>
                            </div>
                	    </c:if>
                	</c:forEach>
                </div>
            </div>
        </div>
        <div class="news container-fluid">   
            <p class="text-center">TIN TỨC</p>
            <div class="d-flex justify-content-around">
                <div class="news-product">
                    <img src="${base }/image/news/news1.png" alt="" width="100%">
                    <div class="title-content">
                        Áo sơ mi kẻ sọc nam Hàn Quốc chuẩn phong cách 2021
                    </div>
                    <div class="content">
                        Áo sơ mi kẻ sọc nam Hàn Quốc hiện đang là mẫu áo rất hot trong phong cách thời trang giới trẻ hiện nay. 
                        Bạn đã sở hữu cho mình những chiếc áo sơ mi nam kẻ sọc Hàn Quốc để phối đồ chưa. <br>
                        <span><a href="#">Xem thêm</a></span>
                    </div>
                </div>
                <div class="news-product">
                    <img src="${base }/image/news/news2.png" alt="" width="100%">
                    <div class="title-content">
                        Các kiểu áo sơ mi nam Hàn Quốc bắt trend MỚI NHẤT 2021
                    </div>
                    <div class="content">
                        Áo sơ mi luôn là những chiếc áo không thể thiếu trong tủ đồ của các anh em. 
                        Để làm mới hơn tủ đồ của mình bạn nên chọn những mẫu áo sơ mi nam Hàn Quốc mới đang là hot trend của giới trẻ. <br>
                        <span><a href="#">Xem thêm</a></span>
                    </div>
                </div>
                <div class="news-product">
                    <img src="${base }/image/news/news3.png" alt="" width="100%">
                    <div class="title-content">
                        Cách phối đồ cho nam gầy thấp không thể bỏ qua
                    </div>
                    <div class="content">
                        Các bạn nam gầy thấp đang lo lắng không biết mặc gì. 
                        Hãy xem ngay những mẹo dưới đây của chúng tôi để có diện mạo hoàn hảo hơn nhé. <br>
                        <span><a href="#">Xem thêm</a></span>
                    </div>
                </div>
                <div class="news-product">
                    <img src="${base }/image/news/news4.png" alt="" width="100%">
                    <div class="title-content">
                        Cách phối đồ cho người lùn mập nam hách dáng cực thon gọn
                    </div>
                    <div class="content">
                        Bạn đang quá tự ti về vóc dáng của bạn. 
                        Quá khó để mix đồ với thân hình khá mập và lùn. Hãy để Độc shop giúp  bạn giải quyết vấn đề trên nhé. <br>
                        <span><a href="#">Xem thêm</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>

<script src="${base }/js/home.js"></script>
</html>
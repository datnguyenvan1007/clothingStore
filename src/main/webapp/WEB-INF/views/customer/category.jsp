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


    <section class="mt-5">
    	<form class="form-inline" id="form-search" action="${base }/category/${seo}" method="GET">
			<div class="d-flex flex-row input-group">
				<!-- dữ liệu để thực hiện tìm kiếm sản phẩm -->
				<input type="hidden" id="page" name="page">
			</div>
		</form>
        <div class="row-product">
         	<c:forEach var="item" items="${products.data }">
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
         	</c:forEach>
         	<c:if test="${products.totalItems == 0 }">
         		<div style="width: 100%; text-align:center; padding:0">
         			<h1 >Không có sản phẩm</h1>
         		</div>
         	</c:if>
         </div>
         
       		<!-- Paging -->
			<c:if test="${products.totalItems > 0 }">
				<div class="row">
					<div class="col-12 d-flex justify-content-center">
						<div id="paging"></div>
					</div>
				</div>
			</c:if>
		
    </section>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>

<script src="${base }/js/home.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		$("#paging").pagination({
			currentPage: ${products.currentPage},
	        items: ${products.totalItems},
	        itemsOnPage: 10,
	        cssStyle: 'dark-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#form-search').trigger('submit');						
			},
	    });
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<header>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <div id="message"></div>
    <div class="col-lg-12 position-relative bg-white">
        <div class="text-center">
            <a href="${base }/home"><img src="${base }/image/banner/logo.png" alt="" ></a>
        </div>
        <div class="d-flex justify-content-center">
            <ul class="nav menu-cha">
                <li class="nav-item">
                    <a href="${base }/home" class="nav-link list-group-item-action">Trang chủ</a>
                </li>
                <c:forEach var="category" items="${categories }">
                	<c:if test="${category.status == true }">
                		<li class="nav-item ">
	                        <a href="${base }/category/${category.seo}" class="nav-link list-group-item-action dropdown-toggle">${category.name }</a>
	                    </li>
                	</c:if>
                </c:forEach>
                <!-- <li class="nav-item ">
                    <a href="#" class="nav-link list-group-item-action dropdown-toggle">ÁO NAM</a>
                    <ul class="list-group list-group-flush text-left menu-con">
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Áo Thun Tay Ngắn</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Áo PoLo</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Áo Tank Top</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Áo Sơ Mi Dài Tay</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Áo Sơ Mi Ngắn Tay</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link list-group-item-action dropdown-toggle">Quần Nam</a>
                    <ul class="list-group list-group-flush text-left menu-con">
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Quần Jean Nam</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Quần Vải Nam</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Quần Nỉ Dài</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Quần Sort Nam</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Quần Jogger</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link list-group-item-action dropdown-toggle">Phụ Kiện</a>
                    <ul class="list-group list-group-flush text-left menu-con">
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Túi/ Balo</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Kính Nam</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Giày Dép</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Mũ Nam</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Thắt Lưng Nam</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="list-group-item-action">Mũ Nam</a>
                        </li>
                    </ul>
                </li>
                 -->
                <li class="nav-item">
                    <a href="#" class="nav-link list-group-item-action">Kiến Thức</a>
                </li>
            </ul>
        </div>

        <!-- icon  -->
        <div class="icon position-absolute">
            <span class="login">
                <a href="${base }/login" class="text-dark" data-toggle="tooltip" data-placement="top" title="${userLogined.username }"><i class="fas fa-user-circle"></i></a>
               	
                <script>
					$(document).ready(function(){
					  $('[data-toggle="tooltip"]').tooltip();
					});
				</script>
            </span>
            <!--  
            <div class="box-login">
            	<ul class="list-group">
	                <li class="list-group-item">Đăng nhập</li>
	                <li class="list-group-item">Đăng ký</li>
	            </ul>
       		</div>-->
            <span class="search">
                <i class="far fa-search"></i>
            </span>
            <span class="cart position-relative">
                <a href="${base }/cart" class="text-dark">
	                <i class="far fa-shopping-bag"></i>
	                <span class="position-absolute" id="cartIndex">
	        			${totalItems }
	                </span>
	            </a>
            </span>
        </div>
        

        <!-- search-bar -->
        <div class="search-bar position-fixed">
            <div class="search-bar-content">
                <div class="d-flex justify-content-between align-items-center">
                    TÌM KIẾM
                    <span class="close"><i class="fal fa-times"></i></span>
                </div>
                <div>
                    <form action="" method="POST">
                        <div>
                            <input type="text" name="search" id="key-search" placeholder="Tìm kiếm sản phẩm...">
                        </div>
                        <button type="button" id="btn-search">
                            <i class="fas fa-search"></i>
                        </button>
                        
                    </form>
                    <div id="search-content">
                        	
                   	</div>
                </div>
            </div>
        </div>


    </div>
</header>


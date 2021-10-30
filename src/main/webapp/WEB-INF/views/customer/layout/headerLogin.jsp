<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div id="message"></div>
	<div class="col-lg-12 position-relative bg-white">
        <div class="text-center">
            <a href="${base }/home"><img src="${base }/image/banner/logo.png" alt="" ></a>
        </div>
        <!-- icon  -->
        <div class="icon-login position-absolute">
            <span>
                <a href="${base }/login" class="text-dark"><i class="fas fa-user-circle"></i></a>
            </span>
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
                            <input type="text" name="search" placeholder="Tìm kiếm sản phẩm...">
                        </div>
                        <button type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<nav>
    <ul class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="${base }/home" class="text-dark">Trang chủ</a>
        </li>
        <li class="breadcrumb-item">
            ${name }
        </li>
    </ul>
</nav>
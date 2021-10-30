<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">QUẢN LÝ</div>
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="far fa-user"></i></div>
                    Quản Lý Tài Khoản
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="${base }/admin/account/customerAccount">Khách hàng</a>
                        <a class="nav-link" href="${base }/admin/account/staffAccount">Nhân viên</a>
                        <a class="nav-link" href="${base }/admin/account/addAccount">Thêm tài khoản</a>
                    </nav>
                </div>

                <a class="nav-link" href="${base }/admin/category">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản Lý Danh Mục
                </a>

                <a class="nav-link" href="${base }/admin/product">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản Lý Sản Phẩm
                </a>
                
                <a class="nav-link" href="${base }/admin/saleorder">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản Lý Hóa Đơn
                </a>
                
                <a class="nav-link" href="/admin/contact">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản Lý Liên Hệ
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            ${userLogined.username }
        </div>
    </nav>
</div>
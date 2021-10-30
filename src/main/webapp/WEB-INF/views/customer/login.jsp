<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/lib.jsp"></jsp:include>
    <link rel="stylesheet" href="${base }/css/login_register.css">
    <link rel="stylesheet" href="${base }/css/header_footer.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/headerLogin.jsp"></jsp:include>
    <section>
    	<div class="container-lg mt-lg-5 d-flex">
            <div class="col-7 d-flex align-items-center">
                <div style="font-size: 50px; font-weight: 630;">
                    Đăng nhập
                </div>
            </div>
            <div class="col-5">
                <form action="${base }/perform_login" method="POST" class="form-signin">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" placeholder="Tên đăng nhập">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="Mật khẩu">
                    </div>
                    <c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert">Tài khoản hoặc mật khẩu của bạn không đúng</div>
					</c:if>
                    <div class="form-group d-flex bottom-form">
                        <button type="submit">Đăng nhập</button>
                        <div class="ml-3">
                            <a href="${base }/forgot_password">Quên mật khẩu</a> <br>
                            <span>hoặc</span> <a href="${base }/register">Đăng ký</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<script src="${base }/js/home.js"></script>
</html>
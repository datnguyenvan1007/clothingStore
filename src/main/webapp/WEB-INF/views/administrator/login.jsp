<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        Login
    </title>
    <jsp:include page="/WEB-INF/views/administrator/layout/lib.jsp"></jsp:include>
    <!-- GOOGLE FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet">
    <!-- BOXICONS -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/login.css">
    
</head>

<body>

    <div class="form" id="signin-form">
        <a href="#" class="form-logo">
            <p>Login<span>.</span></p>
        </a>
        <form action="${base }/perform_login" method="POST">

			<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
			<c:if test="${not empty param.login_error}">
				<div class="alert alert-danger">Login attempt
					was not successful, try again!!!</div>
			</c:if>
	        <div class="form-group">
	            <input type="text" class="form-input" placeholder="Username" id="signin-username" name="username">
	            <span class="form-input-icon err">
	                <i class="bx bx-error-circle"></i>
	            </span>
	            <span class="form-input-icon success">
	                <i class="bx bx-check-circle"></i>
	            </span>
	            <span class="form-input-err-msg" data-err-for="signin-username"></span>
	        </div>
	        <div class="form-group">
	            <input type="password" class="form-input" placeholder="Password" id="signin-password" name="password">
	            <span class="form-input-icon err">
	                <i class="bx bx-error-circle"></i>
	            </span>
	            <span class="form-input-icon success">
	                <i class="bx bx-check-circle"></i>
	            </span>
	            <span class="form-input-err-msg" data-err-for="signin-password"></span>
	        </div>
	        <div class="form-group form-group-checkbox">
	            <input type="checkbox" name="remember" id="remember" checked="checked">
	            <label for="remember">
	                Remember Me
	                <i class="bx bx-check"></i>
	            </label>
	        </div>
	        <button class="form-btn" id="signin-btn">Sign in</button>
	        <span class="form-delimiter">
	            or connect with
	        </span>
	        <div class="form-social">
	            <a href="#" class="form-social-item fb">
	                <i class="bx bxl-facebook"></i>
	            </a>
	            <a href="#" class="form-social-item tw">
	                <i class="bx bxl-twitter"></i>
	            </a>
	            <a href="#" class="form-social-item gg">
	                <i class="bx bxl-google"></i>
	            </a>
	        </div>
	        <span class="form-txt">
	            Don't have an account?
	            <a href="#">Sign up!</a>
	        </span>
	        <span class="form-txt">
	            <a href="#">Forgot password?</a>
	        </span>
        </form>
    </div>
</body>
</html>
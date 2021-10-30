<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    Lấy lại mật khẩu
                </div>
            </div>
            <div class="col-5">
                <form action="" method="POST">
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" placeholder="Email">
                    </div>
                    <div class="form-group d-flex bottom-form">
                        <button type="submit">Đăng Ký</button>
                        <div class="ml-3">
                            <a href="${base }/login">Đăng nhập</a> <br>
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
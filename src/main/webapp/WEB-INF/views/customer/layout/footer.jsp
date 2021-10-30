<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer >
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
        <div class="footer-top d-flex justify-content-center align-items-center">
            <form action="" method="POST">
                <div class="input-group">
                    <input type="email" name="email" placeholder="Đăng ký để nhận thông tin">
                    <div class="input-group-append">
                        <button type="button" id="contact">Đăng ký</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="d-flex justify-content-between footer-bottom container-fluid">
            <div>   
                <p>Công Ty</p>
                <ul>
                    <li>CÔNG TY SHOP ĐỘC</li>
                    <li>ĐỊA CHỈ : Số 110 Nhổn, phường Tây Tựu, quận Bắc Từ Liêm, thành phố Hà Nội</li>
                    <li>Mã Số Doanh Nghiệp: 01D-8004624 do Sở kế hoạch và đầu tư thành phố Hà Nội cấp ngày 16/05/2017</li>
                    <li>SĐT LIÊN HỆ: 0978901995</li>
                    <li>EMAIL: shopdoc@shopdoc.vn</li>
                </ul>
            </div>
            <div>
                <p>Chính Sách Khách Hàng</p>
                <ul>
                    <li>Hướng dẫn mua hàng</li>
                    <li>Chính sách đổi hàng</li>
                    <li>Chính sách vận chuyển</li>
                    <li>Chính sách bảo mật thông tin</li>
                    <li>Hình thức thanh toán</li>
                    <li>Chính sách xử lý khiếu nại </li>
                </ul>
            </div>
            <div>
                <p>Kết Nối Với Chúng Tôi</p>
                <span><a href="#"><img src="${base }/image/footer/icon_facebook.png" alt=""></a></span>
                <span style="margin-left:10px"><a href="#"><img src="${base }/image/footer/icon_instagram.png" alt=""></a></span>
            </div>
            <div>
                <p>Hệ Thống Cửa Hàng</p>
                <ul>
                    <li>326 Cầu Giấy - Hà Nội</li>
                    <li>110 Phố Nhổn - Hà Nội</li>
                    <li>154 Quang Trung - Hà Đông - Hà Nội</li>
                    <li>225 Bạch Mai - Hà Nội</li>
                    <li>49 Chùa Bộc - Hà Nội</li>
                    <li>131 Cầu Giấy - Hà Nội</li>
                </ul>
            </div>
        </div>
    </footer>
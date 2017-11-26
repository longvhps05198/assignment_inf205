<%-- 
    Document   : gioi-thieu
    Created on : Jun 6, 2017, 8:00:30 PM
    Author     : hlong232
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/trang-mau.dwt" codeOutsideHTMLIsLocked="false" -->
  <head>
    <meta charset="UTF-8">
    <!-- InstanceBeginEditable name="EditRegion1" -->
    <title>Giới thiệu</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <!-- InstanceEndEditable -->
  </head>
  <body>
    <div class="container">
      <c:set var="user" value="${sessionScope.USER}"/>
      <c:choose>
          <c:when test="${not empty user}">
              <%@include file="header1.jsp" %>
          </c:when>
          <c:otherwise>
              <%@include file="header.jsp" %>
          </c:otherwise>
      </c:choose>

      <!-- InstanceBeginEditable name="EditRegion2" -->
      <br><br>
      <div class="col-md-12" style="margin-bottom: 300px;width: 90%;margin-left: 5%">
        <div class="col-md-3" style="padding-left: 0">
          <div class="list-group">
            <a href="#" class="list-group-item active" style="background-color: #75BF97; border: none; z-index: 0">
              GIỚI THIỆU
            </a>
            <a href="#" class="list-group-item">Về công ty</a>
            <a href="#" class="list-group-item">Lĩnh vực hoạt động</a>
          </div>
        </div>

        <div class="col-md-9">
          <p>Trang chủ &raquo; <a style="color: #75BF97">Giới thiệu</a></p>
          <h2>VỀ CÔNG TY</h2><br>

          <p>
            ORANGE FASHION là một sản phẩm trực thuộc Mekong Com – doanh nghiệp đi đầu trong lĩnh vực thương mại điện tử Việt Nam với website bán lẻ sách trực tuyến Vinabook được bắt đầu từ năm 2005 và được đầu tư bởi Quỹ đầu tư IDG Ventures<br><br>

            Được thành lập vào cuối năm 2010, cho tới nay ORANGE FASHION đã có 500 nhân viên làm việc tại 02 thành phố lớn là Hà nội và Tp, Hồ Chí Minh phục vụ trên 01 triệu khách hàng trên toàn quốc.<br><br>

            ORANGE FASHION hiện đang cung cấp cho khách hàng trải nghiệm mua sắm những đợt giảm giá theo nhóm (groupon) của các doanh nghiệp, cam kết về uy tín chất lượng dịch vụ và đội ngũ nhân viên chuyên nghiệp tận tình đã giúp ORANGE FASHION bán thành công gần 5 triệu đơn hàng cho hàng ngàn đối tác và đang giữ kỷ lục về số lượng bán các cơ hội giảm giá của  hệ thống Megastar, chuỗi nhà hàng Seoul Garden, khu vui chơi Kizcity và nhiều đối tác khác.<br><br>

            ORANGE FASHION luôn nỗ lực để trở thành cầu nối nhanh và hiệu quả nhất giúp doanh nghiệp tiếp cận người tiêu dùng với phương châm “Happy to Buy”.  Hãy truy cập vào ORANGE FASHION mỗi ngày để có những giây phút mua sắm vui vẻ!<br><br>
          </p>
        </div>
      </div>


      <!-- InstanceEndEditable -->

      <%@include file="footer.jsp" %>
    </div>
  </body>
  <!-- InstanceEnd --></html>

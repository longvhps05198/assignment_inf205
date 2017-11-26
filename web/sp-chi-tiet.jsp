<%-- 
    Document   : sp-chi-tiet
    Created on : Jun 11, 2017, 10:45:59 PM
    Author     : hlong232
--%>
<%@page import="Model.Sanpham"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Sanphamnam"%>
<%@page import="Controller.ConnectionData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Sanphamnu"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/spchitiet.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>JSP Page</title>
  </head>
  <body>
    <c:set var="user" value="${sessionScope.USER}"/>
    <c:choose>
        <c:when test="${not empty user}">
            <%@include file="header1.jsp" %>
        </c:when>
        <c:otherwise>
            <%@include file="header.jsp" %>
        </c:otherwise>
    </c:choose>

    <div class="col-md-12" style="background-color: #f4f4f4;">
      <div class="col-md-12" style="width: 90%;background-color: #fff;margin:20px 5%;padding: 0;border: 1px solid #e3e3e3;">
        <div class="col-md-5" style="width: 40%">
          <%!
              Connection con = new ConnectionData().connectData("Assignment_INF205_PS05198");
              String id;
              String tensanpham;
              String giagoc;
              String giakhuyenmai;
              String chietkhau;
              String urlimage;
              String phanloai;
              String mota;
              String kieudang;
              String mausac;
              String chatlieu;
              String xuatxu;
              Sanpham[] list;
              
          %>
          <div class="row" style="margin: 15px 0;border: 2px seagreen solid;border-radius: 4px">
            <%
                id = request.getParameter("ID");
                phanloai = request.getParameter("PhanLoai");
                Sanpham sp = new Sanpham();
                list = sp.getConnectSP("select * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID where SANPHAM.ID='" + id + "'");
                
                tensanpham = list[0].getTenSanPham();
                giagoc = list[0].getGiaGoc();
                giakhuyenmai = list[0].getGiaKhuyenMai();
                chietkhau = list[0].getChietKhau();
                urlimage = list[0].getImage();
                mota = list[0].getMoTa();
                kieudang = list[0].getKieuDang();
                mausac = list[0].getMauSac();
                chatlieu = list[0].getChatLieu();
                xuatxu = list[0].getXuatXu();                
            %>
            <img src="<%=urlimage%>" width="100%">
          </div>
        </div>
        <div class="col-md-6" style="width: 60%">
          <h1 class="title-product"><%=tensanpham%></h1>
          <p style="margin-top: 40px"><%=mota%></p>
          <div style="border: 1px solid #333; margin: 10px 0"></div>
          <h4>Giá gốc: 
            <span style="text-decoration: line-through">
              <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "<%=giagoc%>" /> ₫</span>
          </h4>

          <div style="font-size: 30px;color: orangered;font-weight: bold">
            <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "<%=giakhuyenmai%>" /> ₫
            <span style="border: 1px solid #FF0040;background-color: #FF0040; padding: 2px; font-size: 16px;border-radius: 4px;color: #fff;margin-left: 20px">
              <%=chietkhau%></span>
          </div>
          <div style="border: 1px solid #333; margin: 10px 0"></div>
          <c:url var="add" value="Controller_Manage">
              <c:param name="btnAction" value="Add to cart" />
              <c:param name="tensp" value="<%=tensanpham%>" />
              <c:param name="hinhanh" value="<%=urlimage%>" />
              <c:param name="dongia" value="<%=giakhuyenmai%>" />
              <c:param name="gioitinh" value="<%=phanloai%>" />
          </c:url>
          <a href="${add}">
            <button class="btn-add-to-cart">
              THÊM VÀO GIỎ HÀNG
            </button></a>
          <div>
            <span style="line-height: 25px">
              <img src="images/motocycle.png" width="25"> Giao sản phẩm <br>
            </span>
            <span style="color: #71be0f;"><img src="images/truck1.png" width="25"> 
              <span>Giao hàng miễn phí tại Hà Nội và TP.HCM cho đơn hàng từ 150,000đ trở lên.</span>
            </span>
          </div>
        </div>
      </div>
      <div class="col-md-12" style="width: 90%;background-color: #fff;margin:20px 5%;padding: 0;border: 1px solid #e3e3e3;">
        <h3 style="border-bottom: 1px solid #d2d2d2; margin: 50px 20px">THÔNG TIN CHI TIẾT</h3>
        <h4 style="text-align: center"><%=tensanpham%></h4>
        <div style="text-align: center;width: 40%; margin: 0 auto"><img src="<%=urlimage%>" width="100%"></div>
        <div style="margin: 20px 20px; line-height: 30px">
          <p style="font-weight: bold">Thông tin sản phẩm</p>
          <p>- Kiểu dáng: <%=kieudang%></p>
          <p>- Màu sắc: <%=mausac%></p>
          <p>- Chất liệu: <%=chatlieu%></p>
          <p>- Xuất xứ: <%=xuatxu%></p>
        </div>
        <p style="margin: 20px 20px;color: #FF0040;text-transform: uppercase;font-weight: bold">Click MUA NGAY bạn nhé!</p>
        <%if (phanloai.equals("nam")) {%>
        <p style="margin: 20px 20px;">Xem thêm <a href="san-pham-nam.jsp?trang=1">
            <span style="background-color: #71be0f; padding: 5px;color: #fff;border-radius: 4px">Thời trang nam</span></a>
        </p><%}%>

        <%if (phanloai.equals("nu")) {%>
        <p style="margin: 20px 20px;">Xem thêm <a href="san-pham-nu.jsp?trang=1">
            <span style="background-color: #71be0f; padding: 5px;color: #fff;border-radius: 4px">Thời trang nữ</span></a>
        </p><%}%>

      </div>
    </div>
    <%
        session.setAttribute("currentpage", "gio-hang.jsp");
    %>
    <%@include file="footer.jsp" %>
  </body>
</html>

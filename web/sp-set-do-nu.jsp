<%-- 
    Document   : sp-set-do-nu
    Created on : Jun 9, 2017, 10:46:37 PM
    Author     : hlong232
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Controller.ConnectionData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Sanphamnu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Set đồ nữ</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/spnu.css">
    <link rel="stylesheet" href="css/spchitiet.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

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
      <div class="row">
        <div class="col-md-12" style="margin-left: 5%; width: 90%; margin-top: 20px;">
          <p><a href="index.jsp" style="color: #333">Trang chủ</a> &raquo; <a href="san-pham-nu.jsp?trang=1" style="color: #333">Thời trang nữ</a>
            &raquo; <a href="" style="color: #75BF97">Set đồ nữ</a></p>
          <div class="tabcontent">
            <h1 class="title clearfix"><span>THỜI TRANG NỮ</span></h1>
            <ul class="tab-cates" style="list-style-type: none ">
              <li><a href="" style="color: #330">Set đồ nữ</a></li>
              <li><a href="sp-ao-nu.jsp?trang=1">Áo nữ</a></li>
              <li><a href="sp-dam-nu.jsp?trang=1">Đầm & Váy nữ</a></li>
            </ul>
          </div>

          <!-- Các sản phẩm-->
          <div class="row">
            <div class="col-md-12" style="margin: 10px 0">
              <div class="row">

                <%!
                    Connection con = new ConnectionData().connectData("Assignment_INF205_PS05198");
                    Statement stm = null;
                    ResultSet rs = null;
                    int soTrang = 0, soDong = 0, soDongTrang = 8, trang = 1, viTri = 0;
                    String id;
                    String tensanpham;
                    String giagoc;
                    String giakhuyenmai;
                    String chietkhau;
                    String urlimage;
                %>
                <%
                    String sql = "select * from SANPHAM where Phanloai=N'Set đồ'";
                    if (request.getParameter("trang") == null || stm == null) {
                        stm = con.createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE,
                                ResultSet.CONCUR_READ_ONLY);
                        rs = stm.executeQuery(sql);
                        rs.last();
                        soDong = rs.getRow();
                    }
                    if (request.getParameter("trang") != null) {
                        trang = Integer.parseInt(request.getParameter("trang"));
                    }

                    soTrang = (soDong % soDongTrang == 0) ? soDong / soDongTrang : soDong / soDongTrang + 1;
                    viTri = (trang == 1) ? 0 : (trang - 1) * soDongTrang;
                    sql += " ORDER BY ID OFFSET " + viTri + " ROWS FETCH NEXT " + soDongTrang + " ROWS ONLY;";
                    rs = stm.executeQuery(sql);
                %>
                <%
                    int stt = 1;
                    while (rs.next()) {
                        id = rs.getString(1);
                        tensanpham = rs.getString(2);
                        giagoc = rs.getString(3);
                        giakhuyenmai = rs.getString(4);
                        chietkhau = rs.getString(5);
                        urlimage = rs.getString(6);
                        stt++;
                %>
                <div class="col-xs-6 col-md-3" style="padding: 0; height: 530px; text-align: center;">
                  <div class="eitem thumbnail">
                    <div class="sale-off"><span>&nbsp;<%=chietkhau%>&nbsp;</span></div>
                    <a href="sp-chi-tiet.jsp?ID=<%=id%>&PhanLoai=nu">
                      <img src="<%=urlimage%>" alt="..." class="eimg">
                    </a>
                    <div class="item-title"><%=tensanpham%></div>
                    <span class="price-new">
                      <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "<%= giakhuyenmai%>" /> ₫</span><br>
                    <span class="price-old">
                      <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "<%= giagoc%>" /> ₫</span>
                    <div class="add-to-cart">
                      <c:url var="add" value="Controller_Manage">
                          <c:param name="btnAction" value="Add to cart" />
                          <c:param name="tensp" value="<%=tensanpham%>" />
                          <c:param name="hinhanh" value="<%=urlimage%>" />
                          <c:param name="dongia" value="<%=giakhuyenmai%>" />
                          <c:param name="gioitinh" value="nu" />
                      </c:url>
                      <img src="images/giohang.png" style="width: 30px">
                      <a href="${add}">Mua</a>
                    </div>
                  </div>
                </div>
                <%}%>
              </div>
              <div class="row" style="margin: 20px 0">
                <div class="store-pagination clear"> 
                  <a class="page-numbers" href="sp-set-do-nu.jsp?trang=1">&laquo;</a>
                  <a class="page-numbers" href="sp-set-do-nu.jsp?trang=<%=(trang - 1) < 1 ? 1 : trang - 1%>">&lsaquo;</a>
                  <%for (int i = 1; i <= soTrang; i++) {
                    if (i == trang) {%>
                  <span class="page-numbers current"><%=trang%></span>
                  <%} else {%>
                  <a class="page-numbers" href="sp-set-do-nu.jsp?trang=<%=i%>"><%=i%></a>
                  <%}
                }%>
                  <a class="page-numbers" href="sp-set-do-nu.jsp?trang=<%=(trang + 1 > soTrang) ? soTrang : trang + 1%>">&rsaquo;</a>
                  <a class="page-numbers" href="sp-set-do-nu.jsp?trang=<%=soTrang%>">&raquo;</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <%
          session.setAttribute("currentpage", "sp-set-do-nu.jsp");
      %>
      <%@include file="footer.jsp" %>
  </body>
</html>

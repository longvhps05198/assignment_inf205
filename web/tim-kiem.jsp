<%-- 
    Document   : gio-hang
    Created on : Jun 6, 2017, 7:59:59 PM
    Author     : hlong232
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Controller.ConnectionData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/giohang.css">
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

      <div class="col-md-12" style="width: 90%;margin-left: 5%; margin-top: 10px;margin-bottom: 100px">
        <p><a href="index.jsp" style="color: #333">Trang chủ</a> &raquo; <a href="" style="color: #75BF97">Kết quả</a></p>
        <h1 class="title"><span>KẾT QUẢ TÌM KIẾM</span></h1>

        <div class="row">
          <form action="Controller_Manage">
            <c:set var="list" value="${sessionScope.LIST}"/>
            <c:if test="${not empty list}">
                <c:set var="count" value="0" />
                <c:forEach var="rows" items="${list}">
                    <c:set var="count" value="${count + 1}" />
                    <div class="col-xs-6 col-md-3" style="padding: 0; height: 450px; text-align: center;margin-bottom: 40px">
                      <div class="eitem">
                        <div class="sale-off"><span>&nbsp;${rows.chietKhau}&nbsp;</span></div>
                        <a href="sp-chi-tiet.jsp?ID=${rows.id}&PhanLoai=nu" class="thumbnail">
                          <img src="${rows.image}" alt="..." class="eimg">
                        </a>
                        <div class="item-title">${rows.tenSanPham}</div>
                        <span class="price-new">
                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${rows.giaKhuyenMai}" /> ₫</span><br>
                        <span class="price-old">
                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${rows.giaGoc}" /> ₫</span>
                        <div class="add-to-cart">
                          <c:url var="add" value="Controller_Manage">
                              <c:param name="btnAction" value="Add to cart" />
                              <c:param name="tensp" value="${rows.tenSanPham}" />
                              <c:param name="hinhanh" value="${rows.image}" />
                              <c:param name="dongia" value="${rows.giaKhuyenMai}" />
                          </c:url>
                          <img src="images/giohang.png" style="width: 30px">
                          <a href="${add}">Mua</a>
                        </div>
                      </div>
                    </div>

                </c:forEach>

            </c:if>

            <c:set var="list1" value="${sessionScope.LIST1}"/>
            <c:if test="${not empty list1}">
                <c:set var="count" value="0" />
                <c:forEach var="rows" items="${list1}">
                    <c:set var="count" value="${count + 1}" />
                    <div class="col-xs-6 col-md-3" style="padding: 0; height: 450px; text-align: center;margin-bottom: 40px">
                      <div class="eitem">
                        <div class="sale-off"><span>&nbsp;${rows.chietKhau}&nbsp;</span></div>
                        <a href="sp-chi-tiet.jsp?ID=${rows.id}&PhanLoai=nam" class="thumbnail">
                          <img src="${rows.image}" alt="..." class="eimg">
                        </a>
                        <div class="item-title">${rows.tenSanPham}</div>
                        <span class="price-new">
                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${rows.giaKhuyenMai}" /> ₫</span><br>
                        <span class="price-old">
                          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${rows.giaGoc}" /> ₫</span>
                        <div class="add-to-cart">
                          <c:url var="add" value="Controller_Manage">
                              <c:param name="btnAction" value="Add to cart" />
                              <c:param name="tensp" value="${rows.tenSanPham}" />
                              <c:param name="hinhanh" value="${rows.image}" />
                              <c:param name="dongia" value="${rows.giaKhuyenMai}" />
                          </c:url>
                          <img src="images/giohang.png" style="width: 30px">
                          <a href="${add}">Mua</a>
                        </div>
                      </div>
                    </div>

                </c:forEach>

            </c:if>
          </form>
        </div>

      </div>



      <%@include file="footer.jsp" %>
    </div>
  </body>
</html>

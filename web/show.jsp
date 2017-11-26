<%-- 
    Document   : show
    Created on : Jun 13, 2017, 4:46:21 PM
    Author     : hlong232
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show</title>
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/giohang.css"
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body>
    <div class="container">
      <%@include file="header.jsp" %>

      <div class="col-md-12" style="width: 90%;margin-left: 5%; margin-top: 10px;">
        <p>Trang chủ &raquo; <a href="" style="color: #75BF97">Giỏ hàng</a></p>
        <h1 class="title"><span>Giỏ hàng của tôi</span></h1>

        <div class="cart-block">
          <c:set var="shop" value="${sessionScope.SHOP}"/>
          <table border="1">
            <thead>
              <tr>
                <th>No.</th>
                <th>Title</th>
                <th>Quantity</th>
                <th>Action</th>
              </tr>
            </thead>
            <c:if test="${not empty shop}">
                <tbody>
                <form action="Controller_Manage">
                  <c:set var="count" value="0" />
                  <c:forEach var="rows" items="${shop}">
                      <c:set var="count" value="${count + 1}" />
                      <tr>
                        <td>${count}</td>
                        <td>${rows.value.tenSanPham}</td>
                        <td>${rows.value.quantity}</td>
                        <td><input type="checkbox" name="rmv" value="${rows.value.tenSanPham}"></td>
                      </tr>
                  </c:forEach>
                  </tbody>
                </c:if>
                <tr>
                  <c:url var="add" value="Controller_Manage">
                      <c:param name="btnAction" value="Add more"/>
                  </c:url>
                  <td colspan="2"><a href="${add}">Add more</a></td>
                  <td><input type="submit" name="btnAction" value="Remove"></td>
                </tr>
            </form>
          </table>
          <div class="clearfix text-right">
            <span><b>Tổng thanh toán:</b></span>
            <span class="pay-price ng-binding">
              0đ
            </span>
          </div>
          <div class="button text-right">
            <a class="btn btn-default" href="/" onclick="window.history.back()">Tiếp tục mua hàng</a>
            <a class="btn btn-primary" href="thanh-toan.html">Thanh toán</a>
          </div>
        </div>
      </div>
      <%@include file="footer.jsp" %>
    </div>
  </body>
</html>


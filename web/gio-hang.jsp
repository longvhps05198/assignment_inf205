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

      <%--
          String math = request.getParameter("math");
          if (math.equals("none")) {
              response.sendRedirect("gio-hang.jsp?math=new");
          }
          if (math.equals("plus")) {
              String soluong = request.getParameter("soluong");
              session.setAttribute("Value", String.valueOf(Integer.parseInt(soluong) + 1));
              response.sendRedirect("gio-hang.jsp");
          }
          if (math.equals("minus")) {
              String soluong = request.getParameter("soluong");
              session.setAttribute("Value", String.valueOf(Integer.parseInt(soluong) - 1));
              response.sendRedirect("gio-hang.jsp");
          }
      --%>
      <div class="col-md-12" style="width: 90%;margin-left: 5%; margin-top: 10px;margin-bottom: 100px">
        <p><a href="index.jsp" style="color: #333">Trang chủ</a> &raquo; <a href="" style="color: #75BF97">Giỏ hàng</a></p>
        <h1 class="title"><span>Giỏ hàng của tôi</span></h1>

        <div class="cart-block">
          <div class="cart-info table-responsive">
            <form action="Controller_Manage">
              <c:set var="shop" value="${sessionScope.SHOP}"/>
              <c:set var="tong" value="0" />
              <table class="list-product" style="text-align: center;" border="1">
                <thead>
                  <tr>
                    <th style="text-align: center">No.</th>
                    <th style="text-align: center">Tên sản phẩm</th>
                    <th style="text-align: center">Hình ảnh</th>
                    <th style="text-align: center">Số lượng</th>
                    <th style="text-align: center">Đơn giá</th>
                    <th style="text-align: center">Thành tiền</th>
                    <th style="text-align: center">Chức năng</th>
                  </tr>
                </thead>
                <c:if test="${not empty shop}">
                    <tbody>
                      <c:set var="count" value="0" />
                      <c:forEach var="rows" items="${shop}">
                          <c:set var="count" value="${count + 1}" />
                          <c:set var="tong" value="${tong + rows.value.quantity * rows.value.giaKhuyenMai}" />
                          <tr>
                            <td>${count}</td>
                            <td>${rows.value.tenSanPham}</td>
                            <td><img src='${rows.value.image}' height="50px"></td>
                            <td>
                              <c:url var="add" value="Controller_Manage">
                                  <c:param name="btnAction" value="Add to cart" />
                                  <c:param name="tensp" value="${rows.value.tenSanPham}" />
                                  <c:param name="hinhanh" value="${rows.value.image}" />
                                  <c:param name="dongia" value="${rows.value.giaKhuyenMai}" />
                              </c:url>
                              <a href="${add}" class='glyphicon glyphicon-plus' style='border: 1px solid #71be0f; padding: 3px'></a>
                              <input type="text" name="soluong" style="border: 1px solid #999; padding:6px 4px;width: 27px;height: 34px;text-align: center" value="${rows.value.quantity}"/>
                              <c:url var="minus" value="Controller_Manage">
                                  <c:param name="btnAction" value="Minus to cart" />
                                  <c:param name="tensp" value="${rows.value.tenSanPham}" />
                                  <c:param name="hinhanh" value="${rows.value.image}" />
                                  <c:param name="dongia" value="${rows.value.giaKhuyenMai}" />
                              </c:url>
                              <a href="${minus}" class='glyphicon glyphicon-minus' style='border: 1px solid #71be0f; padding: 3px'></a>
                            </td>
                            <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${rows.value.giaKhuyenMai}" /></td>
                            <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${rows.value.quantity * rows.value.giaKhuyenMai}" /></td>
                            <%--<td><input type="checkbox" name="rmv" value="${rows.value.tenSanPham}"></td>
                            --%>
                            <c:url var="delete" value="Controller_Manage">
                                <c:param name="btnAction" value="Del"/>
                                <c:param name="sp" value="${rows.value.tenSanPham}"/>
                            </c:url>
                            <td style="line-height: 50px;">
                              <a href="${delete}" class='glyphicon glyphicon-remove' style='border: 1px solid #f07b1d; padding: 5px'></a>
                            </td>
                          </tr>

                          <%--<tr>
                            <c:url var="add" value="Controller_Manage">
                                <c:param name="btnAction" value="Add more"/>
                            </c:url>
                            <td colspan="2"><a href="${add}">Add more</a></td>
                            <td><input type="submit" name="btnAction" value="Remove"></td>
                          </tr>--%>
                      </c:forEach>
                    </tbody>
                </c:if>
              </table>
              <div class="clearfix text-right">
                <span><b>Tổng thanh toán:</b></span>
                <span class="pay-price ng-binding" style="color: #FF0040">
                  <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${tong}" /> VNĐ
                </span>
              </div>
            </form>
            <div class="button text-right">
              <a class="btn btn-default" href="javascript: location.replace(document.referrer);">Tiếp tục mua hàng</a>
              <!-- or <a class="btn btn-default" href="javascript: window.location=document.referrer;">Tiếp tục mua hàng</a>-->
              <a class="btn btn-primary" href="thanh-toan.html">Thanh toán</a>
            </div>
          </div>
        </div>
      </div>
      <%
          session.setAttribute("currentpage", "gio-hang.jsp");
      %>


      <%@include file="footer.jsp" %>
    </div>
  </body>
</html>

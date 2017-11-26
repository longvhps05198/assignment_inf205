<%-- 
    Document   : newjsp
    Created on : Jun 14, 2017, 4:24:17 PM
    Author     : hlong232
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Sanphamnu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/manage.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <title>JSP Page</title>
  </head>
  <body>
    <c:set var="data" value="${sessionScope.DATA}"/>
    <table cellspacing="0" width="100%">
      <thead>
        <tr>
          <th>ID</th>
          <th>Tên sản phẩm</th>
          <th>Giá gốc</th>
          <th>Giá khuyến mãi</th>
          <th>Chiết khấu</th>
          <th>Hình ảnh</th>
          <th>Chức năng</th>
        </tr>
      </thead>
      <c:if test="${not empty data}">
          <tbody>
            <c:set var="count" value="0"/>
            <c:forEach var="rows" items="${data}">
            <form action="Controller_Manage">
              <c:set var="count" value="${count + 1}"/>
              <tr>
                <td>${rows.id}.</td>
                <td>${rows.tenSanPham}</td>
                <td>${rows.giaGoc}</td>
                <td>${rows.giaKhuyenMai}</td>
                <td>${rows.chietKhau}</td>
                <td>${rows.image}</td>
                <c:url var="del" value="Controller_Manage">
                    <c:param name="btnAction" value="Delete" />
                    <c:param name="ID" value="${rows.id}" />
                </c:url>
                <td><a href='${del}' class='glyphicon glyphicon-remove' style='border: 1px solid #f07b1d; padding: 5px'></a></td>
              </tr>
            </form>
          </c:forEach>
      </tbody>
    </c:if>
  </table>
</body>
</html>

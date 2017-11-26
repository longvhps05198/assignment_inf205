<%-- 
    Document   : index
    Created on : Jun 6, 2017, 4:37:32 PM
    Author     : hlong232
--%>

<%@page import="Model.Sanpham"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Trang chủ ORANGE FASHION</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/spnu.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
      ul.tab-cates li a {
          text-decoration: none;
          color: #FA5882;
      }
      .tabcontent {
          border-bottom: 2px solid #FA5882;
          height: 49px;
      }
      
    </style>
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
    <div class="container">
      <div class="row">
        <div class="col-md-12" style="width: 90%; margin: 0 5% 20px">
          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators" style="top: 100%">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <img src="images/banner/banner1.jpg">
                <div class="carousel-caption">

                </div>
              </div>
              <div class="item">
                <img src="images/banner/banner2.jpg">
                <div class="carousel-caption">

                </div>
              </div>
              <div class="item">
                <img src="images/banner/banner3.jpg">
                <div class="carousel-caption">

                </div>
              </div>
              <div class="item">
                <img src="images/banner/banner4.jpg">
                <div class="carousel-caption">

                </div>
              </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

        </div>
      </div>

      <div class="row">
        <div class="col-md-12" style="margin: 0 5%; width: 90%; height: 660px;">
          <div class="row">
            <div class="tabcontent">
              <h1 class="title clearfix" style="border-bottom-color: #FA5882">
                <a href="san-pham-nu.jsp?trang=1">
                  <span style="background-color: #FA5882">THỜI TRANG NỮ</span>
                </a>
              </h1>
              <ul class="tab-cates" style="list-style-type: none ">
                <li><a href="sp-set-do-nu.jsp?trang=1">Set đồ</a></li>
                <li><a href="sp-ao-nu.jsp?trang=1">Áo nữ</a></li>
                <li><a href="sp-dam-nu.jsp?trang=1">Đầm & Váy nữ</a></li>
              </ul>
            </div>
          </div>

          <%!
              int id;
              String tensanpham;
              String giagoc;
              String giakhuyenmai;
              String chietkhau;
              String urlimage;
              String dongia;
          %>

          <div class="row" style="margin: 10px 0;">
            <%
                Sanpham sp = new Sanpham();
                Sanpham[] list = sp.getConnectSP("select top 4 * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID "
                        + "where Phanloai like N'%Áo nữ%' or "
                        + "Phanloai like N'%Set đồ%' or "
                        + "Phanloai like N'%Đầm & Váy nữ%'");
                for (int i = 0; i < list.length; i++) {
                    id = list[i].getId();
                    tensanpham = list[i].getTenSanPham();
                    giagoc = list[i].getGiaGoc();
                    giakhuyenmai = list[i].getGiaKhuyenMai();
                    chietkhau = list[i].getChietKhau();
                    urlimage = list[i].getImage();
            %>  
            <div class="col-xs-6 col-md-3" style="padding: 0; height: 530px; text-align: center;">
              <div class="eitem thumbnail">
                <div class="sale-off"><span>&nbsp;<%= chietkhau%>&nbsp;</span></div>
                <a href="sp-chi-tiet.jsp?ID=<%=id%>&PhanLoai=nu">
                  <img src="<%= urlimage%>" alt="..." class="eimg">
                </a>
                <div class="item-title"><%= tensanpham%></div>
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
                  </c:url>
                  <img src="images/giohang.png" style="width: 30px">
                  <a href="${add}">Mua</a>
                </div>
              </div>
            </div>
            <%}%>

          </div>
          <div class="col-md-12" style="margin-top: 0;">
            <span style="color: #f07b1d; right: 1%;position: absolute;">&raquo; <a href="san-pham-nu.jsp?trang=1">Xem thêm</a></span>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12" style="margin: 0 5%; width: 90%; height: 660px;">
          <div class="row">
            <div class="tabcontent" style="border-bottom-color: #2F5959">
              <h1 class="title clearfix" style="border-bottom-color: #2F5959">
                <a href="san-pham-nu.jsp?trang=1">
                  <span style="background-color: #2F5959">THỜI TRANG NAM</span>
                </a>
              </h1>
              <ul class="tab-cates" style="list-style-type: none ">
                <li><a style="color: #2F5959" href="sp-ao-nam.jsp?trang=1">Áo nam</a></li>
                <li><a style="color: #2F5959" href="sp-quan-nam.jsp?trang=1">Quần nam</a></li>
              </ul>
            </div>
          </div>

          <div class="row" style="margin: 10px 0">
            <%
                Sanpham[] list1 = sp.getConnectSP("select top 4 * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID "
                        + "where Phanloai like N'%Áo nam%' or "
                        + "Phanloai like N'%Quần nam%'");
                for (int i = 0; i < list.length; i++) {
                    id = list1[i].getId();
                    tensanpham = list1[i].getTenSanPham();
                    giagoc = list1[i].getGiaGoc();
                    giakhuyenmai = list1[i].getGiaKhuyenMai();
                    chietkhau = list1[i].getChietKhau();
                    urlimage = list1[i].getImage();
            %>
            <div class="col-xs-6 col-md-3" style="padding: 0; height: 530px; text-align: center;">
              <div class="eitem thumbnail">
                <div class="sale-off"><span>&nbsp;<%= chietkhau%>&nbsp;</span></div>
                <a href="sp-chi-tiet.jsp?ID=<%=id%>&PhanLoai=nam">
                  <img src="<%= urlimage%>" alt="..." class="eimg">
                </a>
                <div class="item-title"><%= tensanpham%></div>
                <span class="price-new">
                  <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "<%= giakhuyenmai%>" /> ₫</span><br>
                <span class="price-old">
                  <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "<%= giagoc%>" /> ₫</span>
                </span>
                <div class="add-to-cart">
                  <c:url var="add" value="Controller_Manage">
                      <c:param name="btnAction" value="Add to cart" />
                      <c:param name="tensp" value="<%=tensanpham%>" />
                      <c:param name="hinhanh" value="<%=urlimage%>" />
                      <c:param name="dongia" value="<%=giakhuyenmai%>" />
                  </c:url>
                  <img src="images/giohang.png" style="width: 30px">
                  <a href="${add}">Mua</a>
                </div>
              </div>
            </div>
            <%}%>
          </div>
          <div class="col-md-12" style="margin-top: 0;">
            <span style="color: #f07b1d; right: 1%;position: absolute;">&raquo; <a href="san-pham-nam.jsp?trang=1">Xem thêm</a></span>
          </div>
        </div>
      </div>

      <%
          session.setAttribute("currentpage", "index.jsp");
      %>

      <%@include file="footer.jsp" %>
    </div>
  </body>
</html>

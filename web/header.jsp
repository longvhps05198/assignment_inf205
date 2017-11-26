<%-- 
    Document   : header
    Created on : Jun 6, 2017, 8:04:13 PM
    Author     : hlong232
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Header</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#" style="color: white">FASHION</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><i class="glyphicon glyphicon-earphone"></i> Hotline: 01239459939</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-check"></i> Kiểm tra đơn hàng</a></li>
            <li><a href="gio-hang.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> Giỏ hàng</a></li>
            <li><a href="dang-nhap.jsp"><i class="glyphicon glyphicon-log-in"></i> Đăng nhập</a></li>
            <li><a href="dang-ky.jsp"><i class="glyphicon glyphicon-pencil"></i> Đăng ký</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    <div class="row" style="background-color: white">
      <div class="col-md-3"><a href="index.jsp"><img src="images/logo.png" style="margin-top: 15px;"></a></div>
      <div class="col-md-6" style="margin: 0 auto;">
        <img src="images/banner.jpg" width="100%">
      </div>
      <div class="col-md-3" style="margin: 16px auto -1px;padding-left: 0;padding-right: 40px">
        <form class="navbar-form navbar-left" role="search" style="margin-left: 0;padding: 0" action="Controller_Manage">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" name="txtSearch" style="width: 100%;">
          </div>
          <input type="submit" name="btnAction" value="Search" class="btn btn-default" />
          <div class="boxcart">
            <a href="gio-hang.jsp"><img src="images/shopping_cart.png" style="height: 40px"></a>
            <span class="number-shop">${fn:length(sessionScope.SHOP)}</span>
            <div style="width: 200px;display: inline-block;vertical-align: -22px;font-size: 15px;line-height: 20px">
              <a href="gio-hang.jsp"><p>GIỎ HÀNG</p></a>
              <c:set var="c" value="${fn:length(sessionScope.SHOP)}"/>
              <c:if test="${c!=0}">
                  <p style="color: #FF0040;font-size: 14px;text-decoration: underline">Có ${fn:length(sessionScope.SHOP)} món trong giỏ hàng</p>
              </c:if>
              <c:if test="${c==0}">
                  <p>&nbsp;</p>
              </c:if>
            </div>
          </div>
        </form>	
      </div>
    </div>

    <section class="navigation-menu clearfix hidden-xs">
      <div class="container">
        <div class="menu-top">
          <div class="row">
            <div class="col-md-12" style="padding: 0">
              <nav class="navbar nav-menu" style="margin:0">
                <div class="navbar-header">
                  <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#mobile-menu" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                </div>
                <nav id="mobile-menu" class="mobile-menu collapse navbar-collapse">
                  <ul class="menu nav navbar-nav" style="font-size: 16px;">
                    <li class="level0" style="margin-left: 14px;"><a class="" href="index.jsp"><span>Trang chủ</span></a></li>
                    <li class="level0"><a class="" href="gioi-thieu.jsp"><span>Giới thiệu</span></a></li>
                    <li class="level0"><a class="" href="#"><span>Sản phẩm</span></a>
                      <ul>
                        <a href="san-pham-nu.jsp?trang=1"><li style="border-bottom: 1px solid #fff">Thời trang nữ</li></a>
                        <a href="san-pham-nam.jsp?trang=1"><li>Thời trang nam</li></a>
                      </ul>
                    </li>
                    <li class="level0"><a class="" href="#"><span>Tin tức</span></a></li>
                    <li class="level0"><a class="" href="lien-he.jsp"><span>Liên hệ</span></a></li>
                  </ul>
                </nav>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>

<%-- 
    Document   : lien-he
    Created on : Jun 6, 2017, 8:01:01 PM
    Author     : hlong232
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/trang-mau.dwt" codeOutsideHTMLIsLocked="false" -->
  <head>
    <meta charset="UTF-8">
    <!-- InstanceBeginEditable name="EditRegion1" -->
    <title>Liên hệ</title>
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
      <div class="col-md-12" style="width: 90%; margin-left: 5%;">
        <p>Trang chủ &raquo; <a style="color: #75BF97">Liên hệ</a></p>
        <h1 class="title">
          <span>Thông tin liên hệ</span>
        </h1>

        <div class="row" style="border-bottom: 2px solid #75bf97; margin-bottom: 50px;">
          <div class="col-md-3">
            <img src="images/logo.png">
          </div>
          <div class="col-md-9" style="width: 70%; margin-left: 5%">
            <p><h4>ORANGE SHOP</h4><br>
            <i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i><span style="font-family: 'Tahoma'; font-size: 16px;"> &nbsp&nbsp Địa chỉ: q11</span><br>
            <i class="glyphicon glyphicon-earphone" aria-hidden="true"></i><span style="font-family: 'Tahoma'; font-size: 16px;"> &nbsp&nbsp Điện thoại: 01239456789</span><br>
            <i class="glyphicon glyphicon-phone" aria-hidden="true"></i><span style="font-family: 'Tahoma'; font-size: 16px;"> &nbsp&nbsp Hotline: 01239456789</span><br>
            <i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><span style="font-family: 'Tahoma'; font-size: 16px;"> &nbsp&nbsp Email: hlong232@gmail.com</span><br>
            </p><br><br>
          </div>
        </div>

        <h3 style="color: #75BF97">Gửi thông tin liên hệ</h3>
        <p>Xin vui lòng điền các yêu cầu vào mẫu dưới đây và gửi cho chúng tôi. Chúng tôi
          sẽ trả lời bạn ngay sau khi nhận được. Xin chân thành cảm ơn!</p>
        <div class="row" style="margin-bottom: 50px; margin-top: 30px">
          <div class="col-md-6 col-sm-12 col-xs-12">
            <div class="contact-feedback">
              <form ng-submit="sendContact()" class="ng-pristine ng-invalid ng-invalid-required ng-valid-email">
                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon glyphicon-user"></i></span>
                  <input type="text" placeholder="Họ tên" ng-model="Name" class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required" required="">
                </div>
                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                  <input type="text" placeholder="Địa chỉ" ng-model="Address" class="form-control ng-pristine ng-untouched ng-valid">
                </div>
                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                  <input type="email" placeholder="Email" ng-model="Email" class="form-control ng-pristine ng-untouched ng-valid-email ng-invalid ng-invalid-required" required="">
                </div>
                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                  <input type="text" placeholder="Điện thoại" ng-model="Phone" class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required" required="">
                </div>
                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
                  <input type="text" placeholder="Tiêu đề" ng-model="Title" class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required" required="">
                </div>
                <div class="form-group">
                  <textarea placeholder="Nội dung" class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required" rows="3" ng-model="Content" required></textarea>
                </div>
                <button class="btn btn-default" type="submit" style="color: white; background-color: black">Gửi</button>
              </form>
            </div>
          </div>

          <div class="col-md-6 col-sm-12 col-xs-12">
            <div id="map" style="width:100%;height:400px"></div>
            <script>
                function myMap() {
                    var myCenter = new google.maps.LatLng(10.7757, 106.7004)
                    var mapOptions = {
                        center: myCenter,
                        zoom: 14,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
                    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                    var marker = new google.maps.Marker({
                        position: myCenter,
                        animation: google.maps.Animation.BOUNCE
                    });

                    marker.setMap(map);
                }
            </script>
            <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnZmSSZpALstsu5Qh-2ynjtVs_nbMC7BY&callback=myMap"></script>
          </div>
        </div>
      </div>
      <br><br>


      <!-- InstanceEndEditable -->

      <%@include file="footer.jsp" %>
    </div>
  </body>
  <!-- InstanceEnd --></html>

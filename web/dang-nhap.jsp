<%-- 
    Document   : dang-nhap
    Created on : Jun 6, 2017, 7:59:22 PM
    Author     : hlong232
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/trang-mau.dwt" codeOutsideHTMLIsLocked="false" -->
  <head>
    <meta charset="UTF-8">
    <!-- InstanceBeginEditable name="EditRegion1" -->
    <title>Đăng nhập</title>
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
      <%@include file="header.jsp" %>

      <!-- InstanceBeginEditable name="EditRegion2" -->
      <br><br>
      <div class="col-md-12" style="width: 90%; margin-left: 5%;margin-top: 10px;height: 600px">
	<div class="col-md-3" style="padding-left: 0">
	  <div class="list-group">
	    <a href="#" class="list-group-item active" style="background-color: #75BF97; border: none; z-index: 0">
	      TÀI KHOẢN
	    </a>
	    <a href="" class="list-group-item">Đăng nhập</a>
	    <a href="dang-ky.jsp" class="list-group-item">Đăng ký</a>
	  </div>
	</div>

	<div class="col-md-9">
	  <p>Trang chủ &raquo; <a href="" style="color: #75BF97">Đăng nhập</a></p>
	  <div class="login-content clearfix ng-scope">
	    <h1 class="title"><span>Đăng nhập hệ thống</span></h1>
	    <div class="col-md-6 col-md-offset-3 col-xs-12 col-sm-12 col-xs-offset-0 col-sm-offset-0">
              <form class="form-horizontal" action="Controller_Login" method="post">
		<div class="form-group">
		  <label for="Email" class="col-sm-4 control-label">Email</label>
		  <div class="col-sm-8">
                    <input type="text" class="form-control" name="txtUsername" value="longvh" required="required">
		  </div>
		</div>
		<div class="form-group">
		  <label for="Password" class="col-sm-4 control-label">Mật khẩu</label>
		  <div class="col-sm-8">
                    <input type="password" name="txtPassword" class="form-control" value="123" required="required">
		  </div>
		</div>

		<div class="form-group">
		  <div class="col-sm-offset-4 col-sm-8">
                    <button type="submit" name="btnLogin" value="Login" class="btn btn-default">Đăng nhập</button>
		    <a href="#">Quên mật khẩu</a>
		  </div>

		</div>
	      </form>
	    </div>
	  </div>
	</div>
      </div>








      <!-- InstanceEndEditable -->

      <%@include file="footer.jsp" %>
    </div>
  </body>
  <!-- InstanceEnd --></html>

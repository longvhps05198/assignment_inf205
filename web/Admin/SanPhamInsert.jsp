<%-- 
    Document   : newjsp
    Created on : Jun 9, 2017, 9:56:02 PM
    Author     : hlong232
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/update.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
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
            <li><a href=""><i class="glyphicon glyphicon-cog"></i> Quản trị website</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-log-in"></i> Xin chào, ${sessionScope.USER}</a></li>
            <li><a href="logout.jsp"><i class="glyphicon glyphicon-log-out"></i> Đăng xuất</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    <div class="row" style="border-bottom: 5px solid #75BF97; margin-bottom: 5px;">
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



    <div class="col-md-12" style="width: 96%; padding:0; margin-left: 2%; margin-right: 2%;">
      <div class="col-sm-3 col-md-3" style="padding-left:0;width: 20%">
        <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                  </span>Sản phẩm nữ</a>
              </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
              <div class="panel-body">
                <table class="table">
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-pencil text-primary"></span>
                      <a href="Admin/SanPhamInsert.jsp">Thêm sản phẩm</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-flash text-success"></span>
                      <c:url var="show" value="Controller_Manage">
                          <c:param name="btnAction" value="Show" />
                      </c:url>
                      <a href="${show}" style="color: #0E4EB5">Sản phẩm</a>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-folder-close">
                  </span>Sản phẩm nam</a>
              </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
              <div class="panel-body">
                <table class="table">
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-pencil text-primary"></span>
                      <a href="Admin/SanPhamInsert.jsp">Thêm sản phẩm</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-flash text-success"></span>
                      <c:url var="show" value="Controller_Manage">
                          <c:param name="btnAction" value="Showspnam" />
                      </c:url>
                      <a href="${show}">Sản phẩm</a>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-9" style="padding:0; width: 80%">
        <div class="panel-heading" style="margin-bottom: 10px">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
              </span>Content</a>
          </h4>
        </div>
        <div class="col-md-12" style="width: 100%;border: 1px solid #e3e3e3">
          <form action="<%=request.getContextPath()%>/uploadFile" method="post" enctype="multipart/form-data">
            <h4 style="margin:20px 10px 50px 10px;border-bottom: 1px solid #e3e3e3">THÔNG TIN SẢN PHẨM</h4>
            <div class="col-md-6" style="width: 60%">

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Tên sản phẩm</div>
                <input type="text" name="txtTensanpham" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Giá gốc</div>
                <input type="text" name="txtGiagoc" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Giá khuyến mãi</div>
                <input type="text" name="txtGiakhuyenmai" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Chiết khấu</div>
                <input type="text" name="txtChietkhau" value="" style="width: 74%">
              </div>

<!--              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Hình ảnh</div>
                <input type="text" id="urlimg" name="txtImage" value="" style="width: 74%" />
              </div>-->
              
              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Giới tính</div>
                <input type="radio" name="txtGioitinh" value="Nam"/> Nam
                <input type="radio" name="txtGioitinh" value="Nữ"/> Nữ
              </div>
              
              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Phân loại</div>
                <select class="choice-product" name="txtPhanloai" style="width: 74%">
                  <option selected="true">-- Select --</option>
                  <option value="Set đồ">Set đồ</option>
                  <option value="Áo nam">Áo nam</option>
                  <option value="Áo nữ">Áo nữ</option>
                  <option value="Đầm & Váy nữ">Đầm & Váy nữ</option>
                  <option value="Quần nam">Quần nam</option>
                </select>
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Mô tả</div>
                <textarea rows="5" name="txtMota" style="width: 74%"></textarea>
                <%--<input type="text" value="${rows.moTa}" style="width: 60%">--%>
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Kiểu dáng</div>
                <input type="text" name="txtKieudang" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Màu sắc</div>
                <input type="text" name="txtMausac" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Chất liệu</div>
                <input type="text" name="txtChatlieu" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <div class="label-up">Xuất xứ</div>
                <input type="text" name="txtXuatxu" value="" style="width: 74%">
              </div>

              <div class="row" style="margin:10px 10px 10px 0">
                <input type="submit" class="btn btn-success" name="btnAction" value="Insert">
                <input type="submit" class="btn btn-danger" name="btnAction" value="Back">
              </div>
            </div>
            <div class="col-md-5" style="width: 40%;margin-top: 10px">
              <div style="border: 1px solid #333"><img id="show-img" src="images/no-image-icon.png" width="100%" height="100%" alt=""></div>
              <input type="file" id="imgInp" name="Upload" value="Upload..." style="margin-top: 14px;">
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-12" style="height: 300px; border-top: 1px solid #333;border-bottom: 1px solid #333;margin-top: 100px;">
      <div class="col-md-3" style="margin-top: 30px;margin-left: 5%; width: 20%; padding: 0">
        <span style="font-size: 25px">GIỚI THIỆU</span><br><br>
        <div class="col-md-12" style="padding: 0; line-height: 30px;">
          <span>&raquo; Về chúng tôi</span><br>
          <span>&raquo; Lĩnh vực hoạt động</span><br>
          <span>&raquo; Hỏi đáp</span>
        </div>
      </div>
      <div class="col-md-3" style="margin-top: 30px; padding: 0;margin-left: 3%; width: 22%">
        <span style="font-size: 25px">TRỢ GIÚP</span><br><br>
        <div class="col-md-12" style="padding: 0; line-height: 30px;">
          <span>&raquo; Hướng dẫn thanh toán</span><br>
          <span>&raquo; Quy định đổi trả</span><br>
          <span>&raquo; Chính sách bảo mật</span>
        </div>
      </div>
      <div class="col-md-3" style="margin-top: 30px; padding: 0">
        <span style="font-size: 25px">THÔNG TIN CÔNG TY</span><br><br>
        <div class="col-md-12" style="padding: 0; line-height: 30px;">
          <span>&raquo; Địa chỉ: Q11, TP.HCM</span><br>
          <span>&raquo; Email: longvhps05198@fpt.edu.vn</span><br>
          <span>&raquo; Điện thoại: 01239459939</span>
        </div>
      </div>
      <div class="col-md-3" style="margin-top: 30px; padding: 0; width: 20%; margin-right: 5%">
        <span style="font-size: 25px">FACEBOOK</span><br><br>
      </div>
    </div>

    <div id="footer" class="col-md-12">
      <span>@ 2017 ORANGE FASHION Store. All Right Reserved. Design by LONG.</span>
    </div>
  </body>

</html>
<script>
//    $('input[type="file"]').change(function () {
//        $('#urlimg').val($(this).val());
//        $("#show-img").attr("src", $(this).val());
//    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#show-img').attr('src', e.target.result);
//                $('#urlimg').val((window.URL || window.webkitURL).createObjectURL(file));
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#imgInp").change(function () {
        readURL(this);
    });
</script>

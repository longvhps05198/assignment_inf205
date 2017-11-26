<%-- 
    Document   : newjsp
    Created on : Jun 7, 2017, 2:38:49 AM
    Author     : hlong232
--%>

<%@page import="Model.Sanphamnu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sản phẩm nữ</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="css/myweb.css">
    <link rel="stylesheet" href="css/manage.css">
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
            <li><a href="dang-nhap.jsp"><i class="glyphicon glyphicon-log-in"></i> Đăng nhập</a></li>
            <li><a href="dang-ky.jsp"><i class="glyphicon glyphicon-pencil"></i> Đăng ký</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    <div class="row" style="border-bottom: 5px solid #75BF97; margin-bottom: 5px;">
      <div class="col-md-3"><img src="images/logo.png" style="margin-top: 15px;"></div>
      <div class="col-md-6" style="margin: 0 auto;">
        <img src="images/banner.jpg" width="100%">
      </div>
      <div class="col-md-3" style="margin: 16px auto;padding-left: 0;padding-right: 40px">
        <form class="navbar-form navbar-left" role="search" style="margin-left: 0;padding: 0">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" style="width: 100%;">
          </div>
          <button type="submit" class="btn btn-default">Search</button>
          <a href="gio-hang.jsp">
            <div class="boxcart">
              <img src="images/shopping_cart.png" style="height: 34px"><span style="color: #fff"> Giỏ hàng</span>
            </div>
          </a>
        </form>	
      </div>
    </div>



    <div class="col-md-12" style="width: 96%; padding:0; margin-left: 2%; margin-right: 2%; height: 1500px">
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
                      <a href="">Áo nữ</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-flash text-success"></span>
                      <a href="">Đầm / Váy nữ</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-file text-info"></span>
                      <a href="">Set đồ</a>
                      <span class="badge">42</span>
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
                      <a href="">Áo nam</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-flash text-success"></span>
                      <a href="">Quần nam</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-file text-info"></span>
                      <a href="">Set đồ</a>
                      <span class="badge">42</span>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-th">
                  </span>Tin tức</a>
              </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
              <div class="panel-body">
                <table class="table">
                  <tr>
                    <td>
                      <a href="">Orders</a>
                      <span class="label label-success">$ 320</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="">Invoices</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="">Shipments</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="">Tex</a>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-user">
                  </span>Tài khoản</a>
              </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
              <div class="panel-body">
                <table class="table">
                  <tr>
                    <td>
                      <a href="">Change Password</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="">Notifications</a> <span class="label label-info">5</span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="">Import/Export</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-trash text-danger"></span>
                      <a href="" class="text-danger">Delete Account</a>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><span class="glyphicon glyphicon-file">
                  </span>Nội dung</a>
              </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">
              <div class="panel-body">
                <table class="table">
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-usd"></span>
                      <a href="">Sales</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-user"></span>
                      <a href="">Customers</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-tasks"></span>
                      <a href="">Products</a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="glyphicon glyphicon-shopping-cart"></span>
                      <a href="">Shopping Cart</a>
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
        <div class="col-md-12" style="width: 100%;">
          <table id="example" class="display" width="100%" height="100%"></table>
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

  <%!
      int id;
      String tensanpham;
      String giagoc;
      String giakhuyenmai;
      String chietkhau;
      String urlimage;
      String urlThem = "<a href='dang-ky.jsp' class='glyphicon glyphicon-plus' style='border: 1px solid #f07b1d; padding: 5px'></a>";
      String urlXoa = "<a href='dang-ky.jsp' class='glyphicon glyphicon-remove' style='border: 1px solid #f07b1d; padding: 5px'></a>";
      String urlSua = "<a href='dang-ky.jsp' class='glyphicon glyphicon-wrench' style='border: 1px solid #f07b1d; padding: 5px'></a>";
      int i;
      Sanphamnu spnu = new Sanphamnu();
      Sanphamnu[] list = spnu.getConnectSPNU("select * from SANPHAMNU");
  %>
    var dataSet = new Array("<%=list.length%>");
  <%
      for (i = 0; i < list.length; i++) {
          id = list[i].getId();
          tensanpham = list[i].getTenSanPham();
          giagoc = list[i].getGiaGoc();
          giakhuyenmai = list[i].getGiaKhuyenMai();
          chietkhau = list[i].getChietKhau();
          urlimage = list[i].getImage();
          String url[] = urlimage.split("/");
  %>
    dataSet["<%=i%>"] = ["<%=id%>", "<%=tensanpham%>", "<%=giagoc%>", "<%=giakhuyenmai%>", "<%=chietkhau%>", "<img src='<%=urlimage%>' width='10%'> <%=url[3]%>", "<%=urlXoa%><%=urlSua%>"];
  <%}%>
    $(document).ready(function () {
        $('#example').DataTable({
            data: dataSet,
            columns: [
                {title: "ID"},
                {title: "Tên sản phẩm"},
                {title: "Giá gốc"},
                {title: "Giá khuyến mãi"},
                {title: "Chiết khấu"},
                {title: "Hình ảnh"},
                {title: "Chức năng"}
            ]
        });
        $('.sorting:eq(4)').css("width", "25%");
        $('.sorting:eq(4)').css("text-align", "center");
    });
</script>
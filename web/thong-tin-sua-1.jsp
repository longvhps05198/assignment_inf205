<%-- 
    Document   : thong-tin-sua
    Created on : Jun 6, 2016, 2:16:23 PM
    Author     : hv
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.ConnectionData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/spchitiet.css">
    <title>Thông tin sữa</title>

  </head>
  <body>
    <table border="1" style="margin:0 auto;width:800px;">
      <caption>THÔNG TIN SỮA</caption>
      <thead>
        <tr>
          <th>Số TT</th>
          <th>Tên sản phẩm</th>
          <th>Giá gốc</th>
          <th>Giá khuyến mãi</th>
          <th>Chiết khấu</th>
          <th>Hình ảnh</th>
          <th>Phân loại</th>
          <th>Mô tả</th>
        </tr>
      </thead>
      <tbody>
        <%!
            Connection con = new ConnectionData().connectData("PS05198_Assignment");
            Statement stm = null;
            ResultSet rs = null;
            int soTrang = 0, soDong = 0, soDongTrang = 5, trang = 1, viTri = 0;
        %>
        <%
            String sql = "select * from SPNU";
            if (request.getParameter("trang") == null || stm == null) {
                stm = con.createStatement(
                        ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                rs = stm.executeQuery(sql);
                rs.last();
                soDong = rs.getRow();
            }
            if (request.getParameter("trang") != null) {
                trang = Integer.parseInt(request.getParameter("trang"));
            }

            soTrang = (soDong % soDongTrang == 0) ? soDong / soDongTrang : soDong / soDongTrang + 1;
            viTri = (trang == 1) ? 0 : (trang - 1) * soDongTrang;
            sql += " ORDER BY ID OFFSET " + viTri + " ROWS FETCH NEXT " + soDongTrang + " ROWS ONLY;";
            rs = stm.executeQuery(sql);
        %>
        <%int stt = 1;
            while (rs.next()) {%>
        <tr>
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
          <td><%=rs.getString(6)%></td>
          <td><%=rs.getString(7)%></td>
          <td><%=rs.getString(8)%></td>
        </tr>
        <%stt++;
            }%>
      </tbody>
    </table>
    <p style="text-align:center;">
      <a href="thong-tin-sua-1.jsp?trang=1"> &lt;&lt; </a>
      <a href="thong-tin-sua-1.jsp?trang=<%=(trang - 1) < 1 ? 1 : trang - 1%>"> &lt; </a>
      <%for (int i = 1; i <= soTrang; i++) {%>
      <a href="thong-tin-sua-1.jsp?trang=<%=i%>"><%=i%></a>
      <%}%>
      <a href="thong-tin-sua-1.jsp?trang=<%=(trang + 1 > soTrang) ? soTrang : trang + 1%>"> &gt; </a>
      <a href="thong-tin-sua-1.jsp?trang=<%=soTrang%>"> &gt;&gt; </a>
    </p>
    
    
    <div class="store-pagination clear"> 
      <a class="prev page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/3/">« Previous</a> 
      <a class="page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/1/">1</a> 
      <a class="page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/2/">2</a> 
      <a class="page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/3/">3</a> 
      <span class="page-numbers current">4</span> 
      <a class="page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/5/">5</a> 
      <a class="page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/6/">6</a> 
      <span class="page-numbers dots">…</span> 
      <a class="page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/8/">8</a> 
      <a class="next page-numbers" href="https://bootstrapthemes.co/items/free-bootstrap-templates/page/5/">Next »</a>
    </div>
  </body>
</html>

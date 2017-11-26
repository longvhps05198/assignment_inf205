<%-- 
    Document   : logout
    Created on : Jun 11, 2017, 12:04:22 AM
    Author     : hlong232
--%>

<%@page import="Model.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
        CartBean shop = (CartBean) session.getAttribute("SHOP");
        session.invalidate();
        HttpSession session1 = request.getSession(true);
        session1.setAttribute("SHOP", shop);
        response.sendRedirect("index.jsp");
    %>
  </body>
</html>

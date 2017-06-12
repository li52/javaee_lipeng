<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/6/6
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>index page</title>
  </head>
  <body>
  <h1>IP SEARCH</h1>
  <form action="search" method="post">
    <input type="text" name="ip" placeholder="IP 地址">
    <input type="submit" value="查询">
  </form>
  <h3>IP 地址</h3>
  <p>
    <%
      String geo = (String) request.getAttribute("geo");
      if (geo != null) {
          out.print(geo);
      }
    %>
  </p>
  </body>
</html>

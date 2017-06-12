<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/6/10
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String ip = request.getParameter("ip");
    if (ip != null) {
        new Driver();
        String url = "jdbc:mysql:///db_ip?user=root&password=lipeng";
        Connection connection = DriverManager.getConnection(url);
        String sql = "SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(min) AND inet_aton(max);";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,ip);
        ResultSet resultSet = ps.executeQuery();
        resultSet.next();
        String message=(String) request.getAttribute("message");
        out.print(message);
        resultSet.close();
        ps.close();
        connection.close();
    }
%>
</body>
</html>

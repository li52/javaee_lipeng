<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/6/7
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if (session.getAttribute("nick") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<h1>主页</h1>
<p><%=session.getAttribute("nick")%></p>
<%--<a href="second.jsp">第二页</a>--%>
<%
    pageContext.setAttribute("key","value");
    application.setAttribute("app-key","app-value");
%>
<%--<%=pageContext.getAttribute("key")%>
<%=application.getAttribute("app-key")%>--%>
<p><a href="user?action=logout">注销</a></p>
<hr>
<form action="student" method="post">
    <input type="hidden" name="action" value="add">
    <input type="text" name="name" placeholder="姓名"><br>
    <input type="text" name="gender" placeholder="性别"><br>
    <input type="date" name="dob" placeholder="出生日期"><br>
    <input type="submit" value="添加">
</form>
</body>
</html>

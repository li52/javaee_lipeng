<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/6/13
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index page</title>
</head>
<body>
<h1>首页</h1>
<form action="user" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="mobile" placeholder="手机号"><br>
    <input type="password" name="password" placeholder="密码"><br>
    <input type="submit" value="登录">
</form>
<p>
    ${requestScope.message}

    <%--<%
        String message = (String) request.getAttribute("message");
        if (message != null) {
            out.print(message);
        }
    %>--%>
</p>
<a href="signup.jsp">注册</a>
</body>
</html>

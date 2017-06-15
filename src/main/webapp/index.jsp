<%@ page import="demo.model.Student" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/6/12
  Time: 9:393
  0
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>index page</title>
    <style>
        table {
            border-collapse: collapse;
        }

        td,
        td {
            border: 1px solid #333;
        }
    </style>

    <script>
        function del() {
            return confirm('DEL?');
        }
        function selectAll() {
            var cb = document.getElementById('cb');
            var items = document.getElementsByClassName('to_be_delete');
            for (var i = 0; i < items.length; i++) {
                items[i].checked = cb.checked
            }
        }
    </script>
</head>
<body><%--eq 等于  ne  不等于    it  小于   gt  大于--%>
<c:if test="${sessionScope.nick eq null}">
    <c:redirect url="default.jsp"/>
</c:if>
<%--<%
    if (session.getAttribute("nick") == null) {
        response.sendRedirect("default.jsp");
    }
%>--%>
<h1>主页</h1>
<p>${sessionScope.nick}
    <%--<p><%=session.getAttribute("nick")%>--%>
</p>
<%--<%
    pageContext.setAttribute("key", "value");
    application.setAttribute("app-key", "app-value");
%>--%>
<p><a href="user?action=logout">注销</a></p>
<hr>
<form action="student" method="post">
    <input type="hidden" name="action" value="add">
    <input type="text" name="name" placeholder="姓名"><br>
    <input type="text" name="gender" placeholder="性别"><br>
    <input type="date" name="dob" placeholder="出生日期"><br>
    <input type="submit" value="添加">
</form>
<hr>
<form action="student" method="post">
    <input type="hidden" name="action" value="batchRemove">
    <table <%--border="1"--%>>
        <c:choose>
            <c:when test="${fn:length(sessionScope.students) eq 0}">
                当前没有记录
            </c:when>
            <c:otherwise>
                <tr>
                    <th><input id="cb" type="checkbox" onclick="selectAll()">序号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>出生日期</th>
                    <th colspan="2">操作</th>
                </tr>
            </c:otherwise>
        </c:choose>
        <c:forEach var="student" items="${sessionScope.students}" varStatus="vs">
            <tr>
                <td><input class="to_be_delete" type="checkbox" name="ids" value="${student.id}">${vs.count}</td>
                <td>${student.name}</td>
                <td>${student.gender}</td>
                <td>${student.dob}</td>
                <td><a href="student?action=queryById&id=${student.id}">编辑</a></td>
                     <%--<td><a href="student?action=remove&id=${student.id}" onclick="return del()">删除</a></td>--%>
                <td><a href="student?action=remove&id=${student.id}" onclick="return del()">删除</a></td>
            </tr>
        </c:forEach>

        <%--<%
            List<Student> resultSet = (List<Student>) session.getAttribute("students");
            for (Student student : resultSet) {
                out.print("<tr>" + "<td>" + student.getId() + "</td>" + "<td>" + student.getName() + "</td>" + "<td>" + student.getGender() + "</td>" + "<td>" + student.getDob() + "<td><a href='student?action=queryById&id=" + student.getId() + "'>编辑</a></td>" + "<td><a href='student?action=remove&id=" + student.getId() + "' onclick='return del()'>删除</a></td>" + "</tr>");
            }
        %>--%>
    </table>
    <c:if test="${fn:length(sessionScope.students) ne 0}">
        <input type="submit" value="删除">
    </c:if>
</form>
<hr>
<%--<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
        out.print(message);
    }
%>--%>
${requestScope.message}

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/6/10
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="ipsearch.jsp" method="post">
    <input type="text" name="ip" placeholder="IP 地址">
    <input type="submit" value="查询">
</form>
<%!
    private int initVar = 0;
    private int serviceVar = 0;
    private int destroyVar = 0;
%>
<%!
    public void jspInit() {
        initVar++;
        System.out.println("jspInit() :JSP 被初始化了" + initVar + "次。");
    }
    public void jspDestroy() {
        destroyVar++;
        System.out.println("jspDestroy() :JSP 被销毁了" + destroyVar + "次。");
    }
%>
<%
    serviceVar++;
    System.out.println("_jspService() :JSP 共响应了" + serviceVar + "次请求。");
    String content1 = "初始化次数：" + initVar;
    String content2 = "响应客户请求次数：" + serviceVar;
    String content3 = "销毁次数：" + destroyVar;
%><h1> JSP 生命周期测试</h1>

</body>
</html>

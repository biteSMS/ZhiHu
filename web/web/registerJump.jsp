<%@ page contentType="text/html; ISO-8859-1" language="java" pageEncoding="utf-8"%>
<html>
<head>
    <title>跳转</title>
</head>
<body>
<%!
    int count = 3;
%>
<h3>注册成功！自动为您登陆.</h3>
<h3><%=count--%>秒后跳转到知乎首页，如果没有跳转请按<a href="home.jsp">这里</a>! </h3>
<%
    response.setHeader("refresh","1");
    if(count == -1){
        count = 3;
        response.sendRedirect("home.jsp");
    }
%>
</body>
</html>

<%@ page contentType="text/html; ISO-8859-1" language="java" pageEncoding="utf-8"%>
<html>
<head>
    <title>跳转</title>
</head>
<body>
<%!
    int count = 3;
%>
<h3>登陆成功!</h3>
<h3><%=count--%>秒后跳转到知乎首页，<a href="home.jsp">如果没有跳转请按这里</a>! </h3>
<%
    response.setHeader("refresh","1");//页面刷新间隔设置if为1秒
    if(count == -1){
        count = 3;
        response.sendRedirect("home.jsp");
    }
%>
</body>
</html>

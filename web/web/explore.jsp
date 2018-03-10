<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>发现 - 知乎</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/explore.css">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
    <!-- 导航栏 -->
    <div id="header">
        <div id="header-container">
            <div id="logo">
                <img src="images/logo.png" alt="logo" width="64px" height="30px">
            </div>
            <div id="header-nav">
                <a href="home.jsp">首页</a>
                <a href="">发现</a>
                <a href="">话题</a>
            </div>
            <div id="search">
                <div id="search-input">
                    <input type="text" class="input" placeholder="搜索你感兴趣的内容…">
                    <img src="images/search.png" width="16px" height="16px">
                </div>
                <div id="search-button">
                    <button>提问</button>
                </div>
            </div>
            <div id="item">
                <div id="bell">
                    <img src="images/bell.png" width="22px" height="22px">
                </div>
                <div id="messages">
                    <img src="images/messages.png" width="24px" height="24px">
                </div>
                <div id="head-portrait">
                    <% if(session.getAttribute("username")==null){%><%-- 用户未登录，显示默认头像--%>
                    <img src="images/head-portrait.png" width="31px" height="31px">
                    <%}else{%>
                    <img src="images/user_picture/<%=session.getAttribute("username")%>.png" width="31px" height="31px">
                    <%}%>
                </div>
            </div>
            <div id="menu">
                <%if(session.getAttribute("username")==null){%><%--用户未登录，跳转到登陆页面--%>
                <a href="Login.jsp">
                    <div id="people">
                        <img src="images/people.png" width="14px" height="14px">我的主页</div>
                </a>
                <%}else{%><%--用户已登陆，跳转到用户主页--%>
                <a href="people.jsp">
                    <div id="people">
                        <img src="images/people.png" width="14px" height="14px">我的主页</div>
                </a>
                <%}%>
                <a href="">
                    <div id="setting">
                        <img src="images/setting.png" width="14px" height="14px">设置</div>
                </a>
                <%if(session.getAttribute("username") == null){%>
                <a href="">
                    <div id="exit">
                        <img src="images/exit.png" width="14px" height="14px">退出</div>
                </a>
                <%}else{%>
                <a href="Exit">
                    <div id="exit">
                        <img src="images/exit.png" width="14px" height="14px">退出</div>
                </a>
                <%}%>
            </div>
        </div>
        <!-- 提问界面 -->
        <div id="question">
            <div id="question-close">
                <img src="images/close.png" width="18px" height="18px">
            </div>
            <form action="QuestionForm" method="post">
                <div id="question-title">写下你的问题</div>
                <div id="question-subtitle">描述精确的问题更易得到解答</div>
                <div id="question-input">
                    <textarea rows="2" name="question_title" cols="30" class="q-input" placeholder="问题标题"></textarea>
                </div>
                <div id="information-title">问题描述（可选）：</div>
                <div id="question-information">
                    <textarea rows="2" name="question_description" cols="30" class="q-input" placeholder="问题背景、条件等详细信息"></textarea>
                </div>
                <%if(session.getAttribute("username")==null){%><%--用户未登录，跳转到登陆页面--%>
                <input type="button" value="提交问题" class="question-button" onclick="alert('请先登陆！');location.href=('Login.jsp');">
                <%}else{%><%--可以获得session中用户id，执行表单提交功能--%>
                <input type="submit" value="提交问题" class="question-button">
                <%}%>

            </form>
        </div>
    </div>
    <div id="container">
        <div class="question frame refresh" onclick="refresh()">刷新问题</div>
        <%--<div class="question frame flag">--%>
    </div>
    <script src="js/header.js"></script>
    <script>
        refresh();
        var problemDiv = '<div class="question frame flag"></div>';
        function refresh() {
            $.ajax({
                method: 'POST',
                url:"QuestionRefresh",
                dataType : "json",
                success: function(res) {
                    var problem = document.querySelectorAll('.flag');
                    if (res.question.length === problem.length){
                        alert('已显示所有的最新问题了哦！');
                    }
                    for (var m = 0; m < res.question.length - problem.length; m++) {
                        $('#container').append(problemDiv);
                    }
                    function dom() {
                        var problemNew = document.querySelectorAll('.flag');
                        for (var i = 0; i < res.question.length; i++) {
                            problemNew[i].innerHTML = '<a href="JumpQuestion?question_title='+res.question[res.question.length - i -1].question_title+'" target="_blank">'+res.question[res.question.length - i -1].question_title+'</a>'
                        }
                    }
                    dom();
                }
            });
        }
    </script>
</body>

</html>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页 - 知乎</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/home.css">
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
            <a href="">首页</a>
            <a href="explore.jsp" target="_blank">发现</a>
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
                <%}else if(session.getAttribute("userpicture_address") != null ){%><%--已登陆,用户头像已更新,显示用户头像--%>
                <img src="images/user_picture/<%=session.getAttribute("username")%>.png" width="31px" height="31px">
                <%}else{%>
                <img src="images/head-portrait.png" width="31px" height="31px">
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
    <!-- 主要栏目 -->
    <div id="main-column">
        <div id="container-header" class="frame">
            <div class="ch-item sticky-font" id="q-button">
                <img src="images/wenhao.png" width="16px" height="16px">提问</div>
            <div class="ch-item sticky-font">
                <img src="images/messages.png" width="20px" height="20px">回答</div>
            <div class="ch-item sticky-font">
                <img src="images/pen2.png" width="16px" height="16px">写文章</div>
            <div class="ch-item sticky-font" onclick="refresh()">
                <img src="images/refresh.png" width="24px" height="24px">刷新动态</div>
        </div>
        <div id="container-problem">
            <!-- 问题及描述 -->



        </div>
    </div>
    <!-- 侧边栏 -->
    <div id="sticky">
        <div id="card" class="frame">
            <div class="category-item sticky-font">
                <img src="images/live.png" width="26px" height="26px">
                <br>Live</div>
            <div class="category-item sticky-font">
                <img src="images/book.png" width="26px" height="26px">
                <br>书店</div>
            <div class="category-item sticky-font">
                <img src="images/desk.png" width="26px" height="26px">
                <br>圆桌</div>
            <div class="category-item sticky-font">
                <img src="images/pen.png" width="26px" height="26px">
                <br>专栏</div>
            <div class="category-item sticky-font">
                <img src="images/money.png" width="26px" height="26px">
                <br>付费咨询</div>
        </div>
        <div id="nav-list" class="frame">
            <div class="nav-link sticky-font">
                <img src="images/star.png" width="15px" height="15px">我的收藏</div>
            <div class="nav-link sticky-font">
                <img src="images/wenhao.png" width="15px" height="15px">我关注的问题</div>
            <div class="nav-link sticky-font">
                <img src="images/people.png" width="15px" height="15px">我的邀请</div>
            <div class="nav-link sticky-font">
                <img src="images/gift.png" width="15px" height="15px">我的礼券</div>
            <div class="nav-link sticky-font">
                <img src="images/messages.png" width="15px" height="15px">社区服务中心</div>
            <div class="nav-link sticky-font">
                <img src="images/C.png" width="15px" height="15px">版权服务中心</div>
            <div class="nav-link sticky-font">
                <img src="images/pen2.png" width="15px" height="15px">公共编辑状态</div>
        </div>
    </div>
</div>
<script src="js/header.js"></script>
<script src="js/home.js"></script>
<script src="js/ajax.js"></script>
<script>
    refresh();
    var problemDiv = '<div class="problem frame"><div class="user"></div><div class="problem-context"><div class="context-title"></div><div class="context-description"></div></div></div>';

    //注意变量提升
    function refresh() {
        $.ajax({
            method: 'POST',
            url:"AnswerRefresh",
            dataType : "json",
            success: function(res) {
                var problem = document.querySelectorAll('.problem');
                for (var m = 0; m < res.answer.length - problem.length; m++) {
                    $('#container-problem').append(problemDiv);
                }
                function dom() {
                    var user = document.querySelectorAll('.user');
                    var title = document.querySelectorAll('.context-title');
                    var description = document.querySelectorAll('.context-description');
                    for (var i = 0; i < res.answer.length; i++) {
                        user[i].innerHTML = '<a href="JumpPerson?username='+res.answer[res.answer.length - i -1].username+'" target="_blank"><img src="images/user_picture/'+res.answer[res.answer.length - i -1].username+'.png" width="26px" height="26px">'+res.answer[res.answer.length - i -1].username+'</a>';
                        title[i].innerHTML = '<a href="JumpQuestion?question_title=' +res.answer[res.answer.length - i -1].question_title+'" target="_blank">'+res.answer[res.answer.length - i -1].question_title+'</a>';
                        description[i].innerHTML = '<a href="JumpQuestion?question_title='+res.answer[res.answer.length - i -1].question_title+'" target="_blank">'+res.answer[res.answer.length - i -1].answer_content+'</a>';
                    }
                }
                dom();
            }
        });
    }
</script>
</body>
</html>
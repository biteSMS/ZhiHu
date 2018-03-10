<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>我的个人资料 - 知乎</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/people.css">
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
                <%if(session.getAttribute("userpicture_address") == null){%><%--用户未更新头像--%>
                <div id="head-portrait">
                    <img src="images/head-portrait.png" width="31px" height="31px">
                </div>
                <%}else{%><%--用户已更新头像--%>
                <div id="head-portrait">
                    <img src="images/user_picture/<%=session.getAttribute("username")%>.png" width="31px" height="31px">
                </div>
                <%}%>
            </div>
            <div id="menu">
                <a href="people.jsp">
                    <div id="people">
                        <img src="images/people.png" width="14px" height="14px">我的主页</div>
                </a>
                <a href="">
                    <div id="setting">
                        <img src="images/setting.png" width="14px" height="14px">设置</div>
                </a>
                <a href="Exit">
                    <div id="exit">
                        <img src="images/exit.png" width="14px" height="14px">退出</div>
                </a>
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
                <button id="question-button" type="submit" onclick="">提交问题</button>
            </form>
        </div>
    </div>
    <!-- 个人信息界面 -->
    <div id="container">
        <div id="change"><button class="button" onclick="location.href='edit.jsp'">编辑个人资料</button></div>
        <div id="user">
            <div id="userpicture"><img src="images/user_picture/<%=session.getAttribute("username")%>.png"></div>
            <div id="username" class="user-frame"><%=session.getAttribute("username")%></div>
            <%if(session.getAttribute("selfdescription") == null){%>
            <div id="selfdescription" class="user-frame">这个家伙很聪明，什么都没有留下~</div>
            <%}else{%>
            <div id="selfdescription" class="user-frame"><%=session.getAttribute("selfdescription")%></div>
            <%}%>
        </div>
    </div>
    <script src="js/header.js"></script>
    <script src="js/people.js"></script>
    <script src="js/ajax.js"></script>
</body>

</html>
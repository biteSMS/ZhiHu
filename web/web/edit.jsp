<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>编辑个人资料 - 知乎</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/edit.css">
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
                    <img src="images/user_picture/<%=session.getAttribute("username")%>.png" width="31px" height="31px">
                </div>
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
                <%if(session.getAttribute("username") == null){%>
                <a href="Exit">
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
                    <textarea rows="2" cols="30" class="q-input" placeholder="问题标题"></textarea>
                </div>
                <div id="information-title">问题描述（可选）：</div>
                <div id="question-information">
                    <textarea rows="2" cols="30" class="q-input" placeholder="问题背景、条件等详细信息"></textarea>
                </div>
                <button id="question-button" type="submit" onclick="">提交问题</button>
            </form>
        </div>
    </div>
    <!-- 修改个人资料 -->
    <div id="container">
        <div id="username" class="frame"><%=session.getAttribute("username")%></div>
        <div id="userpicture"><img src="images/user_picture/<%=session.getAttribute("username")%>.png"></div>
        <div id="upload-form1">
            <form action="pictureEdit" method="post" enctype="multipart/form-data" name="upload-form">
                <input name="imgfile" type="file" accept="image/png" /></br>
                <input name="upload" type="submit" class="button" value="确定修改" />
            </form>
        </div>
        <div id="upload-form2">
            <form action="descriptionEdit" method="post">
                <%if(session.getAttribute("selfdescription") == null){%>
                <div id="textarea" class="frame">
                    <textarea rows="2" name="selfdescription" cols="30" class="text-input" placeholder="这个家伙很聪明，什么也没有留下~"></textarea>
                </div>
                <%}else{%>
                <div id="textarea" class="frame">
                    <textarea rows="2" name="selfdescription" cols="30" class="text-input" placeholder="<%=session.getAttribute("selfdescription")%>"></textarea>
                </div>
                <%}%>
                <div id="d-button"><input name="description" type="submit" class="button" value="确定修改" /></div>
            </form>
        </div>
    </div>
    <script src="js/header.js"></script>
</body>

</html>
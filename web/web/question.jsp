<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title><%=request.getAttribute("question_title")%> - 知乎</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/question.css">
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
                    <%}else{%><%--已登陆,用户头像已更新,显示用户头像--%>
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
        <!-- 问题标题及描述 -->
        <div id="question-header">
            <div id="question-header-container">
                <div id="title"><%=request.getAttribute("question_title")%></div>
                <div id="description"><%=request.getAttribute("question_description")%></div>
                <div id="write-comment">写回答</div>
                <div id="show"><img src="images/show.png" width="23px" height="23px">显示更多</div>
            </div>
        </div>
        <!-- 回复窗口 -->
        <div id="comment-add" class="frame">
            <div id="comment-add-header" class="user"><img src="images/user_picture/<%=session.getAttribute("username")%>.png" width="40px" height="40px"><%=session.getAttribute("username")%></div>
            <form action="AddAnswer" method="post" >
                <textarea name="edit" id="edit" cols="30" rows="10" placeholder="写回答..."></textarea>
                <%if(session.getAttribute("username") != null){%>
                <input type="submit" value="提交回答" class="edit-submit">
                <%}else{%>
                <input type="button" value="提交回答" class="edit-submit" onclick="alert('请先登陆！');location.href=('Login.jsp');">
                <%}%>
            </form>
            <button class="edit-submit" id="cancel">关闭</button>
        </div>
        <!-- 全部回复 -->
        <div id="comment-container">
            <%--<div class="comment frame">--%>
                <%--&lt;%&ndash; 回答块 &ndash;%&gt;--%>
                <%--<div class="user">--%>
                    <%--<a href=""><img src="images/head-portrait.jpg" width="40px" height="40px">biteSMS</a>--%>
                <%--</div>--%>
                <%--<div class="comment-text">小时候只是觉得星空很神秘，但是对这种神秘没有更深刻的体会。</div>--%>
                <%--<div class="comment-footer">--%>
                    <%--<div class="comment-item"><img src="images/messages.png" width="25px" height="25px" >查看评论</div>--%>
                    <%--<div class="add-like"><img src="images/support.png" width="20px" height="20px"><span>15</span><span id="answer_id" style="display: none;"></span></div>--%>
                <%--</div>--%>

                <%--<div class="reply frame">--%>
                    <%--<div class="reply-content frame">--%>
                        <%--<div class="reply-user"><a href=""><img src="images/head-portrait.png">biteSMS</a></div>--%>
                        <%--<div class="reply-words">这是评论的回复</div>--%>
                    <%--</div>--%>
                    <%--<div class="reply-footer frame">--%>
                        <%--<form action="AddComment" method="post">--%>
                            <%--<input type="text" id="commentInput" placeholder="写下你的评论..." class="reply-input" maxlength="150">--%>
                            <%--<input type="submit" value="评论" class="reply-button">--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <script src="js/header.js"></script>
        <script>
            //回答DIV渲染
            var questionTitle = document.querySelector('#title').innerText;
            var answerDiv = '<div class="comment frame"><div class="user"></div><div class="comment-text">小时候只是觉得星空很神秘，但是对这种神秘没有更深刻的体会。</div><div class="comment-footer"><div class="comment-item"><img src="images/messages.png" width="25px" height="25px" >查看评论</div><div class="add-like"><img src="images/support.png" width="20px" height="20px"><span class="supportNum">15</span><span class="answer_id" style="display: none;"></span></div></div></div></div>';
            $.ajax({
                method: 'POST',
                url:"AnswerRefresh1?question_title="+questionTitle,
                dataType : "json",
                success: function(res) {
                    if (res.answer.length === 0) {}
                    else {
                        for (var i = 0; i < res.answer.length; i++) {
                            $('#comment-container').append(answerDiv);
                        }
                        function dom() {
                            var user = document.querySelectorAll('.user');
                            var answerContent = document.querySelectorAll('.comment-text');
                            var supportNum = document.querySelectorAll('.supportNum');
                            var answer_id = document.querySelectorAll('.answer_id');

                            for (var m = 0; m < res.answer.length; m++) {
                                user[m + 1].innerHTML = '<a href="JumpPerson?username='+res.answer[res.answer.length - m -1].username+'" target="_blank"><img src="images/user_picture/'+res.answer[res.answer.length - m -1].username+'.png" width="26px" height="26px">'+res.answer[res.answer.length - m -1].username+'</a>';
                                answerContent[m].innerHTML = res.answer[res.answer.length - m -1].answer_content;
                                supportNum[m].innerHTML = res.answer[res.answer.length - m -1].answer_support_amount;
                                answer_id[m].innerHTML = res.answer[res.answer.length - m -1].answer_id;
                            }
                            support()
                        }
                        dom();
                    }
                }
            });
            //点赞
            function support() {
                var comment = document.querySelectorAll('.comment');
                var addLike = document.querySelectorAll('.add-like');
                var answerId = document.querySelectorAll('.answer_id')
                var supportNum = document.querySelectorAll('.supportNum')

                for (let i = 0; i < comment.length; i++) {
                    addLike[i].addEventListener('click', function () {
                        $.ajax({
                            method: 'POST',
                            url:"SupportAnswer",
                            dataType : "json",
                            data: {answer_id : answerId[i].innerHTML}
                        })
                        supportNum[i].innerHTML = parseInt(supportNum[i].innerHTML) + 1;
                    })
                }
            }

        </script>
        <script src="js/question.js"></script>
</body>

</html>


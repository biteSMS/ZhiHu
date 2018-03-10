<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>知乎 - 发现更大的世界</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div id="containr">
        <div id="sign">
            <div id="header">
                <div id="logo">
                    <img src="images/logo.png" width="140px" height="63px">
                </div>
                <div id="text">
                    <span>注册</span>知乎，发现更大的世界
                </div>
            </div>
            <div id="account">
                <div id="register" style="display: block;">
                    <form class="form" action="Register" method="post">
                        <input type="text" name="username" class="input" placeholder="用户名" maxlength="12">
                        <input type="password" name="password" class="input" placeholder="密码" maxlength="20">
                        <input type="submit" value="注册" class = 'button'>
                    </form>
                    <div class="reg-footer">
                        注册即代表你同意<span>《知乎协议》</span>
                        <a href="https://www.zhihu.com/org/signup">注册机构号</a>
                    </div>
                </div>
                <div id="login" style="display: none;">
                    <form class="form" action="Login" method="post" >
                        <input type="text" name="username" class="input" placeholder="用户名" maxlength="12">
                        <input type="password" name="password" class="input" placeholder="密码" maxlength="20">
                        <input type="submit" value="登陆" class = 'button'>
                    </form>
                    <div class="reg-footer">
                        <span>二维码登录</span> · <span>手机登陆</span> · <span>社交账号登陆</span>
                    </div>
                </div>
            </div>
        </div>
        <div id="switch">
            已有账号？<span>登陆</span>
        </div>
        <div id="erweima"><img src="images/app.jpg" width="250px" height="250px"></div>
    </div>
    <div class="button" id="app">下载知乎 App</div>
    <script src="js/index.js"></script>
    <script src="js/ajax.js"></script>
</body>
</html>
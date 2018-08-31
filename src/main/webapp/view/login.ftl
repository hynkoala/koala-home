<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/login.css"/>
</head>
<body>
    <div class="out-box">
        <form action="/koala-home/user/login" method="post" modelAttibute="User">
            <span class="login-item">用户名：</span>
            <input class="login-input" name="userName" type = "text" id = "userName"></input>
            <span class="login-item">密码：</span>
            <input class="login-input" name="userPassword" type = "password" id = "password"></input>
            <div class="login-submit">
                <button type = "submit" id = "submit">登陆</button>
                <a href = "/koala-home/view/register.ftl">注册</a>
            </div>
        </form>


    </div>


</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/register.css"/>
</head>
<body>
    <div class="out-box">
        <form action="/koala-home/user/register" method="post" modelAttribute="User" >
            <span class="register-item">用户名：</span>
            <input class="register-input" type="text" name="userName" id="user-name-label"/>
            <span class="register-item">密码：</span>
            <input class="register-input" type="password" name="userPassword" id="password"/>
            <span class="register-item">邮箱：</span>
            <input class="register-input" type="email" name="userEmail" id="email"/>
            <span class="register-item">密码提示：</span>
            <input class="register-input" type="text" name="passwordHint" id="password-details"/>
            <div class="register-submit">
                <button class="register-button" type="submit" id="submit">确定</button>
                <button class="register-button" type="reset" id="reset">重置</button>
                <a class="register-button" href="/koala-home/view/login.jsp">返回登陆</a>
            </div>

        </form>


    </div>
</body>
</html>
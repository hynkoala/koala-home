<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/login.css"/>
    <script>
        function checkUser() {
            var username = $("#user-name").val();
            var password = $("#password").val();
            $.ajax({
                type: "post",
                url: "/koala-home/user/login",
                data: {userName: username, userPassword: password},
                success: function (data) {
                    if (data == "验证通过！") {
                        window.location.href = "/koala-home/user/toHome?username=" + username;
                        $("#warn-info").val("loading...");
                    } else {
                        $("#warn-info").val(data);
                    }

                },
                error: function () {
                    $("#warn-info").val("发生未知错误！");
                }
            })
        }
    </script>
</head>
<body>
<div class="out-box">

    <span class="login-item">用户名：</span>
    <input class="login-input" name="userName" type="text" id="user-name">
    <span class="login-item">密码：</span>
    <input class="login-input" name="userPassword" type="password" id="password">
    <div class="login-buttons">
        <button id="submit-login" onclick="checkUser()">登陆</button>
        <button id="to-register" onclick="toRegister()">注册</button>
        <div id="warm-info-area">
            <input id="warn-info" readonly unselectable="on"/>
        </div>
    </div>


</div>


</body>
</html>
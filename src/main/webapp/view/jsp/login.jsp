<%@ page language="java" pageEncoding="utf-8" %>
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
    <form role="form" class="form-inline" method="post">
        <div class="form-group">
            <label class="label" for="user-name">用户名：</label>
            <input class="form-control" type="text" id="user-name"/>
        </div>
        <div class="form-group">
            <label class="label" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
            <input class="form-control" type="password" id="password"/>
        </div>
    </form>
    <div class="btn-group">
        <button id="submit-login" onclick="checkUser()" class="btn btn-default">登陆</button>
        <button id="to-register" onclick="toRegister()" class="btn btn-default">注册</button>
    </div>
    <div id="warm-info-area">
        <input id="warn-info" disabled="true"/>
    </div>
</div>
</body>
</html>
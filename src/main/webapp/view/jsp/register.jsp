<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>注册</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/register.css"/>
    <script>
        function checkInputData() {
            var username = $("#register-username").val();
            var password = $("#password").val();
            var email = $("#email").val();
            var passwordHint = $("#password-hint").val();
            $.ajax({
                type: "post",
                url: "/koala-home/user/register",
                data: {userName: username, userPassword: password, userEmail: email, passwordHint: passwordHint},
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
            <label class="control-label">用户名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input class="form-control" type="text" name="userName" id="register-username"/>
        </div>
        <div class="form-group">
            <label for="password" class="control-label">密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input class="form-control" type="password" name="userPassword" id="password"/>
        </div>
        <div class="form-group">
            <label for="email">邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input class="form-control" type="email" name="userEmail" id="email"/>
        </div>
        <div class="form-group">
            <label for="password-hint">密码提示：</label>
            <input class="form-control" type="text" name="passwordHint" id="password-hint"/>
        </div>
        <div class="btn-group">
            <button class="btn btn-info" onclick="checkInputData();return false" id="submit">确定</button>
            <button class="btn btn-default" type="reset" id="reset">重置</button>
            <a class="btn btn-default" href="/koala-home/view/jsp/login.jsp">返回登陆</a>
        </div>
    </form>
    <div id="warm-info-area">
        <input id="warn-info" readonly unselectable="on"/>
    </div>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/9/29
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/alterPassword.css"/>
    <script>
        $(function () {

        });
        function alterPassword() {

        }
    </script>
</head>
<body>
<div class="out-box">
    <form role="form" class="form-inline" method="post">
        <div class="form-group">
            <label class="label" for="user-name">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</label>
            <input class="form-control" type="text" id="user-name" readonly unselectable="on"/>
        </div>
        <div class="form-group">
            <label class="label" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
            <input class="form-control" type="password" id="password"/>
        </div>
        <div class="form-group">
            <label class="label" for="confirm-password">确认密码：</label>
            <input class="form-control" type="password" id="confirm-password"/>
        </div>
    </form>
    <div class="btn-group">
        <button id="submit-login" onclick="alterPassword()" class="btn btn-default">修改</button>
        <button id="to-register" onclick="closeWindow()" class="btn btn-default">关闭</button>
    </div>
    <div id="warm-info-area">
        <input id="warn-info" disabled="true"/>
    </div>
</div>
</body>
</html>

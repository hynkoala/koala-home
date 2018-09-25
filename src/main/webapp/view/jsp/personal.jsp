<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/9/25
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <script src="/koala-home/static/js/cite/jQuery.js"></script>
    <!-- Bootstrap -->
    <link href="../static/thirdContrul/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/thirdContrul/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="../static/thirdContrul/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="../static/thirdContrul/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/homepage.css"/>
    <link rel="icon" href="/koala-home/static/img/ico.ico"/>
</head>
<body>
<div id="welcome">
    <jsp:include page="alluse/header.jsp"/>

    <div class="self-infj">
        <div id="personal-infomation">
            <form role="form">
                <div class="form-group">
                    <label for="name">名称</label>
                    <input type="text" class="form-control" readonly="true" id="name" placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label for="true-name">名称</label>
                    <input type="text" class="form-control" id="true-name" placeholder="请输入真实姓名">
                </div>
                <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
                </div>
                <div class="form-group">
                    <label for="sex">名称</label>
                    <input type="text" class="form-control" id="sex" placeholder="请输入性别">
                </div>
                <div class="form-group">
                    <label for="age">名称</label>
                    <input type="text" class="form-control" id="age" placeholder="请输入年龄">
                </div>
                <button class="btn btn-default" onclick="alterUserInfo()">更新信息</button>
            </form>
        </div>
    </div>
    <div id="footer">
        <p id="shengming">
            copyright &nbsp;&nbsp; hynkoala
        </p>
    </div>
</div>

</body>
</html>

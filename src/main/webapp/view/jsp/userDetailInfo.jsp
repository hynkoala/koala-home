<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link href="/koala-home/static/thirdControl/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/koala-home/static/thirdControl/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="/koala-home/static/js/cite/jQuery.js"></script>
    <script src="/koala-home/static/thirdControl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/koala-home/static/thirdControl/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="icon" href="/koala-home/static/img/ico.ico"/>
    <script src="/koala-home/static/js/common.js"></script>


    <style>
        #out-box {

            width: 320px;
            height: 400px;
            position: relative;
            margin-top: 8px;
            margin: 0 auto;
            border: 1px solid rgb(36, 66, 92);
            margin-top: 20px;

        }

        label {
            width: 120px;
            float: left;
        }

        .form-control {
            width: 180px;
        }

        #isAdmin {
            width: 20px;
            height: 20px;
            left: 50px;
            display: inline-block;
            margin-left: -100px;
            margin-top: -0.5px;
        }

        .form-group {
            display: table;
            margin-top: 12px;
            margin-left: 12px;
            width: 320px;
        }
    </style>

    <script>
        var json;
        var userName = getUserNameByUrl();
        $(function () {
            var url = '/koala-home/user/getUserInfo?userName=' + userName;
            var xmlhttp = new XMLHttpRequest();
            if (xmlhttp != null) {
                xmlhttp.onreadystatechange = state_Change;
                xmlhttp.open("GET", url, true);
                xmlhttp.send(null);
            }
            function state_Change() {
                if (xmlhttp.readyState == 4) {// 4 = "loaded"
                    if (xmlhttp.status == 200) {// 200 = "OK"
                        var str = xmlhttp.responseText;
                        //var json = str.parseJSON();
                        json = eval('(' + str + ')');
                        putdata(json[0]);
                    }
                    else {
                        alert("Problem retrieving XML data:" + xmlhttp.statusText);
                    }
                }
            }
        });
        function putdata(json) {
            document.getElementById("user-name-2").value = json.userName;
            document.getElementById("user-true-name").value = json.userTrueName;
            document.getElementById("email").value = json.userEmail;
            document.getElementById("phone").value = json.userPhone;
            document.getElementById("sex").value = json.userSex;
            document.getElementById("age").value = json.userAge;
            if (json.adminId == 1) {
                document.getElementById("isAdmin").checked = true;
            }
        }
        function alterUserInfo() {
            var userName = $("#user-name-2").val();
            var userTrueName = $("#user-true-name").val();
            var userSex = $("#sex").val();
            var userAge = $("#age").val();
            var userEmail = $("#email").val();
            var userPhone = $("#phone").val();
            var adminId;
            if ($("#isAdmin")[0].checked) {
                adminId = 1;
            } else {
                adminId = 0;
            }

            $.ajax({
                type: "post",
                url: "/koala-home/user/alterUserInfo",
                data: {
                    userName: userName,
                    userTrueName: userTrueName,
                    userSex: userSex,
                    userAge: userAge,
                    userEmail: userEmail,
                    userPhone: userPhone,
                    adminId: adminId
                },
                success: function () {
                    alert("更新成功！");
                    closeWindow();
                    self.opener.location.reload();
                },
                error: function () {
                    alert("发生未知错误！");
                }
            })
        }
        function refreshWindow() {

            window.location.reload();
        }
        function alterPassword() {
            var url = "alterPassword.jsp";
            var title = "修改密码";
            window.open(url, title, 'width:800;heigth:600');
        }
    </script>
</head>
<body>
<div id="out-box">
    <form role="form" class="form-inline">
        <div class="form-group">
            <label for="user-name-2">用户名</label>
            <input type="text" class="form-control" readonly="true" id="user-name-2" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="user-true-name">真实姓名</label>
            <input type="text" class="form-control" id="user-true-name" placeholder="请输入真实姓名">
        </div>
        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
        </div>
        <div class="form-group">
            <label for="phone">电话</label>
            <input type="text" class="form-control" id="phone" placeholder="请输入电话">
        </div>
        <div class="form-group">
            <label for="sex">性别</label>
            <select class="form-control" id="sex">
                <option value="1">男</option>
                <option value="2">女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="age">年龄</label>
            <input type="text" class="form-control" id="age" placeholder="请输入年龄">
        </div>
        <div class="form-group">
            <label for="isAdmin">是否设置为管理员</label>
            <input type="checkbox" class="form-control" id="isAdmin">
        </div>
    </form>
    <button class="btn btn-default" onclick="alterUserInfo()">更新信息</button>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <jsp:include page="alluse/autoImport.jsp"/>

    <style>
        #welcome {

            width: 1024px;
            height: 768px;
            position: relative;
            margin-top: 8px;
            margin: 0 auto;
            border: 1px solid rgb(36, 66, 92);

        }

        #personal-infomation {
            width: 500px;
            margin: 0 auto;
        }

        label {
            float: left;
            display: block;
            position: relative;
        }
    </style>

    <script>
        var json;
        $(function () {

            var url = '/koala-home/user/getUserInfo?username=hynkoala';
            var xmlhttp = new XMLHttpRequest();
            if (xmlhttp != null) {
                xmlhttp.onreadystatechange = state_Change;
                xmlhttp.open("GET", url, true);
                xmlhttp.send(null);
            }
            function state_Change() {
                if (xmlhttp.readyState == 4) {// 4 = "loaded"
                    if (xmlhttp.status == 200) {// 200 = "OK"
                        var str = xmlhttp.responseText[0];
                        //var json = str.parseJSON();
                        json = eval('(' + str + ')');
                        putdata(json);
                    }
                    else {
                        alert("Problem retrieving XML data:" + xmlhttp.statusText);
                    }
                }
            }
        });
        function putdata(json) {
            document.getElementById("user-name").innerHTML = json.userName;
            document.getElementById("user-name-2").value = json.userName;
            document.getElementById("user-true-name").value = json.userTrueName;
            document.getElementById("email").value = json.userEmail;
            document.getElementById("phone").value = json.userPhone;
            document.getElementById("sex").value = json.userSex;
            document.getElementById("age").value = json.userAge;
            document.getElementById("user-name").innerHTML = json.userName;
            document.getElementById("to-myspace").href = "/koala-home/user/toMyspace?username=" + json.userName;
            document.getElementById("to-home").href = "/koala-home/user/toHome?username=" + json.userName;
        }
        function alterUserInfo() {
            var userName = $("#user-name-2").val();
            var userTrueName = $("#user-true-name").val();
            var userSex = $("#sex").val();
            var userAge = $("#age").val();
            var userEmail = $("#email").val();
            var userPhone = $("#phone").val();
            $.ajax({
                type: "post",
                url: "/koala-home/user/alterUserInfo",
                data: {
                    userName: userName,
                    userTrueName: userTrueName,
                    userSex: userSex,
                    userAge: userAge,
                    userEmail: userEmail,
                    userPhone: userPhone
                },
                success: function () {
                    alert("更新成功！");
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
<div id="welcome">
    <jsp:include page="alluse/header.jsp"/>

    <div class="self-inf">
        <div id="personal-infomation">
            <form role="form">
                <div class="form-group">
                    <label for="user-name-2">名称</label>
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
                    <label for="phone">邮箱</label>
                    <input type="text" class="form-control" id="phone" placeholder="请输入邮箱">
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
                <button class="btn btn-default" onclick="alterUserInfo()">更新信息</button>
                <button class="btn btn-default" onclick="refreshWindow()">重置</button>
                <button class="btn btn-default" onclick="alterPassword()">修改密码</button>
            </form>
        </div>
    </div>
    <jsp:include page="alluse/footer.jsp"></jsp:include>
</div>

</body>
</html>

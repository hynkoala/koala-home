<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>hynkoala</title>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link href="/koala-home/static/thirdContrul/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/koala-home/static/thirdContrul/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="/koala-home/static/thirdContrul/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/koala-home/static/thirdContrul/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/homepage.css"/>
    <link rel="icon" href="/koala-home/static/img/ico.ico"/>
    <script src="/koala-home/static/js/cite/jQuery.js"></script>
    <script>
        var json ;
        $(function () {

            var url = '/koala-home/user/getUserInfo?username=hynkoala';
            var xmlhttp = new XMLHttpRequest();
            if (xmlhttp!=null)
            {
                xmlhttp.onreadystatechange=state_Change;
                xmlhttp.open("GET",url,true);
                xmlhttp.send(null);
            }
            function state_Change() {
                if (xmlhttp.readyState == 4) {// 4 = "loaded"
                    if (xmlhttp.status == 200) {// 200 = "OK"
                        var str = xmlhttp.responseText[0];
                        //var json = str.parseJSON();
                        json = eval('(' + str + ')');
                        var json1 = JSON.parse(str);

                        console.log(str);
                        console.log(json);
                        console.log(json1);
                        //console.log(json.get(0).grade);
                        for(var i=0;i<json.length;i++){
                            var obj = json[i];
                            console.log('第'+i+'组：'+obj.grade+obj.losal+obj.hisal);
                        }
                        // document.getElementById("aaa").innerHTML=json[2].grade;
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
                    else {
                        alert("Problem retrieving XML data:" + xmlhttp.statusText);
                    }
                }
            }

        });
        function putdata(){
            document.getElementById("user-name").innerHTML = json.userName;
            document.getElementById("user-name-2").value = json.userName;
            document.getElementById("user-true-name").value = json.userTrueName;
            document.getElementById("email").value = json.userEmail;
            document.getElementById("phone").value = json.userPhone;
            document.getElementById("sex").value = json.userSex;
            document.getElementById("age").value = json.userAge;
            document.getElementById("user-name").innerHTML = json.userName;
            document.getElementById("myspace").href = "/koala-home/user/toMyspace?username=" + json.userName;
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
    </script>



    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->

</head>

<body>
<div id="welcome">
    <jsp:include page="alluse/header.jsp"/>

    <div class="self-infj">
        <script>

        </script>
    </div>

    <div class="self-inf">
            <table>
                <tr>
                    <td>用户名：<input id="user-name-2" name="userName"/></td>
                    <td>真实姓名：<input id="user-true-name" name="userTrueName"/></td>
                    <td>邮箱：<input id="email" name="userEmail"/></td>
                </tr>
                <tr>
                    <td>电  话：<input id="phone" name="userPhone"/></td>
                    <td>性  别：<input id="sex" name="userSex"/></td>
                    <td>年龄：<input id="age" name="userAge"/></td>
                </tr>
            </table>
        <button onclick="alterUserInfo()">更新信息</button>
        </hr>
        <a id="get" href="/koala-home/view/jsp/personal.jsp" style="color:black">进入personal</a>
        <a href="/koala-home/view/jsp/userManager.jsp" style="color:black">进入用户管理系统</a>
    </div>
    <div id="footer">
        <p id="shengming">
            copyright &nbsp;&nbsp;   hynkoala
        </p>
    </div>
</div>

</body>
</html>





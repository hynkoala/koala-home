<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>hynkoala</title>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/homepage.css"/>
    <link rel="icon" href="/koala-home/static/img/ico.ico'/>"
    <script src="/koala-home/static/js/cite/jQuery.js"></script>
    <#--<script src="/koala-home/static/js/getUserInfo.js"></script>-->
    <#--<script>
        window.onload=function(){
        var username='${JSONObject.userName}';
        var usertruename = '${JSONObject.userTrueName}';
        var email = '${JSONObject.userEmail}'
        var phone = '${JSONObject.userPhone}'
        var sex = '${JSONObject.userSex}'
        var age = '${JSONObject.userAge}'
        document.getElementById("input-user-name").value=username;
        document.getElementById("user-true-name").value=usertruename;
        document.getElementById("email").value=email;
        document.getElementById("phone").value=phone;
        document.getElementById("sex").value=sex;
        document.getElementById("age").value=age;
        document.getElementById("user-name").innerHTML=username;
        document.getElementById("myspace").href="/koala-home/user/toMyspace?username="+username;
        document.getElementById("to-home").href="/koala-home/user/toHome?username="+username;

        }
    </script>-->
    <script>
        var json ;
        window.onload=function(){

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
                        var str = xmlhttp.responseText;
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
                        document.getElementById("input-user-name").value = json.userName;
                        document.getElementById("user-true-name").value = json.userTrueName;
                        document.getElementById("email").value = json.userEmail;
                        document.getElementById("phone").value = json.userPhone;
                        document.getElementById("sex").value = json.userSex;
                        document.getElementById("age").value = json.userAge;
                        document.getElementById("user-name").innerHTML = json.userName;
                        document.getElementById("myspace").href = "/koala-home/user/toMyspace?username=" + json.userName;
                        document.getElementById("to-home").href = "/koala-home/user/toHome?username=" + json.userName;


                    }
                    else {
                        alert("Problem retrieving XML data:" + xmlhttp.statusText);
                    }
                }
            }

        }
        function putdata(){
            document.getElementById("user-name").innerHTML = json.userName;
            document.getElementById("input-user-name").value = json.userName;
            document.getElementById("user-true-name").value = json.userTrueName;
            document.getElementById("email").value = json.userEmail;
            document.getElementById("phone").value = json.userPhone;
            document.getElementById("sex").value = json.userSex;
            document.getElementById("age").value = json.userAge;
            document.getElementById("user-name").innerHTML = json.userName;
            document.getElementById("myspace").href = "/koala-home/user/toMyspace?username=" + json.userName;
            document.getElementById("to-home").href = "/koala-home/user/toHome?username=" + json.userName;
        }
    </script>



    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->

</head>

<body>
<div id="welcome">
    <div id="header">
        <div id="banner"> </div>
        <div class="showtime">
            <!--*****显示时间*********-->
            <script src="/koala-home/static/js/showTime.js"></script>
        </div>

        <div id="biaoqian">
            <table width="80%" height="30" border="0" id="anniu">
                <tr>
                    <td width="32"><a id="to-home" title="返回首页" target="_self">返回首页</a></td>
                    <td width="30"><a href="/koala-home/view/ftl/rizhi.ftl" title="我的日志" target="_self">日志</a></td>
                    <td width="30"><a href="/koala-home/view/html/xiangce.html" title="我的相册" target="_self">相册</a></td>
                    <td width="30"><a href="/koala-home/view/liuyan.html" title="给我留言" target="_self">留言</a></td>
                    <td width="50"><a href="/koala-home/view/html/lianxifangshi.html" title="联系我" target="_self">联系方式</a></td>
                    <td width="50"><a href="/koala-home/view/html/jianli.html" title="我的简历" target="new" >我的简历</a></td>
                    <td width="50"><a id = "myspace" title="个人中心" target="_self" >欢迎您：<span id = 'user-name'></span></a></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="self-infj">
        <script>

        </script>
    </div>

    <div class="self-inf">
        <form action="/koala-home/user/alterUserInfo" method="post" modelAttibute="User">
            <table>
                <tr>
                    <td>用户名：<input id="input-user-name" name="userName" /></td>
                    <td>真实姓名：<input id="user-true-name" name="userTrueName"/></td>
                    <td>邮箱：<input id="email" name="userEmail"/></td>
                </tr>
                <tr>
                    <td>电  话：<input id="phone" name="userPhone"/></td>
                    <td>性  别：<input id="sex" name="userSex"/></td>
                    <td>年龄：<input id="age" name="userAge"/></td>
                </tr>
            </table>
            <button type="submit">更新信息</button>
        </form>
        </hr>
        <button id="get" onclick=getUserInfo()>get</button>
    </div>
    <div id="footer">
        <p id="shengming">
            copyright &nbsp;&nbsp;   hynkoala
        </p>
    </div>
</div>



<#--<script src="/koala-home/static/js/getUserName.js"></script>-->

<#--<script>
    function getUserInfo() {
        var datas = '{"username":"' + $('#userName').val() + '"}';
        $.ajax({
            type : 'POST',
            contentType : 'application/json',
            url : "/koala-home/user/getUserInfo?username=hynkoala",
            processData : false,
            dataType : 'json',
            data : datas,
            success : function(data) {
                alert("username: " + data.userName);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("出现异常，异常信息："+textStatus,"error");
            }
        })
    }
</script>-->

</body>
</html>





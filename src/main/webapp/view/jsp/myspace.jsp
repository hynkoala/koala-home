<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>hynkoala</title>
    <jsp:include page="alluse/autoImport.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="/koala-home/static/css/myspace.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/home.css"/>
    <script>
        var json ;
        var userName = getUserNameByUrl();
        $(function () {
            var url = '/koala-home/user/getUserInfo?userName=' + userName;
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
                    }
                    else {
                        alert("Problem retrieving XML data:" + xmlhttp.statusText);
                    }
                }
            }
        });

        function toPersonal() {
            var url = "/koala-home/view/jsp/personal.jsp?userName=" + userName;
            window.open(url, "个人信息");
        }
        function toUserManager() {
            var url = "/koala-home/view/jsp/userManager.jsp";
            window.open(url, "用户管理");
        }
        function getUserNameByUrl() {
            var url = location.search;
            var theRequest = {};
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest.userName;
        }
    </script>



    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->

</head>

<body>
<div id="welcome">
    <jsp:include page="alluse/header.jsp"/>
    <div id="content-group">
        <div id="content-personal" class="content-item" onclick="toPersonal()"><span class="content-font"> 个人信息管理</span>
        </div>
        <div id="content-userManager" class="content-item" onclick="toUserManager()"><span
                class="content-font">用户管理系统</span></div>
        <div id="content-chatRoom" class="content-item" onclick="toPersonal()"><span class="content-font">进入聊天室</span>
        </div>
    </div>
    <jsp:include page="alluse/footer.jsp"/>
</div>

</body>
</html>





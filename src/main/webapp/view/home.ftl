<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>hynkoala</title>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/homepage.css"/>
    <link rel="icon" href="/koala-home/static/img/ico.ico'/>"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>

    <script>
        function getUsername(){
            var url = location.search;
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest.username;
        }
        window.onload = function(){
            username=getUsername();
            document.getElementById("to-home").href="/koala-home/user/toHome?username="+username;
            document.getElementById("to-myspace").href="/koala-home/user/toMyspace?username="+username;
            document.getElementById("user-name").innerHTML = username;
        }
    </script>





</head>

<body>


<div id="welcome">




    <div id="header">
        <div id="banner"> </div>
        <div class="showtime">
            <script src="/koala-home/static/js/showTime.js"></script>
        </div>

        <div id="biaoqian">
            <table width="80%" height="30" border="0" id="anniu">
                <tr>
                    <td width="32"><a id="to-home" title="首页" target="_self">首页</a></td>
                    <td width="30"><a href="/koala-home/view/ftl/rizhi.ftl" title="我的日志" target="_self">日志</a></td>
                    <td width="30"><a href="/koala-home/view/html/xiangce.html" title="我的相册" target="_self">相册</a></td>
                    <td width="30"><a href="/koala-home/view/liuyan.html" title="给我留言" target="_self">留言</a></td>
                    <td width="50"><a href="/koala-home/view/html/lianxifangshi.html" title="联系我" target="_self">联系方式</a></td>
                    <td width="50"><a href="/koala-home/view/html/jianli.html" title="我的简历" target="new" >我的简历</a></td>
                    <td width="50"><a id="to-myspace" title="个人中心" target="_self">欢迎您：<span id="user-name"></span></a></td>
                </tr>
            </table>
        </div>
    </div>

    <img src="/koala-home/static/img/welcome.jpg"/>

    <div id="dongtai">
        <h3 class="biaoti">我的动态</h3>
        <ul>
            <li>first one</li>
            <li>second one</li>
            <li>第三个</li>
            <span id="test"> </span>
            <li>第四个哈哈</li>

        </ul>
    </div>


    <div id="content">
        <img width="338" height="427" class="welcome" src="/koala-home/static/img/welcome_hua.png" />
    </div>




    <div id="footer">
        <p id="shengming">
            copyright &nbsp;&nbsp;   hynkoala
        </p>
    </div>
</div>




</body>
</html>





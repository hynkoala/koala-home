<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<script>
    function getUsername() {
        var url = location.search;
        var theRequest = {};
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }
        return theRequest.username;
    }
    window.onload = function () {
        username = getUsername();
        document.getElementById("to-home").href = "/koala-home/user/toHome?username=" + username;
        document.getElementById("to-myspace").href = "/koala-home/user/toMyspace?username=" + username;
        document.getElementById("user-name").innerHTML = username;
    }
</script>
<div id="header">
    <div id="banner"> </div>
    <div class="showtime">
        <script src="/koala-home/static/js/showTime.js"></script>
    </div>

    <div id="biaoqian">
        <div width="80%" height="30" border="0" id="anniu">
            <ul>
                <li width="32"><a id="to-home" title="首页" target="_self">首页</a></li>
                <li width="30"><a href="/koala-home/view/jsp/rizhi.jsp" title="我的日志" target="_self">日志</a></li>
                <li width="30"><a href="/koala-home/view/html/xiangce.html" title="我的相册" target="_self">相册</a></li>
                <li width="30"><a href="/koala-home/view/liuyan.html" title="给我留言" target="_self">留言</a></li>
                <li width="50"><a href="/koala-home/view/html/lianxifangshi.html" title="联系我" target="_self">联系方式</a>
                </li>
                <li width="50"><a href="/koala-home/view/html/jianli.html" title="我的简历" target="new">我的简历</a></li>
                <li width="50"><a id="to-myspace" title="个人中心" target="_self">欢迎您：<span id="user-name"></span></a></li>
                <li width="20" id="register-li"><a id="register-a" href="#" onclick="toRegister()">注册</a></li>
            </ul>
        </div>
    </div>
</div>
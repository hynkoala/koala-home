<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>hynkoala</title>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/reStyle.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/homepage.css"/>
    <link rel="icon" href="/koala-home/static/img/ico.ico'/>"/>
    <script src="/koala-home/static/js/cite/jQuery.js"></script>





</head>

<body>


<div id="welcome">
    <jsp:include page="alluse/header.jsp"/>
    <div id="content">
        <img src="/koala-home/static/img/welcome.jpg" style="position: absolute;z-index: -1"/>

        <div id="dongtai">
            <h3 class="biaoti">我的动态</h3>
            <ul>
                <li>first one</li>
                <li>second one</li>
                <li>第三个</li>
                <li>第四个哈哈</li>
            </ul>
        </div>
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





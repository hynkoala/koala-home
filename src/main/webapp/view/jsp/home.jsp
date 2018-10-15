<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <title>koala之家</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-home/static/css/homepage.css"/>
</head>
<body>

<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="content">
        <div id="dongtai">
            <h4 class="biaoti">我的动态</h4>
            <ul>
                <li>first one</li>
                <li>second one</li>
                <li>第三个</li>
                <li>第四个哈哈</li>
            </ul>
        </div>
        <img width="338" height="427" class="welcome" src="/koala-home/static/img/welcome_hua.png"/>
    </div>
    <jsp:include page="alluse/footer.jsp"/>
</div>
</body>
</html>





<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset=utf-8" />
    <title>error</title>
</head>
<body>
<script>
    window.onload=function() {
        var errorInfo = '${errorInfo}'
        var mappingMark = '${mappingMark}'
        if (errorInfo != null && errorInfo != '') {
            alert(errorInfo);
            if (mappingMark=="login") {
                window.location.href = '/koala-home/view/login.ftl';

            }else if(mappingMark=="register"){
                window.location.href = '/koala-home/view/register.ftl';
            }
        }
    }
</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 10/17 0017
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>相册</title>
    <jsp:include page="alluse/autoImport.jsp"/>

    <script>
        var photos=[];
        function uploadPhoto(){
            //photos=$("#input-photo").val();
            photos=document.getElementById("input-photo").files;
            $.ajax({
                url:homeUrl+"/album/uploadPhoto",
                type:"post",
                data:{photos:photos[0]},
                success:function(data){
                    alert(data);
                }
            })
        }

    </script>
</head>
<body>
    <div id="out-box">
        <jsp:include page="alluse/header.jsp"/>
        <div id="content">
            <form role="form">
                <div class="form-group">
                    <input class="form-control" id="input-photo" type="file" multiple="multiple"/>
                </div>
                <div class="form-group">
                    <input class="form-control" id="input-describe" type="text"/>
                </div>
            </form>
            <button type="submit" onclick="uploadPhoto()" class="btn btn-info">上传</button>
        </div>
        <jsp:include page="alluse/footer.jsp"/>
    </div>
</body>
</html>

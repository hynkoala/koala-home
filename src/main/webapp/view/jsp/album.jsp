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
    <script src="../../static/thirdControl/jquery/plugins/ajaxfileupload.js"></script>

    <script>
        var photos;
        function uploadPhoto(){
            //photos=$("#input-photo").val();
            var data = new FormData();
            data.append('file', $("#input-photo")[0].files);
            var url=homeUrl+"/album/uploadPhoto";
            photos=document.getElementById("input-photo").files;
            photos=$("#input-photo")[0].files;
            var str = JSON.stringify(photos[0]);
            photos=data;
            data={photos:photos};
            $.ajaxFileUpload({
                url:url,
                type:"post",
                fileElementId:"input-photo",
                success:function(data){
                    alert(data);
                },
                error:function(e){
                    alert("error:"+e);
                }
            })
        }

    </script>
</head>
<body>
    <div id="out-box">
        <jsp:include page="alluse/header.jsp"/>
        <div id="content">
            <form role="form" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control" id="input-photo" type="file" multiple="multiple" name="photos"/>
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

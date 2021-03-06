<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>日志</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <style>
        #content {
            padding: 20px 50px;
        }

        input#diary-title {
            width: 400px;
        }

        textarea#diary-content {
            height: 260px;
        }
    </style>
    <script>
        var diaryTitle;
        var diaryContent;
        function submitDiary() {
            diaryTitle = $("#diary-title").val();
            diaryContent = $("#diary-content").val();
            var data = {diaryTitle: diaryTitle, diaryContent: diaryContent};
            var url = homeUrl + "/diary/addDiary";
            $.ajax({
                url: url,
                data: data,
                type: "post",
                success: function (data) {
                    alert(data);
                    window.location.reload();
                },
                error: function () {
                    alert("未知错误！");
                }
            })
        }
    </script>
</head>

<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"></jsp:include>
    <div id="content">
        <form role="form" class="inline">
            <div class="form-group">
                <input class="form-control" id="diary-title" placeholder="请输入标题">
            </div>
            <div class="form-group">
                <textarea class="form-control" id="diary-content" placeholder=""></textarea>
            </div>
        </form>
        <button class="btn btn-info right" type="submit" onclick="submitDiary()">提交</button>
    </div>

    <jsp:include page="alluse/footer.jsp"/>
</div>
</body>
</html>
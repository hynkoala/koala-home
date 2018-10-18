<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 10/13 0013
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言</title>
    <jsp:include page="alluse/autoImport.jsp"/>

    <style>
        #write-area {
            width: 800px;
        }

        #history-book {
            width: 800px;
            height: 320px;
            overflow: auto;
            margin-bottom: 20px;
        }

        textarea.form-control {
            margin-top: 10px;
            margin-left: 10px;
            height: 100px;
            font-size: 14px;
        }

        .book-group {
            margin: 5px 20px;
        }

        .book-message {
            font-size: 14px;
            background-color: #abf2ff;
            height: 50px;
            border-radius: 10px;
            text-align: left;
            padding: 3px 8px;
        }

        .user-name {
            display: inline;
            margin-right: -60%;
        }

        .write-time {
            display: inline;
            float: right;
        }

        #show-more {
            margin-right: -66%;
            height: 30px;
        }
    </style>

    <script>
        var currectRecord = 0;
        var maxRecord = 0;
        var bookList;
        var writeTime;
        var userName;
        var bookContent;
        var innerHtmlStr = '';
        var showMoreStr = "<input id='show-more' readonly='readonly' type='button' onclick='showMoreBook(10)' value='more'/>";
        $(function () {
            var url = homeUrl + "/visitorBook/showHistory";
            $.ajax({
                url: url,
                success: function (data) {
                    bookList = data;
                    if (bookList.length > 5) {
                        maxRecord = 5;
                    } else {
                        maxRecord = bookList.length;
                    }
                    for (i = 0; i < maxRecord; i++) {
                        bookContent = bookList[i].bookContent;
                        userName = bookList[i].userName;
                        var timeStr = bookList[i].writeTime;
                        var date=new Date(timeStr);
                        writeTime=dateFormatter("yyyy-MM-dd hh:mm:ss",date)
                        innerHtmlStr = innerHtmlStr + "<div class='book-group'> <div class='book-message'>" + bookContent + "</div> <div class='user-name'>" + userName + "</div> <div class='write-time'>" + writeTime + "</div></div>";
                    }
                    currectRecord = maxRecord;
                    if ((bookList.length - currectRecord) > 10) {
                        maxRecord = currectRecord + 10;
                    } else {
                        maxRecord = bookList.length;
                    }
                    document.getElementById("history-book").innerHTML = innerHtmlStr + showMoreStr;
                }
            })
        });
        function showMoreBook(num) {
            if (currectRecord >= bookList.length) {
                $("#show-more")[0].type = "text";
                $("#show-more")[0].value = "没有更多内容啦，快留个言吧~";
                $("#show-more")[0].style.border = "none";
                $("#show-more")[0].style.width = "200px";
                $("#show-more")[0].style.outline = "none";
                return;
            }
            innerHtmlStr.replace("<input id='show-more' type='button' onclick='showMoreBook(10)' value='more'/>", '');
            // maxRecord=currectRecord+num;
            for (i = currectRecord; i < maxRecord; i++) {
                bookContent = bookList[i].bookContent;
                userName = bookList[i].userName;
                writeTime = bookList[i].writeTime;
                innerHtmlStr = innerHtmlStr + "<div class='book-group'> <div class='book-message'>" + bookContent + "</div> <div class='user-name'>" + userName + "</div> <div class='write-time'>" + writeTime + "</div></div>";
            }
            document.getElementById("history-book").innerHTML = innerHtmlStr + showMoreStr;
            currectRecord = maxRecord;
            if ((bookList.length - currectRecord) > num) {
                maxRecord = currectRecord + num;
            } else {
                maxRecord = bookList.length;
            }
        }
        function submitMessage() {
            var visitorMessage = $("#visitor-message").val();
            if (visitorMessage != '' && visitorMessage != null && visitorMessage != 'undefined') {
                var data = {userName: userName, visitorMessage: visitorMessage};
                $.ajax({
                    type: 'post',
                    data: data,
                    url: homeUrl + "/visitorBook/saveMessage",
                    success: function (data) {
                        //makeBlockTime(data, 500);
                        alert(data);
                        window.location.reload();
                    },
                    error: function () {
                        alert("未知错误！");
                    }
                })
            } else {
                alert("请先输入留言内容");
            }
        }
    </script>
</head>
<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="write-area">
        <form role="form">
            <div class="form-group">
                <textarea class="form-control" id="visitor-message" placeholder="请留言："></textarea>
            </div>
        </form>
        <button class="btn btn-info right" type="submit" onclick="submitMessage()">提交</button>
    </div>
    <br>
    <br>

    <div id="history-book">

    </div>

    <jsp:include page="alluse/footer.jsp"/>

</div>
</body>
</html>

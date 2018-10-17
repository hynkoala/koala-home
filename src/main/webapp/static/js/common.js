/**
 * Created by user on 2018/9/25.
 */
var userName = getUserNameByUrl();
var homeUrl = "/koala-home";
/*window.onload=function(){
 var enabled=0;
 var today=new Date();
 var date;
 date=today.getFullYear()+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日";
 //date2=day;
 document.write(date);
 document.write("<span id='clock'></span>");
 var now,hours,minutes,seconds,timeValue;
 function showtime(){
 now=new Date();
 hours=now.getHours();
 minutes=now.getMinutes();
 seconds=now.getSeconds();
 timeValue=(hours>=10)?"":"0";
 timeValue+=hours+":";
 timeValue+=((minutes<10)?"0":"")+minutes+":";
 timeValue+=((seconds<10)?"0":"")+seconds+"";
 clock.innerHTML=timeValue;
 setTimeout("showtime()",1000);
 }
 showtime();
 }*/
function toRegister() {
    window.location.href = "/koala-home/view/jsp/register.jsp";
}
function toLogin() {
    window.location.href = "/koala-home/view/jsp/login.jsp";
}
function exitLogin() {
    $.blockUI({message: "<h4>" + "记得再回来噢" + "</h4>"});
    setTimeout($.unblockUI, 1000);
    window.location.href = "/koala-home/view/jsp/login.jsp";
}
function loadingShow() {
    $.blockUI({message: '<h1> loading...</h1>'});
}
function loadingHide() {
    setTimeout($.unblockUI, 1000);
}
function makeBlockTime(message, time) {
    $.blockUI({message: "<h4>" + message + "</h4>"});
    setTimeout($.unblockUI, time);
}
/*刷新页面*/
function refreshWindow() {
    window.location.reload();
}
/*关闭窗口*/
function closeWindow() {
    window.close();
}

function getUserNameByUrl() {
    var url = location.search;
    var theRequest = {};
    var userName;
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    userName = theRequest.userName;
    if (userName == "undefined") {
        userName = "guest";
    }
    return userName;
}
function dateFormatter(fmt,date) {
    var o = {
        "M+" : date.getMonth()+1,                 //月份
        "d+" : date.getDate(),                    //日
        "h+" : date.getHours(),                   //小时
        "m+" : date.getMinutes(),                 //分
        "s+" : date.getSeconds(),                 //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S"  : date.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}



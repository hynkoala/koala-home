/**
 * Created by user on 2018/8/24.
 */
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
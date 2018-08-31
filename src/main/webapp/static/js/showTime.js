/**
 * Created by hyn on 8/15 0015.
 */
<!--*****显示时间*********-->
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



<div id="header">
  <div id="banner"> </div>
  <div class="showtime">
  <!--*****显示时间*********-->
  <script language="javascript" >
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
	
	</script>
    </div>
  <div id="biaoqian">
    <table width="80%" height="30" border="0" id="anniu">
      <tr>
        <td width="32"><a href="/homepage.asp" title="返回首页" target="_self">首页</a></td>
        <td width="30"><a href="/html/rizhi.asp" title="我的日志" target="_self">日志</a></td>
        <td width="30"><a href="/html/xiangce.asp" title="我的相册" target="_self">相册</a></td>
        <td width="30"><a href="/html/liuyan.asp" title="给我留言" target="_self">留言</a></td>
        <td width="50"><a href="/html/lianxifangshi.asp" title="联系我" target="_self">联系方式</a></td>
        <td width="50"><a href="/html/jianli.html" title="我的简历" target="new" >我的简历</a></td>
      </tr>
    </table>
  </div>
</div>

<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>
.ycbt {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
}
.xsbt {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
}
.xsnr {
	DISPLAY: block
}
.ycnr {
	DISPLAY: none
}
</STYLE>
<SCRIPT type=text/javascript>
function tb_xs(t,m,n){
for(var i=1;i<=m;i++){
if (i != n){
document.getElementById("tb"+t+ "_bt" + i).className= "ycbt";
document.getElementById("tb"+t+ "_nr" + i).className= "ycnr";}
else{
document.getElementById("tb"+t+ "_bt" + i).className= "xsbt";
document.getElementById("tb"+t+ "_nr" + i).className= "xsnr";}}}
function doquery(px1){
	document.all.pcpx.value=px1;
	form1.submit();
}
</SCRIPT>
<SCRIPT language=JavaScript>
<!--//屏蔽出错代码
function killErr(){
	return true;
}
window.onerror=killErr;
//-->
</SCRIPT>
<SCRIPT language=JavaScript>
<!--//处理大分类一行两个小分类
function autoTable(div){
	fs=document.getElementById(div).getElementsByTagName("TABLE");
	for(var i=0;i<fs.length;i++){
		fs[i].style.width='49.5%';
		if(i%2==1){
			if (document.all) {
				fs[i].style.styleFloat="right";
			}else{
				fs[i].style.cssFloat="right;";
			}
		}else{
			if (document.all) {
				fs[i].style.styleFloat="left";
			}else{
				fs[i].style.cssFloat="left;";
			}
		}
	}
}
//-->
</SCRIPT>
<SCRIPT language=JavaScript src="images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/swfobject.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
<!--//目的是为了做风格方便
document.write('<div class="wrap">');
//-->
</SCRIPT>
<form action="<%=basePath %>searchinfo.jsp" method="post" name="form1" >
<input type="hidden" id="pcpx" name="pcpx" value="">
<input type="hidden" name="type" value="complexquery">
</form>
<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
  <td class=Side vAlign=top align=left width="25%">
  	 <TABLE width="100%" height="150" border=0 cellPadding=0 cellSpacing=0 class=dragTable>
	  <TBODY>
        <TR>
          <TD class=head>
            <SPAN><P>排序筛选</P></SPAN>
		  </TD>
		</TR> 
		<TR><TD><input type="radio" name="px" id="radio1" value="zj desc" onClick="doquery('zj desc')"/><span for="radio1">租金从高到低</span></TD></TR>
		<tr><td><input type="radio" name="px" id="radio2" value="zj asc" onClick="doquery('zj asc')"/><span for="radio2">租金从低到高</span></td></tr>
		<tr><td><input type="radio" name="px" id="radio2" value="zccs desc" onClick="doquery('zccs desc')"/><span for="radio2">租车次数从高到低</span></td></tr> 
		<tr><td><input type="radio" name="px" id="radio2" value="zccs asc" onClick="doquery('zccs asc')"/><span for="radio2">租车次数从低到高</span></td></tr>

	</TBODY>
	</TABLE>
  </td>
  <td class=Side vAlign=top align=right width="75%">
  <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>车辆信息</SPAN>  
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="left" >
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <%
                    List hotlist=cb.getCom("select * from qc order by id desc",8);
                    if(!hotlist.isEmpty()){
					for(int alln1=0;alln1<hotlist.size();alln1++){
						List allnew=(List)hotlist.get(alln1);
			%>
        <TR>
          <TD width=20% align=left>
          <br>
          <IMG height=80 src="<%=basePath+allnew.get(3).toString()%>" width=120 onload=makesmallpic(this,120,80); border=0>
		  </TD>
		  <TD align=left><br>
		  车名：<%=allnew.get(1).toString()%>  &nbsp;&nbsp;&nbsp;所属分类：<%=allnew.get(2).toString()%><br>
		  联系电话：<%=allnew.get(4).toString()%>   <br>
		  租金：<%=allnew.get(5).toString()%>  元&nbsp;超时价格：<%=allnew.get(6).toString()%> 元 &nbsp;&nbsp;&nbsp;
		  备注信息：<%=allnew.get(7).toString()%><br>
		
		  <a href="<%=basePath %>hinfo.jsp?id=<%=allnew.get(0).toString()%>" style="font-size: 12px;color: red">点击查看详细...</a>
		  </TD>
		</TR>
		<%}} %>
				</TBODY>
			</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
  </td>
  </TR>
  </TBODY>
  </TABLE>
     


<SCRIPT language=JavaScript>
<!--//目的是为了做风格方便
document.write('</div>');
//-->
</SCRIPT>
<SCRIPT language=JavaScript>
<!--
clickEdit.init();
//-->
</SCRIPT>
</BODY>
</HTML>

<%@ include file="iframe/foot.jsp"%>
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
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
<!--//目的是为了做风格方便
document.write('<div class="wrap">');
//-->
</SCRIPT>
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
                    String id=request.getParameter("id").trim();cb.comUp("update qc set dj=dj+1 where id='"+id+"'");
                    List allnew=cb.get1Com("select * from qc where id='"+id+"'",10);
                    if(!allnew.isEmpty()){
         			%>
        <TR>
          <TD width=40% align=center>
		  <IMG height=150 src="<%=basePath+allnew.get(3).toString()%>" width=180 onload=makesmallpic(this,180,150); border=0>
		   </TD>
		  <TD align=left><br>
		  车辆分类：<%=allnew.get(2).toString()%>  &nbsp;&nbsp;&nbsp;车辆名称：<%=allnew.get(1).toString()%> &nbsp;&nbsp;&nbsp; 联系电话：<%=allnew.get(4).toString()%>  &nbsp;&nbsp;&nbsp;<br><br>
		
		 价格：<%=allnew.get(5).toString()%> &nbsp;&nbsp;&nbsp;超时价格：<%=allnew.get(6).toString()%>  &nbsp;&nbsp;&nbsp;点击率：<%=allnew.get(8).toString()%>&nbsp;&nbsp;&nbsp;备注：<%=allnew.get(7).toString()%>  &nbsp;&nbsp;&nbsp; <br>
		   <br>
  		   		 <%  List allnew1=cb.get1Com("select count(*) from zc where qcid='"+id+"' and sfhc='否'",1);
  		   		// String sql="select * from zc where qcid='"+id+"' and sfhc='否'";
  		   		 //System.out.println("\nbookCase*********************action="+sql);
  		   		  		// System.out.println("\nbookCase*********************action="+ allnew1.get(0).toString());
  		   		
		  
		if (allnew1.get(0).toString().equals("0"))
	{%><a href="<%=basePath %>prepinfo.jsp?id=<%=allnew.get(0).toString()%>" style="font-size: 12px;color: red">我要租车</a>
	<%}else{%>
 <font color="#FF0000" >此车已经租借</font>
<%}%>
		
		  
		  
		  
		  
		  </TD>
		</TR>
		<TR>
          <TD align=center colspan=2><%=allnew.get(9).toString() %>
		  </TD>
		</TR>
		<%}%>
		
				</TBODY>
			</TABLE>			
			</TD>
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
<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
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
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<script type="text/javascript">
function f1()
{
 	if(document.form1.qcsj.value=="")
 	{
 		alert("请填写取车时间！");
 		document.form1.qcsj.focus();
 		return false;
 	}
 	if(document.form1.qcdd.value=="")
 	{
 		alert("请填写取车地点！");
 		document.form1.qcdd.focus();
 		return false;
 	}
 	if(document.form1.hcsj.value=="")
 	{
 		alert("请填写还车时间！");
 		document.form1.hcsj.focus();
 		return false;
 	}
 	if(document.form1.hcdd.value=="")
 	{
 		alert("请填写还车地点！");
 		document.form1.hcdd.focus();
 		return false;
 	}
 form1.submit();
}
</script>
<%String member=(String)session.getAttribute("member"); 
if(member==null){response.sendRedirect("login.jsp");}else{
String id=request.getParameter("id");
%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>在线租车</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>ComServlet?method=addPREP&id=<%=id%>" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
        <TR>
          <TD width=45% align=right>汽车名称：</TD>
          <TD align=left><%=cb.getString("select cm from qc where id='"+id+"'") %></TD>
		</TR>
		<TR>
          <TD width=45% align=right>租金：</TD>
          <TD align=left><%=cb.getString("select zj from qc where id='"+id+"'") %></TD>
		</TR>
		<TR>
          <TD width=45% align=right>取车时间：</TD>
          <TD align=left><input type=text name=qcsj size="15"  onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>取车地点：</TD>
          <TD align=left><input type=text name=qcdd size=30 ></TD>
		</TR>
		<TR>
          <TD  align=right>还车时间：</TD>
          <TD align=left><input type=text name=hcsj size=15  onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>还车地点：</TD>
          <TD align=left><input type=text name=hcdd size=30 ></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="提交数据"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>

</BODY>
<%} %>
</HTML>

<%@ include file="iframe/foot.jsp"%>
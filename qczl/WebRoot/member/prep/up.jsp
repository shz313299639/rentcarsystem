<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function f1()
{
 	if(document.form1.qcsj.value=="")
 	{
 		alert("����дȡ��ʱ�䣡");
 		document.form1.qcsj.focus();
 		return false;
 	}
 	if(document.form1.qcdd.value=="")
 	{
 		alert("����дȡ���ص㣡");
 		document.form1.qcdd.focus();
 		return false;
 	}
 	if(document.form1.hcsj.value=="")
 	{
 		alert("����д����ʱ�䣡");
 		document.form1.hcsj.focus();
 		return false;
 	}
 	if(document.form1.hcdd.value=="")
 	{
 		alert("����д�����ص㣡");
 		document.form1.hcdd.focus();
 		return false;
 	}
 form1.submit();
}
</script>
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
<%
	String member=(String)session.getAttribute("member");
	if(member==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String id=request.getParameter("id"); 
%>
<BODY><br><br><br><br><br>
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<form action="<%=basePath %>ComServlet?method=upPREP&id=<%=id%>" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
        
		<TR>
          <TD width=45% align=right>ȡ��ʱ�䣺</TD>
          <TD align=left><input type=text name=qcsj size="15"  onclick="SelectDate(this,'yyyy-MM-dd')" value="<%=cb.getString("select qcsj from zc where id='"+id+"'") %>" this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>ȡ���ص㣺</TD>
          <TD align=left><input type=text name=qcdd size=30  value="<%=cb.getString("select qcdd from zc where id='"+id+"'") %>" ></TD>
		</TR>
		<TR>
          <TD  align=right>����ʱ�䣺</TD>
          <TD align=left><input type=text name=hcsj size=15  onclick="SelectDate(this,'yyyy-MM-dd')"  value="<%=cb.getString("select hcsj from zc where id='"+id+"'") %>"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>�����ص㣺</TD>
          <TD align=left><input type=text name=hcdd size=30  value="<%=cb.getString("select hcdd from zc where id='"+id+"'") %>" ></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="�ύ����"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
	</td>
	</tr>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>

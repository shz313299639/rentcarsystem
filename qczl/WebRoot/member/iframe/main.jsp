<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="sysb" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
<jsp:directive.page import="java.text.NumberFormat" />
 <jsp:directive.page import="java.text.DecimalFormat" /> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>会员管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>member/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>member/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/Common.js"></SCRIPT>
<STYLE type=text/css>BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
</STYLE>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
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
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	 //无、银卡会员9.8折、金卡会员9.5折、白金卡会员9折.
%>

<BODY scroll=no marginheight="0" marginwidth="0">

<br><br><br><br><br><p align=center><font color=red><strong>
<%String str="普通会员，享受9.8折优惠";int num=cb.getCount("select jf from member where username='"+member+"'");

	       List pagelist4=tb.gethydj();
	  	if(!pagelist4.isEmpty()){
				for(int n=0;n<pagelist4.size();n++){
					List pagelist5 =(ArrayList)pagelist4.get(n);
	  if(num>=Float.parseFloat(pagelist5.get(2).toString())&& num<Float.parseFloat(pagelist5.get(3).toString()))
	  {str=""+pagelist5.get(1).toString()+"，享受"+pagelist5.get(4).toString()+"折优惠 ";}  
	  else if(num>=10000){str="钻石会员，享受7折优惠 "; }
	  
	  }}
	                           
%>




      欢迎您，尊敬的会员：<%=member %> 您目前的积分：<%=num %> 您的身份：<%=str %></strong></font>
 <br>
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">编号</td>
      <td  align="center">汽车名称</td>
      <td  align="center">租金 元/天</td>
      <td  align="center">取车时间</td>
      <td  align="center">取车地点</td>
      <td  align="center">还车时间</td>
      <td  align="center">还车地点</td> 
    </tr>
    <%List pagelist3=cb.getCom("select * from zc where member='"+member+"'",9);
    		if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='10%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select  cm from qc where id='"+pagelist2.get(1).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select  zj from qc where id='"+pagelist2.get(1).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>  
    </tr>
	
<%
	}} 
%>  
  
</TABLE>
	</BODY>
<%} %>
</HTML>

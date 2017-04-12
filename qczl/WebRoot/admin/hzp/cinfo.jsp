<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>

<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
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
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		
%>
<BODY  scroll=yes  >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="5%" align="center">ID </td>
      <td  align="center">车名</td>
      <td  align="center">所属分类</td>
      <td  align="center">联系电话</td>
      <td  align="center">租金</td>
      <td  align="center">超时价格</td>
      <td  align="center">备注信息</td> 
      <td  align="center">修改</td>
      <td  align="center">选择</td>
    </tr>
 <%String sql;
	String title=Common.toChineseAndTrim(request.getParameter("title"));
	String type=Common.toChineseAndTrim(request.getParameter("type")); 
	//System.out.println("\nbookCase*********************action="+type);
	 if(type.trim().equals("汽车品牌")){
	// System.out.println("\nbookCase*********************action");
		//sql = "select * from sale xl where xl.jdid=sale and xl.js like '%"+title+"%' order by id desc";
    sql = "select * from qc where fl like '%"+title+"%' order by id desc";
		

	}else
	{
	
	
	 sql = "select * from qc where cm like '%"+title+"%' order by id desc";
	
	}
	 
	 

 
%>
    
    
    
    
    <% 
			// String mc=Common.toChineseAndTrim(request.getParameter("mc"));
			// System.out.println("\nbookCase*********************action="+mc);
			 List pagelist3=cb.getCom(sql,9);
			//List pagelist3=cb.getCom("select * from qc where cm like '%"+mc+"%' order by id desc",10);
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %> </td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(7).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath+dir+"/" %>hzp/add.jsp?method=upQC&id=<%=pagelist2.get(0).toString()%>" >修改</a> </td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath%>ComServlet?method=delQC&id=<%=pagelist2.get(0).toString()%>" >删除</a></td>
    </tr>
	
<%
	}}
%>  
	 </TABLE>
	</td>
	</tr>
 
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>

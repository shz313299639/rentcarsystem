<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
<jsp:directive.page import="java.text.NumberFormat" />
 <jsp:directive.page import="java.text.DecimalFormat" /> 
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
function del()
{
	pageform.submit();
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
		List pagelist3=cb.getCom("select * from zc where member='"+member+"'",11);
%>
<BODY >
 
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">���</td>
      <td  align="center">��������</td>
      <td  align="center">��� Ԫ/��</td>
      <td  align="center">ȡ��ʱ��</td>
      <td  align="center">ȡ���ص�</td>
      <td  align="center">����ʱ��</td>
      <td  align="center">�����ص�</td>
      <td  align="center">������Ϣ</td>
      <td  align="center">״̬</td>
      <td  align="center">�޸�</td>
      <td  align="center">ɾ��</td>
      <td  align="center">����</td>
      <td  align="center">����״̬</td>
      <td  align="center">�Ƿ񻹳�</td>
    </tr>
    <%
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
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>      
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
	  <% 
	  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");  
		String data=pagelist2.get(2).toString();
		String data2=pagelist2.get(4).toString();
       

		Date d1=formatter.parse(data);
		Date d2 = formatter.parse(data2); 
		long diff = d2.getTime() - d1.getTime();
		long days = diff / (1000 * 60 * 60 * 24); 
		 double f=0;
       String str="��ͨ��Ա������9.8���Ż�";
		int num=cb.getCount("select jf from member where username='"+member+"'");
	       List pagelist4=tb.gethydj();
	  	if(!pagelist4.isEmpty()){
				for(int n=0;n<pagelist4.size();n++){
					List pagelist5 =(ArrayList)pagelist4.get(n);
	  if(num>=Float.parseFloat(pagelist5.get(2).toString())&& num<Float.parseFloat(pagelist5.get(3).toString()))
	  {str=""+pagelist5.get(1).toString()+"������"+pagelist5.get(4).toString()+"���Żݣ��⳵ʱ��"+days+"�� ";f=Float.parseFloat(pagelist5.get(4).toString());}  
	  else if(num>=10000){str="��ʯ��Ա������7���Żݣ��⳵ʱ��"+days+"�� ";f=0.7; }
	  
	  }
	                            }
	 
	  //float f=98;String str="��ͨ��Ա������9.8���Ż�";
	  //	int num=cb.getCount("select jf from member where username='"+member+"'");
	  //	if(num<5000){str="��ͨ��Ա������9.8���Żݣ��⳵ʱ��"+days+"�� ";f=98;}
	  	//else if(num>=5000&&num<12000){str="������Ա������9.8���Żݣ��⳵ʱ��"+days+"�� ";f=98; }
	//	else if(num>=12000){str="�𿨻�Ա������9.5���Żݣ��⳵ʱ��"+days+"�� ";f=95; }
	//	else if(num>=20000){str="�׽𿨻�Ա������9���Żݣ��⳵ʱ��"+days+"�� ";f=90;} 
	NumberFormat nf=new DecimalFormat( "###0.00 ");
	String zje=nf.format((Float.parseFloat(cb.getString("select  zj from qc where id='"+pagelist2.get(1).toString()+"'")))*f*days)	;

	  %>
	  	  
	  <%=str+"��ǰ���ã�"+zje+"Ԫ" %>
	  </td>
	  <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(7).toString() %></td>  
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(pagelist2.get(7).toString().equals("δ���")){ %>
      <a href="<%=basePath %>member/prep/up.jsp?id=<%=pagelist2.get(0).toString()%>">�޸�</a><%} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(pagelist2.get(7).toString().equals("δ���")){ %>
      <a href="<%=basePath %>ComServlet?method=delP&id=<%=pagelist2.get(0).toString()%>">ɾ��</a><%} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <a href="<%=basePath %>ComServlet?method=xz&id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(8).toString()%></a></td>
    <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(9).toString() %></td>  
    <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(10).toString() %></td>  
   
   
    </tr>
	
<%
	}} 
%>  
  
</TABLE>
</BODY>
<%} %>

</HTML>

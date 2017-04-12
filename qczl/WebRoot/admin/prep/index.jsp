<%@ page language="java" import="java.util.*" import="java.text.SimpleDateFormat,java.util.Date" contentType="text/html;charset=gb2312" %>
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
<HTML><HEAD><TITLE>后台操作区</TITLE>
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
<script  language="javascript" >
function top(){
   	form3.action="<%=basePath%>admin/prep/index.jsp?page=1";
    form3.submit();
}
function last(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>admin/prep/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>admin/prep/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>admin/prep/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>admin/prep/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>admin/prep/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>admin/prep/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>admin/prep/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>admin/prep/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
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
	String user=(String)session.getAttribute("user");
	if(user==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top > 
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td align="center">编号</td>
      <td  align="center">汽车名称</td>
      <td  align="center">租金</td>
      <td  align="center">取车时间</td>
      <td  align="center">取车地点</td>
      <td  align="center">还车时间</td>
      <td  align="center">还车地点</td>
      <td  align="center">租车会员</td>
      <td  align="center">费用信息</td>
      <td  align="center">状态</td> 
      <td  align="center">删除</td>
      <td  align="center">续租</td>
       <td  align="center">续租状态</td>
       <td  align="center">是否还车</td>
    </tr>
    <%cb.setEVERYPAGENUM(12);
			int cou = cb.getMessageCount("select count(*) from zc  ");//得到信息总数			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from zc  order by id desc",11);
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //得到页数  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq"); 
			//List pagelist3=cb.getCom("select * from zc ",9);
    		if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td  align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select  cm from qc where id='"+pagelist2.get(1).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select  zj from qc where id='"+pagelist2.get(1).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>        
        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
    
	
<% 	 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date d1 = sdf.parse(pagelist2.get(2).toString());
Date d2 = sdf.parse(pagelist2.get(4).toString());
//String Nowtime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
//Date d2 = sdf.parse(Nowtime);

int u=(int) ((d2.getTime() -  d1.getTime())/(3600L*1000*24)); 
	 double f=0;
       String str="普通会员，享受9.8折优惠";
		int num=cb.getCount("select jf from member where username='"+pagelist2.get(6).toString()+"'");
	       List pagelist4=tb.gethydj();
	  	if(!pagelist4.isEmpty()){
				for(int n=0;n<pagelist4.size();n++){
					List pagelist5 =(ArrayList)pagelist4.get(n);
	  if(num>=Float.parseFloat(pagelist5.get(2).toString())&& num<Float.parseFloat(pagelist5.get(3).toString()))
	  {str=""+pagelist5.get(1).toString()+"，享受"+pagelist5.get(4).toString()+"折优惠，租车时间"+u+"天 ";f=Float.parseFloat(pagelist5.get(4).toString());}  
	  else if(num>=10000){str="钻石会员，享受7折优惠，租车时间"+u+"天 ";f=0.7; }
	  
	  }
	                            }
	 
	  //float f=98;String str="普通会员，享受9.8折优惠";
	  //	int num=cb.getCount("select jf from member where username='"+member+"'");
	  //	if(num<5000){str="普通会员，享受9.8折优惠，租车时间"+days+"天 ";f=98;}
	  	//else if(num>=5000&&num<12000){str="银卡会员，享受9.8折优惠，租车时间"+days+"天 ";f=98; }
	//	else if(num>=12000){str="金卡会员，享受9.5折优惠，租车时间"+days+"天 ";f=95; }
	//	else if(num>=20000){str="白金卡会员，享受9折优惠，租车时间"+days+"天 ";f=90;} 
	NumberFormat nf=new DecimalFormat( "###0.00 ");
	String zje=nf.format((Float.parseFloat(cb.getString("select  zj from qc where id='"+pagelist2.get(1).toString()+"'")))*f*u)	;

	  %>
	  	  
	  <%=str+"当前费用："+zje+"元" %>
 	
	
 

	  </td>
	  <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">


<%if(pagelist2.get(7).toString().equals("已审核")){out.println("已审核");}else{ %>
<a href="<%=basePath %>ComServlet?method=shP&id=<%=pagelist2.get(0).toString()%>&fy=<%=zje%>"><%=pagelist2.get(7).toString()%></a><%} %></td>  
     
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <a href="<%=basePath %>ComServlet?method=AdelP&id=<%=pagelist2.get(0).toString()%>">删除</a></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(8).toString() %></td>   
   <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
  
   <%if(pagelist2.get(9).toString().equals("已审核")){out.println("已审核");}else{ %>
<a href="<%=basePath %>ComServlet?method=xzzt&id=<%=pagelist2.get(0).toString()%>&fy=<%=zje%>"><%=pagelist2.get(9).toString() %></a><%} %></td>  
    </td>
    
     <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
  
   <%if(pagelist2.get(10).toString().equals("是")){out.println("是");}else{ %>
<a href="<%=basePath %>ComServlet?method=sfhc&id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(10).toString() %></a><%} %></td>  
    
    </td> 
    
    
    </tr>
	
<%
	}} 
%>  
 <tr bgcolor='#FFFFFF'>
	<td colspan='15' align='right'>
	<TABLE width="100%" border=0 align="right" cellPadding=0 cellSpacing=0>
     <TBODY>
     <TR align="right" >
	 <TD >
	 <form action="" method="post" name="form3">	
	 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面

javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值

-->         
					<a href="#" onClick="top()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
	 第<input name="busjump" type="text" size="3" />页<a href="#" onClick="bjump()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
	 </form>
        </TD>
           </TR>
</table>
   </TD>
	</TR>	 
</TABLE>
</BODY>
<%} %>
</HTML>
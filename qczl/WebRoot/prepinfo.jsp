<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
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
table{   border-collapse:   separate;   border-spacing:   10px;   }
</STYLE>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
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
 	/*
 	if(document.form1.hcdd.value=="")
 	{
 		alert("����д�����ص㣡");
 		document.form1.hcdd.focus();
 		return false;
 	}
 	*/
 form1.submit();
}
function count_zj(){
	if(document.all.qcsj.value!=""&&document.all.hcsj.value!=""){
		var price=document.all.zcdj.innerText;
		var days=DateDiff(document.all.hcsj.value,document.all.qcsj.value);
		document.all.zcts.value=days;

		//alert(Number(price)*Number(days));
		var totale=Number(price)*Number(days);
		
		if(totale<0){
			alert("����ʱ�䲻������ȡ��ʱ��");
		}else{
			if(Number(days)>=3&&Number(days)<10){
				totale-=50;
			}else if(Number(days)>=10){
				totale-=200;
			}
			totale=totale*0.8;
			document.all.zczj.value=totale;
		}
	}
}
//����������ĺ�����ͨ��  
   function  DateDiff(sDate1,  sDate2){    //sDate1��sDate2��2002-12-18��ʽ  
       var  aDate,  oDate1,  oDate2,  iDays  
       aDate  =  sDate1.split("-")  
       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //ת��Ϊ12-18-2002��ʽ  
       aDate  =  sDate2.split("-")  
       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
       iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //�����ĺ�����ת��Ϊ����  
       return  iDays  
}
function test(){
	alert("change");
}
</script>
<%String member=(String)session.getAttribute("member"); 
if(member==null){response.sendRedirect("login.jsp");}else{
String id=request.getParameter("id");

String str="��ͨ��Ա������9.8���Ż�";
int num=cb.getCount("select jf from member where username='"+member+"'");

	       List pagelist4=tb.gethydj();
	  	if(!pagelist4.isEmpty()){
				for(int n=0;n<pagelist4.size();n++){
					List pagelist5 =(ArrayList)pagelist4.get(n);
	  if(num>=Float.parseFloat(pagelist5.get(2).toString())&& num<Float.parseFloat(pagelist5.get(3).toString()))
	  {str=""+pagelist5.get(1).toString()+"������"+pagelist5.get(4).toString()+"���Ż� ";}  
	  else if(num>=10000){str="��ʯ��Ա������7���Ż� "; }
	  
	  }}
	                           
%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>�����⳵</SPAN> 
		  </TD>
		</TR>
		<tr>
		<td colspan="2"><p align=center><font color=red><strong> ��ӭ�����𾴵Ļ�Ա��<%=member %> ��Ŀǰ�Ļ��֣�<%=num %> ������ݣ�<%=str %></strong></font></td>
		<tr>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>ComServlet?method=addPREP&id=<%=id%>" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
        <TR>
          <TD width=45% align=right>�������ƣ�</TD>
          <TD align=left><%=cb.getString("select cm from qc where id='"+id+"'") %></TD>
		</TR>
		<TR>
          <TD width=45% align=right>���</TD>
          <TD align=left><span id="zcdj" name="zcdj"><%=cb.getString("select zj from qc where id='"+id+"'") %></span>Ԫ/��</TD>
		</TR>
		<TR>
          <TD width=45% align=right>ȡ��ʱ�䣺</TD>
          <TD align=left><input type=text name=qcsj size="15"  onclick="SelectDate(this,'yyyy-MM-dd');" oninput="count_zj()"  onPropertyChange="count_zj()" this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>ȡ���ص㣺</TD>
          <TD align=left><input type=text name=qcdd size=30 value="�����н���ѧԺ����׿�ų���" readOnly></TD>
		</TR>
		<TR>
          <TD  align=right>����ʱ�䣺</TD>
          <TD align=left><input type="text" name="hcsj" size="15"  onclick="SelectDate(this,'yyyy-MM-dd');" oninput="count_zj()" onPropertyChange="count_zj()" this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>�⳵������</TD>
          <TD align=left><input type=text name=zcts size=30 readOnly></TD>
		</TR>
		<!--TR>
          <TD  align=right>�����ص㣺</TD>
          <TD align=left><input type=text name=hcdd size=30 ></TD>
		</TR-->
		<TR>
          <TD  align=right>�ܼۣ�</TD>
          <TD align=left><input type=text name=zczj size=30  readOnly></TD>
		</TR>
		<tr>
		<td colspan=2 align=center width=100%>
			<span style="color:green;" >�Żݻ��</span>�����⳵3�����ϣ�����3�죩������50������10�죨����10�죩��200�������Ա���и����Ż��ۿ۵����㣡
		</td>
		</tr>
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="����Ԥ��"></TD>
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
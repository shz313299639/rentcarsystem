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
 	/*
 	if(document.form1.hcdd.value=="")
 	{
 		alert("请填写还车地点！");
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
			alert("还车时间不能早于取车时间");
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
//计算天数差的函数，通用  
   function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2002-12-18格式  
       var  aDate,  oDate1,  oDate2,  iDays  
       aDate  =  sDate1.split("-")  
       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2002格式  
       aDate  =  sDate2.split("-")  
       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
       iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
       return  iDays  
}
function test(){
	alert("change");
}
</script>
<%String member=(String)session.getAttribute("member"); 
if(member==null){response.sendRedirect("login.jsp");}else{
String id=request.getParameter("id");

String str="普通会员，享受9.8折优惠";
int num=cb.getCount("select jf from member where username='"+member+"'");

	       List pagelist4=tb.gethydj();
	  	if(!pagelist4.isEmpty()){
				for(int n=0;n<pagelist4.size();n++){
					List pagelist5 =(ArrayList)pagelist4.get(n);
	  if(num>=Float.parseFloat(pagelist5.get(2).toString())&& num<Float.parseFloat(pagelist5.get(3).toString()))
	  {str=""+pagelist5.get(1).toString()+"，享受"+pagelist5.get(4).toString()+"折优惠 ";}  
	  else if(num>=10000){str="钻石会员，享受7折优惠 "; }
	  
	  }}
	                           
%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>在线租车</SPAN> 
		  </TD>
		</TR>
		<tr>
		<td colspan="2"><p align=center><font color=red><strong> 欢迎您，尊敬的会员：<%=member %> 您目前的积分：<%=num %> 您的身份：<%=str %></strong></font></td>
		<tr>
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
          <TD align=left><span id="zcdj" name="zcdj"><%=cb.getString("select zj from qc where id='"+id+"'") %></span>元/天</TD>
		</TR>
		<TR>
          <TD width=45% align=right>取车时间：</TD>
          <TD align=left><input type=text name=qcsj size="15"  onclick="SelectDate(this,'yyyy-MM-dd');" oninput="count_zj()"  onPropertyChange="count_zj()" this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>取车地点：</TD>
          <TD align=left><input type=text name=qcdd size=30 value="福州市江夏学院对面卓信车行" readOnly></TD>
		</TR>
		<TR>
          <TD  align=right>还车时间：</TD>
          <TD align=left><input type="text" name="hcsj" size="15"  onclick="SelectDate(this,'yyyy-MM-dd');" oninput="count_zj()" onPropertyChange="count_zj()" this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></TD>
		</TR>
		<TR>
          <TD  align=right>租车天数：</TD>
          <TD align=left><input type=text name=zcts size=30 readOnly></TD>
		</TR>
		<!--TR>
          <TD  align=right>还车地点：</TD>
          <TD align=left><input type=text name=hcdd size=30 ></TD>
		</TR-->
		<TR>
          <TD  align=right>总价：</TD>
          <TD align=left><input type=text name=zczj size=30  readOnly></TD>
		</TR>
		<tr>
		<td colspan=2 align=center width=100%>
			<span style="color:green;" >优惠活动：</span>连续租车3天以上（包含3天），立减50。租满10天（包含10天）减200！加入会员还有更多优惠折扣等着你！
		</td>
		</tr>
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="马上预定"></TD>
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
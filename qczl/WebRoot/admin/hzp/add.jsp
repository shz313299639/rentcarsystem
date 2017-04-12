<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="com.fredck.FCKeditor.*" %> 
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> 
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
<script type="text/javascript" src="<%=path %>FCKeditor/fckeditor.js"></script> 
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function sub()
{//String cm="";String fl="";String pic="";String cp="";String zj="";String csjg="";String bz="";
	if(document.form1.cm.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.fl.value==""
	||document.form1.pic.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.cp.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.zj.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.csjg.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.bz.value.replace(/\s+$|^\s+/g,"").length<=0)
	
	{
		alert("所有项目必须填写！");
		return false;
	}
	if(document.form1.pic.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		} 
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
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id = "";	
		String cm="";String fl="";String pic="";String cp="";String zj="";String csjg="";String bz="";String qcxq="";
		if(method.equals("upQC")){
			id=request.getParameter("id");
			List newsList=cb.get1Com("select * from qc where id='"+id+"'",10);
			cm=newsList.get(1).toString();
			fl=newsList.get(2).toString();
			pic=newsList.get(3).toString();
			cp=newsList.get(4).toString();			
			zj=newsList.get(5).toString();
			csjg=newsList.get(6).toString();
			bz=newsList.get(7).toString();
			qcxq=newsList.get(9).toString(); 
		}		

%>
<BODY onload="document.form1.infoContent.value=document.form1.qcxq.value" >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>News.do" method="post"  enctype="multipart/form-data">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='30%'><div align="right">车名：</div></td>
    <td ><input name="cm" type="text" size="40" maxlength="100" value="<%=cm %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">所属分类：</div></td>
    <td ><select name="fl" > 
    <%
    	List pagelist3=cb.getCom("select * from type order by  id desc",2);
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
     %>
     <option value="<%=pagelist2.get(1).toString() %>"><%=pagelist2.get(1).toString() %></option>
     <%}}%>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">缩&nbsp;略&nbsp;图：</div></td>
    <td ><input name="pic" type="file"   size="40" maxlength="150" > </td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">联系电话：</div></td>
    <td ><input name="cp" type="text"   size="40" maxlength="100" value="<%=cp %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">租金：</div></td>
    <td ><input name="zj" type="text"  size="15" maxlength="100" value="<%=zj %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">超时价格：</div></td>
    <td ><input name="csjg" type="text"  size="15" maxlength="100" value="<%=csjg %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
  <td width='30%'><div align="right">备注信息：</div></td>
    <td ><TEXTAREA NAME="bz" ROWS="8" COLS="40"><%=bz %></TEXTAREA>	</td>
    </tr>

    <tr bgcolor='#FFFFFF'> 
    <td colspan="2" valign="top" align=center><TEXTAREA style="display:none" NAME="qcxq" ROWS="20" COLS="70"><%=qcxq%></TEXTAREA>	
	  <FCK:editor id="infoContent" basePath="/qczl/FCKeditor/"
              width="550"
              height="400"
              skinPath="/qczl/FCKeditor/editor/skins/silver/"
              defaultLanguage="zh-cn"
              tabSpaces="8"
              imageBrowserURL="/qczl/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
              linkBrowserURL="/qczl/FCKeditor/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
              flashBrowserURL="/qczl/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
              imageUploadURL="/qczl/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Image"
              linkUploadURL="/qczl/FCKeditor/editor/filemanager/upload/simpleuploader?Type=File"
              flashUploadURL="/qczl/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Flash">
      </FCK:editor>	
     </td>
    </tr> 
    
    
    
    
    
    
    
    
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
      </td>
    </tr>
	
</table></form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>

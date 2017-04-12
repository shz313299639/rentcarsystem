<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>系统管理</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" rel=stylesheet>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<SCRIPT language="JavaScript" type="text/JavaScript">
<!--
var array = new Array();//数字顺延
array[0]=1;array[1]=2;array[2]=3;array[3]=4;array[4]=5;array[5]=6;array[6]=7; array[7]=8; array[8]=9; array[9]=10; 
function expand(id_value){
  var tmp;
  eval("tmp=document.getElementById('id_"+id_value+"').style.display");
  if(tmp==''){
    eval("document.getElementById('id_"+id_value+"').style.display='none'");
  }else{
   for(i=0;i<array.length;i++){
      eval("document.getElementById('id_"+array[i]+"').style.display='none'");
  }
    eval("document.getElementById('id_"+id_value+"').style.display=''");
  }  
 }
//-->
</SCRIPT>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{ 
%>
<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE bgColor=#eef8fe  class=HeaderTdStyle height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle ><IMG height=17 src="<%=basePath %><%=dir %>/images/sys.gif" width=21>
          <a href="<%=basePath %><%=dir %>/iframe/main.jsp" target="MainFrame">管理首页</a>
          </TD>
        </TR>
        </TBODY>
      </TABLE>
      <TABLE  bgColor=#eef8fe   height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top height="100%">
          <DIV style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 96%" align=center>
<TABLE  bgColor=#eef8fe cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <TBODY> 
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
    <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;系统管理</TD></TR>
    </TABLE>
    <TABLE width="100%" border="0" align="center" id=id_1 style="display:none">
   <%if(username.equals("admin")){ %>
    <TR>
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> 
      <a href="<%=basePath %><%=dir %>/system/user.jsp" target="MainFrame">网站管理员</a></SPAN></TD></TR>
   <%} %>
  	 <TR>
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> 
      <a href="<%=basePath %><%=dir %>/system/editpwd.jsp" target="MainFrame">修改登录密码</a></SPAN></TD></TR>
  	
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;网站公告管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_2 style="display:none">
 <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/affiche/index.jsp" target="MainFrame">网站公告管理</a></SPAN></TD></TR>
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/affiche/edit.jsp?method=addAffiche" target="MainFrame">发布网站公告</a></SPAN></TD></TR>
  
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(3)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;新闻信息管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_3 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/news/index.jsp" target="MainFrame">新闻信息管理</a></SPAN></TD></TR>
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/news/add.jsp?method=addTH" target="MainFrame">发布新闻信息</a></SPAN></TD></TR>
  </TABLE>
  </TD>
  </TR>
   <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(4)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;汽车类别管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_4 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/hzp/type.jsp" target="MainFrame">汽车类别管理</a></SPAN></TD></TR>
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(5)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;汽车信息管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_5 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/hzp/index.jsp" target="MainFrame">汽车信息管理</a></SPAN></TD></TR>
    <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/hzp/add.jsp?method=addQC" target="MainFrame">添加汽车信息</a></SPAN></TD></TR> 
    <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/hzp/c.jsp" target="MainFrame">查询汽车信息</a></SPAN></TD></TR> 
 
 </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(6)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;注册用户管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_6 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/member/person.jsp" target="MainFrame">注册用户管理</a></SPAN></TD></TR>
    
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(7)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;租车信息管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_7 style="display:none">
   <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/prep/index.jsp" target="MainFrame">租车信息管理</a></SPAN></TD></TR>
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/prep/tj.jsp" target="MainFrame">租车收入统计</a></SPAN></TD></TR>
 
   </TABLE>
  </TD>
  </TR>
  
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(8)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;会员等级管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_8 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/hzp/hydj.jsp" target="MainFrame">会员等级管理</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(9)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;留言板管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_9 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/guestbook/index.jsp" target="MainFrame">留言板管理</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>
  
  
  
  
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(10)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;相关专业人员管理</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_10 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/qy/index.jsp" target="MainFrame">相关专业人员管理</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>

  
  
  
  
  
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(11)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;退出登陆</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_11 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=path%>/Admin.do?method=exit" target=_top>退出登陆</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>
  
  </TBODY>
</TABLE>
</DIV>

    </TD>
    </TR>
    </TBODY>
    </TABLE>
    </TD></TR>
    </TBODY>
    </TABLE>
</BODY>
<%} %>
</HTML>

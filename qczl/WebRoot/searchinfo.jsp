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
 <%String sql;
	String title=Common.toChineseAndTrim(request.getParameter("title"));
	String type=Common.toChineseAndTrim(request.getParameter("type")); 
	String pcpx=request.getParameter("pcpx"); 
	String sel_cx=Common.toChineseAndTrim(request.getParameter("sel_cx"));
	String sel_dw=Common.toChineseAndTrim(request.getParameter("sel_dw"));
	System.out.println("px==="+pcpx);
	//System.out.println("\nbookCase*********************action="+type);
	 if(type.trim().equals("����Ʒ��")){
	// System.out.println("\nbookCase*********************action");
		//sql = "select * from sale xl where xl.jdid=sale and xl.js like '%"+title+"%' order by id desc";
    sql = "select * from qc where fl like '%"+title+"%' order by id desc";
		

	}else if(type.trim().equals("complexquery")){
	
		sql="select * from qc where 1=1 ";
		if(!"".equals(sel_cx)&&sel_cx!=null){
			sql+=" and qclx= '"+sel_cx+"'";
		}
		if(!"".equals(sel_dw)&&sel_dw!=null){
			sql+=" and qcdw= '"+sel_dw+"'";
		}
		if(!"".equals(pcpx)&&pcpx!=null){
			sql+=" order by "+pcpx;
		}

	}else
	{
	
	
	 sql = "select * from qc where cm like '%"+title+"%' order by id desc";
	
	}
	 
	 

 
%>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
<!--//Ŀ����Ϊ������񷽱�
document.write('<div class="wrap">');
//-->
function doquery(px1){
	document.all.pcpx.value=px1;
	form1.submit();
}
function sel_cx(cx){
	document.all.sel_cx.value=cx;
	form1.submit();
}
function sel_dw(dw){
	document.all.sel_dw.value=dw;
	form1.submit();
}
</SCRIPT>
 <form action="<%=basePath %>searchinfo.jsp" method="post" name="form1" >
<input type="hidden" id="pcpx" name="pcpx" value="<%=pcpx%>">
<input type="hidden" name="sel_cx" value="<%=sel_cx%>">
<input type="hidden" name="sel_dw" value="<%=sel_dw%>">
<input type="hidden" name="type" value="complexquery">
</form>
<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
  <td class=Side vAlign=top align=left width="25%">
  	 <TABLE width="100%" height="150" border=0 cellPadding=0 cellSpacing=0 class=dragTable>
	  <TBODY>
        <TR>
          <TD class=head>
            <SPAN><P>����ɸѡ</P></SPAN>
		  </TD>
		</TR> 
		<TR><TD><input type="radio" name="px" id="radio1" value="" onClick="doquery('')" <%if("".equals(pcpx)) out.print("checked");%> /><span for="radio1">����</span></TD></TR>
		<TR><TD><input type="radio" name="px" id="radio1" value="zj desc" onClick="doquery('zj desc')" <%if("zj desc".equals(pcpx)) out.print("checked");%>/><span for="radio1">���Ӹߵ���</span></TD></TR>
		<tr><td><input type="radio" name="px" id="radio2" value="zj asc" onClick="doquery('zj asc')" <%if("zj asc".equals(pcpx)) out.print("checked");%>/><span for="radio2">���ӵ͵���</span></td></tr>
		<tr><td><input type="radio" name="px" id="radio2" value="zccs desc" onClick="doquery('zccs desc')" <%if("zccs desc".equals(pcpx)) out.print("checked");%>/><span for="radio2">�⳵�����Ӹߵ���</span></td></tr> 
		<tr><td><input type="radio" name="px" id="radio2" value="zccs asc" onClick="doquery('zccs asc')" <%if("zccs asc".equals(pcpx)) out.print("checked");%>/><span for="radio2">�⳵�����ӵ͵���</span></td></tr>

	</TBODY>
	</TABLE>
	<TABLE width="100%" height="100" border=0 cellPadding=0 cellSpacing=0 class=dragTable>
	  <TBODY>
        <TR>
          <TD class=head>
            <SPAN><P>��λ</P></SPAN>
		  </TD>
		</TR> 
		<TR><TD><input type="radio" name="dw" id="radio1" value="" onClick="sel_dw('')" <%if("".equals(sel_dw)) out.print("checked");%>/><span for="radio1">����</span></TD></TR>
		<tr><td><input type="radio" name="dw" id="radio2" value="�ֶ���" onClick="sel_dw('�ֶ�')" <%if("�ֶ�".equals(sel_dw)) out.print("checked");%>/><span for="radio2">�ֶ���</span></td></tr>
		<tr><td><input type="radio" name="dw" id="radio2" value="�Զ���" onClick="sel_dw('�Զ�')" <%if("�Զ�".equals(sel_dw)) out.print("checked");%>/><span for="radio2">�Զ���</span></td></tr>

	</TBODY>
	</TABLE>
	<TABLE width="100%" height="150" border=0 cellPadding=0 cellSpacing=0 class=dragTable>
	  <TBODY>
        <TR>
          <TD class=head>
            <SPAN><P>����</P></SPAN>
		  </TD>
		</TR> 
		<TR><TD><input type="radio" name="cx" id="radio1" value="" onClick="sel_cx('')" <%if("".equals(sel_cx)) out.print("checked");%>/><span for="radio1">����</span></TD></TR>
		<tr><td><input type="radio" name="cx" id="radio2" value="SUV" onClick="sel_cx('SUV')" <%if("SUV".equals(sel_cx)) out.print("checked");%>/><span for="radio2">SUV</span></td></tr>
		<tr><td><input type="radio" name="cx" id="radio2" value="������" onClick="sel_cx('������')" <%if("������".equals(sel_cx)) out.print("checked");%>/><span for="radio2">������</span></td></tr> 
		<tr><td><input type="radio" name="cx" id="radio2" value="������" onClick="sel_cx('������')" <%if("������".equals(sel_cx)) out.print("checked");%>/><span for="radio2">������</span></td></tr>
		<tr><td><input type="radio" name="cx" id="radio2" value="������" onClick="sel_cx('������')" <%if("������".equals(sel_cx)) out.print("checked");%>/><span for="radio2">������</span></td></tr>

	</TBODY>
	</TABLE>
  </td>
  <td class=Side vAlign=top align=right width="75%">

     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>��ѯ���</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="left" >
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <% 
                    List hotlist=cb.getCom(sql,13);
                    if(!hotlist.isEmpty()){
					for(int alln1=0;alln1<hotlist.size();alln1++){
						List allnew=(List)hotlist.get(alln1);
			%>
        <TR>
          <TD width=20% align=center>
          <br>
		 <IMG height=80 src="<%=basePath+allnew.get(3).toString()%>" width=120 onload=makesmallpic(this,120,80); border=0>
		
		   </TD>
          <TD align=left><br>
	            ������<%=allnew.get(1).toString()%>  &nbsp;&nbsp;&nbsp;�������ࣺ<%=allnew.get(2).toString()%><br>
		  ��ϵ�绰��<%=allnew.get(4).toString()%>   <br>
		  ���<%=allnew.get(5).toString()%>  Ԫ&nbsp;��ʱ�۸�<%=allnew.get(6).toString()%> Ԫ &nbsp;&nbsp;&nbsp;���޴�����<%=allnew.get(10).toString()%> ��<br>
		  ��ע��Ϣ��<%=allnew.get(7).toString()%><br>
		
		  <a href="<%=basePath %>hinfo.jsp?id=<%=allnew.get(0).toString()%>" style="font-size: 12px;color: red">����鿴��ϸ...</a>
	  </TD>
		</TR>
		<%}} %>
				</TBODY>
			</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
  </td>
  </TR>
  </TBODY>
  </TABLE>
     

<SCRIPT language=JavaScript>
<!--//Ŀ����Ϊ������񷽱�
document.write('</div>');
//-->
</SCRIPT>
<SCRIPT language=JavaScript>
<!--
clickEdit.init();
//-->
</SCRIPT>
</BODY>
</HTML>
<%@ include file="iframe/foot.jsp"%>

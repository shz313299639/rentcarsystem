package com.action;

/**
 * 
 * 留言本
 */

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.GuestBookBean;
import com.bean.SystemBean;
import com.util.Constant;
import com.util.Filter;

public class GuestBookAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GuestBookAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		//nikename, pic, email, qq, weburl, blogurl, expressions, content
		String sysdir = new SystemBean().getDir();
		HttpSession session = request.getSession();
		String method = request.getParameter("method").trim();
			GuestBookBean guestBookBean = new GuestBookBean();
			if(method.equals("add")){//发表留言
				String member=(String)session.getAttribute("member");//会员名
				String nikename = Filter.escapeHTMLTags(request.getParameter("nikename").trim());//留言人姓名
				String face ="images/nobody.gif";//留言表情
				String email = Filter.escapeHTMLTags(request.getParameter("email").trim());//留言人EMAIL
				String qq = Filter.escapeHTMLTags(request.getParameter("qq").trim());//留言人qq
				String weburl = Filter.escapeHTMLTags(request.getParameter("weburl").trim());//留言人url
				String blogurl = Filter.escapeHTMLTags(request.getParameter("blogurl").trim());
				String expressions = "images/face/"+Filter.escapeHTMLTags(request.getParameter("face").trim())+".gif";//留言人表情
				String content = Filter.escapeHTMLTags(request.getParameter("content").trim());//留言内容
				String ip = request.getRemoteAddr();
				 
				int guestbook=1;
				int flag = guestBookBean.addGuestBook(nikename, face, email, qq, weburl, blogurl, expressions, content, ip,guestbook);//向数据库插入留言信息
				if(flag == 1){
					
						request.setAttribute("message", "谢谢您的留言，请等候管理员回复！");
						request.getRequestDispatcher("guestbook.jsp").forward(request, response);
					
				}
				else{
					request.setAttribute("message", "系统维护中，请稍后再试！");
					request.getRequestDispatcher("guestbook.jsp").forward(request, response);
				}
			}
			else if(method.equals("delguestbook")){//删除留言
				try{
					String username2 = (String)session.getAttribute("user");
					if(username2 == null){
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}
					else{
						String check[] = request.getParameterValues("checkit");//实现多条留言记录一起选择删除
						if(check == null){
							request.setAttribute("message", "请选择要删除的记录！");
							request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
						}
						else{
							int id[]= new int[check.length];
							for(int i = 0;i<check.length;i++){
								int s = Integer.parseInt(check[i]);				
								id[i] = s;
							}
							int flag = guestBookBean.delGuestBook(id);//删除相应的留言
							if(flag == Constant.SUCCESS){
								request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
							}
						}
					}
				}catch(Exception e){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			}
			
			else if(method.equals("replay")){//回复留言的实现
				try{
					String username2 = (String)session.getAttribute("user");
					if(username2 == null){
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}
					else{
						String messageid = Filter.escapeHTMLTags(request.getParameter("id").trim());//回复留言的ID
						String replay = Filter.escapeHTMLTags(request.getParameter("replay").trim());//回复留言的内容
						int flag = guestBookBean.reGuestBook(Integer.parseInt(messageid), replay, username2);//插入数据库实现留言信息保存
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "回复成功！");//提示回复成功信息
							request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
						}
					}
				}catch(Exception e){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			}
			else if(method.equals("upreplay")){
				try{
					String username2 = (String)session.getAttribute("user");
					if(username2 == null){
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}
					else{
						String messageid = Filter.escapeHTMLTags(request.getParameter("id").trim());//回复留言的内容
						String replay = Filter.escapeHTMLTags(request.getParameter("replay").trim());//回复留言的内容
						int flag = guestBookBean.upReplay(Integer.parseInt(messageid), replay);//更新数据库实现留言信息保存
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "修改成功！");
							request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/guestbook/index.jsp").forward(request, response);
						}
					}
				}catch(Exception e){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			}
			else{
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
	}
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}

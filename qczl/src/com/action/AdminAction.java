package com.action;
/**
 * 管理员登陆 增加 修改 删除 删除登陆日志
 */
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.AdminBean;
import com.bean.SystemBean;
import com.util.Constant;
import com.util.MD5;

public class AdminAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminAction() {
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

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		try{
			String method=request.getParameter("method").trim();
			AdminBean loginbean = new AdminBean();
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(1200);
			SystemBean systembean = new SystemBean();
			String sysdir = systembean.getDir();
			if(method.equals("one")){//admin登录
				String username = request.getParameter("username");//定义变量用户名
				String password = request.getParameter("password");//定义变量密码
				if(username == null||username.trim().equals("")){//判断用户名是否为空
					request.setAttribute("message", "请正确输入用户名！");
					request.getRequestDispatcher(sysdir+"/login.jsp").forward(request, response);
				}
				else if(password == null||password.trim().equals("")){//判断密码是否为空
					request.setAttribute("message", "请输入密码！");
					request.getRequestDispatcher(sysdir+"/login.jsp").forward(request, response);
				}
				else{
					String md5password = MD5.MD5(password);//MD5加密操作
					String agent = request.getHeader("user-agent"); 
					StringTokenizer st = new StringTokenizer(agent,";"); 
					String useros=st.nextToken();
					String loginip = request.getRemoteAddr();			
					int flag = loginbean.adminLogin(username,md5password, password,useros,loginip);//查询数据库是否存在该管理员账号
					switch (flag){
						case Constant.SUCCESS:
							List list = loginbean.getAdminInfo(username);
							session.setAttribute("user", username);//登录成功赋值全局变量
							session.setAttribute("list", list);//将表单赋值全局变量
							request.getRequestDispatcher(sysdir+"/").forward(request, response);//登录成功跳转
							break;
						case Constant.NAME_ERROR:
							request.setAttribute("message", "用户名错误！请确认管理权限！");//用户名错误提示
							request.getRequestDispatcher(sysdir+"/login.jsp").forward(request, response);
							break;
						case Constant.PASSWORD_ERROR:
							request.setAttribute("message", "密码错误，请确认管理权限！");//密码名错误提示
							request.getRequestDispatcher(sysdir+"/login.jsp").forward(request, response);
							break;
					}
				}
			}
			else if(method.equals("editpwd")){//修改密码
				String username2 = (String)session.getAttribute("user");//申请USER名并赋值给变量
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					String oldpwd = MD5.MD5(request.getParameter("oldpwd").trim());//对旧密码进行MD5反加密操作
					String newpwd = MD5.MD5(request.getParameter("newpwd").trim());//对新密码进行MD5反加密操作
					String username = (String)session.getAttribute("user");//将全局变量user赋值给username
					int flag = loginbean.editPassword(username, oldpwd, newpwd);//进行密码的修改操作
					switch (flag){
						case Constant.SUCCESS:
							request.setAttribute("message", "密码修改成功！");//修改成功
							request.getRequestDispatcher(sysdir+"/system/editpwd.jsp").forward(request, response);//修改成功后页面跳转到editpwd.jsp
							break;
						case Constant.PASSWORD_ERROR://原始密码错误的返回
							request.setAttribute("message", "原始密码错误，请确认权限！");
							request.getRequestDispatcher(sysdir+"/system/editpwd.jsp").forward(request, response);//原始密码错误页面跳转到editpwd.jsp
							break;
						case Constant.SYSTEM_ERROR:
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/editpwd.jsp").forward(request, response);//修改失败后页面跳转到editpwd.jsp
							break;
					}
				}		
			}
			else if(method.equals("exit")){//管理员退出操作
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){//判断如果管理员为空跳转到error.jsp页面
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					session.removeAttribute("user");
					session.removeAttribute("list");
					System.gc();
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}			
			}
			else if(method.equals("manager")){//添加修改管理员信息
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					
						String username = request.getParameter("username").trim();//申请用户名变量
						String password = MD5.MD5(request.getParameter("password").trim());// 申请密码并进行MD5加密操作
						
						String fd =  request.getParameter("fd");
						int flag = loginbean.addManager(username, password, fd, "1");//插入数据库操作
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "增加管理员成功！");//提示增加成功
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);//页面跳转
						}
						else if(flag == Constant.SAME_NAME){
							request.setAttribute("username", username);
							request.setAttribute("message", "该用户名已经存在！");//提示用户名已存在
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}		
					
				}
			}
			else if(method.equals("delm")){//删除管理员操作
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					int id = Integer.parseInt(request.getParameter("id").trim());//原始账号不能删除
					if(id == 1){
						request.setAttribute("message", "不能删除原始帐号！");
						request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
					}
					else{
						int flag = loginbean.delManager(id);//根据ID删除管理员记录
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "删除成功！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}	
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}	
					}
				}			
			}
			else if(method.equals("dellog")){//删除登录记录
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					String check[] = request.getParameterValues("checkit");//实现批量删除多选框
					if(check == null){
						request.setAttribute("message", "请选择要删除的记录！");
						request.getRequestDispatcher(sysdir+"/system/log.jsp").forward(request, response);
					}
					else{
						int id[]= new int[check.length];
						for(int i = 0;i<check.length;i++){
							int s = Integer.parseInt(check[i]);				
							id[i] = s;
						}
						int flag = loginbean.delLog(id);
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "删除记录成功！");
							request.getRequestDispatcher(sysdir+"/system/log.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/log.jsp").forward(request, response);
						}
					}
				}			
			}
			else{//无参数传入转到错误页面
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
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

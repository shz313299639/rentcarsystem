package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.HzpBean;
import com.bean.NewsBean;
import com.util.Constant;

public class HzpAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HzpAction() {
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
		HttpSession session=request.getSession();
		HzpBean tb=new HzpBean();
		String method=request.getParameter("method").trim();
		///////////////////////////////////////////////////////////////////////商品

		if(method.equals("addType")){//添加分类代码
			String type=request.getParameter("type").trim();//定义类别变量
			int flag=tb.addType(type);//插入数据库操作
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");//插入数据库成功跳转操作
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
			else if(flag==Constant.DEFAULT_ERROR){
				request.setAttribute("message", "该分类已存在！");//判断该类别是否重复
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
		}
		else if(method.equals("delType")){//删除分类代码
			String id=request.getParameter("id").trim();//定义类别ID变量
			int flag=tb.delType(id);//删除数据操作
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");//删除数据库成功跳转操作
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
			
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");//删除数据库失败跳转操作
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
		}
		
		
		else if(method.equals("addhydj")){
			String type=request.getParameter("type").trim();//定义类型变量并赋值
			String edsx=request.getParameter("edsx").trim();//定义等级上线变量
			String edxx=request.getParameter("edxx").trim();//定义等级下线变量
			String yhed=request.getParameter("yhed").trim();//定义优惠额度
			int flag=tb.addhydj(type,edsx,edxx,yhed);//插入数据库操作
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");//插入成功跳转操作
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
			else if(flag==Constant.DEFAULT_ERROR){//判断数据库重复操作
				request.setAttribute("message", "该等级已存在！");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
		}
		else if(method.equals("delhydj")){
			String id=request.getParameter("id").trim();
			int flag=tb.delhydj(id);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
			
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
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

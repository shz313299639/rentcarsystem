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
		///////////////////////////////////////////////////////////////////////��Ʒ

		if(method.equals("addType")){//��ӷ������
			String type=request.getParameter("type").trim();//����������
			int flag=tb.addType(type);//�������ݿ����
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");//�������ݿ�ɹ���ת����
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
			else if(flag==Constant.DEFAULT_ERROR){
				request.setAttribute("message", "�÷����Ѵ��ڣ�");//�жϸ�����Ƿ��ظ�
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
		}
		else if(method.equals("delType")){//ɾ���������
			String id=request.getParameter("id").trim();//�������ID����
			int flag=tb.delType(id);//ɾ�����ݲ���
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");//ɾ�����ݿ�ɹ���ת����
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
			
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");//ɾ�����ݿ�ʧ����ת����
				request.getRequestDispatcher("admin/hzp/type.jsp").forward(request, response);
			}
		}
		
		
		else if(method.equals("addhydj")){
			String type=request.getParameter("type").trim();//�������ͱ�������ֵ
			String edsx=request.getParameter("edsx").trim();//����ȼ����߱���
			String edxx=request.getParameter("edxx").trim();//����ȼ����߱���
			String yhed=request.getParameter("yhed").trim();//�����Żݶ��
			int flag=tb.addhydj(type,edsx,edxx,yhed);//�������ݿ����
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");//����ɹ���ת����
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
			else if(flag==Constant.DEFAULT_ERROR){//�ж����ݿ��ظ�����
				request.setAttribute("message", "�õȼ��Ѵ��ڣ�");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
		}
		else if(method.equals("delhydj")){
			String id=request.getParameter("id").trim();
			int flag=tb.delhydj(id);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/hzp/hydj.jsp").forward(request, response);
			}
			
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
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

package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
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
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addTH")){  //add teacher
			String title=request.getParameter("title");
			String content=request.getParameter("infoContent");   
				 int flag = cBean.comUp("insert into news(title, content,sj ) " +
							"values('"+title+"', '"+content+"', '"+date2+"' )");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
					}
			 
		}
		else if(method.equals("upTH")){ ///update teacher
			String id = request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("infoContent");  
			int flag = cBean.comUp("update news set title='"+title+"', content='"+content+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delTH")){  //del teacher
			String id = request.getParameter("id");
			System.out.println("\nbookCase*********************action="+id);			
			
			int flag = cBean.comUp("delete from news where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("qyJS")){  //del teacher
			String js = request.getParameter("infoContent");
			int flag = cBean.comUp("update js set js='"+js+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/qy/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/qy/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("delQC")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from qc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/hzp/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/hzp/index.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("addPREP")){  //添加汽车租赁信息
			String id = request.getParameter("id");
			String qcsj = request.getParameter("qcsj");//定义取车时间变量
			String qcdd = request.getParameter("qcdd");//定义取车地点变量
			String hcsj = request.getParameter("hcsj");//定义换车时间变量
			String hcdd = request.getParameter("hcdd");//定义换车地点变量
			String member=(String)session.getAttribute("member");//定义会员名称变量
			int flag = cBean.comUp("insert into zc(qcid,qcsj,qcdd,hcsj,hcdd,member,zt,xzzt,sfhc) " +
					"values('"+id+"','"+qcsj+"','"+qcdd+"','"+hcsj+"','"+hcdd+"','"+member+"','未审核','未审核','否')");//插入数据库操作
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功，请登录会员中心查看详细信息！");//插入成功
				request.getRequestDispatcher("nhzp.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("nhzp.jsp").forward(request, response); //插入失败跳转
			}
		}
		else if(method.equals("upPREP")){  //del teacher
			String id = request.getParameter("id");
			String qcsj = request.getParameter("qcsj");
			String qcdd = request.getParameter("qcdd");
			String hcsj = request.getParameter("hcsj");
			String hcdd = request.getParameter("hcdd"); 
			String sql="update zc set  qcsj='"+qcsj+"',qcdd='"+qcdd+"',hcsj='"+hcsj+"',hcdd='"+hcdd+"' where id='"+id+"'";
			 
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delP")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from zc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("AdelP")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from zc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("shP")){  //设置审核状态
			String id = request.getParameter("id");//定义ID变量主键
			String fy = request.getParameter("fy");//定义变量
			String member=cBean.getString("select member from zc where id='"+id+"'");//选择租车会员信息
			 
			int flag = cBean.comUp("update zc set zt='已审核' where id='"+id+"'");// 更新数据库审核状态
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("update member set jf=jf+"+fy+" where username='"+member+"'");//设置会员积分信息
				request.setAttribute("message", "操作成功！");//操作成功
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("xz")){  //设置是否续租
			String id = request.getParameter("id");//定义ID变量主键
			int flag = cBean.comUp("update zc set xz='已',xzzt='未审核',sfhc='否' where id='"+id+"'");// 更新数据库是否续租
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");//操作成功跳转
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("xzzt")){  //更新数据库续租状态
			String id = request.getParameter("id");
			int flag = cBean.comUp("update zc set xzzt='已审核' where id='"+id+"'");//更新数据库续租状态
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");//操作成功跳转
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("sfhc")){  //执行还车操作
			String id = request.getParameter("id");
			int flag = cBean.comUp("update zc set sfhc='是' where id='"+id+"'");//更新数据库字段为是
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
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

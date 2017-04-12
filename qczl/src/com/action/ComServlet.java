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
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
					}
			 
		}
		else if(method.equals("upTH")){ ///update teacher
			String id = request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("infoContent");  
			int flag = cBean.comUp("update news set title='"+title+"', content='"+content+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delTH")){  //del teacher
			String id = request.getParameter("id");
			System.out.println("\nbookCase*********************action="+id);			
			
			int flag = cBean.comUp("delete from news where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("qyJS")){  //del teacher
			String js = request.getParameter("infoContent");
			int flag = cBean.comUp("update js set js='"+js+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/qy/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/qy/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("delQC")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from qc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/hzp/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/hzp/index.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("addPREP")){  //�������������Ϣ
			String id = request.getParameter("id");
			String qcsj = request.getParameter("qcsj");//����ȡ��ʱ�����
			String qcdd = request.getParameter("qcdd");//����ȡ���ص����
			String hcsj = request.getParameter("hcsj");//���廻��ʱ�����
			String hcdd = request.getParameter("hcdd");//���廻���ص����
			String member=(String)session.getAttribute("member");//�����Ա���Ʊ���
			int flag = cBean.comUp("insert into zc(qcid,qcsj,qcdd,hcsj,hcdd,member,zt,xzzt,sfhc) " +
					"values('"+id+"','"+qcsj+"','"+qcdd+"','"+hcsj+"','"+hcdd+"','"+member+"','δ���','δ���','��')");//�������ݿ����
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ������¼��Ա���Ĳ鿴��ϸ��Ϣ��");//����ɹ�
				request.getRequestDispatcher("nhzp.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("nhzp.jsp").forward(request, response); //����ʧ����ת
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
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delP")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from zc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("AdelP")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from zc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("shP")){  //�������״̬
			String id = request.getParameter("id");//����ID��������
			String fy = request.getParameter("fy");//�������
			String member=cBean.getString("select member from zc where id='"+id+"'");//ѡ���⳵��Ա��Ϣ
			 
			int flag = cBean.comUp("update zc set zt='�����' where id='"+id+"'");// �������ݿ����״̬
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("update member set jf=jf+"+fy+" where username='"+member+"'");//���û�Ա������Ϣ
				request.setAttribute("message", "�����ɹ���");//�����ɹ�
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		
		
		else if(method.equals("xz")){  //�����Ƿ�����
			String id = request.getParameter("id");//����ID��������
			int flag = cBean.comUp("update zc set xz='��',xzzt='δ���',sfhc='��' where id='"+id+"'");// �������ݿ��Ƿ�����
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");//�����ɹ���ת
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("xzzt")){  //�������ݿ�����״̬
			String id = request.getParameter("id");
			int flag = cBean.comUp("update zc set xzzt='�����' where id='"+id+"'");//�������ݿ�����״̬
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");//�����ɹ���ת
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("sfhc")){  //ִ�л�������
			String id = request.getParameter("id");
			int flag = cBean.comUp("update zc set sfhc='��' where id='"+id+"'");//�������ݿ��ֶ�Ϊ��
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
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

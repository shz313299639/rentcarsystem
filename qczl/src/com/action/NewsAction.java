package com.action;

 
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.NewsBean;
import com.bean.SystemBean;
import com.bean.ComBean;
import com.util.Constant;
import com.util.Filter;
import com.util.SmartFile;
import com.util.SmartUpload;

public class NewsAction extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public NewsAction() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
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
		String sysdir = new SystemBean().getDir();
		HttpSession session = request.getSession();
		try{
			String username2 = (String)session.getAttribute("user");
			if(username2 == null){
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			else{
				 String method = null; 
				 ComBean cb=new ComBean();
				 SmartUpload mySmartUpload = new SmartUpload();//init
				 int count = 0;
				 try{
					 mySmartUpload.initialize(config,request,response);
		             mySmartUpload.upload(); 
		             method = mySmartUpload.getRequest().getParameter("method").trim();
		           if(method.equals("addQC")){//增加汽车信息
		            	String cm = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("cm").trim());//定义车辆名称变量
						String fl = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("fl").trim());//定义车辆分类变量
						String cp = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("cp").trim());//定义联系电话
						String zj = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("zj").trim());//定义车辆总价
						String csjg = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("csjg").trim());//定义超时价格
						String bz = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("bz").trim()); //定义车辆备注
						String qcxq = mySmartUpload.getRequest().getParameter("infoContent"); 	//增加汽车信息
							SmartFile file = mySmartUpload.getFiles().getFile(0);//定义上传组件
			            	String fileExt=file.getFileExt();	            
			            	String path="/upload_file/sale";//定义图片路径
		                    count = mySmartUpload.save(path);//定义图片路径
		                    int flag=cb.comUp("insert into qc (cm,fl,pic,cp,zj,csjg,bz,qcxq)" +//插入数据库操作
		                    		"values('"+cm+"','"+fl+"','"+path+"/"+file.getFileName()+"','"+cp+"','"+zj+"','"+csjg+"','"+bz+"','"+qcxq+"')"); 
							if(flag == Constant.SUCCESS){
								request.setAttribute("message", "操作成功！");//操作成功状态
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
						 
		            }
		            //update
		            else if(method.equals("upQC")){
		            	String id = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("id").trim());
		            	String cm = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("cm").trim());
						String fl = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("fl").trim());
						String cp = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("cp").trim());
						String zj = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("zj").trim());
						String csjg = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("csjg").trim());
						String bz = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("bz").trim()); 
						String qcxq = mySmartUpload.getRequest().getParameter("infoContent"); 	
						
						SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/upload_file/sale";
		                    count = mySmartUpload.save(path);	                    
		                   int flag = cb.comUp("update qc set cm='"+cm+"',fl='"+fl+"',pic='"+path+"/"+file.getFileName()+"',cp='"+cp+"',zj='"+zj+"'," +
		                   		"csjg='"+csjg+"',bz='"+bz+"',qcxq='"+qcxq+"' where id='"+id+"'");
							if(flag == Constant.SUCCESS){
								request.setAttribute("message", "操作成功！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
						}
		            
		             
		            else{
		            	request.getRequestDispatcher("error.jsp").forward(request, response);
		            }
		        }catch(Exception ex){
		        	ex.printStackTrace();
		        	//request.getRequestDispatcher("error.jsp").forward(request, response);
		        }
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

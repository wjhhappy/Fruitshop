package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserBusyness;
import entity.User;

public class RegistServlet extends HttpServlet {

	public RegistServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//获得页面提交的信息
		String name=request.getParameter("uname");
		String pass=request.getParameter("upass");
		String flag=request.getParameter("flag");
		//flag是个隐藏域，判断是检查用户还是注册
		//创建实体模型
		User u=new User();
		u.setUname(name);
		u.setUpass(pass);
		//创建业务模型
		UserBusyness ub=new UserBusyness();
	    //检查用户名是否可用
		if(flag!=null&&flag.equals("0")){
			//用户名可用
			if(ub.nameIsExit(name)){
				request.setAttribute("isExit", "true");
			}else{//用户名不可用
				request.setAttribute("isExit", "false");
			}
			//不管用户名可不可用都返回页面继续注册
			request.setAttribute("userName", name);
			//回到注册画面
			RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
			dis.forward(request, response);
		}
		//实现注册功能
		if(flag!=null&&flag.equals("1")){
			if(ub.regist(u)){
				//注册成功回到登陆画面
				out.print("注册成功,3秒后去登录!");
				response.setHeader("refresh", "3;url=login.jsp");
			}else{
				//失败回到注册画面
				out.print("注册失败,请查查原因,3秒后继续注册!");
				response.setHeader("refresh", "3;url=register.jsp");
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

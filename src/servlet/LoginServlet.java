package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserBusyness;
import entity.User;

public class LoginServlet extends HttpServlet {
	public LoginServlet() {
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
			//创建实体模型
			User u=new User();
			u.setUname(name);
			u.setUpass(pass);
			//创建业务模型
			UserBusyness ub=new UserBusyness();
	        //登陆成功
			if(ub.login(u)){
			HttpSession session=request.getSession();
			//登录成功把用户名保存到session中
			session.setAttribute("user",u);
			RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
				dis.forward(request, response);
			}else{//登录失败
			out.print("登录失败,查看用户名和密码是否错误？3秒钟后继续登录!");
				response.setHeader("refresh", "3;url=login.jsp");
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

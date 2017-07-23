package filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
   private static final String LOGON_URI="LOGON_URI";
   private static final String Regist_URI="Regist_URI";
   private static final String LOGON_SERVLET="LOGON_SERVLET";
   private static final String Regist_SERVLET="Regist_SERVLET";
   private String logon_page;
   private String regist_page;
   private String logon_servlet;
   private String regist_servlet;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
        HttpServletRequest req=(HttpServletRequest) request;
        HttpServletResponse resp=(HttpServletResponse) response;
        resp.setContentType("text/html;");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session=req.getSession();
        PrintWriter out=resp.getWriter();
        //得到用户请求的URI
        String request_uri=req.getRequestURI();
        //得到Web应用程序的上下文路径
        String ctxPath=req.getContextPath();
        //去除上下文路径，得到剩余部分的路径
        String uri=request_uri.substring(ctxPath.length());
        //判断用户访问的是否是登录页面或注册页面
        if(uri.equals(logon_page)||uri.equals(regist_page)
        		||uri.equals(logon_servlet)||uri.equals(regist_servlet)){
        	//执行一个过滤器
        	chain.doFilter(request, response);
        }else{
        	//如果访问的不是登录页面，则判断用户是否登录
        	if(null!=session.getAttribute("user")&&""!=session.getAttribute("user")){
        		chain.doFilter(request,response);
        		}else{
        			String path=ctxPath+logon_page;
        			out.print("您没有登录,请先<a href="+path+" target=_top>登录</a>!");
        			return;
        	}
        }
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// 从web.xml的部署描述符中获取初始参数值
		 logon_page=config.getInitParameter(LOGON_URI);
		 regist_page=config.getInitParameter(Regist_URI);
		 logon_servlet=config.getInitParameter(LOGON_SERVLET);
		 regist_servlet=config.getInitParameter(Regist_SERVLET);
	}
}

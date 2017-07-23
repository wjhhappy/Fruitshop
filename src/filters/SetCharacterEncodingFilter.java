package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//过滤器设置字符编码为UTF-8
public class SetCharacterEncodingFilter implements Filter {
	protected String encoding=null;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		this.encoding=null;
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
         String encoding=this.encoding;
         if(encoding!=null)
        	 request.setCharacterEncoding(encoding);
         //执行下一个过滤器
         chain.doFilter(request,response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.encoding=filterConfig.getInitParameter("encoding");
	}
}

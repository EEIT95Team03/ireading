package org.iii.eeit9503.ireading.misc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter(
		urlPatterns={"/*"}
		)
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
        
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}


	private FilterConfig FilterConfig;
	@Override
	public void init(FilterConfig FilterConfig) throws ServletException {
		// TODO Auto-generated method stub
  this.FilterConfig=FilterConfig;
	}

}

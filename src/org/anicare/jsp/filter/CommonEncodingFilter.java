package org.anicare.jsp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class CommonEncodingFilter implements Filter {
    public CommonEncodingFilter() {
    	System.out.println("Encoding Filter Create");
    }
    public void init(FilterConfig fConfig) throws ServletException {}
	public void destroy() {	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hr = (HttpServletRequest) request;
		if(hr.getMethod().equalsIgnoreCase("POST")) {
			request.setCharacterEncoding("UTF-8");
		}
		
		chain.doFilter(request, response);
	}
}

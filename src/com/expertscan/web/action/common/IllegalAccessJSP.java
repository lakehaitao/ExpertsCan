package com.expertscan.web.action.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


/**
 * deny the direct access to jsp pages
 * 
 * @author hht
 *
 */
public class IllegalAccessJSP implements Filter{
	
	
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		if(isHttpServletRequest(arg0)){
			HttpServletRequest request = (HttpServletRequest)arg0;
			String uri = request.getRequestURI();
			if(isLegal(uri)){
				arg2.doFilter(arg0, arg1);
				return;
			}
			request.getRequestDispatcher("404.jsp").forward(arg0, arg1);
			System.out.println("ee");
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	
	private boolean isHttpServletRequest(ServletRequest request){
		Class<?>[] interfaces= request.getClass().getInterfaces();
		for(int i = 0; i < interfaces.length; i++){
			if(interfaces[i].equals(HttpServletRequest.class))
				return true;
		}
		return false;
	}
	
	
	private boolean isLegal(String uri){
		if(uri.equals("/ExpertsCan/")){
			return true;
		}
		return false;
	}
}

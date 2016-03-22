package com.expertscan.web.interceptors;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SigninRepeatedly extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8943110029787775223L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		Map<String, Object> session = arg0.getInvocationContext().getSession();
		String userName = (String) session.get("userName");
		if(userName != null){
			System.out.println("signinRepeatedly");
			return "signinRepeatedly";
		}else{
			return arg0.invoke();
		}
	}

}

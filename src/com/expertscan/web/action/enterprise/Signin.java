package com.expertscan.web.action.enterprise;

import java.util.Map;

import com.expertscan.business.enterprise.UserValidation;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Signin extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 148485466020663638L;
	String email;
	String password;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String execute() throws Exception {
		
		ActionContext ac = ActionContext.getContext();
		
		Map<String, Object> session = ac.getSession();
		
		//HttpServletRequest dd = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
		UserValidation instance = new UserValidation();
		int result = instance.check(email, password, session);
		switch(result){
		
		case 0:
			return SUCCESS;
		case 1:
			return ERROR;
		case 2:
			return ERROR;
		default:
			return ERROR;
		}
	}
}

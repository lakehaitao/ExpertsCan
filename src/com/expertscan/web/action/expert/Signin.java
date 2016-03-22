/**
 * 
 */
package com.expertscan.web.action.expert;

import java.util.Map;

import com.expertscan.business.expert.UserValidation;
import com.opensymphony.xwork2.*;

/**
 * @author hht
 *
 */
public class Signin extends ActionSupport {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5890904608449429823L;
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
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		
		Map<String, Object> session = ac.getSession();
		
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

package com.expertscan.web.action.enterprise;

import java.util.Map;

import com.expertscan.business.enterprise.UserRegistration;
import com.expertscan.data.EntInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Signup extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1566277638182678920L;
	
	private String email;
	private String password;
	private String confirmPassword;
	private String enterpriseName;
	private UserRegistration registor;
	private Map<String, Object> session;
	
	
	public Map<String, Object> getSession() {
		return session;
	}
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
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getEnterpriseName() {
		return enterpriseName;
	}
	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}
	public UserRegistration getRegistor() {
		return registor;
	}
	public void setRegistor(UserRegistration registor) {
		this.registor = registor;
	}
	
	
	public Signup() {
		// TODO Auto-generated constructor stub
		session = ActionContext.getContext().getSession();
	}
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		EntInfo ent = registor.register(this);
		
		if(ent != null){
			return SUCCESS;
		}else{
			return ERROR;
		}
		
		
	}

}

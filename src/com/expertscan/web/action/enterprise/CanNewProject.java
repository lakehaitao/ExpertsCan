package com.expertscan.web.action.enterprise;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CanNewProject extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2214971805476492554L;
	
	private Map<String, Object> session;
	
	
	
	public Map<String, Object> getSession() {
		return session;
	}


	public CanNewProject() {
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
	}
	
	@Override
	public String execute() throws Exception {
		if(session.get("userType").equals("enterprise")){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}

}

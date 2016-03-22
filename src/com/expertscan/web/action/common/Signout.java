package com.expertscan.web.action.common;

import java.util.Map;

import com.expertscan.web.SessionUpdate;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Signout extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private SessionUpdate sessionUpdator;
	private Map<String, Object> session;
	
	public Map<String, Object> getSession() {
		return session;
	}

	public SessionUpdate getSessionUpdator() {
		return sessionUpdator;
	}

	public void setSessionUpdator(SessionUpdate sessionUpdator) {
		this.sessionUpdator = sessionUpdator;
	}
	
	
	public Signout(){
		session = ActionContext.getContext().getSession();
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		sessionUpdator.clear(session);
		return SUCCESS;
	}

}

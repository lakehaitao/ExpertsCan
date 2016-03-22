package com.expertscan.web.action.common;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InformationCenter extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		int result = verifyID(session);
		
		switch(result){
		
		case 0:
			return "enterprise";
		case 1:
			return "expert";
		case -1:
			return ERROR;
		default:
			return ERROR;
		}
	}
	
	
	
	private int verifyID(Map<String, Object> session){
		String result = (String) session.get("userType");
		
		if(result == null)	return -1;
		
		switch(result){
		case "enterprise":
			return 0;
			
		case "expert":
			return 1;
			
		case "visitor":
			return -1;
			
		default:
			return -1;
			
		}
	}

}

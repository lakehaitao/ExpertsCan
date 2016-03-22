package com.expertscan.business.expert;

import com.expertscan.web.SessionUpdate;
import com.expertscan.web.action.expert.Signup;
import com.expertscan.data.ExpInfo;

public class UserRegistration {
	private SessionUpdate sessionUpdator;
	
	public SessionUpdate getSessionUpdator() {
		return sessionUpdator;
	}
	public void setSessionUpdator(SessionUpdate sessionUpdator) {
		this.sessionUpdator = sessionUpdator;
	}

	public ExpInfo register(Signup action){
		ExpInfo exp = new ExpInfo();
		exp.setEmail(action.getEmail());
		exp.setPassword(action.getPassword());
		exp.setName(action.getExpertName());
		exp.setIsPublic(true);
		
		if(exp.insertToDB()){
			sessionUpdator.update(action.getSession(), exp);
			return exp;
		}else{
			return null;
		}
	}
}

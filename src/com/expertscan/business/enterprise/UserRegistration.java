package com.expertscan.business.enterprise;

import com.expertscan.web.SessionUpdate;
import com.expertscan.web.action.enterprise.Signup;
import com.expertscan.data.EntInfo;

public class UserRegistration {
	private SessionUpdate sessionUpdator;
	
	public SessionUpdate getSessionUpdator() {
		return sessionUpdator;
	}
	public void setSessionUpdator(SessionUpdate sessionUpdator) {
		this.sessionUpdator = sessionUpdator;
	}

	public EntInfo register(Signup action){
		EntInfo ent = new EntInfo();
		ent.setEmail(action.getEmail());
		ent.setPassword(action.getPassword());
		ent.setName(action.getEnterpriseName());
		
		if(ent.insertToDB()){
			sessionUpdator.update(action.getSession(), ent);
			return ent;
		}else{
			return null;
		}
	}
}

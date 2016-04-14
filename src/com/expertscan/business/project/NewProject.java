package com.expertscan.business.project;

import com.expertscan.data.EntInfo;
import com.expertscan.data.ProjInfo;

public class NewProject {
	
	public ProjInfo establish(com.expertscan.web.action.project.NewProject action){		
		if(isIdenticalEnterprise(action)){
			ProjInfo project = new ProjInfo();
			project.setDescription(action.getDescription());
			project.setExpense(action.getExpense());
			project.setTitle(action.getTitle());

			project.insertNew(action.getEntid());
			return project;
		}else{
			return null;
		}
	}
	
	
	private boolean isIdenticalEnterprise(com.expertscan.web.action.project.NewProject action){
		EntInfo ent = (EntInfo)action.getSession().get("userInfo");
		return ent.getEntid().equals(action.getEntid());
	}
	

}

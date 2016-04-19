package com.expertscan.business.project;

import com.expertscan.data.ProjExpTendering;

public class SetProjectExpertRelation {
	
	public boolean setTendering(Integer projid, Integer expid, Integer state){
		
		ProjExpTendering relationship = new ProjExpTendering();
		relationship.updateRelationship(projid, expid, state);
		
		return true;
	}

}

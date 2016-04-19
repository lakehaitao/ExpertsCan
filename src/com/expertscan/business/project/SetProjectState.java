package com.expertscan.business.project;

import com.expertscan.data.ProjExpCompleted;
import com.expertscan.data.ProjExpOngoing;
import com.expertscan.data.ProjExpTendering;
import com.expertscan.data.ProjInfo;

public class SetProjectState {
	public boolean set(Integer projid, Integer state){
		ProjInfo proj = ProjInfo.retrieveById(projid, true);
		if(proj.getState().equals(0) && state.equals(1)){
			return startProject(proj);
		}
		
		if(proj.getState().equals(1) && state.equals(2)){
			return closeProject(proj);
		}
		return false;
	}
	
	private boolean startProject(ProjInfo proj){
		
		ProjExpOngoing migrateTool = new ProjExpOngoing();
		int membersCount = 0;
		for(ProjExpTendering relation:proj.getExpertsTendering()){
			if(relation.getState().equals(1)){
				migrateTool.migrateFrom(relation);
				membersCount++;
			}
		}
		
		if(membersCount != 0){
			proj.changeState(1);
			return true;
		}else{
			return false;
		}
	}
	
	private boolean closeProject(ProjInfo proj){
		ProjExpCompleted migrateTool = new ProjExpCompleted();
		int membersCount = 0;
		for(ProjExpOngoing relation:proj.getExpertsOngoing()){
			if(true){
				migrateTool.migrateFrom(relation);
				membersCount++;
			}
		}
		
		if(membersCount != 0){
			proj.changeState(2);
			return true;
		}else{
			return false;
		}
	}
}

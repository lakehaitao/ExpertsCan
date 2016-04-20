package com.expertscan.business.project;

import com.expertscan.data.EntInfo;
import com.expertscan.data.ExpInfo;
import com.expertscan.data.ProjExpCompleted;

public class CommentService {
	
	public boolean commentFromExp(Integer projid, Integer expid, String comment, Integer rate){
		ProjExpCompleted tool = new ProjExpCompleted();
		if(tool.updateByExp(projid, expid, comment, rate)){
			EntInfo enterprise = new EntInfo();
			return enterprise.updateRateByProjID(projid);
		}
		return false;
	}
	
	public boolean commentFromEnt(Integer projid, Integer expid, String comment, Integer rate){
		ProjExpCompleted tool = new ProjExpCompleted();
		if(tool.updateByEnt(projid, expid, comment, rate)){
			ExpInfo expert = new ExpInfo();
			return expert.updateRate(expid);
		}
		return false;
	}

}

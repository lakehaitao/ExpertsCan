package com.expertscan.data;

import java.io.Serializable;

public class ProjExpOngoing implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7470334213989782432L;
	
	
	private Integer projid;
	private Integer expid;
	public Integer getProjid() {
		return projid;
	}
	public void setProjid(Integer projid) {
		this.projid = projid;
	}
	public Integer getExpid() {
		return expid;
	}
	public void setExpid(Integer expid) {
		this.expid = expid;
	}
}

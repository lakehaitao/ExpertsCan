package com.expertscan.data;

import java.io.Serializable;

public class ProjExpCompleted implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8352811089961021188L;
	
	
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

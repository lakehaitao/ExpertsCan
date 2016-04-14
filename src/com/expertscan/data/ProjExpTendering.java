package com.expertscan.data;

import java.io.Serializable;

public class ProjExpTendering implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6326751797222757906L;
	
	
	private ProjInfo proj;
	private ExpInfo exp;
	private Integer state;
	
	public ProjInfo getProj() {
		return proj;
	}
	public void setProj(ProjInfo proj) {
		this.proj = proj;
	}
	public ExpInfo getExp() {
		return exp;
	}
	public void setExp(ExpInfo exp) {
		this.exp = exp;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
}

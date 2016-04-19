package com.expertscan.data;

import java.io.Serializable;

import org.hibernate.Session;

public class ProjExpCompleted implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8352811089961021188L;
	
	
	private ProjInfo proj;
	private ExpInfo exp;
	private String commentsFromExp;
	private String commentsFromEnt;
	private Integer rateFromExp;
	private Integer rateFromEnt;
	
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
	public String getCommentsFromExp() {
		return commentsFromExp;
	}
	public void setCommentsFromExp(String commentsFromExp) {
		this.commentsFromExp = commentsFromExp;
	}
	public String getCommentsFromEnt() {
		return commentsFromEnt;
	}
	public void setCommentsFromEnt(String commentsFromEnt) {
		this.commentsFromEnt = commentsFromEnt;
	}
	public Integer getRateFromExp() {
		return rateFromExp;
	}
	public void setRateFromExp(Integer rateFromExp) {
		this.rateFromExp = rateFromExp;
	}
	public Integer getRateFromEnt() {
		return rateFromEnt;
	}
	public void setRateFromEnt(Integer rateFromEnt) {
		this.rateFromEnt = rateFromEnt;
	}
	
	public boolean migrateFrom(ProjExpOngoing relation){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		this.proj = session.load(ProjInfo.class, relation.getProj().getProjid());
		this.exp = session.load(ExpInfo.class, relation.getExp().getExpid());
		this.commentsFromEnt = "尚未评论";
		this.commentsFromExp = "尚未评论";
		this.rateFromEnt = -1;
		this.rateFromExp = -1;

		session.saveOrUpdate(this);
		
		session.getTransaction().commit();
		return true;
	}
}

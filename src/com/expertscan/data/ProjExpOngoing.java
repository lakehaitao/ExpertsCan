package com.expertscan.data;

import java.io.Serializable;

import org.hibernate.Session;

public class ProjExpOngoing implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7470334213989782432L;
	
	
	private ProjInfo proj;
	private ExpInfo exp;
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
	
	
	public boolean migrateFrom(ProjExpTendering relation){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		this.proj = session.load(ProjInfo.class, relation.getProj().getProjid());
		this.exp = session.load(ExpInfo.class, relation.getExp().getExpid());

		session.saveOrUpdate(this);
		
		session.getTransaction().commit();
		return true;
	}
}

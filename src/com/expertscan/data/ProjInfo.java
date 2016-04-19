package com.expertscan.data;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Session;

public class ProjInfo {
	
	private Integer projid;
	private String title;
	private String description;
	private Date releaseDate;
	private String expense;
	private EntInfo enterprise;
	private Integer state;
	
	private Set<ProjExpTendering> expertsTendering = new HashSet<ProjExpTendering>();
	private Set<ProjExpOngoing> expertsOngoing = new HashSet<ProjExpOngoing>();
	private Set<ProjExpCompleted> expertsCompleted = new HashSet<ProjExpCompleted>();
	
	public Set<ProjExpCompleted> getExpertsCompleted() {
		return expertsCompleted;
	}
	public void setExpertsCompleted(Set<ProjExpCompleted> expertsCompleted) {
		this.expertsCompleted = expertsCompleted;
	}
	public Set<ProjExpOngoing> getExpertsOngoing() {
		return expertsOngoing;
	}
	public void setExpertsOngoing(Set<ProjExpOngoing> expertsOngoing) {
		this.expertsOngoing = expertsOngoing;
	}
	public Set<ProjExpTendering> getExpertsTendering() {
		return expertsTendering;
	}
	public void setExpertsTendering(Set<ProjExpTendering> expertsTendering) {
		this.expertsTendering = expertsTendering;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getProjid() {
		return projid;
	}
	public void setProjid(Integer projid) {
		this.projid = projid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getExpense() {
		return expense;
	}
	public void setExpense(String expense) {
		this.expense = expense;
	}
	public EntInfo getEnterprise() {
		return enterprise;
	}
	public void setEnterprise(EntInfo enterprise) {
		this.enterprise = enterprise;
	}

	
	public boolean insertNew(int entid){
		releaseDate = new Date();
		state = 0;
		
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		EntInfo ent = session.load(EntInfo.class, entid);
		enterprise = ent;
		
		session.save(this);
		Hibernate.initialize(getEnterprise());
		session.getTransaction().commit();
		return true;
	}
	
	
	public boolean insertToDB(){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		
		session.beginTransaction();
		session.save(this);
		session.getTransaction().commit();
		return true;
	}
	
	
	public static ProjInfo retrieveById(int projid, boolean needLoad){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ProjInfo proj = session.load(ProjInfo.class, projid);
		
		if(needLoad){
			Hibernate.initialize(proj.getEnterprise());
			
			switch(proj.getState()){
			case 0:
				Hibernate.initialize(proj.getExpertsTendering());
				break;
			case 1:
				Hibernate.initialize(proj.getExpertsOngoing());
				break;
			case 2:
				Hibernate.initialize(proj.getExpertsCompleted());
				break;
			}
			
		}
		
		session.getTransaction().commit();
		return proj;
	}
	
	public boolean changeState(Integer state){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ProjInfo project = session.load(ProjInfo.class, projid);
		project.setState(state);
		
		session.update(project);
		session.getTransaction().commit();
		return true;
	}
}

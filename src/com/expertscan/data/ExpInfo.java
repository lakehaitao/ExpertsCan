package com.expertscan.data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

public class ExpInfo {
	private Integer expid;
	private String email;
	private String password;
	private String name;
	private String description;
	private String experience;
	private String portrait;
	private String phone0;
	private String email1;
	private Boolean isPublic;
	private Float rate;
	private Set<ProjInfo> projectsBidding = new HashSet<ProjInfo>();
	private Set<ProjInfo> projectsOngoing = new HashSet<ProjInfo>();
	private Set<ProjInfo> projectsCompleted = new HashSet<ProjInfo>();
		
	
	public Float getRate() {
		return rate;
	}
	public void setRate(Float rate) {
		this.rate = rate;
	}
	public Set<ProjInfo> getProjectsBidding() {
		return projectsBidding;
	}
	public void setProjectsBidding(Set<ProjInfo> projectsBidding) {
		this.projectsBidding = projectsBidding;
	}
	public Set<ProjInfo> getProjectsOngoing() {
		return projectsOngoing;
	}
	public void setProjectsOngoing(Set<ProjInfo> projectsOngoing) {
		this.projectsOngoing = projectsOngoing;
	}
	public Set<ProjInfo> getProjectsCompleted() {
		return projectsCompleted;
	}
	public void setProjectsCompleted(Set<ProjInfo> projectsCompleted) {
		this.projectsCompleted = projectsCompleted;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getPortrait() {
		return portrait;
	}
	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	public String getPhone0() {
		return phone0;
	}
	public void setPhone0(String phone0) {
		this.phone0 = phone0;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public Boolean getIsPublic() {
		return isPublic;
	}
	public void setIsPublic(Boolean isPublic) {
		this.isPublic = isPublic;
	}
	public Integer getExpid() {
		return expid;
	}
	public void setExpid(Integer expid) {
		this.expid = expid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public List<?> retrieve(String email){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from ExpInfo e where e.email ='" + email + "'");
		List<?> result = q.list();
		
		if(result.size()!=0){
			ExpInfo exp = (ExpInfo) result.get(0);
			Hibernate.initialize(exp.getProjectsBidding());
			Hibernate.initialize(exp.getProjectsOngoing());
			Hibernate.initialize(exp.getProjectsCompleted());
		}
		
		session.getTransaction().commit();
		return result;
	}
	
	public boolean insertToDB(){
		this.rate = Float.valueOf(5);
		
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		
		session.beginTransaction();
		session.save(this);
		session.getTransaction().commit();
		return true;
	}
	
	public boolean update(){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();	
		session.beginTransaction();
		session.update(this);
		session.getTransaction().commit();
		return true;
	}
	
	public boolean refresh(){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from ExpInfo e where e.expid ='" + expid + "'");
		List<?> result = q.list();
		
		if(result.size()!=0){
			ExpInfo exp = (ExpInfo) result.get(0);
			Hibernate.initialize(exp.getProjectsBidding());
			Hibernate.initialize(exp.getProjectsOngoing());
			Hibernate.initialize(exp.getProjectsCompleted());
			setAs(exp);
		}
		
		session.getTransaction().commit();
		return result.size()!=0;
	}
	
	private void setAs(ExpInfo exp){
		this.description = exp.description;
		this.email = exp.email;
		this.email1 = exp.email1;
		this.experience = exp.experience;
		this.expid = exp.expid;
		this.isPublic = exp.isPublic;
		this.name = exp.name;
		this.password = exp.password;
		this.phone0 = exp.phone0;
		this.portrait = exp.portrait;
		this.projectsBidding = exp.getProjectsBidding();
		this.projectsCompleted = exp.getProjectsCompleted();
		this.projectsOngoing = exp.getProjectsOngoing();
		this.rate = exp.getRate();
	}
	
	public static ExpInfo retrieveById(int expid, boolean needLoad){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ExpInfo exp = session.load(ExpInfo.class, expid);
		
		if(needLoad){
			Hibernate.initialize(exp.getProjectsBidding());
			Hibernate.initialize(exp.getProjectsOngoing());
			Hibernate.initialize(exp.getProjectsCompleted());
		}
		
		session.getTransaction().commit();
		return exp;
	}
	
	
	public boolean updateRate(Integer expid){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ExpInfo expert = session.load(ExpInfo.class, expid);
		if(expert == null){
			return false;
		}
		float score = 0;
		int count = 0;
		for(ProjInfo project: expert.getProjectsCompleted()){
			for(ProjExpCompleted relation:project.getExpertsCompleted()){
				if(relation.getRateFromEnt() >= 0){
					score +=relation.getRateFromEnt();
					count++;
				}
			}
		}
		if(count > 0){
			expert.setRate(score / count);
		}else{
			expert.setRate(Float.valueOf(5));
		}
		System.out.println("ddddd:" + score);
		session.update(expert);
		session.getTransaction().commit();
		return true;
	}
}

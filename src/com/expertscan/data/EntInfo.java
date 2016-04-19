package com.expertscan.data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

public class EntInfo {
	private Integer entid;
	private String email;
	private String password;
	private String name;
	private String address;
	private String email1;
	private String phone0;
	private String description;
	private String logo;
	private Integer rate;
	private Set<ProjInfo> projects = new HashSet<ProjInfo>();	
	
	public Integer getRate() {
		return rate;
	}
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	public Set<ProjInfo> getProjects() {
		return projects;
	}
	public void setProjects(Set<ProjInfo> projects) {
		this.projects = projects;
	}
	public Integer getEntid() {
		return entid;
	}
	public void setEntid(Integer entid) {
		this.entid = entid;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getPhone0() {
		return phone0;
	}
	public void setPhone0(String phone0) {
		this.phone0 = phone0;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	


	public List<?> retrieve(String email){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from EntInfo e where e.email ='" + email + "'");
		List<?> result = q.list();
		
		if(result.size()!=0){
			EntInfo ent = (EntInfo) result.get(0);
			Hibernate.initialize(ent.getProjects());
		}
		
		session.getTransaction().commit();
		return result;
	}
	
	public List<?> retrieveById(int entid, boolean needLoad){
		Session session = HibernateHelpUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from EntInfo e where e.entid ='" + entid + "'");
		List<?> result = q.list();
		
		if(result.size()!=0){
			EntInfo ent = (EntInfo) result.get(0);
			if(needLoad){
				Hibernate.initialize(ent.getProjects());
			}
		}
		
		session.getTransaction().commit();
		return result;
	}
	
	
	public boolean insertToDB(){
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
		Query q = session.createQuery("from EntInfo e where e.entid ='" + entid + "'");
		List<?> result = q.list();
		
		if(result.size()!=0){
			EntInfo ent = (EntInfo) result.get(0);
			Hibernate.initialize(ent.getProjects());
			setAs(ent);
		}
		
		session.getTransaction().commit();
		return result.size()!=0;
	}
	
	private void setAs(EntInfo ent){
		this.address = ent.address;
		this.description = ent.description;
		this.email = ent.email;
		this.email1 = ent.email1;
		this.entid = ent.entid;
		this.logo = ent.logo;
		this.name = ent.name;
		this.password = ent.password;
		this.phone0 = ent.phone0;
		this.projects = ent.getProjects();
	}
	
	public Set<ProjInfo> getProjectsTendering() {
		Set<ProjInfo> projectsTendering = new HashSet<ProjInfo>();
		for(ProjInfo p : projects){
			if(p.getState().equals(0))
				projectsTendering.add(p);
		}
		return projectsTendering;
	}
	
	public Set<ProjInfo> getProjectsOngoing() {
		Set<ProjInfo> projectsOngoing = new HashSet<ProjInfo>();
		for(ProjInfo p : projects){
			if(p.getState().equals(1))
				projectsOngoing.add(p);
		}
		return projectsOngoing;
	}
	
	public Set<ProjInfo> getProjectsCompleted() {
		Set<ProjInfo> projectsCompleted = new HashSet<ProjInfo>();
		for(ProjInfo p : projects){
			if(p.getState().equals(2))
				projectsCompleted.add(p);
		}
		return projectsCompleted;
	}

}

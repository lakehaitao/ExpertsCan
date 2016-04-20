package com.expertscan.web.action.project;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.business.project.CommentService;
import com.expertscan.data.ExpInfo;
import com.expertscan.data.ProjInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentOnProject extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -267453909044427297L;
	
	private Integer expid;
	private Integer projid;
	private String commentsFromExp;
	private Integer rateFromExp;
	private String commentsFromEnt;
	private Integer rateFromEnt;
	
	private com.expertscan.business.expert.UserValidation expValidator;
	private com.expertscan.business.enterprise.UserValidation entValidator;
	private CommentService service;
	private Map<String, Object> session;
	private HttpServletRequest request;
	
	
	public CommentService getService() {
		return service;
	}
	public void setService(CommentService service) {
		this.service = service;
	}
	public Integer getExpid() {
		return expid;
	}
	public void setExpid(Integer expid) {
		this.expid = expid;
	}
	public Integer getProjid() {
		return projid;
	}
	public void setProjid(Integer projid) {
		this.projid = projid;
	}
	public String getCommentsFromExp() {
		return commentsFromExp;
	}
	public void setCommentsFromExp(String commentsFromExp) {
		this.commentsFromExp = commentsFromExp;
	}
	public Integer getRateFromExp() {
		return rateFromExp;
	}
	public void setRateFromExp(Integer rateFromExp) {
		this.rateFromExp = rateFromExp;
	}
	public String getCommentsFromEnt() {
		return commentsFromEnt;
	}
	public void setCommentsFromEnt(String commentsFromEnt) {
		this.commentsFromEnt = commentsFromEnt;
	}
	public Integer getRateFromEnt() {
		return rateFromEnt;
	}
	public void setRateFromEnt(Integer rateFromEnt) {
		this.rateFromEnt = rateFromEnt;
	}
	public com.expertscan.business.expert.UserValidation getExpValidator() {
		return expValidator;
	}
	public void setExpValidator(com.expertscan.business.expert.UserValidation expValidator) {
		this.expValidator = expValidator;
	}
	public com.expertscan.business.enterprise.UserValidation getEntValidator() {
		return entValidator;
	}
	public void setEntValidator(com.expertscan.business.enterprise.UserValidation entValidator) {
		this.entValidator = entValidator;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	public CommentOnProject(){
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
	}
	
	@Override
	public String execute() throws Exception {
		String userType = (String) session.get("userType");
		switch(userType){
		case "enterprise":
			return handleEnterprise();
		case "expert":
			return handleExpert();
			default:
				return ERROR;
		}
	}
	
	
	private String handleExpert(){
		ExpInfo expert = ExpInfo.retrieveById(expid, true);
		if(expert == null){
			return ERROR;
		}
		
		if( expValidator.isSelf(expert.getExpid(), session)
				&&service.commentFromExp(projid, expid, commentsFromExp, rateFromExp)){
			return SUCCESS;
		}
		return ERROR;
	}
	
	private String handleEnterprise(){
		ProjInfo project = ProjInfo.retrieveById(projid, true);
		if(project == null){
			return ERROR;
		}
		
		if( entValidator.isSelf(project.getEnterprise().getEntid(), session)
				&&service.commentFromEnt(projid, expid, commentsFromEnt, rateFromEnt)){
			return SUCCESS;
		}
		return ERROR;
		
	}

}

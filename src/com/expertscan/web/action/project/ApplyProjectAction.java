package com.expertscan.web.action.project;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.business.project.SetProjectExpertRelation;
import com.expertscan.data.ExpInfo;
import com.expertscan.data.ProjInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ApplyProjectAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8905796870971197909L;

	
	private Integer expid;
	private Integer projid;
	private Integer state;
	private com.expertscan.business.expert.UserValidation expValidator;
	private com.expertscan.business.enterprise.UserValidation entValidator;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private SetProjectExpertRelation service;
	
	
	
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
	/**
	 *		getter/setter
	 */
	
	
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
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	
	
	
	public SetProjectExpertRelation getService() {
		return service;
	}
	public void setService(SetProjectExpertRelation service) {
		this.service = service;
	}
	public ApplyProjectAction(){
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
				&&service.setTendering(projid, expid, state)){
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
				&&service.setTendering(projid, expid, state)){
			return SUCCESS;
		}
		return ERROR;
	}
	
}

package com.expertscan.web.action.project;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.business.project.SetProjectState;
import com.expertscan.data.ProjInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SetStateAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8905796870971197909L;

	
	private Integer projid;
	private Integer state;
	private com.expertscan.business.enterprise.UserValidation entValidator;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private SetProjectState service;
	
	
	
	public SetProjectState getService() {
		return service;
	}
	public void setService(SetProjectState service) {
		this.service = service;
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
	
	
	public SetStateAction(){
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
	}
	
	
	@Override
	public String execute() throws Exception {
		ProjInfo project = ProjInfo.retrieveById(projid, true);
		if(project == null){
			return ERROR;
		}
		if( entValidator.isSelf(project.getEnterprise().getEntid(), session)
				&&service.set(projid, state)){
			return SUCCESS;
		}
		return ERROR;
	}
	
}

package com.expertscan.web.action.enterprise;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.data.ProjInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewProject extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2214971805476492554L;
	
	private com.expertscan.business.enterprise.NewProject newProjectService;
	
	private Map<String, Object> session;
	private HttpServletRequest request;
	
	private String title;
	private String description;
	private String expense;
	private Integer entid;
	
	
	
	public Integer getEntid() {
		return entid;
	}


	public void setEntid(Integer entid) {
		this.entid = entid;
	}


	public com.expertscan.business.enterprise.NewProject getNewProjectService() {
		return newProjectService;
	}


	public void setNewProjectService(com.expertscan.business.enterprise.NewProject newProjectService) {
		this.newProjectService = newProjectService;
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


	public String getExpense() {
		return expense;
	}


	public void setExpense(String expense) {
		this.expense = expense;
	}





	public Map<String, Object> getSession() {
		return session;
	}


	public NewProject() {
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		
		request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
	}
	
	@Override
	public String execute() throws Exception {
		if(session.get("userType").equals("enterprise")){
			ProjInfo project = newProjectService.establish(this);
			
			if(project == null){
				return ERROR;
			}else{
				request.setAttribute("information", project);
				return SUCCESS;
			}
		}else{
			return ERROR;
		}
	}

}

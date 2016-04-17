package com.expertscan.web.action.project;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.business.enterprise.UserValidation;
import com.expertscan.data.ProjInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InfoByIdAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7011051844804932435L;
	
	private Integer projid;
	private UserValidation validator;
	private Map<String, Object> session;
	private HttpServletRequest request;
	
	public Map<String, Object> getSession() {
		return session;
	}

	public Integer getProjid() {
		return projid;
	}

	public UserValidation getValidator() {
		return validator;
	}

	public void setValidator(UserValidation validator) {
		this.validator = validator;
	}

	public void setProjid(Integer projid) {
		this.projid = projid;
	}
	
	public InfoByIdAction() {
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
	}

	
	@Override
	public String execute() throws Exception {
		
		ProjInfo proj = ProjInfo.retrieveById(projid, true);
		
		if(proj == null){
			return ERROR;
		}else{
			request.setAttribute("information", proj);
			if(validator.isSelf(proj.getEnterprise().getEntid(), session)){
				switch(proj.getState()){
				case 0:
					return "edit_tendering";
				case 1:
					return "edit_ongoing";
				case 2:
					return "edit_completed";
				default:
					return ERROR;
				}
			}else{
				switch(proj.getState()){
				case 0:
					return "show_tendering";
				case 1:
					return "show_ongoing";
				case 2:
					return "show_completed";
				default:
					return ERROR;
				}
			}
		}		
	}

}

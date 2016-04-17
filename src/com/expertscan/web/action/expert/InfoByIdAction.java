package com.expertscan.web.action.expert;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.business.expert.UserValidation;
import com.expertscan.data.ExpInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InfoByIdAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7011051844804932435L;
	
	private Integer expid;
	private UserValidation validator;
	private Map<String, Object> session;
	private HttpServletRequest request;
	
	public Integer getExpid() {
		return expid;
	}

	public void setExpid(Integer expid) {
		this.expid = expid;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public UserValidation getValidator() {
		return validator;
	}

	public void setValidator(UserValidation validator) {
		this.validator = validator;
	}

	
	public InfoByIdAction() {
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
	}

	
	@Override
	public String execute() throws Exception {
		
		ExpInfo expert = ExpInfo.retrieveById(expid, true);
		
		if(expert == null){
			return ERROR;
		}else{
			request.setAttribute("information", expert);
			if(validator.isSelf(expert.getExpid(), session)){
				return "self";
			}else if(expert.getIsPublic()){
				return SUCCESS;
			}else{
				return "anonymous";
			}
		}		
	}

}

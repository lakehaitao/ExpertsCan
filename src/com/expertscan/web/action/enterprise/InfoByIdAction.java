package com.expertscan.web.action.enterprise;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.expertscan.business.enterprise.UserValidation;
import com.expertscan.data.EntInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InfoByIdAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7011051844804932435L;
	
	private Integer entid;
	private UserValidation validator;
	private Map<String, Object> session;
	private HttpServletRequest request;
	
	public Map<String, Object> getSession() {
		return session;
	}

	public Integer getEntid() {
		return entid;
	}

	public UserValidation getValidator() {
		return validator;
	}

	public void setValidator(UserValidation validator) {
		this.validator = validator;
	}

	public void setEntid(Integer entid) {
		this.entid = entid;
	}
	
	public InfoByIdAction() {
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
	}

	
	@Override
	public String execute() throws Exception {
		
		if(validator.isSelf(entid, session)){
			return "self";
		}else{
			EntInfo ent = new EntInfo();
			List<?> result = ent.retrieve(entid);
			if(result.size() == 0){
				return ERROR;
			}else{
				request.setAttribute("information", result.get(0));
				return SUCCESS;
			}
		}		
	}

}

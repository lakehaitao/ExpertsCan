package com.expertscan.web.action.expert;

import java.util.Map;

import com.expertscan.data.ExpInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateInfo extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String description;
	private String experience;
	private String phone0;
	private String email1;
	private String isPublic;
	
	
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


	public String getIsPublic() {
		return isPublic;
	}


	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		ExpInfo expert = (ExpInfo)session.get("userInfo");
		
		expert.setName(name);
		expert.setDescription(description);
		expert.setExperience(experience);
		expert.setPhone0(phone0);
		expert.setEmail1(email1);
		if(isPublic != null){
			expert.setIsPublic(true);
		}else{
			expert.setIsPublic(false);
		}
		expert.update();
		
		return SUCCESS;
	}

}

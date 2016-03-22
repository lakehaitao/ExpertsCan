package com.expertscan.web.action.enterprise;

import java.util.Map;

import com.expertscan.data.EntInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateInfo extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String description;
	private String address;
	private String phone0;
	private String email1;
	
	
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


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
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


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		EntInfo expert = (EntInfo)session.get("userInfo");
		
		expert.setName(name);
		expert.setDescription(description);
		expert.setAddress(address);
		expert.setPhone0(phone0);
		expert.setEmail1(email1);

		expert.update();
		
		return SUCCESS;
	}

}

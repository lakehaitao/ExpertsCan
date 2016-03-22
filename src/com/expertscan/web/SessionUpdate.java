package com.expertscan.web;

import java.util.Map;

import com.expertscan.data.EntInfo;
import com.expertscan.data.ExpInfo;


/**
 * Maybe contain:
 * Key Name		Value Type		Possible Values
 * userType		String			enterprise/expert/visitor
 * userInfo		Object			EntInfo/ExpInfo
 * userName		String			name
 * 
 * @author hht
 *
 */
public class SessionUpdate {
	
	public boolean update(Map<String, Object> session, EntInfo ent){
		session.put("userType", "enterprise");
		session.put("userInfo", ent);
		session.put("userName", ent.getName());
		return true;
	}
	
	public boolean update(Map<String, Object> session, ExpInfo exp){
		session.put("userType", "expert");
		session.put("userInfo", exp);
		session.put("userName", exp.getName());
		return true;
	}
	
	public boolean clear(Map<String, Object> session){
		session.put("userType", "visitor");
		session.remove("userInfo");
		session.remove("userName");
		return true;
	}
}

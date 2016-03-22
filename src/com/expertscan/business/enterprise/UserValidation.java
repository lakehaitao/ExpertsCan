package com.expertscan.business.enterprise;

import java.util.List;
import java.util.Map;
import com.expertscan.data.EntInfo;
import com.expertscan.web.SessionUpdate;

public class UserValidation {
	
	/**
	 * 登录验证
	 * @param email
	 * @param loginPassword
	 * @param session
	 * @return	0	成功
	 * 			1	用户不存在
	 * 			2	密码错误
	 */
	public int check(String email, String password, Map<String, Object> session){
		EntInfo ent = new EntInfo();
		List<?> result = ent.retrieve(email);
		if(result.size() == 0){
			return 1;
		}else{
			ent = (EntInfo) result.get(0);
			if(ent.getPassword().equals(password)){
				SessionUpdate su = new SessionUpdate();
				su.update(session, ent);
				return 0;
			}else{
				return 2;
			}
		}
		
	}
	
	
	public boolean isSelf(Integer entid, Map<String, Object> session){
		String userType = (String) session.get("userType");
		if(userType.equals("enterprise")){
			int curID = ((EntInfo)session.get("userInfo")).getEntid();
			if(entid.equals(curID)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
}

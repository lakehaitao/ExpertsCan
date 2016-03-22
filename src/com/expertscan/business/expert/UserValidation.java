package com.expertscan.business.expert;

import java.util.List;
import java.util.Map;

import com.expertscan.data.ExpInfo;
import com.expertscan.data.ProjInfo;
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
		ExpInfo exp = new ExpInfo();
		List<?> result = exp.retrieve(email);
		if(result.size() == 0){
			return 1;
		}else{
			exp = (ExpInfo) result.get(0);
			if(exp.getPassword().equals(password)){
				SessionUpdate su = new SessionUpdate();
				su.update(session, exp);
				return 0;
			}else{
				return 2;
			}
		}
		
	}
}

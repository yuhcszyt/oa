package com.honganwei.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.po.TEmail;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class EmailAction extends BaseAction<TEmail>{
	
	@Autowired
	private UserService userService;
	
	/*public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
*/
/*	
	public String writeEmail(){
		
		List<TUser>list = userService.find();
		ActionContext.getContext().put("userList",list);
		return "write";
	}*/
}

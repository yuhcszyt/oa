package com.honganwei.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.po.TUser;
import com.honganwei.service.UserService;

public class UserAction extends BaseAction<TUser>{

	@Autowired
	private UserService userService;
	
	public String updateUser(){
		
		boolean flag=false;
		
		model.setUpdateTime(new Date());
		
		try {
			flag = userService.updateUser(model);
			sysResult.setOk("ok");
		} catch (Exception e) {
			sysResult.setMsg(ERROR);
		}
		
		return "json";
	}
	
}

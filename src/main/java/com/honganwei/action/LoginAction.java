package com.honganwei.action;



import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
import com.honganwei.service.base.BaseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;




public  class LoginAction extends BaseAction<TUser>{

	private String result;
	
	@Autowired
	private UserService userService;
	
	private static  ObjectMapper MAPPER =new ObjectMapper(); 
	
	public String login(){
		
		TUser user =userService.login(model);
		
		if(user != null){
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			return HOME;
		}else{
			return LOGIN;
		}
	}

	
	public String updateUser(){
		
		
		return FINSH;
	}
	
	public String execute(){
		
		return SUCCESS;
	}
	
}


 
	  
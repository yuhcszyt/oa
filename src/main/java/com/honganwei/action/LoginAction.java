package com.honganwei.action;



import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
import com.honganwei.service.base.BaseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;




public  class LoginAction extends BaseAction<TUser>{

	@Autowired
	private UserService userService;
	
	
	public String login(){
		
		TUser user =userService.login(model);
		
		if(user != null){
			//登录成功,将user对象放入session，跳转到首页
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			return HOME;
		}else{
			//登录失败，,设置提示信息，跳转到登录页面
			//输入的验证码错误,设置提示信息，跳转到登录页面
			this.addActionError("用户名或者密码输入错误！");
			return LOGIN;
		}
	}

	
	public String updateUser(){
		
		
		return FINSH;
	}
	
}


 
	  
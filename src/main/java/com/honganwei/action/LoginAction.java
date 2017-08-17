package com.honganwei.action;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
<<<<<<< HEAD
=======
import com.honganwei.service.base.BaseService;
>>>>>>> branch 'master' of https://github.com/yuhcszyt/oa
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;







public  class LoginAction extends BaseAction<TUser>{

	private TUser tuser=new TUser();
	@Override
	public TUser getModel() {
		// TODO Auto-generated method stub
		return tuser;
	}
	


	@Autowired
	private UserService userService;
	
	

	public String login(){
		
	Boolean	result=userService.login(tuser);
		if(result==false){
			this.addFieldError("", "用户密码错误！");
			return "login";
		}
		
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




 
	  
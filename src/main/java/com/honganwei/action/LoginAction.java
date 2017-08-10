package com.honganwei.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import pojo.TUser;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport implements ModelDriven<TUser>{

	
	private TUser user;
	

	public String login(){
		/* TUser user = userService.login(model);
		 
		 if(user != null){
				//登录成功,将user对象放入session，跳转到首页
				ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
				return HOME;
			}else{
				//登录失败，,设置提示信息，跳转到登录页面
				//输入的验证码错误,设置提示信息，跳转到登录页面
				this.addActionError("用户名或者密码输入错误！");
				return LOGIN;*/
		 System.out.println(user.getUsername());
		 return "login";
	}

	@Override
	public TUser getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}


 
	  
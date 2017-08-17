package com.honganwei.action;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public  class LoginAction extends ActionSupport implements ModelDriven<TUser>{

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
			this.addFieldError("", "”√ªß√‹¬Î¥ÌŒÛ£°");
			return "login";
		}
		
		return "login";
	}

}




 
	  
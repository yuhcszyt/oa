package com.honganwei.action;





import org.springframework.beans.factory.annotation.Autowired;




import org.apache.struts2.ServletActionContext;


import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;









public  class LoginAction extends ActionSupport implements ModelDriven<TUser>{


	private TUser user = new TUser();
	
	@Autowired
	private UserService userService;
	
	

	public String login(){
		
	
		
		TUser user1 =userService.login(user);
		
		if(user1 != null){
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user1);
			return "home";
		}else{
			this.addFieldError("","wahaha");
			return LOGIN;
		}
	}

	
	public String updateUser(){
		
		
		return "finsh";
	}


	@Override
	public TUser getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	

}




 
	  
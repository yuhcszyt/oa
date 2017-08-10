package com.honganwei.action;





import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



import com.honganwei.po.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public  class LoginAction extends ActionSupport implements ModelDriven<TUser>{

	@Override
	public TUser getModel() {
		// TODO Auto-generated method stub
		return null;

	}


	public String login(){
		
		return "login";
	}

}




 
	  
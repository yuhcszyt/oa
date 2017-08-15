package com.honganwei.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
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
	
	public String writeEmail(){
		
		List<TUser>list = userService.find();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("userList",list);
		//ActionContext.getContext().put("userlist", list);
		return "write";
	}
	
	
	public String insertEmail(){
		
		return "write";
	}
	
	
}

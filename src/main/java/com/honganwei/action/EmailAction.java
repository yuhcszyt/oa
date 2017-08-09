package com.honganwei.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.mapper.UserMapper;
import com.honganwei.po.TEmail;
import com.honganwei.po.TUser;
import com.opensymphony.xwork2.ActionContext;

public class EmailAction extends BaseAction<TEmail>{
	
	@Autowired
	private UserMapper userMapper;
	
	
	public String writeEmail(){
		
		List<TUser>list = userMapper.findAll();
		
		ActionContext.getContext().put("userList",list);
		
		return "write";
	}
	
}

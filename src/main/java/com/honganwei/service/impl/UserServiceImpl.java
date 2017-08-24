package com.honganwei.service.impl;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honganwei.mapper.UserMapper;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;


	@Override
	public TUser login(TUser user) {
		return userMapper.selectUserByID(user);
	}


	/**
	 * 查询所有的用户
	 */
	public List<TUser> find() {
		return userMapper.findAll();
}


	/*编辑用户*/
	public void editUser(String username, TUser model) {
		
		userMapper.editUser(username, model);
	}


	
	
	
	
	
	

	



}


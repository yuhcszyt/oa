package com.honganwei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honganwei.mapper.UserMapper;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;

@Service
public class UserServiceImpl implements UserService<TUser>{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<TUser> find() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(TUser t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(TUser t) {
		// TODO Auto-generated method stub
		
	}
	
}

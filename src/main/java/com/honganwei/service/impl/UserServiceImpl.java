package com.honganwei.service.impl;

import java.util.List;

import com.honganwei.mapper.UserMapper;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;


public class UserServiceImpl implements UserService<TUser>{

	private UserMapper userMapper;
	
	@Override
	public List<TUser> find() {
		return userMapper.findAll();
	}

	@Override
	public void update(TUser t) {
		userMapper.update(t);
	}

	@Override
	public void delete(TUser t) {
		userMapper.delete(t);
	}
}

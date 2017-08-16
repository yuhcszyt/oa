package com.honganwei.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
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
	
}

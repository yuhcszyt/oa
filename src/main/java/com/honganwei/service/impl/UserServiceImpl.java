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

	@Override
	public boolean login(TUser user) {
		
		List<TUser> tuser=userMapper.findUserByName(user);
		TUser getUser=null;
		
		if(tuser!=null&&tuser.size()>0){
			getUser=tuser.get(0);
		}
		if(getUser!=null){
			
			if(tuser!=null && user.getPassword().equals(getUser.getPassword()) ){
				return true;
			}
			
			
		}
	
		
		return false;
	}




	}
	


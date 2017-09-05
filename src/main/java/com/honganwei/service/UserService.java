package com.honganwei.service;

import java.util.List;



import com.honganwei.po.TUser;
import com.honganwei.service.base.BaseService;





public interface UserService {

	public TUser login(TUser user);
	
	public List<TUser> find();
	

	boolean updateUser(TUser user);

}


package com.honganwei.service;

import java.util.List;



import com.honganwei.po.TUser;





public interface UserService {

	public TUser login(TUser user);
	
	public List<TUser> find();

	public void editUser(String username, TUser model);

}


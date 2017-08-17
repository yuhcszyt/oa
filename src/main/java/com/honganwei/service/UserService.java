package com.honganwei.service;

import com.honganwei.po.TUser;
import com.honganwei.service.base.BaseService;

public interface UserService<T> extends BaseService<T> {

	public boolean login(TUser user);
	
}


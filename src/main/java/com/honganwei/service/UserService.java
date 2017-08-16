package com.honganwei.service;

import org.springframework.stereotype.Service;

import com.honganwei.po.TUser;
import com.honganwei.service.base.BaseService;


public interface UserService {

	public TUser login(TUser user);
}

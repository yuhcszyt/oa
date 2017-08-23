package com.honganwei.mapper;

import java.util.List;



import com.honganwei.po.TUser;

public interface UserMapper{




	public TUser selectUserByID(TUser user);

	public List<TUser> findAll();

}


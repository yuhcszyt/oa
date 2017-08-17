package com.honganwei.mapper;

import java.util.List;

<<<<<<< HEAD
import com.honganwei.mapper.base.mapper.BaseMapper;
=======
>>>>>>> branch 'master' of https://github.com/yuhcszyt/oa
import com.honganwei.po.TUser;

public interface UserMapper{

<<<<<<< HEAD

	public List<TUser> findUserByName(TUser user);
=======
	public TUser selectUserByID(TUser user);

	public List<TUser> findAll();
>>>>>>> branch 'master' of https://github.com/yuhcszyt/oa
}


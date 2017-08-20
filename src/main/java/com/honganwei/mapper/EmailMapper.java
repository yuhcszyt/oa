package com.honganwei.mapper;

import java.util.List;

import com.honganwei.mapper.base.mapper.BaseMapper;
import com.honganwei.po.TEmail;

public interface EmailMapper extends BaseMapper<TEmail>{
	
	public TEmail selectById(int id);

	public void updateIsDelete(Integer id);

}

package com.honganwei.mapper;

import java.util.List;
import java.util.Map;

import com.honganwei.mapper.base.mapper.BaseMapper;
import com.honganwei.po.TEmail;

public interface EmailMapper extends BaseMapper<TEmail>{
	
	public TEmail selectById(int id);

	public List<TEmail> selectByPage(Map map);

	/**
	 * 根据接受人,查询接受的数量
	 * @param recipients
	 * @return
	 */
	public int findCount(String recipients);

	
	public void  updateIsDelete(TEmail email);
	
}

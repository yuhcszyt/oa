package com.honganwei.mapper.base.mapper;

import java.util.List;

public interface BaseMapper<T> {

	public List<T> findAll();
	
	public void insert(T t);
	
	public void delete(T t);
	
	public void update(T t);
	
	
}

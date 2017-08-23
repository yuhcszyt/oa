package com.honganwei.service.base;

import java.util.List;

public interface BaseService<T>{

	public List<T> find();
	
	public void update(T t);
	
	public boolean delete(T t);
	
	public void insert(T t);
}

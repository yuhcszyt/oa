package com.honganwei.service;

import com.honganwei.service.base.BaseService;

public interface EmailService<T> extends BaseService<T>{

	public void writeEmail(T t);
}

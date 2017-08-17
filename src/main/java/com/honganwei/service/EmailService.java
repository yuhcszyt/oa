package com.honganwei.service;

import java.io.File;

import com.honganwei.po.TEmail;
import com.honganwei.service.base.BaseService;

public interface EmailService<T> extends BaseService<T>{

	public void writeEmail(T t);
	
	public TEmail upload(File uploadFile,String uploadFileFileName,String uploadFileContentType);
	
	public TEmail findEmailById(int id);
	
}

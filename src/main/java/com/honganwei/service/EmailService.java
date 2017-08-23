package com.honganwei.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.honganwei.po.TEmail;
import com.honganwei.service.base.BaseService;

import util.PageBean;

public interface EmailService<T> extends BaseService<T>{

	public void writeEmail(T t);
	
	public TEmail upload(File uploadFile,String uploadFileFileName,String uploadFileContentType);
	
	public TEmail findEmailById(int id);
	
	/**
	 * 分页查询.
	 * @param email
	 * @param pageNum 当前页
	 * @return
	 */
	PageBean<TEmail> findEmailByPage(TEmail email, int pageNum);
	/**
	 * 更新删除状态
	 * @param email
	 * @return
	 */
	public boolean updateIsdelete(TEmail  email);

	public PageBean<TEmail> findJunkEmailByPage(TEmail model, int pageNum);
	
}

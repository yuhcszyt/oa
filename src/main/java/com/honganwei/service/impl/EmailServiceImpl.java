package com.honganwei.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honganwei.mapper.EmailMapper;
import com.honganwei.po.TEmail;
import com.honganwei.service.EmailService;

import util.PageBean;

@Service
public class EmailServiceImpl implements EmailService<TEmail>{

	@Autowired
	private EmailMapper emailMapper;

	/**
	 * 查询全部的email信息
	 */
	public List<TEmail> find() {
		
		return emailMapper.findAll();
	}

	@Override
	public void update(TEmail t) {
		
		emailMapper.update(t);
	}

	@Override
	public void delete(TEmail t) {
		emailMapper.update(t);
	}

	@Override
	public void insert(TEmail t) {
		
		
		
	}

	@Override
	public void writeEmail(TEmail t) {

		TEmail email=new TEmail();
		
		email.setRecipients(t.getRecipients());
		email.setSender(t.getSender());
		email.setTitle(t.getTitle());
		email.setContent(t.getContent());
		email.setEnclosure(t.getEnclosure());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			email.setSendTime(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		email.setIsRead(0);
		email.setIsdelete(0);
		email.setReadtime(null);
		emailMapper.insert(email);
	}
	
	
	public TEmail upload(File uploadFile,String uploadFileFileName,String uploadFileContentType){
		
		System.out.println("fileName:"+uploadFileFileName);
        System.out.println("contentType:"+uploadFileContentType);
        System.out.println("File:"+uploadFile);
        
        //获取要保存文件夹的物理路径(绝对路径)
        String realPath=ServletActionContext.getServletContext().getRealPath("/upload");
        File file = new File(realPath);
        
        //测试此抽象路径名表示的文件或目录是否存在。若不存在，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
        if(!file.exists())file.mkdirs();
        
        try {
            //保存文件
            FileUtils.copyFile(uploadFile, new File(file,uploadFileFileName));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        TEmail email=new TEmail();
        email.setEnclosure(file+System.getProperty("file.separator")+uploadFileFileName);
		return email;
	}

	
	
	public TEmail findEmailById(int id){
		
		TEmail email = emailMapper.selectById(id);
		
		return email;
		
	}

	@Override
	public PageBean<TEmail> findEmailByPage(TEmail email,int pageNum) {
		
		int totalRecord=emailMapper.findCount(email.getRecipients());
		
		Map map =new HashMap<String,Object>();
		PageBean page=new PageBean<TEmail>(pageNum, 6, totalRecord);
		map.put("page",page);
 	    
		map.put("email",email);
		
		List<TEmail> list =emailMapper.selectByPage(map);
		page.setData(list);
		
		return page;
	}

	
	/**
	 * @param email
	 * @return
	 */
	public boolean updateIsdelete(TEmail  email){
		
		try {
			emailMapper.updateIsDelete(email);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}

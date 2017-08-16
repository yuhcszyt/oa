package com.honganwei.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honganwei.mapper.UserMapper;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;

@Service
public class UserServiceImpl implements UserService<TUser>{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<TUser> find() {
		return userMapper.findAll();
	}

	@Override
	public void update(TUser t) {
		userMapper.update(t);
	}

	@Override
	public void delete(TUser t) {
		userMapper.delete(t);
	}

	@Override
	public void insert(TUser t) {
		// TODO Auto-generated method stub
		
	}

	
	public boolean transferto(File file,String fileFileName) throws IOException{
		
		 String root = ServletActionContext.getServletContext().getRealPath("/upload");
	        
	        InputStream is = new FileInputStream(file);
	        
	        OutputStream os = new FileOutputStream(new File(root, fileFileName));
	        System.out.println("fileFileName: " + fileFileName);

	     // 因为file是存放在临时文件夹的文件，我们可以将其文件名和文件路径打印出来，看和之前的fileFileName是否相同
	        System.out.println("file: " + file.getName());
	        System.out.println("file: " + file.getPath());
	        
	        byte[] buffer = new byte[500];
	        int length = 0;
	        
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        
	        os.close();
	        is.close();
	        
			return false;
		
	}
	
	
	
	
	
	
}

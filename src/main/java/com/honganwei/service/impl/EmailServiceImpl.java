package com.honganwei.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honganwei.mapper.EmailMapper;
import com.honganwei.po.TEmail;
import com.honganwei.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService<TEmail>{

	@Autowired
	private EmailMapper emailMapper;

	/**
	 * 鏌ヨ鍏ㄩ儴鐨別mail淇℃伅
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
        
        //鑾峰彇瑕佷繚瀛樻枃浠跺す鐨勭墿鐞嗚矾寰�(缁濆璺緞)
        String realPath=ServletActionContext.getServletContext().getRealPath("/upload");
        File file = new File(realPath);
        
        //娴嬭瘯姝ゆ娊璞¤矾寰勫悕琛ㄧず鐨勬枃浠舵垨鐩綍鏄惁瀛樺湪銆傝嫢涓嶅瓨鍦紝鍒涘缓姝ゆ娊璞¤矾寰勫悕鎸囧畾鐨勭洰褰曪紝鍖呮嫭鎵�鏈夊繀闇�浣嗕笉瀛樺湪鐨勭埗鐩綍銆�
        if(!file.exists())file.mkdirs();
        
        try {
            //淇濆瓨鏂囦欢
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
	public void updateIsDelete(Integer id) {
		
		emailMapper.updateIsDelete(id);
	}


}

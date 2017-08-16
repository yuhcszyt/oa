package com.honganwei.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.po.TEmail;
import com.honganwei.po.TUser;
import com.honganwei.service.EmailService;
import com.honganwei.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class EmailAction extends BaseAction<TEmail>{
	
    private File uploadFile; //得到上传的文件
    private String uploadFileContentType; //得到文件的类型
    private String uploadFileFileName; //得到文件的名称
    
	private String content; //内容
    private String recipients;//收件人
    private String title;//标题
    
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailService<TEmail>emailService;
	
	/**
	 * 进入写邮件页面
	 * @return
	 */
	public String writeEmail(){
		
		List<TUser>list = userService.find();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("userList",list);
		return "write";
	}
	
	/**
	 * 提交一份新邮件
	 * @return
	 * @throws IOException 
	 */
		
	public String insertEmail() throws IOException{
		
		 
		TEmail email=emailService.upload(uploadFile, uploadFileFileName, uploadFileContentType);
        
		if(email!=null){
			model.setEnclosure(email.getEnclosure());
		}
		//获取用户
		TUser user=(TUser) ActionContext.getContext().getSession().get("user");
		if(user==null){
				model.setSender("小彭");
		}else{
			model.setSender(user.getUsername());;
		}
		emailService.writeEmail(model);
		
        return "success";
	}

	
	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	public String getRecipients() {
		return recipients;
	}

	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

    public String getContent() {
	  return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}

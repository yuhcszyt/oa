package com.honganwei.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.po.TEmail;
import com.honganwei.po.TUser;
import com.honganwei.service.EmailService;
import com.honganwei.service.UserService;
import com.opensymphony.xwork2.ActionContext;

import util.PageBean;

public class EmailAction extends BaseAction<TEmail>{
	
    private File  uploadFile; //得到上传的文件
    private String uploadFileContentType; //得到文件的类型
    private String uploadFileFileName; //得到文件的名称
    
	private String content; //内容
    private String recipients;//收件人
    private String title;//标题
    
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailService<TEmail>emailService;
	
	//接受当前页页数
	private int pageNum;
	

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
	
	
	
	/**
	 * 进入邮件信息页面
	 * @return
	 */
	public String emailInfo(){
		
		
		//由于小彭没把用户放在session暂且先这样写
		model.setRecipients("546345");
		
		//List<TEmail>emailList=emailService.find();
		PageBean<TEmail> page=emailService.findEmailByPage(model,pageNum);
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setAttribute("page",page);
		
		return "emailInfo";
	}
	
	
	
	
	/**
	 * 进去邮件详情页面
	 * @return
	 * @throws ParseException 
	 */
	public String emailInfoDetail() throws ParseException{
		
		TEmail email=emailService.findEmailById(model.getId());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//当前阅读时间
		email.setReadtime(sdf.parse(sdf.format(new Date())));
		
		HttpServletRequest request =ServletActionContext.getRequest();
		request.setAttribute("email", email);
		
		return "emailInfoDetail";
	}
	
	
	/**
	 * 下载附件
	 * @return
	 */
	public InputStream  getDownloadFile(){
		
		TEmail email=emailService.findEmailById(model.getId());
		
		String path=email.getEnclosure();
		//获取文件扩展名
		int contentIndex=path.lastIndexOf(".");
		String contentType=path.substring(contentIndex);
		
		//获取文件名
		int fileIndex=path.lastIndexOf(System.getProperty("file.separator"));
		String FileName=path.substring(fileIndex+1,contentIndex);
		
		return ServletActionContext.getServletContext().getResourceAsStream("upload/"+FileName+contentType) ; 
	//	Can not find a java.io.InputStream with the name [downloadFile] in the invocation stack. Check the <param name="inputName"> tag specified for this action.
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
	public int getPageNum() {

		return pageNum;
	}

	public void setPageNum(int pageNum) {
		
		this.pageNum = pageNum;
	}
	
}

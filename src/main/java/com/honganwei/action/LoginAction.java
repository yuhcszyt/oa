package com.honganwei.action;



import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;



public  class LoginAction extends BaseAction<TUser>{

	private String result;
	
	@Autowired
	private UserService userService;
	
	//private static  ObjectMapper MAPPER =new ObjectMapper(); 
	
	public String login() throws IOException{
		
		TUser user =userService.login(model);
		
		try {
			//String result=MAPPER.writeValueAsString(user);
			
			ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
			//3.2 发送
			//if(result==null||result.equals("")){
			//System.out.println(result);
			if(user!=null){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("flase");
			}
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public String updateUser(){
		
		
		return FINSH;
	}
	
	public String home(){
		
		return SUCCESS;
	}
	
	
	//一下是参考
	/*public String findAllWithDepartment() throws IOException{
		//1 查询
		List<CrmPost> allPost = this.postService.findAll(post.getDepartment());
		
		//2 将java对象 转换 json数据
		
		//2.1 排除不需要数据
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[]{"department","staffSet"});
		//2.2 转换
		String jsonData = JSONArray.fromObject(allPost,jsonConfig).toString();
		
		//3 将json数据发送给浏览器
		//3.1 响应中文乱码
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		//3.2 发送
		ServletActionContext.getResponse().getWriter().print(jsonData);
		
		return "none";
	}*/
	
}


 
	  
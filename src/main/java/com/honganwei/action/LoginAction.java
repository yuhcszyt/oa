package com.honganwei.action;




import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;
import com.opensymphony.xwork2.ActionContext;

import util.SysResult;

/**
 * 注释的代码是参考,故没有删除
 * @author yu
 *
 */
public  class LoginAction extends BaseAction<TUser>{


	@Autowired
	private UserService userService;
	
	
	
	//xiaopeng	start
	/*	TUser user =userService.login(model);
		
		if(user != null){
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			return HOME;
		}else{
			this.addActionError("haha");
			return LOGIN;
		}*/
	//end 	
		
		public String login() throws IOException{
			// 条件参数
			
			// 查询数据库
			//logger.info(condition);
			TUser user = userService.login(model);
			if(user!=null){
				SysResult result=new SysResult(user);
				String jsonData=MAPPER.writeValueAsString(result);
				
				 HttpServletResponse response=ServletActionContext.getResponse();  
				 response.setContentType("text/html;charset=utf-8"); 
				 
				 response.getWriter().println(jsonData);
				//写入session
				 ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
				// ActionContext.getContext().put("loginUser", user);
			}
			
		/*	JSONArray jsonuserlist = JsonUtil.fromObject(userlist);
			dataMap.put("rows", jsonuserlist);
			dataMap.put("total", jsonuserlist.size());
			logger.info(dataMap.toString());*/
			//[{"PHONE":"","AREAICODE":"1","NAME":"管理员","STOPFLAG":0,"EMAIL":"","ROW_NUMBER":1,"LOGINNAME":"admin","PASSWORD":"admin","ICODE":"1","NO":""}]
			// 写入session
			/*if(jsonuserlist.size()>0){
				String userdatajsonstr = jsonuserlist.get(0).toString();
				MANAGE_USEREntity userdata = (MANAGE_USEREntity) JsonUtil.toBean(userdatajsonstr,MANAGE_USEREntity.class);
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = (request).getSession(true);
				session.setAttribute("user", userdata);
				
				//查找地域信息并写入session
				condition = "{'ICODE':'"+userdata.getAREAICODE()+"'}";
				List<Map<String, Object>> arealist = imanage_areaservice.findByCondition(condition,0, 1);
				JSONArray jsonarealist = JsonUtil.fromObject(arealist);
				if(jsonarealist.size()>0){
					String areadatajsonstr = jsonarealist.get(0).toString();
					MANAGE_AREAEntity areadata = (MANAGE_AREAEntity) JsonUtil.toBean(areadatajsonstr,MANAGE_AREAEntity.class);				
					session.setAttribute("area", areadata);
				}
			}
			
			// 清空查询条件
			condition = null;*/
			return null;
		}
		

	public String home(){
		
		
		
		
		return HOME;
	}
	

}




 
	  
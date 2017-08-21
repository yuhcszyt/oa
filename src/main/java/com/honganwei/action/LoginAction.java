package com.honganwei.action;




import org.springframework.beans.factory.annotation.Autowired;
import org.apache.struts2.ServletActionContext;
import com.honganwei.po.TUser;
import com.honganwei.service.UserService;

public  class LoginAction extends BaseAction<TUser>{


	@Autowired
	private UserService userService;
	
	

	public String login(){
		
		
		TUser user =userService.login(model);
		
		if(user != null){
			//��¼�ɹ�,��user�������session����ת����ҳ
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			return HOME;
		}else{
			//��¼ʧ�ܣ�,������ʾ��Ϣ����ת����¼ҳ��
			//�������֤�����,������ʾ��Ϣ����ת����¼ҳ��
			this.addActionError("�û������������������");
			return LOGIN;
		}
	}

	
	public String updateUser(){
		
		
		return FINSH;
	}
	

}




 
	  
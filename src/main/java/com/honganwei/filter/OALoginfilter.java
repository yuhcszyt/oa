package com.honganwei.filter;

import com.honganwei.po.TUser;
import com.honganwei.utils.LoginUtil;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class OALoginfilter extends MethodFilterInterceptor {

	private static final String LOGIN = "login";

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		TUser user = LoginUtil.getLoginUser();
		if(user == null){
			return LOGIN;
		}
		
		return invocation.invoke();
	}

}

package com.honganwei.utils;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.honganwei.po.TUser;

public class LoginUtil {

public static HttpSession getSession(){
		
		return ServletActionContext.getRequest().getSession();
	}


public static TUser getLoginUser(){
	
	return (TUser) getSession().getAttribute("loginUser");

}

}
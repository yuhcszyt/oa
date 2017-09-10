package com.honganwei.action;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import util.SysResult;

public  abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T> {

	public static final ObjectMapper MAPPER =new ObjectMapper();
	
	public SysResult sysResult=new SysResult();
	
	
	public SysResult getSysResult() {
		return sysResult;
	}

	public void setSysResult(SysResult sysResult) {
		this.sysResult = sysResult;
	}



	public static final String HOME = "home";
	public static final String FINSH = "finsh";
	
	protected T model;
	public T getModel() {
		return model;
	}

	


	public BaseAction() {
		ParameterizedType genericSuperclass = (ParameterizedType) this.getClass().getGenericSuperclass();


		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		Class<T> entityClass = (Class<T>) actualTypeArguments[0];


		try {
			model = entityClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
}

package com.honganwei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honganwei.mapper.EmailMapper;
import com.honganwei.po.TEmail;
import com.honganwei.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService<TEmail>{

	@Autowired
	private EmailMapper emailMapper;

	@Override
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void writeEmail(TEmail t) {

		
	}

	


}

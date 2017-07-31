package com.njgo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.njgo.dao.MyPageDAO;

@Service
public class MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	public int profileUpdateBoth(String fileName, String info,String email){
		return myPageDAO.profileUpdateBoth(fileName,info,email);
	}

	public int profileUpdate_f(String fileName, String email) {
		
		return myPageDAO.profileUpdate_f(fileName,email);
	}
	
	public int profileUpdate_info(String info, String email){
		return myPageDAO.profileUpdate_info(info, email);
	}
	
}

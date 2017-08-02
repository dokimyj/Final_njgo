package com.njgo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.njgo.dao.MyPageDAO;
import com.njgo.dto.MemberDTO;

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

	public int userUpdate(MemberDTO memberDTO) {
		return myPageDAO.userUpdate(memberDTO);
	
	}

	public int userWarn(MemberDTO memberDTO) {
		
		return myPageDAO.userWarn(memberDTO);
	}

	public int userDelete(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return myPageDAO.userDelete(memberDTO);
	}

	public MemberDTO userSearch(MemberDTO memberDTO) {
		
		return myPageDAO.userSearch(memberDTO);
	}
	
}

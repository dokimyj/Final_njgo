package com.njgo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.MemberDAO;
import com.njgo.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	
	public int memberJoin(MemberDTO memberDTO){
		
		return memberDAO.memberJoin(memberDTO);
	}
	
	public MemberDTO emailCheck(String email){
		
		return memberDAO.emailCheck(email);
	}
	
	public MemberDTO nickNameCheck(String nickName){
		
		return memberDAO.nickNameCheck(nickName);
	}
	
}

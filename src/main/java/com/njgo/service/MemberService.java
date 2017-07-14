package com.njgo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.MemberDAO;
import com.njgo.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	// 회원가입 grade =0
	public int memberJoin(MemberDTO memberDTO){
		
		return memberDAO.memberJoin(memberDTO);
	}
	//이메일 중복체크
	public MemberDTO emailCheck(String email){
		
		return memberDAO.emailCheck(email);
	}
	//닉네임 중복체크
	public MemberDTO nickNameCheck(String nickName){
		
		return memberDAO.nickNameCheck(nickName);
	}
	
	// email 인증 검사
	public int emailConfirm(String joinCode,String email){
		
		return memberDAO.emailConfrim(joinCode,email);
	}
	
}

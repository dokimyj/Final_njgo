package com.njgo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.MemberDAO;
import com.njgo.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	// ========================== Login , Delete, Update 관련 =====================
	
	public MemberDTO memberLogin(String email, String pw){
		return memberDAO.memberLogin(email, pw);
	}
	
	public MemberDTO find_password(String email){
		return memberDAO.find_password(email);
	}
	
	// =========================== 회원 가입 관련 ================================
	
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
	public MemberDTO emailConfirm(String joinCode,String email){
		
		return memberDAO.emailConfrim(joinCode,email);
	}
	
}

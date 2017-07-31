package com.njgo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.njgo.dao.MemberDAO;
import com.njgo.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	// ========================== Login , Delete, Update 관련 =====================
	
	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO){
		return memberDAO.memberLogin(memberDTO);
	}
	// 비밀번호 찾기
	public MemberDTO find_password(String email){
		return memberDAO.find_password(email);
	}
	//회원 정보수정
	public int memberUpdate(String data, String type,String email){
		return memberDAO.memberUpdate(data, type, email);
	}
	// 회원탈퇴
	public int memberDelete(MemberDTO memberDTO) {
		
		return memberDAO.memberDelete(memberDTO);
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
	
	// email 인증 검사 완료 후 grade = 1
	public MemberDTO emailConfirm(String joinCode,String email){
		
		return memberDAO.emailConfrim(joinCode,email);
	}

	public MemberDTO kakaoIDCheck(String kakaoID) {
	
		return memberDAO.kakaoIDCheck(kakaoID);
	}
	public int memberSNSJoin(MemberDTO memberDTO) {
		
		return memberDAO.memberSNSJoin(memberDTO);
	}

	
	
}

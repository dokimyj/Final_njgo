package com.njgo.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="MemberMapper.";
	
	
	// ========================== Login , Delete, Update 관련 =====================
	//memberLogin
	public MemberDTO memberLogin(String email, String pw){
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("pw", pw);

		return sqlSession.selectOne(NAMESPACE+"memberLogin", map);
	}
	
	//find_password
	public MemberDTO find_password(String email){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		
		//email로 검색 
		return sqlSession.selectOne(NAMESPACE+"emailCheck", email);
	}
	
	//Delete
	public void memberDelete(){}
	
	//List
	public void memberList(){}
	
	//Update
	public int memberUpdate(String data, String type,String email){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("data", data);
		map.put("type", type);
		map.put("email", email);
		
		return sqlSession.update(NAMESPACE+"memberUpdate", map);
		
	}
	
	
	// =========================== 회원 가입 관련 ================================
	//join
	public int memberJoin(MemberDTO memberDTO){
		
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	
	//email중복체크
	public MemberDTO emailCheck(String email){
		return sqlSession.selectOne(NAMESPACE+"emailCheck", email);
	}

	//nickName 중복체크
	public MemberDTO nickNameCheck(String nickName) {
		
		return sqlSession.selectOne(NAMESPACE+"nickNameCheck", nickName);
	}

	
	//1. 이메일 인증 확인
	public MemberDTO emailConfrim(String joinCode,String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("joinCode", joinCode);
		map.put("email", email);
		//링크로 받아온 이메일 값 확인 
		//DB에는 joinCode가 미리 생성되있기때문에 링크로 받아온 joinCode와 일치할경우 성공
		MemberDTO memberDTO = sqlSession.selectOne(NAMESPACE+"emailConfirm", map);
		int result =0;
		//이메일 인증이 완료되면 grade 값 1로 변경 
		if(memberDTO != null){
			result = sqlSession.update(NAMESPACE+"join_success",map);
		}
		
		return memberDTO;
	}

	public MemberDTO kakaoIDCheck(String kakaoID) {
		
		return sqlSession.selectOne(NAMESPACE+"kakaoIDCheck", kakaoID);
	}	
}

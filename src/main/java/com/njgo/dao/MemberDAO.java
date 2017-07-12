package com.njgo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="MemberMapper.";
	
	//join
	public int memberJoin(MemberDTO memberDTO){
		
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	
	//Delete
	public void memberDelete(){}
	
	//List
	public void memberList(){}
	
	//Update
	public void memberUpdate(){}
	
	//중복체크 
	public void memberCheck(){}
	
	//email중복체크
	public MemberDTO emailCheck(String email){
		return sqlSession.selectOne(NAMESPACE+"emailCheck", email);
	}

	//nickName 중복체크
	public MemberDTO nickNameCheck(String nickName) {
		
		return sqlSession.selectOne(NAMESPACE+"nickNameCheck", nickName);
	}
	
}

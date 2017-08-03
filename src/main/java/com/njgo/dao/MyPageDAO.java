package com.njgo.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MemberDTO;


@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="MyPageMapper.";
	
	public int profileUpdateBoth(String fileName, String info,String email) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("myPhoto", fileName);
		map.put("info", info);
		map.put("email", email);
		
		return sqlSession.update(NAMESPACE+"profileBoth", map);
	}

	public int profileUpdate_f(String fileName, String email) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("myPhoto", fileName);
		map.put("email", email);
		return sqlSession.update(NAMESPACE+"profile_f", map);
	}
	
	public int profileUpdate_info(String info,String email){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("info", info);
		map.put("email", email);
		
		return sqlSession.update(NAMESPACE+"profile_info",map);
	}

	public int userUpdate(MemberDTO memberDTO) {
		return sqlSession.update(NAMESPACE+"userUpdate", memberDTO);
	}

	public int userWarn(MemberDTO memberDTO) {
		
		return sqlSession.update(NAMESPACE+"userWarn", memberDTO);
	}

	public int userDelete(MemberDTO memberDTO) {
		
		return sqlSession.delete(NAMESPACE+"userDelete", memberDTO);
	}

	public MemberDTO userSearch(MemberDTO memberDTO) {
		
		return sqlSession.selectOne(NAMESPACE+"userSearch", memberDTO);
	}

	public int followCancel(String login_nickName, String myPage_nickName) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("login_nickName", login_nickName);
		map.put("myPage_nickName", myPage_nickName);
		
		return sqlSession.delete(NAMESPACE+"followCancel", map);
	}

	public int follow(String login_nickName, String myPage_nickName) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("login_nickName", login_nickName);
		map.put("myPage_nickName", myPage_nickName);
		
		return sqlSession.delete(NAMESPACE+"follow", map);
	}
	
}

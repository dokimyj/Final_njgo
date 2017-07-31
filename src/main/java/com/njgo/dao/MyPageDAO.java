package com.njgo.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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
	
}

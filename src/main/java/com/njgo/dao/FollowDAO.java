package com.njgo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.FollowDTO;
import com.njgo.dto.MemberDTO;

@Repository
public class FollowDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="MyPageMapper.";
	
	public FollowDTO followingCheck(FollowDTO followDTO) {
		
		return sqlSession.selectOne(NAMESPACE+"followingCheck", followDTO);
	}

	public int followingCount(MemberDTO myPage) {
		
		return sqlSession.selectOne(NAMESPACE+"followingCount",myPage);
	}

	public int followerCount(MemberDTO myPage) {
		
		return sqlSession.selectOne(NAMESPACE+"followerCount",myPage);
	}

	public List<String> followingList(String nickName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nickName", nickName);
		
		return sqlSession.selectList(NAMESPACE+"followingList", map);
	}
	
}

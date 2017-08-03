package com.njgo.dao;

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
	
}

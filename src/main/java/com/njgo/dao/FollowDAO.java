package com.njgo.dao;

import java.util.ArrayList;
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

	public int followingCount(String nickName) {
		
		return sqlSession.selectOne(NAMESPACE+"followingCount",nickName);
	}

	public int followerCount(String nickName) {
		
		return sqlSession.selectOne(NAMESPACE+"followerCount",nickName);
	}

	public List<String> followingList(String nickName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nickName", nickName);
		
		return sqlSession.selectList(NAMESPACE+"followingList", map);
	}

	public List<MemberDTO> followList(List<String> followingList) {
		List<MemberDTO> ar =  new ArrayList<MemberDTO>();
		
		for(int i = 0 ; i<followingList.size() ;i++){
			ar.add((MemberDTO)sqlSession.selectOne(NAMESPACE+"followList", followingList.get(i))); 
			System.out.println("following List : "+followingList.get(i));
		}
		return ar;
	}

}

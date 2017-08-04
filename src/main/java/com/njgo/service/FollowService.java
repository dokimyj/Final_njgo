package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.FollowDAO;
import com.njgo.dto.FollowDTO;
import com.njgo.dto.MemberDTO;

@Service
public class FollowService {
	
	@Autowired
	private FollowDAO followDAO;

	public FollowDTO followingCheck(FollowDTO followDTO) {
		return followDAO.followingCheck(followDTO);
	}

	public int followingCount(String nickName) {
		
		return followDAO.followingCount(nickName);
	}

	public int followerCount(String nickName) {
		
		return followDAO.followerCount(nickName);
	}
	// 팔로잉한 닉네임 리스트
	public List<String> followingList(String nickName) {
		
		return followDAO.followingList(nickName);
	}
	// 팔로잉한 닉네임 리스트로 각 닉네임에대한 정보를 리스트로 가져옴
	public List<MemberDTO> followList(List<String> followingList) {
		
		return followDAO.followList(followingList);
	}
	
}

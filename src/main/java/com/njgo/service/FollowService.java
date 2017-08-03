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

	public int followingCount(MemberDTO myPage) {
		
		return followDAO.followingCount(myPage);
	}

	public int followerCount(MemberDTO myPage) {
		
		return followDAO.followerCount(myPage);
	}

	public List<String> followingList(String nickName) {
		
		return followDAO.followingList(nickName);
	}

	
}

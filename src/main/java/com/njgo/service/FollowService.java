package com.njgo.service;

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

	
}

package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.RankingDAO;
import com.njgo.dto.R_ChefDTO;
import com.njgo.dto.R_CookDTO;
import com.njgo.util.ListInfo;


@Service
public class RankingService{

	@Autowired
	private RankingDAO rankingDAO;
	
	//hit 조회
	public List<R_CookDTO> rankingPage1(ListInfo listInfo){
		return rankingDAO.selectHit(listInfo);
	}
	//scrap 조회
	public List<R_CookDTO> rankingPage2(ListInfo listInfo){	
		return rankingDAO.selectScrap(listInfo);
	}
	//u_count 조회
	public List<R_ChefDTO> rankingPage3(ListInfo listInfo){
		return rankingDAO.selectR_Chef(listInfo);
	}

}

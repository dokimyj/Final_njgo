package com.njgo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.RankingDAO;
import com.njgo.dto.MemberDTO;
import com.njgo.dto.R_ChefDTO;
import com.njgo.dto.R_CookDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.util.ListInfo;


@Service
public class RankingService{

	@Autowired
	private RankingDAO rankingDAO;
	
	
	public List<R_CookDTO> rankingList(ListInfo listInfo){
		//select RecipeDTO
		List<RecipeDTO> recipe = rankingDAO.selectRecipe();
		List<R_CookDTO> rank = new ArrayList<R_CookDTO>();
		
		int count = recipe.size();
		while(count>0){
			int i =0;
			R_CookDTO r_CookDTO = new R_CookDTO();
			r_CookDTO.setFoodname(recipe.get(i).getFoodname());
			r_CookDTO.setRegdate(recipe.get(i).getRegdate());
			r_CookDTO.setRep_pic(recipe.get(i).getRep_pic());
			r_CookDTO.setHit(recipe.get(i).getHit());
			r_CookDTO.setScrap(recipe.get(i).getScrap());
			rank.add(r_CookDTO);
			count--;
			i++;
		}
		//insert RankingDTO
		rankingDAO.writeRecipe(rank);
		
		//select MemberDTO
		List<MemberDTO> upload = rankingDAO.selectUpload();
		int count1 = upload.size();
		while(count>0){
			int i =0;
			R_ChefDTO r_ChefDTO = new R_ChefDTO();
			r_ChefDTO.setNicname(upload.get(i).getNicname());
			r_ChefDTO.setRegdate(upload.get(i).getJoin_date());
			rankingChefDTO.setRep_pic(recipe.get(i).getRep_pic());
			rankingChefDTO.setHit(recipe.get(i).getHit());
			rankingChefDTO.setScrap(recipe.get(i).getScrap());
			rank.add(rankingChefDTO);
			count--;
			i++;
		}
		
		
		return rankingDAO.rankingListhit(listInfo);
	}
	
	public List<R_CookDTO> rankingScrap(ListInfo listInfo){
		List<R_CookDTO> ar = rankingDAO.rankingselect();
		rankingDAO.rankingWrite(ar);
		return rankingDAO.rankingListhit(listInfo);
	}
	
	public List<R_CookDTO> rankingUpload(ListInfo listInfo){
		/*List<RankingDTO> ar = rankingDAO.rankingUpload();
		rankingDAO.rankingWrite(ar);*/
		return rankingDAO.rankingListhit(listInfo);
	}

	/*public NoticeDTO noticeView(int num) {
		return noticeDAO.noticeView(num);
	}
	public NoticeDTO noticeBefore(int num) {
		return noticeDAO.noticeBefore(num);
	}
	public NoticeDTO noticeAfter(int num) {
		return noticeDAO.noticeAfter(num);
	}

	public int noticeWrite(NoticeDTO noticeDTO) {
		return noticeDAO.noticeWrite(noticeDTO);
	}

	public int noticeUpdate(NoticeDTO noticeDTO) {
		return noticeDAO.noticeUpdate(noticeDTO);
	}

	public int noticeDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}*/

}

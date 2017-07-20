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
	
	
	public List<R_CookDTO> rankingPage(ListInfo listInfo){
		//select RecipeDTO
		List<RecipeDTO> recipe = rankingDAO.selectRecipe();
		List<R_CookDTO> rank = new ArrayList<R_CookDTO>();
		
		int count = recipe.size();
		while(count>0){
			int i =0;
			R_CookDTO r_CookDTO = new R_CookDTO();
			r_CookDTO.setFoodname(recipe.get(i).getFoodname());
			System.out.println(recipe.get(i).getFoodname());
			r_CookDTO.setRegdate(recipe.get(i).getRegdate());
			System.out.println(recipe.get(i).getRegdate());
			r_CookDTO.setRep_pic(recipe.get(i).getRep_pic());
			r_CookDTO.setHit(recipe.get(i).getHit());
			r_CookDTO.setScrap(recipe.get(i).getScrap());
			rank.add(r_CookDTO);
			count--;
			i++;
		}
		//insert RankingDTO
		int result = rankingDAO.insertRecipe(rank);
		System.out.println("리턴값 : "+result);
		
		//select MemberDTO
		List<MemberDTO> upload = rankingDAO.selectUpload();
		List<R_ChefDTO> chef = new ArrayList<R_ChefDTO>();
		int count1 = upload.size();
		while(count1>0){
			int i =0;
			R_ChefDTO r_ChefDTO = new R_ChefDTO();
			r_ChefDTO.setNicname(upload.get(i).getNicname());
			r_ChefDTO.setRegdate(upload.get(i).getJoin_date());
			r_ChefDTO.setRep_pic(upload.get(i).getMyphoto());
			r_ChefDTO.setU_count(upload.get(i).getU_count());
			chef.add(r_ChefDTO);
			count1--;
			i++;
		}
		//insert RankingDTO
		result = rankingDAO.insertUpload(chef);
		System.out.println("최종 리턴값 : "+result);
		
		return rankingDAO.selectHit(listInfo);
	}
	public List<R_CookDTO> rankingPage2(ListInfo listInfo){
		//select RecipeDTO
		List<RecipeDTO> recipe = rankingDAO.selectRecipe();
		List<R_CookDTO> rank = new ArrayList<R_CookDTO>();
		
		int count = recipe.size();
		while(count>0){
			int i =0;
			R_CookDTO r_CookDTO = new R_CookDTO();
			r_CookDTO.setFoodname(recipe.get(i).getFoodname());
			System.out.println(recipe.get(i).getFoodname());
			r_CookDTO.setRegdate(recipe.get(i).getRegdate());
			System.out.println(recipe.get(i).getRegdate());
			r_CookDTO.setRep_pic(recipe.get(i).getRep_pic());
			r_CookDTO.setHit(recipe.get(i).getHit());
			r_CookDTO.setScrap(recipe.get(i).getScrap());
			rank.add(r_CookDTO);
			count--;
			i++;
		}
		//insert RankingDTO
		int result = rankingDAO.insertRecipe(rank);
		System.out.println("리턴값 : "+result);
		
		//select MemberDTO
		List<MemberDTO> upload = rankingDAO.selectUpload();
		List<R_ChefDTO> chef = new ArrayList<R_ChefDTO>();
		int count1 = upload.size();
		while(count1>0){
			int i =0;
			R_ChefDTO r_ChefDTO = new R_ChefDTO();
			r_ChefDTO.setNicname(upload.get(i).getNicname());
			r_ChefDTO.setRegdate(upload.get(i).getJoin_date());
			r_ChefDTO.setRep_pic(upload.get(i).getMyphoto());
			r_ChefDTO.setU_count(upload.get(i).getU_count());
			chef.add(r_ChefDTO);
			count1--;
			i++;
		}
		//insert RankingDTO
		result = rankingDAO.insertUpload(chef);
		System.out.println("최종 리턴값 : "+result);
		
		return rankingDAO.selectScrap(listInfo);
	}
	public List<R_ChefDTO> rankingPage3(ListInfo listInfo){
		return rankingDAO.selectUpload();
	}

}

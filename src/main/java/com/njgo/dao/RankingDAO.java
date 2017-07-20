package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MemberDTO;
import com.njgo.dto.R_ChefDTO;
import com.njgo.dto.R_CookDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.util.ListInfo;

@Repository
public class RankingDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="RankingMapper.";
	
	//select RecipeDTO
	public List<RecipeDTO> selectRecipe() {
		return sqlSession.selectList(NAMESPACE+"selectRecipe");
	}
	//insert R_CookDTO
	public int insertRecipe(List<R_CookDTO> recipe) {
		int count = recipe.size();
		int i =0;
		R_CookDTO r_CookDTO = null;
		while(count>0){
			r_CookDTO = new R_CookDTO();
			r_CookDTO.setFoodname(recipe.get(i).getFoodname());
			r_CookDTO.setHit(recipe.get(i).getHit());
			r_CookDTO.setRegdate(recipe.get(i).getRegdate());
			r_CookDTO.setRep_pic(recipe.get(i).getRep_pic());
			r_CookDTO.setScrap(recipe.get(i).getScrap());
			r_CookDTO.setWriter(recipe.get(i).getWriter());
			count--;
			i++;
		}
		return sqlSession.insert(NAMESPACE+"insertRecipe", r_CookDTO);		
	}
	
	//select MemberDTO
	public List<MemberDTO> selectUpload() {
		return sqlSession.selectList(NAMESPACE+"selectUpload");
	}
	
	//insert R_ChefDTO
	public int insertUpload(List<R_ChefDTO> upload) {
		int count = upload.size();
		int i =0;
		R_ChefDTO r_ChefDTO = null;
		while(count>0){
			r_ChefDTO = new R_ChefDTO();
			r_ChefDTO.setNickname(upload.get(i).getNickname());
			r_ChefDTO.setRegdate(upload.get(i).getRegdate());	
			r_ChefDTO.setRep_pic(upload.get(i).getRep_pic());
			r_ChefDTO.setU_count(upload.get(i).getU_count());
			
			count--;
			i++;
		}
		return sqlSession.insert(NAMESPACE+"insertUpload", r_ChefDTO);	
	}
	//selectHit
	public List<R_CookDTO> selectHit(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"selectHit", listInfo);
	}
	//selectScrap
	public List<R_CookDTO> selectScrap(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"selectScrap", listInfo);
	}
	//selectUpload
	public List<R_ChefDTO> selectR_Chef(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"selectR_Chef", listInfo);
	}

}

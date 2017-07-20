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
		return sqlSession.insert(NAMESPACE+"insertRecipe", recipe);		
	}
	
	//select MemberDTO
	public List<MemberDTO> selectUpload() {
		return sqlSession.selectList(NAMESPACE+"selectUpload");
	}
	
	//insert R_ChefDTO
	public int insertUpload(List<R_ChefDTO> upload) {
		return sqlSession.insert(NAMESPACE+"insertUpload", upload);		
	}
	
	public List<R_CookDTO> selectHit(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"selectHit", listInfo);
	}
	public List<R_CookDTO> selectScrap(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"selectScrap", listInfo);
	}
	public List<R_ChefDTO> selectUpload(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"selectUpload", listInfo);
	}

}

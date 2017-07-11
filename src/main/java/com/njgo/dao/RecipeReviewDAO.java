package com.njgo.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.RecipeReviewDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeReviewDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeReviewMapper.";
	
	public List<RecipeReviewDTO> reviewList(ListInfo listInfo, Integer num){
		HashMap<String, Object> reply=new HashMap<String, Object>();
		reply.put("listInfo", listInfo);
		reply.put("num", num);
		return sqlSession.selectList(NAMESPACE+"list", reply);
	}
	
	public int reviewWrite(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int reviewUpdate(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int reviewDelete(Integer num){
		return 0;
	}
}

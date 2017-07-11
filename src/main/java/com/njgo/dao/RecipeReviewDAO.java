package com.njgo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeReviewDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeReviewMapper.";
	
	public List<RecipeReplyDTO> replyList(ListInfo listInfo){
		return null;
	}
	
	public int reviewWrite(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int reviewUpdate(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int reviewDelete(RecipeReviewDTO rreviewDTO){
		return 0;
	}
}

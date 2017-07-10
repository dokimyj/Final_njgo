package com.njgo.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeMapper.";
	
	public HashMap<String, Object> view(Integer num) throws Exception{
		HashMap<String, Object> recipe=new HashMap<String, Object>();
		return recipe;
	}
	
	public List<RecipeDTO> list(ListInfo listInfo){
		return null;
	}
	
	public int write(HashMap<String, Object> recipe){
		return 0;
	}
	
	public int update(HashMap<String, Object> recipe){
		return 0;
	}
	
	public int delete(Integer num){
		return 0;
	}
	
	public int reply(RecipeReplyDTO rreplyDTO){
		return 0;
	}
	
	public int replyUpdate(RecipeReplyDTO rreplyDTO){
		return 0;
	}
	
	public int replyDelete(RecipeReplyDTO rreplyDTO){
		return 0;
	}
	
	public int review(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int reviewUpdate(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int reviewDelete(RecipeReviewDTO rreviewDTO){
		return 0;
	}
	
	public int scrapIncrease(int num){
		return 0;
	}
	
	public int scrapDecrease(int num){
		return 0;
	}
}

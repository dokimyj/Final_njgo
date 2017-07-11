package com.njgo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.RecipeReplyDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeReplyMapper.";
	
	public List<RecipeReplyDTO> replyList(ListInfo listInfo){
		return null;
	}
	
	public int replyWrite(RecipeReplyDTO rreplyDTO){
		return 0;
	}
	
	public int replyUpdate(RecipeReplyDTO rreplyDTO){
		return 0;
	}
	
	public int replyDelete(Integer num){
		return 0;
	}
}

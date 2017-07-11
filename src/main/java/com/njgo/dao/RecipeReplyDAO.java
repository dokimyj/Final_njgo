package com.njgo.dao;

import java.util.HashMap;
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
	
	public List<RecipeReplyDTO> replyList(ListInfo listInfo, Integer num){
		HashMap<String, Object> reply=new HashMap<String, Object>();
		reply.put("listInfo", listInfo);
		reply.put("num", num);
		return sqlSession.selectList(NAMESPACE+"list", reply);
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

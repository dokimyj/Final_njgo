package com.njgo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<RecipeReplyDTO> replyList(ListInfo listInfo, Integer rnum){
		HashMap<String, Object> reply=new HashMap<String, Object>();
		reply.put("listInfo", listInfo);
		reply.put("rnum", rnum);
		int totalCount=sqlSession.selectOne(NAMESPACE+"totalcount", rnum);
		listInfo.makePage(totalCount, 10);
		listInfo.setRow(listInfo.getCurPage(), 10);
		return sqlSession.selectList(NAMESPACE+"list", reply);
	}
	
	public RecipeReplyDTO replyView(Integer num){
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	
	public int replyWrite(RecipeReplyDTO rreplyDTO){
		return sqlSession.insert(NAMESPACE+"write", rreplyDTO);
	}
	
	public int replyReply(RecipeReplyDTO rreplyDTO){ //이 매개변수에서 rreplyDTO.setNum은 반드시 답글다는 댓글의 원댓글 번호를 가져와야 함!
		HashMap<String, Object> replyDTO=new HashMap<String, Object>();
		replyDTO.put("replyDTO", rreplyDTO);
		sqlSession.insert("reply", replyDTO);
		return (Integer)replyDTO.get("result");
	}
	
	public int replyUpdate(RecipeReplyDTO rreplyDTO){
		return sqlSession.update(NAMESPACE+"update", rreplyDTO);
	}
	
	public int replyDelete(Integer num){
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
}

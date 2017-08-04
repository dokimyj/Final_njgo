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
	
	public List<RecipeReviewDTO> reviewList(ListInfo listInfo, Integer rnum){
		HashMap<String, Object> review=new HashMap<String, Object>();
		review.put("listInfo", listInfo);
		review.put("rnum", rnum);
		int totalCount=sqlSession.selectOne(NAMESPACE+"totalcount", rnum);
		listInfo.makePage(totalCount, 10);
		listInfo.setRow(listInfo.getCurPage(), 10);
		return sqlSession.selectList(NAMESPACE+"list", review);
	}
	
	public int reviewWrite(RecipeReviewDTO rreviewDTO){
		HashMap<String, Object> review=new HashMap<String, Object>();
		review.put("reviewDTO", rreviewDTO);
		sqlSession.insert(NAMESPACE+"write", review);
		return (Integer)review.get("result");
	}
	
	public int reviewDelete(Integer num, Integer rnum){
		HashMap<String, Object> review=new HashMap<String, Object>();
		review.put("num", num);
		review.put("rnum", rnum);
		sqlSession.delete(NAMESPACE+"delete", review);
		return (Integer)review.get("result");
	}
}

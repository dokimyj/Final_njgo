package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MemberDTO;
import com.njgo.dto.R_CookDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.util.ListInfo;

@Repository
public class RankingDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="RankingMapper.";
	
	//select recipeDTO
	public List<RecipeDTO> selectRecipe() {
		return sqlSession.selectList(NAMESPACE+"selectRecipe");
	}
	public List<MemberDTO> selectUpload() {
		return sqlSession.selectList(NAMESPACE+"selectUpload");
	}
	
	//insert rankingDTO
	public int writeRecipe(List<R_CookDTO> recipe) {
		return sqlSession.insert(NAMESPACE+"writeRecipe", recipe);		
	}
	
	public int writeUpload(List<R_CookDTO> upload) {
		return sqlSession.insert(NAMESPACE+"writeRecipe", upload);		
	}
	
	
	
	
	
	
	
	
	public List<R_CookDTO> rankingListhit(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"listhit", listInfo);
	}
	
	/*public NoticeDTO noticeView(int num) {
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	public NoticeDTO noticeBefore(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewbefore", num);
	}
	public NoticeDTO noticeAfter(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewafter", num);
	}
	

	
	public int noticeUpdate(NoticeDTO noticeDTO) {
		return sqlSession.update(NAMESPACE+"update", noticeDTO);
	}
	
	public int noticeDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int noticeCount(ListInfo listInfo) {
		return 0;
	}

	public int noticeHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}*/

}

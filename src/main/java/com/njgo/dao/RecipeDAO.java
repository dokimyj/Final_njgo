package com.njgo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.CategoryDTO;
import com.njgo.dto.HashtagDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.StepsDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeMapper.";
	
	public HashMap<String, Object> view(Integer num) throws Exception{
		RecipeDTO recipeDTO=sqlSession.selectOne(NAMESPACE+"rview", num);
		List<IngredientsDTO> ingredients=sqlSession.selectList(NAMESPACE+"iview", num);
		List<StepsDTO> steps=sqlSession.selectList(NAMESPACE+"sview", num);
		List<HashtagDTO> tags=sqlSession.selectList(NAMESPACE+"tview", num);
		HashMap<String, Object> recipe=new HashMap<String, Object>();
		recipe.put("recipeDTO", recipeDTO);
		recipe.put("ingredients", ingredients);
		recipe.put("steps", steps);
		recipe.put("hashtags", tags);
		return recipe;
	}
	
	public HashMap<String, Object> list(ListInfo listInfo){
		listInfo.setRow(1, 9);
		Integer totalCount=sqlSession.selectOne(NAMESPACE+"totalcount", listInfo);
		listInfo.makePage(totalCount, 10);
		HashMap<String, Object> listPack=new HashMap<String, Object>();
		listPack.put("listInfo", listInfo);
		listPack.put("listPack", sqlSession.selectList(NAMESPACE+"list", listInfo)); 
		return listPack;
	}
	
	public HashMap<String, Object> search(ListInfo listInfo){
		listInfo.setRow(1, 9);
		List<Integer> num=sqlSession.selectList(NAMESPACE+"rnum", listInfo.getFind());
		List<Integer> inum=sqlSession.selectList(NAMESPACE+"inum", listInfo.getFind());
		List<Integer> hnum=sqlSession.selectList(NAMESPACE+"hnum", listInfo.getFind());
		num.addAll(inum);
		num.addAll(hnum);
		Integer searchCount=sqlSession.selectOne(NAMESPACE+"searchcount", num);
		listInfo.makePage(searchCount, 10);
		HashMap<String, Object> searchQ=new HashMap<String, Object>();
		searchQ.put("numbers", num);
		searchQ.put("listInfo", listInfo);
		List<RecipeDTO> searchResult=sqlSession.selectList(NAMESPACE+"search", searchQ);
		searchQ.put("searchResult", searchResult);
		return searchQ;
	}
	
	public HashMap<String, Object> catesearch(CategoryDTO category, ListInfo listInfo){
		HashMap<String, Object> catesearch=new HashMap<String, Object>();
		listInfo.setRow(1, 9);
		Integer cateCount=sqlSession.selectOne(NAMESPACE+"catecount", category);
		listInfo.makePage(cateCount, 10);
		catesearch.put("listInfo", listInfo);
		catesearch.put("category", category);
		List<RecipeDTO> cateResult=sqlSession.selectList(NAMESPACE+"catesearch", catesearch);
		catesearch.put("cateResult", cateResult);
		return catesearch;
	}
	
	public HashMap<String, Object> isearch(List<IngredientsDTO> ingredients, ListInfo listInfo){
		HashMap<String, Object> isearch=new HashMap<String, Object>();
		listInfo.setRow(1, 9);
		Integer iCount=sqlSession.selectOne(NAMESPACE+"icount", ingredients);
		listInfo.makePage(iCount, 10);
		isearch.put("listInfo", listInfo);
		isearch.put("ingredients", ingredients);
		List<RecipeDTO> iResult=sqlSession.selectList(NAMESPACE+"isearch", isearch);
		isearch.put("iResult", iResult);
		return isearch;
	}
	
	public int scrapIncrease(Integer num){
		return sqlSession.update(NAMESPACE+"scrapI", num);
	}
	
	public int scrapDecrease(Integer num){
		return sqlSession.update(NAMESPACE+"scrapD", num);
	}
}

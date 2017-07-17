package com.njgo.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.CategoryDTO;
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
		HashMap<String, Object> recipe=new HashMap<String, Object>();
		recipe.put("recipeDTO", recipeDTO);
		recipe.put("ingredients", ingredients);
		recipe.put("steps", steps);
		return recipe;
	}
	
	public List<RecipeDTO> list(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}
	
	public List<RecipeDTO> search(String find, ListInfo listInfo){
		listInfo.setFind(find);
		return sqlSession.selectList(NAMESPACE+"search", listInfo);
	}
	
	public List<RecipeDTO> catesearch(CategoryDTO category, ListInfo listInfo){
		HashMap<String, Object> catesearch=new HashMap<String, Object>();
		catesearch.put("listInfo", listInfo);
		catesearch.put("category", category);
		return sqlSession.selectList(NAMESPACE+"catesearch", catesearch);
	}
	
	public List<RecipeDTO> isearch(List<IngredientsDTO> ingredients, ListInfo listInfo){
		HashMap<String, Object> isearch=new HashMap<String, Object>();
		isearch.put("listInfo", listInfo);
		isearch.put("ingredients", ingredients);
		return sqlSession.selectList(NAMESPACE+"isearch", isearch);
	}
	
	public int scrapIncrease(Integer num){
		return sqlSession.update(NAMESPACE+"scrapI", num);
	}
	
	public int scrapDecrease(Integer num){
		return sqlSession.update(NAMESPACE+"scrapD", num);
	}
}

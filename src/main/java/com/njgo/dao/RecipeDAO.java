package com.njgo.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
	public int scrapIncrease(Integer num){
		return 0;
	}
	
	public int scrapDecrease(Integer num){
		return 0;
	}
}

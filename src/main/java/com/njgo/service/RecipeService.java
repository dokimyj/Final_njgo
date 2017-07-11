package com.njgo.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.njgo.dao.RecipeDAO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.util.ListInfo;

@Service
public class RecipeService {

	@Inject
	private RecipeDAO recipeDAO;
	
	public HashMap<String, Object> view(Integer num) throws Exception{
		return recipeDAO.view(num);
	}
	
	public List<RecipeDTO> list(ListInfo listInfo){
		return recipeDAO.list(listInfo);
	}
	
	public int write(HashMap<String, Object> recipe){
		return recipeDAO.write(recipe);
	}
	
	public int update(HashMap<String, Object> recipe){
		return recipeDAO.update(recipe);
	}
	
	public int delete(Integer num){
		return recipeDAO.delete(num);
	}
	
	public int scrapIncrease(int num){
		return recipeDAO.scrapIncrease(num);
	}
	
	public int scrapDecrease(int num){
		return recipeDAO.scrapDecrease(num);
	}
}

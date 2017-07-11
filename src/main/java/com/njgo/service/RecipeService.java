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
	
	public int reply(RecipeReplyDTO rreplyDTO){
		return recipeDAO.reply(rreplyDTO);
	}
	
	public int replyUpdate(RecipeReplyDTO rreplyDTO){
		return recipeDAO.replyUpdate(rreplyDTO);
	}
	
	public int replyDelete(RecipeReplyDTO rreplyDTO){
		return recipeDAO.replyDelete(rreplyDTO);
	}
	
	public int review(RecipeReviewDTO rreviewDTO){
		return recipeDAO.review(rreviewDTO);
	}
	
	public int reviewUpdate(RecipeReviewDTO rreviewDTO){
		return recipeDAO.reviewUpdate(rreviewDTO);
	}
	
	public int reviewDelete(RecipeReviewDTO rreviewDTO){
		return recipeDAO.reviewDelete(rreviewDTO);
	}
	
	public int scrapIncrease(int num){
		return recipeDAO.scrapIncrease(num);
	}
	
	public int scrapDecrease(int num){
		return recipeDAO.scrapDecrease(num);
	}
}

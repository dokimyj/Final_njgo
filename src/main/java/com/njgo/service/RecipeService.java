package com.njgo.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.njgo.dao.RecipeDAO;
import com.njgo.dao.RecipeReplyDAO;
import com.njgo.dao.RecipeReviewDAO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.util.ListInfo;

@Service
public class RecipeService {

	@Inject
	private RecipeDAO recipeDAO;
	@Inject
	private RecipeReplyDAO rreplyDAO;
	@Inject
	private RecipeReviewDAO rreviewDAO;
	
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
	
	public List<RecipeReplyDTO> replyList(ListInfo listInfo){
		return rreplyDAO.replyList(listInfo);
	}
	
	public int replyWrite(RecipeReplyDTO rreplyDTO){
		return rreplyDAO.replyWrite(rreplyDTO);
	}
	
	public int replyUpdate(RecipeReplyDTO rreplyDTO){
		return rreplyDAO.replyUpdate(rreplyDTO);
	}
	
	public int replyDelete(Integer num){
		return rreplyDAO.replyDelete(num);
	}
	
	public List<RecipeReviewDTO> reviewList(ListInfo listInfo){
		return rreviewDAO.reviewList(listInfo);
	}
	
	public int reviewWrite(RecipeReviewDTO rreviewDTO){
		return rreviewDAO.reviewWrite(rreviewDTO);
	}
	
	public int reviewUpdate(RecipeReviewDTO rreviewDTO){
		return rreviewDAO.reviewUpdate(rreviewDTO);
	}
	
	public int reviewDelete(Integer num){
		return rreviewDAO.reviewDelete(num);
	}
	
	public int scrapIncrease(int num){
		return recipeDAO.scrapIncrease(num);
	}
	
	public int scrapDecrease(int num){
		return recipeDAO.scrapDecrease(num);
	}
}

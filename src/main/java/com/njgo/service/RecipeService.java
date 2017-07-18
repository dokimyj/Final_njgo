package com.njgo.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.njgo.dao.RecipeDAO;
import com.njgo.dao.RecipeReplyDAO;
import com.njgo.dao.RecipeReviewDAO;
import com.njgo.dto.CategoryDTO;
import com.njgo.dto.IngredientsDTO;
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
	
	public HashMap<String, Object> list(ListInfo listInfo){
		return recipeDAO.list(listInfo);
	}
	
	public HashMap<String, Object> search(ListInfo listInfo){
		return recipeDAO.search(listInfo);
	}
	
	public HashMap<String, Object> catesearch(CategoryDTO category, ListInfo listInfo){
		return recipeDAO.catesearch(category, listInfo);
	}
	
	public HashMap<String, Object> isearch(List<IngredientsDTO> ingredients, ListInfo listInfo){
		return recipeDAO.isearch(ingredients, listInfo);
	}
	
	public List<RecipeReplyDTO> replyList(ListInfo listInfo, Integer num){
		return rreplyDAO.replyList(listInfo, num);
	}
	
	public int replyWrite(RecipeReplyDTO rreplyDTO){
		return rreplyDAO.replyWrite(rreplyDTO);
	}
	
	public int replyReply(RecipeReplyDTO rreplyDTO){ //이 매개변수에서 rreplyDTO.setNum은 반드시 답글다는 댓글의 원댓글 번호를 가져와야 함!
		return rreplyDAO.replyReply(rreplyDTO);
	}
	
	public RecipeReplyDTO replyView(Integer num){
		return rreplyDAO.replyView(num);
	}
	
	public int replyUpdate(RecipeReplyDTO rreplyDTO){
		return rreplyDAO.replyUpdate(rreplyDTO);
	}
	
	public int replyDelete(Integer num){
		return rreplyDAO.replyDelete(num);
	}
	
	public List<RecipeReviewDTO> reviewList(ListInfo listInfo, Integer num){
		return rreviewDAO.reviewList(listInfo, num);
	}
	
	public int reviewWrite(RecipeReviewDTO rreviewDTO){
		return rreviewDAO.reviewWrite(rreviewDTO);
	}
	
	public int reviewDelete(Integer num, Integer rnum){ //지우려는 댓글 번호, 해당 댓글이 있는 레시피의 번호
		return rreviewDAO.reviewDelete(num, rnum);
	}
	
	public int scrapIncrease(Integer num){
		return recipeDAO.scrapIncrease(num);
	}
	
	public int scrapDecrease(Integer num){
		return recipeDAO.scrapDecrease(num);
	}
}

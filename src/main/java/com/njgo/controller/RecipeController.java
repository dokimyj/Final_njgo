package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.HashtagDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.service.RecipeService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/recipe/**")
public class RecipeController {
	@Inject
	private RecipeService recipeService;
	
	@RequestMapping(value="recipeView", method=RequestMethod.GET)
	public void view(Integer num, Model model) throws Exception{
		model.addAttribute("recipe", recipeService.view(num).get("recipeDTO"));
		model.addAttribute("ingredients", recipeService.view(num).get("ingredients"));
		model.addAttribute("steps", recipeService.view(num).get("steps"));
	}
	
	@RequestMapping(value="recipeList", method=RequestMethod.GET)
	public void list(ListInfo listInfo, Model model) throws Exception{
		model.addAttribute("recipe", recipeService.list(listInfo));
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String list(ListInfo listInfo, String find, RedirectAttributes ra) throws Exception{
		ra.addFlashAttribute("result", recipeService.search(find, listInfo));
		return "redirect:recipeList";
	}

	@RequestMapping(value="tagsearch", method=RequestMethod.POST)
	public String tagsearch(String[] tags, Integer rnum, ListInfo listInfo, RedirectAttributes ra) throws Exception{
		List<HashtagDTO> hashtag=new ArrayList<HashtagDTO>();
		for(int i=0;i<tags.length;i++){
			HashtagDTO hdto=new HashtagDTO();
			hdto.setRecipenum(rnum);
			hdto.setHashtag(tags[i]);
			hashtag.add(hdto);
		}
		ra.addFlashAttribute("result", recipeService.tagsearch(hashtag, listInfo)); 
		return "redirect:recipeList";
	}
	
	@RequestMapping(value="isearch", method=RequestMethod.POST)
	public String isearch(String[] ingredients, String[] amount, Integer rnum, ListInfo listInfo, RedirectAttributes ra) throws Exception{
		List<IngredientsDTO> ing=new ArrayList<IngredientsDTO>();
		for(int i=0;i<ingredients.length;i++){
			IngredientsDTO idto=new IngredientsDTO();
			idto.setRecipenum(rnum);
			idto.setName(ingredients[i]);
			idto.setAmount(amount[i]);
			ing.add(idto);
		}
		ra.addFlashAttribute("result", recipeService.isearch(ing, listInfo)); 
		return "redirect:recipeList";
	}
	
	@RequestMapping(value="recipeScrapI", method=RequestMethod.GET)
	public String scrapI(Integer num, Model model) throws Exception{
		recipeService.scrapIncrease(num);
		return "redirect:recipeView?num="+num;
	}
	
	@RequestMapping(value="recipeScrapD", method=RequestMethod.GET)
	public String scrapD(Integer num, Model model) throws Exception{
		recipeService.scrapDecrease(num);
		return "redirect:recipeView?num="+num;
	}
	
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public void replyList(ListInfo listInfo, Integer rnum, Model model) throws Exception{ //rnum은 해당 레시피의 글번호
		List<RecipeReplyDTO> replyList=recipeService.replyList(listInfo, rnum);
		model.addAttribute("list", replyList);
	}
	
	@RequestMapping(value="replyWrite", method=RequestMethod.POST)
	public String replyWrite(RecipeReplyDTO rreplyDTO) throws Exception{
		recipeService.replyWrite(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum(); 
	}
	
	@RequestMapping(value="replyReply", method=RequestMethod.GET)
	public String replyReply(RecipeReplyDTO rreplyDTO) throws Exception{ //이 매개변수에서 rreplyDTO.setNum은 반드시 답글다는 댓글의 원댓글 번호를 가져와야 함!
		recipeService.replyReply(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.GET)
	public String replyUpdate(Integer num, Model model) throws Exception{
		RecipeReplyDTO rrdto=recipeService.replyView(num);
		model.addAttribute("content", rrdto.getContents());
		return "/recipe/replyView";
	}
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(RecipeReplyDTO rreplyDTO) throws Exception{
		recipeService.replyUpdate(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String replyDelete(Integer num, Integer rnum) throws Exception{ //rnum은 해당 레시피의 글번호
		recipeService.replyDelete(num);
		return "redirect:replyList?rnum="+rnum;
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public void reviewList(ListInfo listInfo, Integer rnum, Model model) throws Exception{ //rnum은 해당 레시피의 글번호
		List<RecipeReviewDTO> reviewList=recipeService.reviewList(listInfo, rnum);
		model.addAttribute("list", reviewList);
	}
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(RecipeReviewDTO rreviewDTO) throws Exception{
		recipeService.reviewWrite(rreviewDTO);
		return "redirect:reviewList?rnum="+rreviewDTO.getRecipenum(); 
	}
	
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(Integer num, Integer rnum) throws Exception{ //rnum은 해당 레시피의 글번호
		recipeService.reviewDelete(num, rnum);
		return "redirect:reviewList?rnum="+rnum;
	}
}

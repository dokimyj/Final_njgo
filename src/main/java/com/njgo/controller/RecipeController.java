package com.njgo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.CategoryDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.dto.ScrapDTO;
import com.njgo.service.RecipeService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/recipe/**")
public class RecipeController {
	@Inject
	private RecipeService recipeService;
	
	@RequestMapping(value="recipeView", method=RequestMethod.GET)
	public void view(Integer num, String[] curIng, Model model) throws Exception{
		model.addAttribute("recipe", recipeService.view(num).get("recipeDTO"));
		model.addAttribute("ingredients", recipeService.view(num).get("ingredients"));
		model.addAttribute("steps", recipeService.view(num).get("steps"));
		model.addAttribute("hashtags", recipeService.view(num).get("hashtags"));
		model.addAttribute("curIng", curIng);
	}
	
	@RequestMapping(value="recipeList", method=RequestMethod.GET) 
	public void list(RedirectAttributes ra) throws Exception{
	}
	
	@ResponseBody
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(ListInfo listInfo, RedirectAttributes ra) throws Exception{
		ra.addFlashAttribute("list", recipeService.search(listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipeList";
	}

	@ResponseBody
	@RequestMapping(value="catesearch", method=RequestMethod.GET)
	public String catesearch(CategoryDTO cdto, ListInfo listInfo, RedirectAttributes ra) throws Exception{
		ra.addFlashAttribute("list", recipeService.catesearch(cdto, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipeList";
	}
	
	@RequestMapping(value="inglist", method=RequestMethod.GET)
	public String inglist(String find, Model model) throws Exception{
		List<IngredientsDTO> ing=recipeService.ingList(find);
		model.addAttribute("ingList", ing);
		return "recipe/ingList";
	}

	@ResponseBody
	@RequestMapping(value="isearch", method=RequestMethod.GET)
	public String isearch(String[] ingredients, ListInfo listInfo, RedirectAttributes ra) throws Exception{
		List<IngredientsDTO> ing=new ArrayList<IngredientsDTO>();
		for(int i=0;i<ingredients.length;i++){
			IngredientsDTO idto=new IngredientsDTO();
			idto.setName(ingredients[i]);
			ing.add(idto);
		}
		ra.addFlashAttribute("list", recipeService.isearch(ing, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipeList";
	}
	
	@ResponseBody
	@RequestMapping(value="writersearch", method=RequestMethod.GET)
	public String writersearch(String writer, ListInfo listInfo, RedirectAttributes ra){
		ra.addFlashAttribute("list", recipeService.writersearch(writer, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipeList";
	}
	
	@ResponseBody
	@RequestMapping(value="scrapsearch", method=RequestMethod.GET)
	public String scrapsearch(String nickname, ListInfo listInfo, RedirectAttributes ra){
		ra.addFlashAttribute("list", recipeService.scrapsearch(nickname, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipeList";
	}
	
	@RequestMapping(value="recipeScrapI", method=RequestMethod.GET)
	public String scrapI(ScrapDTO scrapDTO, Model model) throws Exception{
		recipeService.scrapIncrease(scrapDTO);
		return "redirect:recipeView?num="+scrapDTO.getRecipenum();
	}
	
	@RequestMapping(value="recipeScrapD", method=RequestMethod.GET)
	public String scrapD(ScrapDTO scrapDTO, Model model) throws Exception{
		recipeService.scrapDecrease(scrapDTO);
		return "redirect:recipeView?num="+scrapDTO.getRecipenum();
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

package com.njgo.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.njgo.service.RecipeService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/recipe/**")
public class RecipeController {
	@Inject
	private RecipeService recipeService;
	
	@RequestMapping(value="recipeView", method=RequestMethod.GET)
	public void view(Integer num, Model model) throws Exception{
		model.addAttribute("recipe", recipeService.view(num));
	}
	
	@RequestMapping(value="recipeList", method=RequestMethod.POST)
	public void list(ListInfo listInfo, Model model) throws Exception{
		model.addAttribute("recipe", recipeService.list(listInfo));
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
}

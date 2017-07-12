package com.njgo.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.njgo.service.RecipeService;

@Controller
@RequestMapping(value="/recipe/**")
public class RecipeController {
	@Inject
	private RecipeService recipeService;
	
	@RequestMapping(value="recipeView", method=RequestMethod.GET)
	public void view(Integer num, Model model) throws Exception{
		model.addAttribute("recipe", recipeService.view(num));
	}
}

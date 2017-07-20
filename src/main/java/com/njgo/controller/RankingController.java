package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.njgo.dto.R_ChefDTO;
import com.njgo.dto.R_CookDTO;
import com.njgo.service.RankingService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/ranking/**")
public class RankingController {

	@Autowired
	private RankingService rankingService;
	
	//rankingPage
	@RequestMapping(value="rankingPage1", method=RequestMethod.GET)
	public void rankingPage(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<R_CookDTO> hit = rankingService.rankingPage1(listInfo);
		model.addAttribute("list", hit);
		model.addAttribute("board", "조회수 랭킹");
		model.addAttribute("column", "hit");
	}
	//rankingPage2
	@RequestMapping(value="rankingPage2", method=RequestMethod.GET)
	public String rankingPage2(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<R_CookDTO> scrap = rankingService.rankingPage2(listInfo);
		model.addAttribute("list", scrap);
		model.addAttribute("board", "스크랩수 랭킹");
		model.addAttribute("column", "scrap");
		return "redirect:rankingPage";
	}
	//rankingPage3
	@RequestMapping(value="rankingPage3", method=RequestMethod.GET)
	public String rankingPage3(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<R_ChefDTO> upload = rankingService.rankingPage3(listInfo);
		model.addAttribute("list", upload);
		model.addAttribute("board", "셰프 랭킹");
		model.addAttribute("column", "upload");
		return "redirect:rankingPage";
	}	
	
}

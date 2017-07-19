package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.njgo.dto.RankingDTO;
import com.njgo.service.RankingService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/ranking/**")
public class RankingController {

	@Autowired
	private RankingService rankingService;
	
	//Page
	@RequestMapping(value="rankingPage", method=RequestMethod.GET)
	public void rankingPage(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<RankingDTO> hit = rankingService.rankingHit(listInfo);
		List<RankingDTO> scrap = rankingService.rankingScrap(listInfo);
		List<RankingDTO> upload = rankingService.rankingUpload(listInfo);
		model.addAttribute("hit", hit);
		model.addAttribute("scrap", scrap);
		model.addAttribute("upload", upload);
	}
	
	
	//ListHit
	@RequestMapping(value="rankingHit", method=RequestMethod.GET)
	public void rankingHit(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<RankingDTO> hit = rankingService.rankingHit(listInfo);
		model.addAttribute("list", hit);
		model.addAttribute("board", "hit");
	}
	
	//ListScrap
	@RequestMapping(value="rankingScrap", method=RequestMethod.GET)
	public void rankingScrap(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<RankingDTO> scrap = rankingService.rankingScrap(listInfo);
		model.addAttribute("list", scrap);
		model.addAttribute("board", "scrap");
	}	
	
	//ListUpload
		@RequestMapping(value="rankingUpload", method=RequestMethod.GET)
		public void rankingUpload(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
			List<RankingDTO> upload = rankingService.rankingUpload(listInfo);
			model.addAttribute("list", upload);
			model.addAttribute("board", "upload");
		}
}

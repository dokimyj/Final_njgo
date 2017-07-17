package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.NoticeDTO;
import com.njgo.service.NoticeService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/ranking/**")
public class RankingController {

	/*@Autowired
	private NoticeService noticeService;*/
	
	//test
	@RequestMapping(value="rankingPage", method=RequestMethod.GET)
	public void test() throws Exception{
	}
	
	
	/*//list
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public void noticeList(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		System.out.println("boardList controller");
		List<BoardDTO> ar = noticeService.boardList(listInfo);
		model.addAttribute("list", ar);
		model.addAttribute("board", "notice");
	}

	//View
	@RequestMapping(value="boardView", method=RequestMethod.GET)
	public void noticeView(Integer num, Model model) throws Exception{
		BoardDTO boardDTO=noticeService.boardView(num);
		model.addAttribute("dto", boardDTO);
	}

	//writeForm
	@RequestMapping(value="boardWrite", method=RequestMethod.GET)
	public void noticeWrite(Model model){
		model.addAttribute("path", "Write");
	}

	//write 
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String noticeWrite(NoticeDTO noticeDTO, RedirectAttributes rd)throws Exception{
		int result=noticeService.boardWrite(noticeDTO);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:noticeList?curPage=2";
	}

	//update
	@RequestMapping(value="boardUpdate", method=RequestMethod.GET)
	public String noticeUpdate(Integer num, Model model) throws Exception{
		BoardDTO boardDTO = noticeService.boardView(num);
		model.addAttribute("dto", boardDTO);
		model.addAttribute("path", "Update");
		return "notice/noticeWrite";
	}

	@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
	public String noticeUpdate(NoticeDTO noticeDTO, RedirectAttributes rd) throws Exception{
		int result = noticeService.boardUpdate(noticeDTO);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:noticeList?curPage=1";
	}

	@RequestMapping(value="boardDelete", method=RequestMethod.GET)
	public void noticeDelete(Integer num){
		int result = noticeService.boardDelete(num);
	}
*/
}

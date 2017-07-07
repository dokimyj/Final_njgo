package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.BoardDTO;
import com.njgo.dto.QnaDTO;
import com.njgo.service.QnaService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/qna/**")
public class QnaController {

	
	@Autowired
	private QnaService qnaService;

	//list
	@RequestMapping(value="qnaList", method=RequestMethod.GET)
	public void qnaList(Model model, @RequestParam(defaultValue="1") Integer curPage, ListInfo listInfo) throws Exception{
		List<BoardDTO> ar = qnaService.boardList(listInfo);
		model.addAttribute("list", ar);
	}

	//View
	@RequestMapping(value="qnaView", method=RequestMethod.GET)
	public void qnaView(Integer num, Model model) throws Exception{
		BoardDTO boardDTO=qnaService.boardView(num);
		model.addAttribute("dto", boardDTO);
	}

	//writeForm
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public void qnaWrite(Model model){
		model.addAttribute("path", "Write");
	}

	//write 
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public String qnaWrite(QnaDTO qnaDTO, RedirectAttributes rd)throws Exception{
		int result=qnaService.boardWrite(qnaDTO);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:qnaList?curPage=2";
	}

	//update
	@RequestMapping(value="qnaUpdate", method=RequestMethod.GET)
	public String qnaUpdate(Integer num, Model model) throws Exception{
		BoardDTO boardDTO = qnaService.boardView(num);
		model.addAttribute("dto", boardDTO);
		model.addAttribute("path", "Update");
		return "qna/qnaWrite";
	}

	@RequestMapping(value="qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdate(QnaDTO qnaDTO, RedirectAttributes rd) throws Exception{
		int result = qnaService.boardUpdate(qnaDTO);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:qnaList?curPage=1";
	}

	@RequestMapping(value="qnaDelete", method=RequestMethod.GET)
	public void qnaDelete(Integer num){
		int result = qnaService.boardDelete(num);
	}

}

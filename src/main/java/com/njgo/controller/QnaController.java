package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		List<QnaDTO> ar = qnaService.qnaList(listInfo);
		model.addAttribute("list", ar);
		model.addAttribute("board", "qna");
		model.addAttribute("nickName","t10");
	}

	//View
	@RequestMapping(value="qnaView", method=RequestMethod.GET)
	public void qnaView(Integer num, Model model) throws Exception{
		QnaDTO qnaDTO=qnaService.qnaView(num);
		QnaDTO qnaBefore=qnaService.qnaBefore(num);
		QnaDTO qnaAfter=qnaService.qnaAfter(num);
		model.addAttribute("dto", qnaDTO);
		model.addAttribute("before", qnaBefore);
		model.addAttribute("after", qnaAfter);
	}

	//writeForm
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public void qnaWrite(Model model){
		model.addAttribute("path", "Write");
	}

	//write 
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public String qnaWrite(QnaDTO qnaDTO, RedirectAttributes rd)throws Exception{
		int result=qnaService.qnaWrite(qnaDTO);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:qnaList?curPage=2";
	}

	//update Form
	@RequestMapping(value="qnaUpdate", method=RequestMethod.GET)
	public String qnaUpdate(Integer num, Model model) throws Exception{
		QnaDTO qnaDTO = qnaService.qnaView(num);
		model.addAttribute("dto", qnaDTO);
		model.addAttribute("path", "Update");
		return "qna/qnaWrite";
	}
	//update 
	@RequestMapping(value="qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdate(QnaDTO qnaDTO, RedirectAttributes rd) throws Exception{
		int result = qnaService.qnaUpdate(qnaDTO);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:qnaList?curPage=1";
	}

	@RequestMapping(value="qnaDelete", method=RequestMethod.GET)
	public String qnaDelete(Integer num, RedirectAttributes rd){
		int result = qnaService.qnaDelete(num);
		String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:qnaList?curPage=2";
	}

}

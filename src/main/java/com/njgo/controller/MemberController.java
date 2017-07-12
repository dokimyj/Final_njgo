package com.njgo.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.njgo.dto.MemberDTO;
import com.njgo.service.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="provision",method= RequestMethod.GET)
	public void test(){
		
	}
	@RequestMapping(value="joinForm",method= RequestMethod.POST)
	public void join(){
		
	}
	
	@RequestMapping(value="memberJoin", method = RequestMethod.POST)
	public void memberJoin(MemberDTO memberDTO,Model model)throws Exception{
		
		int result = memberService.memberJoin(memberDTO);
		if(result>0){
			System.out.println("가입성공!");
		}else{
			System.out.println("가입실패!!");
		}
	}
	
	@RequestMapping(value="emailCheck", method = RequestMethod.POST)
	public ModelAndView emailCheck(String email){
		System.out.println("email채크");
		MemberDTO memberDTO = memberService.emailCheck(email);
		ModelAndView mv = new ModelAndView();
		int code = 1; // 사용가능한 email
		if(memberDTO!=null){
			code = 0; // 중복된 email 
		}
		mv.addObject("code", code);
		mv.setViewName("./member/commons/result");
		
		return mv;
	}
	
	@RequestMapping(value="nickNameCheck", method = RequestMethod.POST)
	public ModelAndView nickNameCheck(String nickName){
		System.out.println("nickName채크");

		MemberDTO memberDTO = memberService.nickNameCheck(nickName);
		ModelAndView mv = new ModelAndView();
		int code = 1; // 사용가능한 nickName
		if(memberDTO!=null){
			code = 0; // 중복된 nickName 
		}
		mv.addObject("code", code);
		mv.setViewName("./member/commons/result");
		
		return mv;
	}
	
	
	
}

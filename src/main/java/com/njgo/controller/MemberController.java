package com.njgo.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		
		
		memberService.memberJoin(memberDTO);
		
		System.out.println("email:"+memberDTO.getEmail());
		System.out.println("Address:"+memberDTO.getAddress());
		System.out.println("Name:"+memberDTO.getName());
		System.out.println("phone:"+memberDTO.getPhone());
		
		
	}
	
	
}

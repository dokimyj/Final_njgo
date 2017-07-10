package com.njgo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@RequestMapping(value="provision",method= RequestMethod.GET)
	public void test(){
		
	}
	@RequestMapping(value="joinForm",method= RequestMethod.POST)
	public void join(){
		
	}
	
	
}

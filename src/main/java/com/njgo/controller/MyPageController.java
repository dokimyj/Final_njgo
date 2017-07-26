package com.njgo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member/myPage/**")
public class MyPageController {
	
	@RequestMapping(value="myPage")
	public void myPage(){
		
	}
}

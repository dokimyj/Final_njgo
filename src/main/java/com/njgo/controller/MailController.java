package com.njgo.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njgo.dto.MemberDTO;
import com.njgo.service.MailService;
import com.njgo.service.MemberService;

@Controller
public class MailController {
		
		@Autowired
	    private MailService mailService;
		@Autowired
		private MemberService memberService;
   
	    /*public void setMailService(MailService mailService) {
	        this.mailService = mailService;
	    }*/
		
		@RequestMapping(value="member/checkEmail")
		public void Test(){
			
		}
		// 넘어온값으로 db 검색해서 결과가 일치하면 grade를 1로 update
		@RequestMapping(value="emailConfirm")
			public void emailTest(@RequestParam String joinCode, String email){
				System.out.println("메일에서 링크로 넘어온 값 : "+joinCode);
				System.out.println("메일에서 링크로 넘어온 값 : "+email);
					// 넘어온값으로 db 검색해서 결과가 일치하면 grade를 1로 update
			int  result =memberService.emailConfirm(joinCode,email);
			if(result >0){
				System.out.println("이메일 인증 가입성공!!");		
			}
		}
		
	    // 회원가입 이메일 인증
	    @RequestMapping(value ="member/sendEmail", method = RequestMethod.POST)
	    public String sendMailAuth(HttpSession session,Model model, @RequestParam String email, String joinCode) {
	    
	        session.setAttribute("joinCode", joinCode);
	 
	        String subject = "회원가입 인증 코드 발급 안내 입니다.";
	        StringBuilder sb = new StringBuilder();
	        sb.append("<a href='http://192.168.20.6/finalProject/emailConfirm?joinCode="+joinCode+"&email="+email+"' > 가입 승인 </a>");
	        
	        boolean result_sendMail = mailService.send(subject, sb.toString(), "rich20125@gmail.com", email, null);
	        String path ="";
	        if(result_sendMail){
	        	path = "member/emailCheck";
	        	model.addAttribute("email", email);
	        	model.addAttribute("joinCode", joinCode);
	        }else{
	        	System.out.println("이메일 발송에 실패했습니다.");
	        }
	        
	        return path;
	    }
}

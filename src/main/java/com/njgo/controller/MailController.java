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
		
		@RequestMapping(value="member/find_password")
		public void find_password(){
			
		}
		
		@RequestMapping(value="member/find_password",method=RequestMethod.POST)
		public String find_password(@RequestParam String email , Model model){
			MemberDTO memberDTO = memberService.find_password(email);
			String code = "NOT_EXIST";										// 성공/실패 code
			
			if(memberDTO !=null){
				 String subject = "넁장GO 계정 비밀번호 확인입니다.";   			//이메일 제목
				 code = "SUCCESS";
			        StringBuilder sb = new StringBuilder();
			        sb.append("<h2> 비밀번호 : "+memberDTO.getPw()+"</h2>");   //이메일 내용
			        
			        boolean result_sendMail = mailService.send(subject, sb.toString(), "fridgegotest@gmail.com", email, null);
			        if(!result_sendMail){	      
			        	System.out.println("이메일 발송에 실패했습니다.");
			        	return "home";
			        }	
			}
			model.addAttribute("code", code);
			
			return "member/commons/result";
		}
		
		// 넘어온값으로 db 검색해서 결과가 일치하면 grade를 1로 update
		@RequestMapping(value="emailConfirm")
			public String emailTest(@RequestParam String joinCode, String email, Model model, HttpSession session){
				System.out.println("메일에서 링크로 넘어온 값 : "+joinCode);
				System.out.println("메일에서 링크로 넘어온 값 : "+email);
					// 넘어온값으로 db 검색해서 결과가 일치하면 grade를 1로 update
			MemberDTO  memberDTO =memberService.emailConfirm(joinCode,email);
			System.out.println("memberDTO : "+memberDTO);
			String message ="가입실패...?!";
			
			if(memberDTO !=null){
					message ="가입성공!! 환영합니다.";
					model.addAttribute("message", message);
					session.setAttribute("memberDTO", memberDTO);
			}
			return "home";
		}
		
	    // 회원가입 이메일 인증
	    @RequestMapping(value ="member/sendEmail", method = RequestMethod.POST)
	    public String sendMailAuth(HttpSession session,Model model, @RequestParam String email, String joinCode) {
	    
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

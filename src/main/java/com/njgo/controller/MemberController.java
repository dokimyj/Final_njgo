package com.njgo.controller;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.njgo.dto.MemberDTO;
import com.njgo.service.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="provision",method= RequestMethod.GET)
	public void test(@RequestParam String login_mode,@RequestParam(defaultValue="") String access_token, Model model){
		
		
		model.addAttribute("login_mode", login_mode);
		model.addAttribute("access_token", access_token);
		
		
	}
	@RequestMapping(value="login")
	public void login(){
		
	}
	@RequestMapping(value="info_check" ,method=RequestMethod.GET)
	public void info_check(){
		
	}
	@RequestMapping(value="info_correct" ,method=RequestMethod.GET)
	public void info_correct(){
	
	}
	@RequestMapping(value="memberDelete" ,method=RequestMethod.GET)
	public void memberDelete(){
		
	}
	@RequestMapping(value="test" ,method=RequestMethod.GET)
	public void testKakao(){
	
	}
	
	//=================================== 로그인 , 회원정보 수정, 탈퇴 관련 ==========================================
	
	
	@RequestMapping(value="memberDelete" ,method=RequestMethod.POST)
	public String memberDelete(MemberDTO memberDTO,HttpSession session,RedirectAttributes rd){
		
		int result = memberService.memberDelete(memberDTO);
		String message ="이용해주셔서 감사합니다!";
	
		if(result>0){
			System.out.println("탈퇴 성공!!");
			session.invalidate();
			rd.addFlashAttribute("message", message);
		}
		return "redirect:../";
	}
	
	//회원 정보 수정
	@RequestMapping(value="infoCorrectSend",method=RequestMethod.POST)
	public String infoCorrectSend(@RequestParam String data,@RequestParam String type,@RequestParam String email,HttpSession session){
		/*System.out.println("data : "+data);
		System.out.println("type : "+type);
		System.out.println("email :"+email);*/
		int result = memberService.memberUpdate(data, type, email);
		MemberDTO memberDTO =null;
		
		if(result >0){
			memberDTO = memberService.emailCheck(email);
			session.setAttribute("memberDTO", memberDTO);
		}
		return "redirect:info_correct";
	}
	
	
	//회원정보 비밀번호 재확인
	@RequestMapping(value="info_check" ,method=RequestMethod.POST)
	public String info_check(MemberDTO memberDTO, RedirectAttributes rd){
		
		MemberDTO memberDTO_result = memberService.memberLogin(memberDTO);
		Boolean check =false;
		String message = "비밀번호를 다시 확인해주세요.";
		if(memberDTO_result !=null){
			check =true;
			rd.addFlashAttribute("check", check);
			return "redirect:info_correct";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:info_check";
	}
	
	
	
	// 로그인
	@RequestMapping(value="memberLogin",method={RequestMethod.GET,RequestMethod.POST})
	public String memberLogin(HttpSession session ,MemberDTO memberDTO,Model model){
		
		MemberDTO memberDTO_result = memberService.memberLogin(memberDTO);
		
		String message = "아이디 또는 비밀번호를 다시 확인해주세요.";
		// 로그인 성공
		if (memberDTO_result != null) {
			message = "로그인 성공!!";
			session.setAttribute("memberDTO", memberDTO_result);
			return "redirect:../";
		}
		//로그인 실패시 메세지 보내기
		model.addAttribute("message", message);
		
		return "member/login"; 
	}
	// 로그아웃 
	@RequestMapping(value="logout")
	public String memberLogout(HttpSession session){
	
		session.invalidate();
		return "home";
	}
	
	
	
	//=============================  Member Join START=====================================
	
	//약관 확인 누른다음 joinCode 생성해서 joinForm.jsp에 넣어줌
	@RequestMapping(value="joinForm",method= RequestMethod.POST)
	public void join(Model model, @RequestParam String login_mode, @RequestParam String access_token)throws Exception{
		
		String path = "memberJoin";
		if(login_mode.equals("SNS_join")){
			path="memberSNSJoin";
		}
		model.addAttribute("path", path);
		
		
		 int ran = new Random().nextInt(1000000) + 100000; // 100000 ~ 999999
	     String joinCode = String.valueOf(ran);
	     model.addAttribute("joinCode", joinCode);
	     model.addAttribute("access_token", access_token);	
	     model.addAttribute("login_mode", login_mode);
	}
	
	// 가입
	@RequestMapping(value="memberJoin", method = RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO ,Model model)throws Exception{
		
		//일반회원 이메일 인증 전 단계 grade = 0
		
		int result = memberService.memberJoin(memberDTO);
		String path ="member/sendEmail";
		if(result>0){
				
			model.addAttribute("email", memberDTO.getEmail());
			model.addAttribute("joinCode", memberDTO.getJoinCode());
			model.addAttribute("path", "sendEmail");
				
			return path;
		}else{
				
			return "redirect:../";
		}

	}
	// SNS(Kakao) 가입 
	@RequestMapping(value="memberSNSJoin", method = RequestMethod.POST)
	public String memberSNSJoin(MemberDTO memberDTO,RedirectAttributes rd,HttpSession session)throws Exception{
		
		int result = memberService.memberSNSJoin(memberDTO);
		if(result>0){
			session.setAttribute("memberDTO", memberDTO);
			rd.addFlashAttribute("message", "가입성공!! 환영합니다.");
		}else{
			rd.addFlashAttribute("message", "가입 실패 ERROR..");
		}
		return "redirect:../";
	}
	
	// 이메일 중복 체크 
	@RequestMapping(value="emailCheck", method = RequestMethod.POST)
	public ModelAndView emailCheck(String email){
		
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
	//1.kakaoID 중복 체크
	//2. 로그인 할때 kakao 아이디 존재 유무
		@RequestMapping(value="kakaoIDCheck", method = RequestMethod.POST)
		public ModelAndView kakaoIDCheck(String kakaoID){
			
			MemberDTO memberDTO = memberService.kakaoIDCheck(kakaoID);
			ModelAndView mv = new ModelAndView();
			int code = 1; // 사용가능한 kakaoID
			if(memberDTO!=null){
				code = 0; // 중복된 kakaoID 
			}
			mv.addObject("code", code);
			mv.setViewName("./member/commons/result");
			
			return mv;
		}

	// 닉네임 중복체크
	@RequestMapping(value="nickNameCheck", method = RequestMethod.POST)
	public ModelAndView nickNameCheck(String nickName){

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

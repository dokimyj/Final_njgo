package com.njgo.controller;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.njgo.dto.MemberDTO;
import com.njgo.service.FileService;
import com.njgo.service.MemberService;
import com.njgo.service.MyPageService;

@Controller
@RequestMapping(value="/member/myPage/**")
public class MyPageController {
	
	@Autowired
	private FileService fileService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="myPage")
	public void myPage(@RequestParam String nickName, HttpSession session){
		
		MemberDTO memberDTO = memberService.nickNameCheck(nickName);
		session.setAttribute("myPage", memberDTO);
		
	}
	
	@RequestMapping(value="profile_upload", method=RequestMethod.POST)
	public ModelAndView profile_upload(HttpSession session , MultipartFile myPhoto, String info, String email)throws Exception{
		System.out.println("myPhoto : "+myPhoto.getOriginalFilename());
		System.out.println("intfo :" +info);
		String fileName ="";
		int result =0;
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/myPage/myPage");
		// 이미지, Info 수정
		if(!myPhoto.getOriginalFilename().equals("") && !info.equals("")){
			
			fileName = fileService.fileSave(myPhoto, session);
			// 업로드 한뒤 DB Member 데이터 수정
			if(!fileName.equals("")){
				
				result = myPageService.profileUpdateBoth(fileName,info,email);
				// 업로드, DB수정이 성공하면  세션도 수정
				if(result >0){
					MemberDTO memberDTO = (MemberDTO)session.getAttribute("myPage");
					memberDTO.setInfo(info);
					memberDTO.setMyPhoto(fileName);
					session.setAttribute("myPage", memberDTO);
					session.setAttribute("memberDTO", memberDTO);
				}
			}
			
		}
		// 이미지만 수정
		else if(!myPhoto.getOriginalFilename().equals("") && info.equals("")){
			fileName = fileService.fileSave(myPhoto, session);
			
			if(!fileName.equals("")){
				
				result = myPageService.profileUpdate_f(fileName,email);
				// 업로드, DB수정이 성공하면  세션도 수정
				if(result >0){
					MemberDTO memberDTO = (MemberDTO)session.getAttribute("myPage");
					memberDTO.setMyPhoto(fileName);
					session.setAttribute("myPage", memberDTO);
					session.setAttribute("memberDTO", memberDTO);
				}
			}
		
		}
		// Info 수정
		else if(myPhoto.getOriginalFilename().equals("") && !info.equals("")){
			result = myPageService.profileUpdate_info(info, email);
			//  DB수정이 성공하면  세션도 수정
			if(result >0){
				MemberDTO memberDTO = (MemberDTO)session.getAttribute("myPage");
				memberDTO.setInfo(info);
				session.setAttribute("myPage", memberDTO);
				session.setAttribute("memberDTO", memberDTO);
			}
		}
		
		return mv;
			
		
		//  1. 자기 소개의 내용만 수정된 경우
		//  2. 자신의 "이미지"만 수정된 경우
		//  3. "이미지", "소개" 둘다 수정된 경우 
	}
	
}

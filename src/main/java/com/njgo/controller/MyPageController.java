package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.MemberDTO;
import com.njgo.service.FileService;
import com.njgo.service.MemberService;
import com.njgo.service.MyPageService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/member/myPage/**")
public class MyPageController {
	
	@Autowired
	private FileService fileService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MemberService memberService;
	
	// ==================================추가 ==================================================
	// Search , 닉네임으로 받아온다음 닉네임으로 검색 , 닉네임이 정확해야함
	@RequestMapping(value="userSearch", method=RequestMethod.POST)
	public String userSearch(MemberDTO memberDTO,  RedirectAttributes rd,Model model){
		System.out.println("search");
		List<MemberDTO> userList = new ArrayList<MemberDTO>();
		MemberDTO memberDTO_result = myPageService.userSearch(memberDTO);   //nickName 속성에만 값이 들어가있음
		String path ="redirect:userList?curPage=1";
		
		if(memberDTO_result ==null){
			String message ="존재하지않은 닉네임입니다.";
			rd.addFlashAttribute("message", message);
		}
		else{
			ListInfo listInfo = new ListInfo();
			listInfo.setPerPage(5);
			listInfo.setRow(listInfo.getCurPage(),5);			// 페이지당 몇개씩 보여줄지
			listInfo.makePage(1, 5);	
			userList.add(memberDTO_result);  									// 결과 DTO List형식에 추가	
			model.addAttribute("listInfo", listInfo);
			model.addAttribute("searchUser", userList);
			model.addAttribute("search", "search");	
			model.addAttribute("curPage", 1);
			path ="member/myPage/userList";
		}
		
		return path;
	}
	// userDelete  탈퇴버튼
	@RequestMapping(value="userDelete", method=RequestMethod.POST)
	public String userDelete(MemberDTO memberDTO, RedirectAttributes rd, int curPage){
	
		int result = myPageService.userDelete(memberDTO);
		
		return "redirect:userList?curPage="+curPage;
	}
	
	@RequestMapping(value="userWarn", method=RequestMethod.POST)
	public String userWarn(MemberDTO memberDTO, RedirectAttributes rd, int curPage){
	
		int result = myPageService.userWarn(memberDTO);
		
		return "redirect:userList?curPage="+curPage;
	}
	// userUpdate 정보 수정
	@RequestMapping(value="userUpdate", method=RequestMethod.POST)
	public String userUpdate(MemberDTO memberDTO, RedirectAttributes rd, int curPage){
	
		int result = myPageService.userUpdate(memberDTO);
		String message ="수정실패..?";
		if(result>0){
			message ="수정성공!";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:userList?curPage="+curPage;
	}
	
	
	// ==================================추가 ==================================================
	
	@RequestMapping(value="grade_view")
	public String grade_view(ListInfo listInfo, Model model){
		String data ="grade";
		int totalCount = memberService.memberTotalCount(data);  // 회원 총인원
		
		listInfo.setPerPage(5);
		listInfo.setRow(listInfo.getCurPage(),5);			// 페이지당 몇개씩 보여줄지
	
		List<MemberDTO> userList = memberService.memberGradeList(listInfo); //회원 리스트
		
		listInfo.makePage(totalCount, 5);					// 페이징처리 
		
		model.addAttribute("userList", userList);
		model.addAttribute("curPage", listInfo.getCurPage());
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("type", data);
		
		return "member/myPage/userList";
	}	
	
	@RequestMapping(value="warning_view")
	public String warning_view(ListInfo listInfo, Model model){
		String data ="warn";
		int totalCount = memberService.memberTotalCount(data);  // 회원 총인원
		
		listInfo.setPerPage(5);
		listInfo.setRow(listInfo.getCurPage(),5);			// 페이지당 몇개씩 보여줄지
		listInfo.makePage(totalCount, 5);					// 페이징처리 
		
		List<MemberDTO> userList = memberService.memberWarningList(listInfo); //회원 리스트
		model.addAttribute("userList", userList);
		model.addAttribute("curPage", listInfo.getCurPage());
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("type", data);
		
		return "member/myPage/userList";
	}	
	
	@RequestMapping(value="userList")
	public void userList(ListInfo listInfo, Model model){
		
		int totalCount = memberService.memberTotalCount();  // 회원 총인원
		
		listInfo.setPerPage(5);
		listInfo.setRow(listInfo.getCurPage(),5);			// 페이지당 몇개씩 보여줄지
		listInfo.makePage(totalCount, 5);					// 페이징처리 
		/*System.out.println("curPage : "+listInfo.getCurPage());
		System.out.println("startRow : "+ listInfo.getstartRow());
		System.out.println("lastRow : "+ listInfo.getLastRow());*/
		List<MemberDTO> userList = memberService.memberList(listInfo); //회원 리스트
		model.addAttribute("userList", userList);
		model.addAttribute("curPage", listInfo.getCurPage());
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("type", "list");
	
	}	
	
	
	@RequestMapping(value="myPage")
	public void myPage(@RequestParam String nickName, HttpSession session){
		
		MemberDTO memberDTO = memberService.nickNameCheck(nickName);
		session.setAttribute("myPage", memberDTO);
		
	}
	
	@RequestMapping(value="profile_upload", method=RequestMethod.POST)
	public ModelAndView profile_upload(HttpSession session , MultipartFile myPhoto, String info, String email)throws Exception{
		System.out.println("myPhoto : "+myPhoto.getOriginalFilename());
		System.out.println("info :" +info);
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

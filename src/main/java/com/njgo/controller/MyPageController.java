package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.FollowDTO;
import com.njgo.dto.MemberDTO;
import com.njgo.dto.MessageDTO;
import com.njgo.service.FileService;
import com.njgo.service.FollowService;
import com.njgo.service.MemberService;
import com.njgo.service.MessageService;
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
	@Autowired
	private FollowService followService;
	@Autowired
	private MessageService messageService;
	
	// ==================================user Search , Update ,Delete  ==================================================
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
		if(result>0){
			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setSend_nickName("운영자");
			messageDTO.setGet_nickName(memberDTO.getNickName());
			messageDTO.setTitle("경고 메세지 입니다.");
			messageDTO.setContents("신고에 의해 경고 1회 누적 되셨습니다. 경고가 많이 누적되면 이용에 제한이 됩니다.");
			messageDTO.setCategory("reportList");
			messageService.messageInsert(messageDTO);
		}
		
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
	
	
	// ================================== ==================================================
	
	// 등급 순으로 리스트 가져옴
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
	// 경고 많이 받은 순으로 가져옴
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
	// 유저 리스트 
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
	
	// ======================================== Follow START===========================================
	@RequestMapping(value="followingList")
	public void followingList(String nickName, Model model,@RequestParam(defaultValue="1",required=false) Integer curPage){
		// 팔로잉 리스트 가져오기 
		ListInfo listInfo = new ListInfo();
		listInfo.setCurPage(curPage);
		listInfo.setPerPage(10);
		listInfo.setRow(listInfo.getCurPage(),10);			// 페이지당 몇개씩 보여줄지
		
		List<String> followingList = followService.followingList(nickName);
		/*System.out.println("팔로워 리스트 : "+followingList.size());*/
		
		listInfo.makePage(followingList.size(), 5);					// 페이징처리 
		
		List<MemberDTO> f_List = followService.followList(followingList); 
		/*System.out.println(" test : "+f_List.size());*/
		List<Integer> f_count = new ArrayList<Integer>();
		for( int i = 0 ; i < followingList.size();i++){
			f_count.add(followService.followingCount(followingList.get(i)));
		}
		model.addAttribute("following_count", f_count);
		model.addAttribute("f_List", f_List);
		model.addAttribute("listInfo", listInfo);
	}
	// 팔로우
	@RequestMapping(value="follow",method=RequestMethod.POST)
	public String follow(String login_nickName,String myPage_nickName, Model model){
		
		 int result = myPageService.follow(login_nickName,myPage_nickName); 
		 return "redirect:myPage?nickName=test1";
	}
	// 팔로우 취소
	@RequestMapping(value="followCancel",method=RequestMethod.POST)
	public String followCancel(String login_nickName,String myPage_nickName, Model model){
		
		 int result = myPageService.followCancel(login_nickName,myPage_nickName);
		 
		 return "redirect:myPage?nickName=test1";  
	}
	
	
	
	// ======================================== Follow END===========================================
	// 마이페이지 
	@RequestMapping(value="myPage")
	public String myPage(@RequestParam String nickName, HttpSession session , Model model)throws Exception{
		
		System.out.println("myPage nickName : "+nickName);
		
		MemberDTO login_member = (MemberDTO)session.getAttribute("memberDTO"); 	// 로그인 된 계정
		
		MemberDTO myPage = memberService.nickNameCheck(nickName);				// 자신 또는 다른 사람의 myPage로 접속한경우 
		if(myPage ==null){
			model.addAttribute("message", "존재하지않는 닉네임입니다.");
			return "home";
		}																		// myPage만의 DTO를 생성함
		
		FollowDTO followDTO = new FollowDTO();								
		followDTO.setFollower(myPage.getNickName());
		//following 체크 
		// follower - following 존재 여부 확인
		FollowDTO follow_check =null;
		
		// 로그인을안하고 uri로 접글했을때 , myPage 내에서 세션이 만료되어 비로그인상태인 경우
		if(login_member!=null){
			followDTO.setFollowing(login_member.getNickName());
			follow_check = followService.followingCheck(followDTO);
		}
		
		int followingCount = followService.followingCount(myPage.getNickName());
		int followerCount = followService.followerCount(myPage.getNickName());
		
		if(follow_check != null){
			model.addAttribute("following", "following");   // 존재함 
		}else{
			model.addAttribute("follow", "follow");			// 존재하지 않음 
		}	 
		model.addAttribute("followingCount", followingCount);
		model.addAttribute("followerCount", followerCount);
		session.setAttribute("myPage", myPage);
		return "member/myPage/myPage";   
	}   
	// ======================================  프로필 수정 ========================================================
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

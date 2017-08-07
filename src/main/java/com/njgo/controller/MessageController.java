package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.njgo.dto.MemberDTO;
import com.njgo.dto.MessageDTO;
import com.njgo.service.MemberService;
import com.njgo.service.MessageService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="member/myPage/**")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private	MemberService memberService;
	
	@RequestMapping(value="messageList")
	public void messageList(){
		
	}
	//쪽지 쓰기
	@RequestMapping(value="messageWrite")
	public void messageWrite(String category,Model model, @RequestParam(required=false) String nickName){
		
		model.addAttribute("nickName", nickName);
		model.addAttribute("category", category);
	}
	
	// 쪽지 보기 
	@RequestMapping(value="messageView")
	public void messageView(int m_num,String category ,Model model){
		
		MessageDTO messageDTO = messageService.messageView(m_num,category);
		
		model.addAttribute("messageDTO", messageDTO);
		model.addAttribute("category", category);
		
	}
	// ==================================== 쪽지 리스트 ===================================
	@RequestMapping(value="messageList",method=RequestMethod.POST)
	public void messageList(String nickName,@RequestParam(defaultValue="general",required=false)String category,Model model, HttpSession session,@RequestParam(defaultValue="1",required=false) Integer curPage){
		System.out.println("message curPage : "+curPage);
		//  페이징 처리
		ListInfo listInfo = new ListInfo();
		listInfo.setCurPage(curPage);
		listInfo.setRow(curPage, 10);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		List<MessageDTO> m_List = new ArrayList<MessageDTO>();
		
		
		m_List = messageService.messageList(listInfo,category,nickName);		// 받은쪽지 리스트,신고 쪽지함 , 보낸쪽지함
			
		
		int totalCount = messageService.messageTotalCount(nickName,category);			// 총 메세지 갯수(닉네임에 대한)
		
		listInfo.makePage(totalCount, 5);										// 페이징 
		System.out.println("category : "+category);
		System.out.println("message List Size : "+m_List.size());
		System.out.println("message startRow : "+listInfo.getstartRow());
		System.out.println("message lastRow : "+listInfo.getLastRow());
		
		System.out.println("==========================================");
		
		String messageList_title = "받은 쪽지함";									// 쪽지 리스트 제목
		if(category.equals("report")){
			messageList_title="운영자 쪽지함";
		}else if(category.equals("send")){
			messageList_title="보낸 쪽지함";
		}
		
		model.addAttribute("m_List", m_List);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("messageList_title", messageList_title);
		model.addAttribute("curPage", curPage);
		model.addAttribute("category", category);
	}
	// 쪽지 보내기
	@RequestMapping(value="messageSend",method=RequestMethod.POST)
	public String messageSend(MessageDTO messageDTO){
		
		String message="메세지 오류 발생...";	
			//1. 보낸 사람 과 받은 사람 DB 저장 
			int result = messageService.messageInsert(messageDTO);
			if(result >0){
				message="메세지를 보냈습니다.!"	;	
			}	
		
		System.out.println("메세지 : "+message);
		return "redirect:messageWrite";				
	}
	
}

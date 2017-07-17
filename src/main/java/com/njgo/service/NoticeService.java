package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.NoticeDAO;
import com.njgo.dto.NoticeDTO;
import com.njgo.util.ListInfo;


@Service
public class NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	
	public List<NoticeDTO> noticeList(ListInfo listInfo){
		return noticeDAO.noticeList(listInfo);
	}

	public NoticeDTO noticeView(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	public int noticeWrite(NoticeDTO noticeDTO) {
		
		return noticeDAO.noticeWrite(noticeDTO);
	}

	public int noticeUpdate(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int noticeDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

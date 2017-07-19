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
		return noticeDAO.noticeView(num);
	}
	public NoticeDTO noticeBefore(int num) {
		return noticeDAO.noticeBefore(num);
	}
	public NoticeDTO noticeAfter(int num) {
		return noticeDAO.noticeAfter(num);
	}

	public int noticeWrite(NoticeDTO noticeDTO) {
		return noticeDAO.noticeWrite(noticeDTO);
	}

	public int noticeUpdate(NoticeDTO noticeDTO) {
		return noticeDAO.noticeUpdate(noticeDTO);
	}

	public int noticeDelete(int num) {
		return noticeDAO.noticeDelete(num);
	}

}

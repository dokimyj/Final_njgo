package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.NoticeDAO;
import com.njgo.dto.BoardDTO;
import com.njgo.util.ListInfo;


@Service
public class NoticeService implements BoardService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<BoardDTO> boardList(ListInfo listInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO boardView(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardWrite(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardUpdate(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.QnaDAO;
import com.njgo.dto.NoticeDTO;
import com.njgo.dto.QnaDTO;
import com.njgo.util.ListInfo;


@Service
public class QnaService{

	@Autowired
	private QnaDAO qnaDAO;
	
	
	public List<QnaDTO> qnaList(ListInfo listInfo) {
		return qnaDAO.qnaList(listInfo);
	}

	public QnaDTO qnaView(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	public int qnaWrite(QnaDTO qnaDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int qnaUpdate(QnaDTO qnaDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int qnaDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

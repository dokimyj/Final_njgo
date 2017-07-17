package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.QnaDTO;
import com.njgo.util.ListInfo;

@Repository
public class QnaDAO{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="QnaMapper.";
		
	
	public List<QnaDTO> qnaList(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"list",listInfo);
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

	public int qnaCount(ListInfo listInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int qnaHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

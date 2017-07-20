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
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}
	
	public QnaDTO qnaView(int num) {
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	public QnaDTO qnaBefore(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewbefore", num);
	}
	public QnaDTO qnaAfter(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewafter", num);
	}
	
	public int qnaWrite(QnaDTO qnaDTO) {
		return sqlSession.insert(NAMESPACE+"write", qnaDTO);	
	}
	
	public int qnaUpdate(QnaDTO qnaDTO) {
		return sqlSession.update(NAMESPACE+"update", qnaDTO);
	}
	
	public int qnaDelete(int num) {
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int qnaCount(ListInfo listInfo) {
		return 0;
	}

	public int qnaHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
}

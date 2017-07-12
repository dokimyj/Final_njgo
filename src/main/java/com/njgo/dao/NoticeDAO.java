package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.BoardDTO;
import com.njgo.util.ListInfo;

@Repository
public class NoticeDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="NoticeMapper.";

	@Override
	public List<BoardDTO> boardList(ListInfo listInfo) {
		System.out.println("noticedao");
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}

	@Override
	public BoardDTO boardView(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardWrite(BoardDTO boardDTO) {
		return sqlSession.insert(NAMESPACE+"write", boardDTO);
		
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

	@Override
	public int boardCount(ListInfo listInfo) {
		return 0;
	}

	@Override
	public int boardHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

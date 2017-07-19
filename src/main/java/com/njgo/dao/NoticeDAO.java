package com.njgo.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.njgo.dto.NoticeDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.njgo.util.ListInfo;

@Repository
public class NoticeDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="NoticeMapper.";

	public List<NoticeDTO> noticeList(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}

	public NoticeDTO noticeView(int num) {
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	public NoticeDTO noticeBefore(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewbefore", num);
	}
	public NoticeDTO noticeAfter(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewafter", num);
	}
	
	public int noticeWrite(NoticeDTO noticeDTO) {
		return sqlSession.insert(NAMESPACE+"write", noticeDTO);	
	}
	
	public int noticeUpdate(NoticeDTO noticeDTO) {
		return sqlSession.update(NAMESPACE+"update", noticeDTO);
	}
	
	public int noticeDelete(int num) {
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int noticeCount(ListInfo listInfo) {
		return 0;
	}

	public int noticeHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.NoticeDTO;
import com.njgo.util.ListInfo;

@Repository
public class NoticeDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="NoticeMapper.";

	public List<NoticeDTO> noticeList(ListInfo listInfo) {
		System.out.println("noticedao");
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}

	public NoticeDTO noticeView(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	public int noticeWrite(NoticeDTO noticeDTO) {
		return sqlSession.insert(NAMESPACE+"write", noticeDTO);
		
	}
	
	public int noticeUpdate(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int noticeDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int noticeCount(ListInfo listInfo) {
		return 0;
	}

	public int noticeHit(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.RankingDTO;
import com.njgo.util.ListInfo;

@Repository
public class RankingDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="RankingMapper.";

	public List<RankingDTO> rankingselect() {
		return sqlSession.selectList(NAMESPACE+"list");
	}

	public int rankingWrite(List<RankingDTO> ar) {
		return sqlSession.insert(NAMESPACE+"write", ar);		
	}
	
	public List<RankingDTO> rankingListhit(ListInfo listInfo) {
		return sqlSession.selectList(NAMESPACE+"listhit", listInfo);
	}
	
	/*public NoticeDTO noticeView(int num) {
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	public NoticeDTO noticeBefore(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewbefore", num);
	}
	public NoticeDTO noticeAfter(int num) {
		return sqlSession.selectOne(NAMESPACE+"viewafter", num);
	}
	

	
	public int noticeUpdate(NoticeDTO noticeDTO) {
		return sqlSession.update(NAMESPACE+"update", noticeDTO);
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
	}*/

}

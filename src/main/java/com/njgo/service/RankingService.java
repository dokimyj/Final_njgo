package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.RankingDAO;
import com.njgo.dto.RankingDTO;
import com.njgo.util.ListInfo;


@Service
public class RankingService{

	@Autowired
	private RankingDAO rankingDAO;
	
	
	public List<RankingDTO> rankingHit(ListInfo listInfo){
		List<RankingDTO> ar = rankingDAO.rankingselect();
		rankingDAO.rankingWrite(ar);
		return rankingDAO.rankingListhit(listInfo);
	}
	
	public List<RankingDTO> rankingScrap(ListInfo listInfo){
		List<RankingDTO> ar = rankingDAO.rankingselect();
		rankingDAO.rankingWrite(ar);
		return rankingDAO.rankingListhit(listInfo);
	}
	
	public List<RankingDTO> rankingUpload(ListInfo listInfo){
		/*List<RankingDTO> ar = rankingDAO.rankingUpload();
		rankingDAO.rankingWrite(ar);*/
		return rankingDAO.rankingListhit(listInfo);
	}

	/*public NoticeDTO noticeView(int num) {
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
		// TODO Auto-generated method stub
		return 0;
	}*/

}

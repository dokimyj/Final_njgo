package com.njgo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MessageDTO;
import com.njgo.util.ListInfo;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="MessageMapper.";
	
	
	public int messageInsert(MessageDTO messageDTO) {
		
		return sqlSession.insert(NAMESPACE+"messageInsert", messageDTO);
	}


	public int messageTotalCount(String nickName, String category) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nickName", nickName);
		map.put("category", category);
	
		return sqlSession.selectOne(NAMESPACE+"messageTotalCount",map);
	}


	public List<MessageDTO> messageList(ListInfo listInfo, String category, String nickName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("category", category);
		map.put("nickName", nickName);
		
		return sqlSession.selectList(NAMESPACE+"messageList", map);
	}


	public MessageDTO messageView(int m_num, String category) {
		
		if(!category.equals("send")){
			int result = sqlSession.update(NAMESPACE+"messageUpdate",m_num);			
		}
		
		return sqlSession.selectOne(NAMESPACE+"messageView", m_num);
	}
	
	
	
}

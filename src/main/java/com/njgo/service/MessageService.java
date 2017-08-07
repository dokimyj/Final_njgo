package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.MessageDAO;
import com.njgo.dto.MessageDTO;
import com.njgo.util.ListInfo;

@Service
public class MessageService {
	
	@Autowired
	private MessageDAO messageDAO;

	public int messageInsert(MessageDTO messageDTO) {
		
		return messageDAO.messageInsert(messageDTO);
	}

	public int messageTotalCount(String nickName, String category) {
	
		return messageDAO.messageTotalCount(nickName,category);
	}

	public List<MessageDTO> messageList(ListInfo listInfo, String category, String nickName) {
	
		return messageDAO.messageList(listInfo,category,nickName);
	}

	public MessageDTO messageView(int m_num, String category) {
	
		return messageDAO.messageView(m_num,category);
	}
	
}

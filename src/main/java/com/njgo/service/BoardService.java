package com.njgo.service;

import java.util.List;

import com.njgo.dto.BoardDTO;
import com.njgo.util.ListInfo;


public interface BoardService {
	
	public List<BoardDTO> boardList(ListInfo listInfo);
	public BoardDTO boardView(int num);
	public int boardWrite(BoardDTO boardDTO);
	public int boardUpdate(BoardDTO boardDTO);
	public int boardDelete(int num);
}

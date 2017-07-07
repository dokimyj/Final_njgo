package com.njgo.service;

import java.util.List;

import com.njgo.dto.BoardDTO;


public interface BoardService {
	
	public List<BoardDTO> boardList();
	public BoardDTO boardView(int num);
	public int boardWrite(BoardDTO boardDTO);
	public int boardUpdate(BoardDTO boardDTO);
	public int boardDelete(int num);
}

package com.njgo.dao;

import java.util.List;
import com.njgo.dto.BoardDTO;

public interface BoardDAO {
	
	public List<BoardDTO> boardList();
	public BoardDTO boardView(int num);
	public int boardWrite(BoardDTO boardDTO);
	public int boardUpdate(BoardDTO boardDTO);
	public int boardDelete(int num);
	public int boardCount();
	public int boardHit(int num);
}

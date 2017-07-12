package com.njgo.dao;

import java.util.List;
import com.njgo.dto.BoardDTO;
import com.njgo.util.ListInfo;

public interface BoardDAO {
	
	public List<BoardDTO> boardList(ListInfo listInfo);
	public BoardDTO boardView(int num);
	public int boardWrite(BoardDTO boardDTO);
	public int boardUpdate(BoardDTO boardDTO);
	public int boardDelete(int num);
	public int boardCount(ListInfo listInfo);
	public int boardHit(int num);
}

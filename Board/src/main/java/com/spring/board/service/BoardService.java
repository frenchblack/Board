package com.spring.board.service;

import java.util.List;
import java.util.Map;

import com.spring.board.model.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getBoardList() throws Exception;
	public int insertBoard(BoardVO boardVO) throws Exception;
}

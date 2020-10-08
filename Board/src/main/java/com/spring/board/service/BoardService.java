package com.spring.board.service;

import java.util.List;

import com.spring.board.model.BoardVO;

public interface BoardService {
	public List<BoardVO> getBoardList() throws Exception;
}

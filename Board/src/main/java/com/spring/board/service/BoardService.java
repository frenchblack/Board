package com.spring.board.service;

import java.util.List;

import com.spring.board.common.Pagination;
import com.spring.board.model.BoardVO;
import com.spring.board.model.SearchVO;

public interface BoardService {
	
	public List<BoardVO> getBoardList(Pagination pagination, SearchVO searchVO) throws Exception;
	public int insertBoard(BoardVO boardVO) throws Exception;
	public BoardVO getBoardContent(int board_cd) throws Exception;
	public int updateBoard(BoardVO boardVO) throws Exception;
	public int deleteBoard(int board_cd) throws Exception;
	public int getBoardCnt(SearchVO searchVO) throws Exception;
}

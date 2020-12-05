package com.spring.board.dao;

import java.util.List;

import com.spring.board.common.Pagination;
import com.spring.board.model.BoardVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList(Pagination pagination) throws Exception;
	public BoardVO getBoardContent(int board_cd) throws Exception;
	public int insertBoard(BoardVO boardVo) throws Exception;
	public int updateBoard(BoardVO boardVo) throws Exception;
	public int deleteBoard(int board_cd) throws Exception;
	public int getBoardCnt() throws Exception;
}

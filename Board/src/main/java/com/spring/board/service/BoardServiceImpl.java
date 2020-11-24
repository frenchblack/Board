package com.spring.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDAO;
import com.spring.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		return boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO getBoardContent(int board_cd) throws Exception {
		return boardDAO.getBoardContent(board_cd);
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		return boardDAO.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(int board_cd) throws Exception {
		return boardDAO.deleteBoard(board_cd);
	}

}

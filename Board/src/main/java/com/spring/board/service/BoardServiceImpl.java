package com.spring.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.board.common.Pagination;
import com.spring.board.dao.BoardDAO;
import com.spring.board.model.BoardVO;
import com.spring.board.model.CommentVO;
import com.spring.board.model.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> getBoardList(Pagination pagination, SearchVO searchVO) throws Exception {
		return boardDAO.getBoardList(pagination, searchVO); 
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

	@Override
	public int getBoardCnt(SearchVO searchVO) throws Exception {
		return boardDAO.getBoardCnt(searchVO);
	}

	@Override
	public List<CommentVO> getCommentList(Pagination pagination, int board_cd) throws Exception {
		return boardDAO.getCommentList(pagination, board_cd);
	}

	@Override
	public int getCommentCnt(int board_cd) throws Exception {
		return boardDAO.getCommentCnt(board_cd);
	}

	@Override
	public Map<String, Integer> updateComment(CommentVO commentVO) throws Exception {
		return boardDAO.updateComment(commentVO);
	}

	@Override
	public Map<String, Integer> insertComment(CommentVO commentVO) throws Exception {
		return boardDAO.insertComment(commentVO);
	}

	@Override
	public int deleteComment(CommentVO commentVO) throws Exception {
		return boardDAO.deleteComment(commentVO);
		
	}

}

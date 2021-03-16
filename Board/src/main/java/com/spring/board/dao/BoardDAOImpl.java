package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.board.common.Pagination;
//import com.spring.board.BoardDAOTest;
import com.spring.board.model.BoardVO;
import com.spring.board.model.CommentVO;
import com.spring.board.model.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> getBoardList(Pagination pagination, SearchVO searchVO) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pagination", pagination);
		params.put("searchVO", searchVO);
	
		return sqlSession.selectList("boardMapper.getBoardList", params);
	}

	@Override
	public BoardVO getBoardContent(int board_cd) throws Exception {
		return sqlSession.selectOne("boardMapper.getBoardContent", board_cd);
	}

	@Override
	public int insertBoard(BoardVO boardVo) throws Exception {
		return sqlSession.insert("boardMapper.insertBoard", boardVo);
	}

	@Override
	public int updateBoard(BoardVO boardVo) throws Exception {
		return sqlSession.update("boardMapper.updateBoard", boardVo);
	}

	@Override
	public int deleteBoard(int board_cd) throws Exception {
		return sqlSession.delete("boardMapper.deleteBoard", board_cd);
	}

	@Override
	public int getBoardCnt(SearchVO searchVO) throws Exception {
		return sqlSession.selectOne("boardMapper.getBoardCnt", searchVO);
	}

	@Override
	public List<CommentVO> getCommentList(Pagination pagination, int board_cd) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("pagination", pagination);
		params.put("board_cd", board_cd);
		
		return sqlSession.selectList("boardMapper.getCommentList", params);
	}

	@Override
	public int getCommentCnt(int board_cd) throws Exception {
		return sqlSession.selectOne("boardMapper.getCommentCnt", board_cd);
	}

	@Override
	public Map<String, Integer> updateComment(CommentVO commentVO) throws Exception {
		sqlSession.update("boardMapper.updateComment", commentVO);
		
		Map<String, Integer> result = new HashMap<String, Integer>();
		
		result.put("comment_cd", commentVO.getComment_cd());
		result.put("comment_class", commentVO.getComment_class());
		
		return result;
	}

	@Override
	public Map<String, Integer> insertComment(CommentVO commentVO) throws Exception {
		int comm_cd = sqlSession.insert("boardMapper.insertComment", commentVO);
		logger.info(commentVO.getComment_cd() + "/" + comm_cd);
		
		Map<String, Integer> result = new HashMap<String, Integer>();
		result.put("comment_cd", commentVO.getComment_cd());
		result.put("comment_class", commentVO.getComment_class());
		
		return result;
	}

	@Override
	public int deleteComment(CommentVO commentVO) throws Exception {
		return sqlSession.delete("boardMapper.deleteComment", commentVO);
	}

}

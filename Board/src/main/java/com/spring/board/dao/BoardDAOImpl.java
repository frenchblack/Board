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

}

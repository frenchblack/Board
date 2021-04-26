package com.spring.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.board.model.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int login(UserVO userVO) throws Exception {
		return sqlSession.selectOne("userMapper.login", userVO);
	}

	@Override
	public int join(UserVO userVO) throws Exception {
		return sqlSession.insert("userMapper.join", userVO);
	}

}

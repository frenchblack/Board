package com.spring.board.dao;

import com.spring.board.model.UserVO;

public interface UserDAO {
	public int login(UserVO userVO) throws Exception;
	public int join(UserVO userVO) throws Exception;
}

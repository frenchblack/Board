package com.spring.board.service;

import com.spring.board.model.UserVO;

public interface UserService {
	public int login(UserVO userVO) throws Exception;
	public int join(UserVO userVO) throws Exception;
}

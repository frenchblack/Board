package com.spring.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDAO;
import com.spring.board.model.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO userDAO;
	
	@Override
	public int login(UserVO userVO) throws Exception {
		return userDAO.login(userVO);
	}

}

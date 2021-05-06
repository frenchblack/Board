package com.spring.board.security;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.board.dao.UserDAO;
import com.spring.board.model.UserVO;

public class UserAuthService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(UserAuthService.class);
	
	@Inject
	private UserDAO userDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("loadUserByUsername");
		logger.info("username : " + username);
		UserVO user = null;
		try {
			user = userDAO.getUserByID(username);
	        if ( user==null ) {
	            throw new UsernameNotFoundException(username);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}

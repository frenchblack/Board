package com.spring.board.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.spring.board.model.UserVO;

public class UserAuthProvider implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory.getLogger(UserAuthProvider.class);
	
	private UserAuthService userDetailsService;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		logger.info("Authentication");
		
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();

		logger.info( authentication.toString() );
		logger.info( "username : " + username + " // password : " + password );
		
		UserVO user = (UserVO) userDetailsService.loadUserByUsername(username);
		
		logger.info("password : " + password + " // user.getPassword() : " + user.getPassword());
		logger.info(!password.equals(user.getPassword()) + "");
		
		
		if ( !password.equals(user.getPassword()) ) {
			throw new BadCredentialsException(username);
		}
		
		logger.info("!user.isEnabled()");
        if ( !user.isEnabled() ) {
            throw new BadCredentialsException(username);
        }

		return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	public UserAuthService getUserDetailsService() {
		return userDetailsService;
	}
	public void setUserDetailsService(UserAuthService userDetailsService) {
		this.userDetailsService = userDetailsService;
	}
	public BCryptPasswordEncoder getPasswordEncoder() {
		return passwordEncoder;
	}
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
}

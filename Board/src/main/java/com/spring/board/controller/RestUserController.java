package com.spring.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.board.model.UserVO;
import com.spring.board.service.UserService;

@RestController
@RequestMapping(value = "/RestUser")
public class RestUserController {
	private static final Logger logger = LoggerFactory.getLogger(RestUserController.class);
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/join", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int join(@RequestBody UserVO userVO) throws Exception {
		logger.info("join");
		
		return userService.join(userVO);
	}
}

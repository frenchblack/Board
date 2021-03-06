package com.spring.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.model.UserVO;
import com.spring.board.service.UserService;

@Controller
@RequestMapping(value = "/User")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/getJoinForm", method = RequestMethod.GET)
	public String getJoinForm(Model model) throws Exception {
		logger.info("getJoinForm");
		
		model.addAttribute("userVO", new UserVO());
		
		return "/user/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, @ModelAttribute("userVO") UserVO userVO) throws Exception {
		logger.info("login");
		
		//model.addAttribute("uriParser", uriParser);
		
		return "/free/free";
	}
	
	@RequestMapping(value = "/getLoginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String getLoginForm(Model model) throws Exception {
		logger.info("getLoginForm");
		
		model.addAttribute("userVO", new UserVO());
		
		return "/user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, @ModelAttribute("userVO") UserVO userVO) throws Exception {
		logger.info("login");
		
		//model.addAttribute("uriParser", uriParser);
		
		return "/free/free";
	}
}

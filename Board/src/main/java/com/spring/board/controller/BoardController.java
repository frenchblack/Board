package com.spring.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.model.BoardVO;
import com.spring.board.service.BoardService;

@Controller
@RequestMapping(value = "/Board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/Free/getBoardList", method = RequestMethod.GET)
	public String getBoardList(Model model) throws Exception {
		logger.info("getBoardList");
		model.addAttribute("boardList", boardService.getBoardList());
		
		return "/free/free";
	}
	
	@RequestMapping(value = "/Free/writeBoard", method = RequestMethod.GET)
	public String moveWriteBoard(Model model) throws Exception {
		logger.info("moveWriteBoard");
		return "/free/writeForm";
	}
	
	@RequestMapping(value = "/Free/insertBoard", method = RequestMethod.POST)
	public String insertBoard(@ModelAttribute("BoardVO") BoardVO boardVO, RedirectAttributes rttr) throws Exception {
		logger.info("insertBoard");
		boardService.insertBoard(boardVO);
		
		return "redirect:/Board/Free/getBoardList.do";
	}
}

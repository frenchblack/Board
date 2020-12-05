package com.spring.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.common.Pagination;
import com.spring.board.model.BoardVO;
import com.spring.board.service.BoardService;

@Controller
@RequestMapping(value = "/Board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/Free/getBoardList", method = RequestMethod.GET)
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,  @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		logger.info("getBoardList");
		
		int listCnt = boardService.getBoardCnt();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", boardService.getBoardList(pagination));
		
		return "/free/free";
	}
	
	@RequestMapping(value = "/Free/writeBoard", method = RequestMethod.GET)
	public String moveWriteBoard(Model model) throws Exception {
		logger.info("moveWriteBoard");
		model.addAttribute("boardVO", new BoardVO());
		
		return "/free/writeForm";
	}
	
	@RequestMapping(value = "/Free/insertBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("BoardVO") BoardVO boardVO, @RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {
		logger.info("saveBoard");
		if ( mode.equals("update") ) {
			boardService.updateBoard(boardVO);
		} else {
			boardService.insertBoard(boardVO);
		}
		
		return "redirect:/Board/Free/getBoardList.do";
	}
	
	@Transactional
	@RequestMapping(value = "/Free/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("board_cd") int board_cd) throws Exception {
		logger.info("getBoardContent");
		
		model.addAttribute("boardContent", boardService.getBoardContent(board_cd));
		
		return "/free/boardContent";
	}
	
	@RequestMapping(value = "/Free/updateForm", method = RequestMethod.GET)
	public String updateBoard(@RequestParam("board_cd") int board_cd, @RequestParam String mode, Model model) throws Exception {
		logger.info("updateBoard");
		model.addAttribute("boardContent", boardService.getBoardContent(board_cd));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		
		return "/free/writeForm";
	}
	
	@RequestMapping(value = "/Free/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("board_cd") int board_cd, RedirectAttributes rttr) throws Exception {
		logger.info("deleteBoard");
		boardService.deleteBoard(board_cd);
		
		return "redirect:/Board/Free/getBoardList.do";
	}
}

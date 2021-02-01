package com.spring.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.common.Pagination;
import com.spring.board.common.URIParser;
import com.spring.board.model.CommentVO;
import com.spring.board.service.BoardService;

@RestController
@RequestMapping(value = "/RestBoard")
public class RestBoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/Free/getCommentList", method = RequestMethod.POST)
	public List<CommentVO> getCommentList(Model model, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam("board_cd") int board_cd) throws Exception {
		logger.info("getCommentList");
		
		int listCnt = boardService.getCommentCnt(board_cd);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(30);
		pagination.setRangeSize(5);
		
		pagination.pageInfo(page, range, listCnt);
		
		URIParser uriParser = new URIParser();
		
		model.addAttribute("uriParser", uriParser);
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", boardService.getCommentList(pagination, board_cd));
		
		logger.info(boardService.getCommentList(pagination, board_cd).toString());
		
		return boardService.getCommentList(pagination, board_cd);
	}
	
	@RequestMapping(value = "/Free/insertComment", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String saveComment(@RequestBody CommentVO commentVO) throws Exception {
		logger.info("saveComment" + commentVO);
		
		int result;
		if ( commentVO.getComment_cd() == 0 ) {
			result = boardService.insertComment(commentVO);
		} else {
			result = boardService.updateComment(commentVO);
		}
		
		return result + "";
	}
	
	@RequestMapping(value = "/Free/deleteComment", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String deleteComment(@RequestBody CommentVO commentVO) throws Exception {
		logger.info("deleteComment:" + commentVO);
		
		int result;
		
		result = boardService.deleteComment(commentVO);
		
		return result + "";
	}
}

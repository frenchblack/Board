package com.spring.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.board.common.Pagination;
import com.spring.board.common.URIParser;
import com.spring.board.model.CommentVO;
import com.spring.board.service.BoardService;

@RestController
@RequestMapping(value = "/RestBoard")
public class RestBoardController {
	private static final Logger logger = LoggerFactory.getLogger(RestBoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/Free/getCommentList", method = RequestMethod.POST)
	public Map<String, Object> getCommentList(Model model
			, @RequestParam(value = "listSize", required = false, defaultValue = "10") int listSize
			, @RequestParam(value = "rangeSize", required = false, defaultValue = "5") int rangeSize
			, @RequestParam(value = "page", required = false, defaultValue = "1") int page
			, @RequestParam(value = "range", required = false, defaultValue = "1") int range
			, @RequestParam(value = "board_cd") int board_cd) throws Exception {
		logger.info("getCommentList");
		logger.info("listSize:" + listSize + "/rangeSize: " + rangeSize + "/page:" + page + "/range: " + range + "/board_cd: " + board_cd);
		
		int listCnt = boardService.getCommentCnt(board_cd);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(listSize);
		pagination.setRangeSize(rangeSize);
		
		if ( page < 0 && range < 0 ) {
			pagination.pageInfo(page, range, listCnt, true);
		} else {
			pagination.pageInfo(page, range, listCnt);
		}
		
		URIParser uriParser = new URIParser();
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("pagination", pagination);
		result.put("commentList", boardService.getCommentList(pagination, board_cd));
		
//		model.addAttribute("uriParser", uriParser);
//		model.addAttribute("pagination", pagination);
//		model.addAttribute("boardList", boardService.getCommentList(pagination, board_cd));
		
		logger.info("CommentListReturn: " + result);
		
		return result;
	}
	
	@RequestMapping(value = "/Free/insertComment", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Integer> saveComment(@RequestBody CommentVO commentVO) throws Exception {
		logger.info("saveComment" + commentVO);
		
		int comment_cd = commentVO.getComment_cd();
		Map<String, Integer> result;
		
		if ( comment_cd == 0 ) {
			result = boardService.insertComment(commentVO);
		} else {
			result = boardService.updateComment(commentVO);
		}
		
		result.put("mode", comment_cd == 0 ? 0 : 1);
		
		return result;
	}
	
	@RequestMapping(value = "/Free/deleteComment", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String deleteComment(@RequestBody CommentVO commentVO) throws Exception {
		logger.info("deleteComment:" + commentVO);
		
		int result;
		
		result = boardService.deleteComment(commentVO);
		
		return result + "";
	}
}

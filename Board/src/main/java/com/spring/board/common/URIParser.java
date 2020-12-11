package com.spring.board.common;

import java.util.Map;
import java.util.Map.Entry;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.board.model.SearchVO;

public class URIParser {
	private String freeList = "/Board/Free/getBoardList.do";
	private String freeContent = "/Board/Free/getBoardContent.do";
	private String freeWirte = "/Board/Free/writeBoard.do";
	
	public String getFreeList() {
		return freeList;
	}

	public void setFreeList(String freeList) {
		this.freeList = freeList;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

	public String getFreeWirte() {
		return freeWirte;
	}

	public void setFreeWirte(String freeWirte) {
		this.freeWirte = freeWirte;
	}

	public String parsingURI( Map<String, String> params ) {
		UriComponents uri;
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.newInstance();
		
		for ( Entry<String, String> entry : params.entrySet() ) {
			uriBuilder.queryParam(entry.getKey(), entry.getValue());
		}
		
		uri = uriBuilder.build();
		
		return uri.toString();
	}
	
	public String parsingURI( Map<String, String> params, SearchVO searchVO ) {
		UriComponents uri;
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.newInstance();
		
		for ( Entry<String, String> entry : params.entrySet() ) {
			uriBuilder.queryParam(entry.getKey(), entry.getValue());
		}
		
		if ( searchVO.getKeyword() != null ) {
			uriBuilder.queryParam("searchType", searchVO.getSearchType()).queryParam("keyword", searchVO.getKeyword());
		}
		
		uri = uriBuilder.build();
		
		return uri.toString();
	}

	@Override
	public String toString() {
		return "URIParser [freeList=" + freeList + ", freeContent=" + freeContent + ", freeWirte=" + freeWirte
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}

package com.spring.board.model;

public class BoardVO {
	public int board_cd;
	public String user_id;
	public String title;
	public String content;
	public String in_id;
	public String in_date;
	public String up_id;
	public String up_date;
	
	public int getBoard_cd() {
		return board_cd;
	}
	public void setBoard_cd(int borad_cd) {
		this.board_cd = borad_cd;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String tile) {
		this.title = tile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIn_id() {
		return in_id;
	}
	public void setIn_id(String in_id) {
		this.in_id = in_id;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getUp_id() {
		return up_id;
	}
	public void setUp_id(String up_id) {
		this.up_id = up_id;
	}
	public String getUp_date() {
		return up_date;
	}
	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	@Override
	public String toString() {
		return "BoardVO [board_cd=" + board_cd + ", user_id=" + user_id + ", title=" + title + ", content=" + content
				+ ", in_id=" + in_id + ", in_date=" + in_date + ", up_id=" + up_id + ", up_date=" + up_date + "]";
	}
}

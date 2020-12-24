package com.spring.board.model;

public class CommentVO {
	public int board_cd;
	public int comment_cd;
	public int comment_class;
	public String user_id;
	public String comment_content;
	public String in_date;
	
	public int getBoard_cd() {
		return board_cd;
	}
	public void setBoard_cd(int board_cd) {
		this.board_cd = board_cd;
	}
	public int getComment_cd() {
		return comment_cd;
	}
	public void setComment_cd(int comment_cd) {
		this.comment_cd = comment_cd;
	}
	public int getComment_class() {
		return comment_class;
	}
	public void setComment_class(int comment_class) {
		this.comment_class = comment_class;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	@Override
	public String toString() {
		return "CommentVO [board_cd=" + board_cd + ", comment_cd=" + comment_cd + ", comment_class=" + comment_class
				+ ", user_id=" + user_id + ", comment_content=" + comment_content + ", in_date=" + in_date + "]";
	}
}

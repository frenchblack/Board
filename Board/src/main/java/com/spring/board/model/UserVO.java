package com.spring.board.model;

public class UserVO {
	public String user_id;
	public String user_pw;
	public String user_nm;
	public String join_dt;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getJoin_dt() {
		return join_dt;
	}
	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}
}

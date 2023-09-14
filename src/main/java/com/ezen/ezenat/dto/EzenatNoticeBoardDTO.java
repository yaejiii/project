package com.ezen.ezenat.dto;

public class EzenatNoticeBoardDTO {

	private int notice_board_num;
	private String notice_board_subject;
	private String notice_board_content;
	private String notice_board_input_date;
	private String notice_board_writer;
	private String notice_board_writer_ip;
	private int notice_board_readcount;
	
	private String notice_board_admin_password;

	public int getNotice_board_num() {
		return notice_board_num;
	}

	public void setNotice_board_num(int notice_board_num) {
		this.notice_board_num = notice_board_num;
	}

	public String getNotice_board_subject() {
		return notice_board_subject;
	}

	public void setNotice_board_subject(String notice_board_subject) {
		this.notice_board_subject = notice_board_subject;
	}

	public String getNotice_board_content() {
		return notice_board_content;
	}

	public void setNotice_board_content(String notice_board_content) {
		this.notice_board_content = notice_board_content;
	}

	public String getNotice_board_input_date() {
		return notice_board_input_date;
	}

	public void setNotice_board_input_date(String notice_board_input_date) {
		this.notice_board_input_date = notice_board_input_date;
	}

	public String getNotice_board_writer() {
		return notice_board_writer;
	}

	public void setNotice_board_writer(String notice_board_writer) {
		this.notice_board_writer = notice_board_writer;
	}

	public String getNotice_board_writer_ip() {
		return notice_board_writer_ip;
	}

	public void setNotice_board_writer_ip(String notice_board_writer_ip) {
		this.notice_board_writer_ip = notice_board_writer_ip;
	}

	public int getNotice_board_readcount() {
		return notice_board_readcount;
	}

	public void setNotice_board_readcount(int notice_board_readcount) {
		this.notice_board_readcount = notice_board_readcount;
	}

	public String getNotice_board_admin_password() {
		return notice_board_admin_password;
	}

	public void setNotice_board_admin_password(String notice_board_admin_password) {
		this.notice_board_admin_password = notice_board_admin_password;
	}

}

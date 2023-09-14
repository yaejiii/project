package com.ezen.ezenat.dto;

public class EzenatFAQBoardDTO {

	private int faq_board_num;
	private String faq_board_subject;
	private String faq_board_content;
	private String faq_board_input_date;
	private String faq_board_writer;
	private String faq_board_writer_ip;
	
	private String faq_board_admin_password;

	public int getFaq_board_num() {
		return faq_board_num;
	}

	public void setFaq_board_num(int faq_board_num) {
		this.faq_board_num = faq_board_num;
	}

	public String getFaq_board_subject() {
		return faq_board_subject;
	}

	public void setFaq_board_subject(String faq_board_subject) {
		this.faq_board_subject = faq_board_subject;
	}

	public String getFaq_board_content() {
		return faq_board_content;
	}

	public void setFaq_board_content(String faq_board_content) {
		this.faq_board_content = faq_board_content;
	}

	public String getFaq_board_input_date() {
		return faq_board_input_date;
	}

	public void setFaq_board_input_date(String faq_board_input_date) {
		this.faq_board_input_date = faq_board_input_date;
	}

	public String getFaq_board_writer() {
		return faq_board_writer;
	}

	public void setFaq_board_writer(String faq_board_writer) {
		this.faq_board_writer = faq_board_writer;
	}

	public String getFaq_board_writer_ip() {
		return faq_board_writer_ip;
	}

	public void setFaq_board_writer_ip(String faq_board_writer_ip) {
		this.faq_board_writer_ip = faq_board_writer_ip;
	}

	public String getFaq_board_admin_password() {
		return faq_board_admin_password;
	}

	public void setFaq_board_admin_password(String faq_board_admin_password) {
		this.faq_board_admin_password = faq_board_admin_password;
	}

}

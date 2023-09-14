package com.ezen.ezenat.dto;

public class ReviewBoardDTO {
	private int review_board_num;
	private int product_num;
	private int member_num; //멤버로 불러와서 멤버 이름을 입력하는 방식으로...
	private String title; //없애기
	private String content;
	private String write_date;
	private int height; 
	private int weight;
	private int score;
	// 상품 평균별점 가지고 오기...?
	private int recommend_count; //만들기

	public int getReview_board_num() {
		return review_board_num;
	}
	public void setReview_board_num(int review_board_num) {
		this.review_board_num = review_board_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getRecommend_count() {
		return recommend_count;
	}
	public void setRecommend_count(int recommend_count) {
		this.recommend_count = recommend_count;
	}
}

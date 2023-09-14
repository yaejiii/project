package com.ezen.ezenat.dto;

public class EzenatOrderHistoryDTO {

	private String order_history_num;
	private int member_num;
	private int total_price;
	private int used_point;
	private int discount;
	private int delivery_fee;
	private String order_history_password;
	private String order_history_date;
	
	public String getOrder_history_num() {
		return order_history_num;
	}
	public void setOrder_history_num(String order_history_num) {
		this.order_history_num = order_history_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getUsed_point() {
		return used_point;
	}
	public void setUsed_point(int used_point) {
		this.used_point = used_point;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public String getOrder_history_password() {
		return order_history_password;
	}
	public void setOrder_history_password(String order_history_password) {
		this.order_history_password = order_history_password;
	}
	public String getOrder_history_date() {
		return order_history_date;
	}
	public void setOrder_history_date(String order_history_date) {
		this.order_history_date = order_history_date;
	}
}

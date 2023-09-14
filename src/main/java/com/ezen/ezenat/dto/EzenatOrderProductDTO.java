package com.ezen.ezenat.dto;

public class EzenatOrderProductDTO {

	private int order_product_num;
	private int product_num;
	private String order_history_num;
	private String tracking_number;
	private int order_product_price;
	private int order_product_qty;
	private String order_product_status;
	
	public String getOrder_product_status() {
		return order_product_status;
	}
	public void setOrder_product_status(String order_product_status) {
		this.order_product_status = order_product_status;
	}
	public int getOrder_product_num() {
		return order_product_num;
	}
	public void setOrder_product_num(int order_product_num) {
		this.order_product_num = order_product_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getOrder_history_num() {
		return order_history_num;
	}
	public void setOrder_history_num(String order_history_num) {
		this.order_history_num = order_history_num;
	}
	public String getTracking_number() {
		return tracking_number;
	}
	public void setTracking_number(String tracking_number) {
		this.tracking_number = tracking_number;
	}
	public int getOrder_product_price() {
		return order_product_price;
	}
	public void setOrder_product_price(int order_product_price) {
		this.order_product_price = order_product_price;
	}
	public int getOrder_product_qty() {
		return order_product_qty;
	}
	public void setOrder_product_qty(int order_product_qty) {
		this.order_product_qty = order_product_qty;
	}
}

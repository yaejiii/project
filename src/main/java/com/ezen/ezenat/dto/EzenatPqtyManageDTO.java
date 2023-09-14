package com.ezen.ezenat.dto;

public class EzenatPqtyManageDTO {
	private int product_num;
	private int store_num;
	private String store_name;
	private int offline_pqty;
	private int store_nowon_pqty;
	private int store_gangnam_pqty;
	private int store_hongdae_pqty;
	
	
	public int getStore_nowon_pqty() {
		return store_nowon_pqty;
	}
	public void setStore_nowon_pqty(int store_nowon_pqty) {
		this.store_nowon_pqty = store_nowon_pqty;
	}
	public int getStore_gangnam_pqty() {
		return store_gangnam_pqty;
	}
	public void setStore_gangnam_pqty(int store_gangnam_pqty) {
		this.store_gangnam_pqty = store_gangnam_pqty;
	}
	public int getStore_hongdae_pqty() {
		return store_hongdae_pqty;
	}
	public void setStore_hongdae_pqty(int store_hongdae_pqty) {
		this.store_hongdae_pqty = store_hongdae_pqty;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getStore_num() {
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getOffline_pqty() {
		return offline_pqty;
	}
	public void setOffline_pqty(int offline_pqty) {
		this.offline_pqty = offline_pqty;
	}
}

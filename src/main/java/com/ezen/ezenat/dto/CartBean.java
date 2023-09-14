package com.ezen.ezenat.dto;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.ezen.ezenat.service.MallClientMapper;

public class CartBean {

//	@Autowired
//	private MallClientMapper mallClientMapper;
	
	private List<EzenatProductAllDTO> cart;
	
	public CartBean() {
		cart = new ArrayList<>();
	}
	
	public int insertCart(int product_num, int product_qty, MallClientMapper mallClientMapper) {
		if (product_qty <= 0) {
			return 0;
		}

		EzenatProductAllDTO dto = mallClientMapper.getProduct(product_num);
		dto.setProduct_pqty(product_qty);
		
		for (EzenatProductAllDTO prod_dto : cart) {
			if (prod_dto.getProduct_num() == dto.getProduct_num()) {
				prod_dto.setProduct_pqty(prod_dto.getProduct_pqty() + dto.getProduct_pqty());
				
				return 1;
			}
		}
		cart.add(dto);
		
		return 1;
	}
	
	public List<EzenatProductAllDTO> getListCart() {
		return cart;
	}
	
	public int getListCartQty() {
		return cart.size();
	}
	
	public EzenatProductAllDTO getCart(int product_num, MallClientMapper mallClientMapper) {
		EzenatProductAllDTO dto = mallClientMapper.getProduct(product_num);
		
		for (EzenatProductAllDTO prod_dto : cart) {
			if (prod_dto.getProduct_num() == dto.getProduct_num()) {
				
				return prod_dto;
			}
		}
		
		return null;
	}
	
	public EzenatProductAllDTO getSelectCart(int product_num, MallClientMapper mallClientMapper) {
		EzenatProductAllDTO dto = mallClientMapper.getProduct(product_num);
		
		return dto;
	}
	
	public int deleteCart(int product_num) {
		for (EzenatProductAllDTO productDTO : cart) {
			if (productDTO.getProduct_num() == product_num) {
				cart.remove(productDTO);
				
				return 1;
			}
		}
		
		return 0;
	}
	
	public void deleteAllCart() {
		cart.clear();
	}
	
	public int editCart(int product_num, int product_qty) {
		if (product_qty <= 0) {
			deleteCart(product_num);
		}
		
		for (EzenatProductAllDTO prod_dto : cart) {
			if (prod_dto.getProduct_num() == product_num) {
				prod_dto.setProduct_pqty(product_qty);
				
				return 1;
			}
		}
		
		return 0;
	}
}

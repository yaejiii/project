package com.ezen.ezenat.dto;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ezen.ezenat.service.MallClientMapper;

public class OrderHistoryBean {

//	@Autowired
	private MallClientMapper mallClientMapper;
	
	private List<EzenatOrderHistoryDTO> orderHistory;
	
	public OrderHistoryBean() {
		orderHistory = new ArrayList<>();
	}
	
	public void setMallClientMapper(MallClientMapper mallClientMapper) {
		this.mallClientMapper = mallClientMapper;
	}
	
	// 회원의 주문내역들 세팅
	public void setOrderHistoryList(int member_num) {
		orderHistory = mallClientMapper.getOrderHistoryList(member_num);
	}
	
	// 회원의 주묵내역 리스트 가져오기
	public List<EzenatOrderHistoryDTO> getOrderHistoryList() {
		return orderHistory;
	}
	
	// 회원의 주문내역 총 개수
	public int getOrderHistoryListSize() {
		return orderHistory.size();
	}

	//-------------mypage 주문 status 별 Count----------------
	// 입금 전
	public int getBeforeDepositCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getBeforeDepositCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	
	// 배송 준비중
	public int getPreparingCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getPreparingCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	
	// 배송 중
	public int getShippingCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getShippingCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	
	// 배송 완료
	public int getCompletedCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getCompletedCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	
	// 주문 취소
	public int getCancellationCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getCancellationCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	
	// 주문 교환
	public int getExchangeCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getExchangeCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	
	// 주문 반품
	public int getReturnCount() {
		int count = 0;
		for (EzenatOrderHistoryDTO orderHistoryDTO : orderHistory) {
			count += mallClientMapper.getReturnCount(orderHistoryDTO.getOrder_history_num());
		}
		
		return count;
	}
	//-----------------------------------------------------
}

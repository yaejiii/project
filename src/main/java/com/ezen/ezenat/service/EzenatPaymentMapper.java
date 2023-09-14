package com.ezen.ezenat.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ezenat.dto.EzenatOrderHistoryDTO;
import com.ezen.ezenat.dto.EzenatOrderProductDTO;

@Service
public class EzenatPaymentMapper {

	@Autowired 
	SqlSession sqlSession;
	
	// 주문번호 중복 조회
		public int checkOrderHistoryCode(String code) {
			return sqlSession.selectOne("check_order_history_code", code);
		}
	
	// 주문내역 입력
		public int insertOrderHistory(EzenatOrderHistoryDTO dto) {
			return sqlSession.insert("insert_order_history", dto);
		}
		
	// 주문상품 입력
		public int insertOrderProductDTO(EzenatOrderProductDTO dto) {
			return sqlSession.insert("insert_order_product", dto);
		}
		
	// 주문한 주소 입력
	// 주문 포인트 사용 내역 입력
	// 주문 쿠폰 사용 내역 입력
		
//	// 쿠폰넘버(시퀀스) 넣기
//		public int insertCouponNumSeq() {
//			return sqlSession.insert("insert_coupon_num");
//		}

	// 쿠폰넘버(시퀀스) 받기
		public int selectCouponNumSeq() {
			return sqlSession.selectOne("select_coupon_num");
		}

}

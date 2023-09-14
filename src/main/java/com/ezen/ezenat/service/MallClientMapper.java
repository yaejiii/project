package com.ezen.ezenat.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ezenat.dto.EzenatOrderHistoryDTO;
import com.ezen.ezenat.dto.EzenatOrderProductDTO;
import com.ezen.ezenat.dto.EzenatProductAllDTO;

@Service
public class MallClientMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int getCount() {
		int count = sqlSession.selectOne("getCount");
		
		return count;
	}

	public List<EzenatProductAllDTO> getProductList(int startRow, int endRow) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("start", startRow);
		map.put("end", endRow);
		
		List<EzenatProductAllDTO> list = sqlSession.selectList("getProductList", map);
		
		return list;
	}

	public EzenatProductAllDTO getProduct(int product_num) {
		EzenatProductAllDTO dto = sqlSession.selectOne("getProduct", product_num);
		
		return dto;
	}
	
	public List<EzenatOrderHistoryDTO> getOrderHistoryList(int member_num) {
		List<EzenatOrderHistoryDTO> list = sqlSession.selectList("getOrderHistoryList", member_num);
		
		return list;
	}

	public int getBeforeDepositCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "입금전");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	public int getPreparingCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "배송준비중");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	public int getShippingCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "배송중");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	public int getCompletedCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "배송완료");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	public int getCancellationCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "주문취소");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	public int getExchangeCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "주문교환");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	public int getReturnCount(String order_history_num) {
		Map<String, String> map = new Hashtable<>();
		map.put("order_history_num", order_history_num);
		map.put("status", "주문반품");
		
		int res = sqlSession.selectOne("getStatusCount", map);
		
		return res;
	}

	
}

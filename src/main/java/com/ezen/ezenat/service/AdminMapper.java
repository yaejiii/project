package com.ezen.ezenat.service;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ezenat.dto.EzenatCategoryDTO;
import com.ezen.ezenat.dto.EzenatMemberDTO;
import com.ezen.ezenat.dto.EzenatOfflineStoreDTO;
import com.ezen.ezenat.dto.EzenatOrderHistoryDTO;
import com.ezen.ezenat.dto.EzenatPqtyManageDTO;
import com.ezen.ezenat.dto.EzenatProductAllDTO;
import com.ezen.ezenat.dto.EzenatProductDTO;
import com.ezen.ezenat.dto.EzenatProductImageDTO;

@Service
public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<EzenatCategoryDTO> listCate() {
		return sqlSession.selectList("listCate");
	}

	public int insertProduct(EzenatProductDTO dto) {
		return sqlSession.insert("insertProduct", dto);
	}

	public int insertProductImage(EzenatProductImageDTO dto) {
		return sqlSession.insert("insertProductImage", dto);
	}

	public List<EzenatProductAllDTO> listProd(Map<String, String>map) {
		return sqlSession.selectList("listProd",map);
	}

	public int getProductNum(EzenatProductDTO dto) {
		return sqlSession.selectOne("getProductNum", dto);
	}

	public int getProductCount(EzenatProductDTO dto) {
		return sqlSession.selectOne("getProductCount", dto);
	}

	public EzenatProductAllDTO getProd(int product_num) {
		return sqlSession.selectOne("getProd", product_num);
	}

	public int updateProd(EzenatProductDTO dto) {
		return sqlSession.update("updateProd", dto);
	}

	public int updateProdImage(EzenatProductImageDTO dto) {
		return sqlSession.update("updateProdImage", dto);
	}

	public EzenatProductImageDTO imageList(int product_num) {
		return sqlSession.selectOne("imageList", product_num);
	}

	
	public int deleteRealProdList(String num){ 
		sqlSession.delete("deleteProdImgList",num); 
		return sqlSession.delete("deleteRealProdList",num); 
	}

	public int moveDeleteProdList(String num) {
		return sqlSession.update("moveDeleteProdList", num);
	}
	
	public int moveRestoreProdList(String num) {
		return sqlSession.update("moveRestoreProdList", num);
	}

	public List<EzenatProductAllDTO> deleteProdList(Map<String, String> map) { 
		 return sqlSession.selectList("deleteProdList", map); 
	}
	 
	public List<Integer> deleteNumList() {
		return sqlSession.selectList("deleteNumList");
	}

	/*
	 * public int editPqty(int input) { return sqlSession.selectOne("editPqty",
	 * input); }
	 */
	
//	public int codeCheck(String input) {
//		return sqlSession.selectOne("codeCheck", input);
//	}
	
	public int pNameCheck(String input) {
		return sqlSession.selectOne("pNameCheck", input);
	}

	public List<EzenatProductAllDTO> searchProductname(String searchString){
		System.out.println("상품명 검색: " + searchString);
		return sqlSession.selectList("searchProductname", "%" + searchString + "%");
	}
	
	public List<EzenatProductAllDTO> searchProductcode(String searchString){
		System.out.println("상품코드 검색: " + searchString);
		return sqlSession.selectList("searchProductcode", "%" + searchString + "%");
	}
	
	public List<EzenatProductAllDTO> searchProductnameDel(String searchString){
		System.out.println("상품명 검색: " + searchString);
		return sqlSession.selectList("searchProductnameDel", "%" + searchString + "%");
	}
	
	public List<EzenatProductAllDTO> searchProductcodeDel(String searchString){
		System.out.println("상품코드 검색: " + searchString);
		return sqlSession.selectList("searchProductcodeDel", "%" + searchString + "%");
	}
	
	 public int adminDeleteMember(String id){ 											//관리자쪽 회원 삭제.
		 sqlSession.delete("adminDeleteMember",id); 
		 return sqlSession.delete("adminDeleteMember",id); 
	 }
	 
	 public List<EzenatMemberDTO> searchId(String searchString){
		System.out.println("아이디 검색: " + searchString);
		return sqlSession.selectList("searchId", "%" + searchString + "%");
	 }
	 
	 public List<EzenatMemberDTO> searchEmail(String searchString){
		System.out.println("이메일 검색: " + searchString);
		return sqlSession.selectList("searchEmail", "%" + searchString + "%");
	 }
	 
	 public List<EzenatMemberDTO> searchHp(String searchString){
		System.out.println("전화번호 검색: " + searchString);
		return sqlSession.selectList("searchHp", "%" + searchString + "%");
	 }
	 
	 public List<EzenatMemberDTO> searchNickname(String searchString){
		System.out.println("닉네임 검색: " + searchString);
		return sqlSession.selectList("searchNickname", "%" + searchString + "%");
	 }
	 
	 public List<EzenatMemberDTO> searchAddress(String searchString){
		System.out.println("주소 검색: " + searchString);
		return sqlSession.selectList("searchAddress", "%" + searchString + "%");
	 }

	public int memberMoveBlackList(String id) {
		return sqlSession.update("memberMoveBlackList", id);
	}
	 
	public int memberMoveNormalList(String id) {		
		return sqlSession.update("memberMoveNormalList", id);
	}
	 
	public List<EzenatMemberDTO> memberBlackList(Map<String, String> map) { 
		 return sqlSession.selectList("memberBlackList", map); 
	}
	
	public List<String> memberIdList() {
			return sqlSession.selectList("memberIdList");
	}
	 
	/*
	 * public List<EzenatProductDTO> searchCategory(String search){
	 * System.out.println("분류 검색: " + search); return
	 * sqlSession.selectList("searchCategory", "%" + search+ "%"); }
	 */
	
	public List<EzenatMemberDTO> searchRatingList(Map<String, String> map) {

		return sqlSession.selectList("searchRatingList",map);
	}

	public List<EzenatMemberDTO> searchList(Map<String, String> map) {

		return sqlSession.selectList("searchList",map);
	}

	public int updateRating(Map<String,String> map) {
		
		return sqlSession.update("updateRating", map);
	}
	
	public List<EzenatProductAllDTO> moveSoldoutList() {

		return sqlSession.selectList("moveSoldoutList");
	}

	public List<EzenatProductAllDTO> listPqty() {
		return sqlSession.selectList("listPqty");
	}

	public int updateOnlinePqty(EzenatProductAllDTO dto) {
		return sqlSession.update("updateOnlinePqty", dto);
	}
	
	 public List<EzenatProductAllDTO> searchOfflinePlace(String searchString) {
		System.out.println("지점명 검색: " + searchString);
		return sqlSession.selectList("searchOfflinePlace", "%" + searchString + "%");
	}
		
	public List<EzenatProductAllDTO> searchOfflinePlaceDel(String searchString) {
		System.out.println("지점명 검색: " + searchString);
		return sqlSession.selectList("searchOfflinePlaceDel", "%" + searchString + "%");
	}
	
	/* 진성님 구역 */
	// 7월 12일 추가
	public int upgradeAdminPower(int member_num) {
	
		return sqlSession.update("upgradeAdminPower",member_num);
	}

	public int downgradeAdminPower(int member_num) {
		
		return sqlSession.update("downgradeAdminPower",member_num);
	}
	//7/12 요기까지.
	
	// 주문전체목록 (7월 23일 수정)
	public List<EzenatOrderHistoryDTO> listOrder(Map<String, String> map) {
	
		return sqlSession.selectList("listOrder", map);
	}
	
	public List<EzenatProductAllDTO> searchOrderList(Map<String, String> map) {
	
		return sqlSession.selectList("searchOrderList", map);
	}
	
	public List<EzenatOrderHistoryDTO> searchOrderNum(Map<String, String> map) {
		map.put("searchString", "%" + map.get("searchString") + "%");
		if(map.get("search").equals("order_history_num")) {
			map.put("search", "order_history_num");
		}
		if(map.get("search").equals("order_history_password")) {
			map.put("search", "order_history_password");
		}
		return sqlSession.selectList("searchOrderNum", map);
	}
	
	public int updateStatusDeliver(int order_history_num) {
		
		return sqlSession.update("updateStatusDeliver", order_history_num);
	}
	
	public int updateStatusWaiting(int order_history_num) {
		
		return sqlSession.update("updateStatusWaiting",order_history_num);
	}
	
	//환불 목록
	public List<EzenatProductAllDTO> listOrderRefund(Map<String, String> map) {
		
		return sqlSession.selectList("listOrderRefund", map);
	}
	
	public int orderRefundComplete(int order_history_num) {
		
		return sqlSession.update("orderRefundComplete",order_history_num);
	}
	
	public int orderRefundWaiting(int order_history_num) {
		
		return sqlSession.update("orderRefundWaiting",order_history_num);
	}
	
	public List<EzenatProductAllDTO> searchOrderNumRefund(Map<String, String> map) {
		map.put("searchString", "%" + map.get("searchString") + "%");
		if(map.get("search").equals("order_history_num")) {
			map.put("search", "order_history_num");
		}
		if(map.get("search").equals("coupon_num")) {
			map.put("search", "coupon_num");
		}
		return sqlSession.selectList("searchOrderNumRefund", map);
	}
	 
	//반품 목록
	public List<EzenatProductAllDTO> listOrderReturn(Map<String, String> map) {
		
		return sqlSession.selectList("listOrderReturn", map);
	}
	
	public int orderReturnComplete(int order_history_num) {
		
		return sqlSession.update("orderReturnComplete",order_history_num);
	}
	
	public int orderReturnWaiting(int order_history_num) {
		
		return sqlSession.update("orderReturnWaiting",order_history_num);
	}
	
	public List<EzenatProductAllDTO> searchOrderNumReturn(Map<String, String> map) {
		
		map.put("searchString", "%" + map.get("searchString") + "%");
		if(map.get("search").equals("order_history_num")) {
			map.put("search", "order_history_num");
		}
		if(map.get("search").equals("order_history_password")) {
			map.put("search", "order_history_password");
		}
		return sqlSession.selectList("searchOrderNumReturn", map);
	}
	
	//교환 목록
	public List<EzenatProductAllDTO> listOrderExchange(Map<String,String>map) {
		
		return sqlSession.selectList("listOrderExchange",map);
	}
	
	public int orderExchangeComplete(int order_history_num) {
		
		return sqlSession.update("orderExchangeComplete",order_history_num);
	}
	
	public int orderExchangeWaiting(int order_history_num) {
		
		return sqlSession.update("orderExchangeWaiting",order_history_num);
	}
	
	public List<EzenatProductAllDTO> searchOrderNumExchange(Map<String, String> map) {
		
		map.put("searchString", "%" + map.get("searchString") + "%");
		if(map.get("search").equals("order_history_num")) {
			map.put("search", "order_history_num");
		}
		if(map.get("search").equals("coupon_num")) {
			map.put("search", "coupon_num");
		}
		return sqlSession.selectList("searchOrderNumExchange", map);
	}
	
	//취소 목록
	public List<EzenatProductAllDTO> listOrderCancel(Map<String, String>map) {
		
		return sqlSession.selectList("listOrderCancel",map);
	}
	
	public List<EzenatProductAllDTO> searchOrderNumCancel(Map<String, String> map) {
		map.put("searchString", "%" + map.get("searchString") + "%");
		if(map.get("search").equals("order_history_num")) {
			map.put("search", "order_history_num");
		}
		if(map.get("search").equals("order_history_password")) {
			map.put("search", "order_history_password");
		}
		return sqlSession.selectList("searchOrderNumCancel", map);
	}
	
	public int orderCancel(int order_history_num) {
		
		return sqlSession.update("orderCancel",order_history_num);
	}
	
	public int orderProceeding(int order_history_num) {
	
		return sqlSession.update("orderProceeding",order_history_num);
	}
	
	public List<EzenatProductAllDTO> getListOrderProd(String order_history_num) {
		
		return sqlSession.selectList("getListOrderProd", order_history_num);
	}
	// 7/23 수정 요기까지.

	// 7월 18일 추가
	public int getListProdCount() {
		
		return sqlSession.selectOne("getListProdCount");
	}

	public int getListMemCount() {
		
		return sqlSession.selectOne("getListMemCount");
	}

	public int getListOrderCount() {
	
		return sqlSession.selectOne("getListOrderCount");
	}
	// 7/18 요기까지.

	// 7월 25일 추가
	public int getListOrderRefundCount() {		
		return sqlSession.selectOne("getListOrderRefundCount");
	}

	public int getListOrderExchangeCount() {
		return sqlSession.selectOne("getListOrderExchangeCount");
	}

	public int getListOrderCancelCount() {
		return sqlSession.selectOne("getListOrderCancelCount");
	}

	public int getListOrderReturnCount() {
		
		return sqlSession.selectOne("getListOrderReturnCount");
	}
	// 7/25 요기까지.
	/* // 진성님 구역 */
	
	/* 예지님 구역 */
	// 7/14
	public int updateOnlinePqty(int product_pqty, int product_num) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("product_pqty", product_pqty);
		map.put("product_num", product_num);
		
		return sqlSession.update("updateOnlinePqty", map);
	}
	
	public int updateOfflinePqty(int offline_pqty, int product_num) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("offline_pqty", offline_pqty);
		map.put("product_num", product_num);
		
		return sqlSession.update("updateOfflinePqty", map);
	}
	// 7/14 end
	
	// 7/25 새로 추가
	public int updateStoreGangnamPqty(int store_gangnam_pqty, int product_num) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("store_gangnam_pqty", store_gangnam_pqty);
		map.put("product_num", product_num);
		
		return sqlSession.update("updateStoreGangnamPqty", map);
	}

	public int updateStoreNowonPqty(int store_nowon_pqty, int product_num) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("store_nowon_pqty", store_nowon_pqty);
		map.put("product_num", product_num);
		
		return sqlSession.update("updateStoreNowonPqty", map);
	}
	
	public int updateStoreHongdaePqty(int store_hongdae_pqty, int product_num) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("store_hongdae_pqty", store_hongdae_pqty);
		map.put("product_num", product_num);
		
		return sqlSession.update("updateStoreHongdaePqty", map);
	}
		
	public List<EzenatProductAllDTO> searchPqtyProductName(String searchString) {
		System.out.println("상품명 검색: " + searchString);
		
		return sqlSession.selectList("searchPqtyProductName", "%" + searchString + "%");
	}
	 
	public List<EzenatProductAllDTO> searchPqtyProductCode(String searchString) {
		System.out.println("상품코드 검색: " + searchString);
		
		return sqlSession.selectList("searchPqtyProductCode", "%" + searchString + "%");
	}
	// 7/25 end
	/* // 예지님 구역 */
	
	/* 태일님 구역 */
	public int insertStore(EzenatOfflineStoreDTO dto) {
		return sqlSession.insert("insertStore", dto);
	}
	
	public List<EzenatOfflineStoreDTO> listStore(){
		return sqlSession.selectList("listStore");
	}
	
	public int deleteStore(int store_num) {
		return sqlSession.delete("deleteStore", store_num);
	}
	
	// 7/17
	public List<EzenatOfflineStoreDTO>locationStoreMap(){
		 return sqlSession.selectList("StoreMap");
	}
	 
	public int updateStore(EzenatOfflineStoreDTO dto) {
		return sqlSession.update("updateStore", dto);
	}
	// 7/17 end

	// 7/18
	public EzenatOfflineStoreDTO getStore(int store_num) {
		return sqlSession.selectOne("getStore", store_num);
	}
	
	public int sNameCheck(String input) {
		return sqlSession.selectOne("sNameCheck", input);
	}
	// 7/18 end
	/* // 태일님 구역 */
}

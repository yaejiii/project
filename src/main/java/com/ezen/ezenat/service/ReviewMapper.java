package com.ezen.ezenat.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.ezenat.dto.ReviewBoardDTO;

@Service
public class ReviewMapper {

	@Autowired
	SqlSession sqlSession;
	
// 리뷰 작성
	public int insertReview(ReviewBoardDTO dto) {
		return sqlSession.insert("insert_review", dto);
	}
	
// 리뷰 이미지 넣기	
	public int insertReviewImage(String filename) {
		return sqlSession.insert("insert_review_image", filename);
	}
	
	// 게시판 총 게시글 수 가져오기 (페이징 처리에 필요)
	public int getReviewCount() {
		return sqlSession.selectOne("getCount");
	}
	
// 해당 상품의 평균 별점 	구하기 
	public double getScoreAverage(int product_num) {
		return sqlSession.selectOne("get_score_review", product_num);
	}

// 해당 상품의 리뷰 목록
	public List<ReviewBoardDTO> listReview(@RequestParam Map<String, Integer> params){
		return sqlSession.selectList("list_review", params);
	}
	
}

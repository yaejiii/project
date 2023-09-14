package com.ezen.ezenat.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.ezenat.dto.EzenatFAQBoardDTO;

@Service
public class EzenatFAQBoardMapper {
	@Autowired
	SqlSession sqlSession;
	
// 게시글 작성
	public int insertFAQBoard(EzenatFAQBoardDTO dto) {
		return sqlSession.insert("insert_faq_board", dto);
	}

// 게시판 총 게시글 수 가져오기 (페이징 처리에 필요)
	public int getFAQBoardCount() {
		return sqlSession.selectOne("get_faq_board_count");
	}

// 게시글 가져오기
	public EzenatFAQBoardDTO getFAQBoardContent(int faq_board_num) {
		return sqlSession.selectOne("get_faq_board_content", faq_board_num);
	}
	
// 게시글 목록
	public List<EzenatFAQBoardDTO> listFAQBoard(@RequestParam Map<String, Integer> params){
		return sqlSession.selectList("list_faq_board", params);
	}

// 게시글 검색
	public List<EzenatFAQBoardDTO> searchFAQBoard(@RequestParam Map<String, String> params){
		return sqlSession.selectList("search_faq_board", params);
	}
	
// 게시글 수정
	public int updateContent(EzenatFAQBoardDTO dto) {
		return sqlSession.update("updateBoard", dto);
	}
	// 게시글 삭제	
	public int deleteContent(int faq_board_num) {
		return sqlSession.delete("delete_faq_board", faq_board_num);
	}


}

package com.ezen.ezenat.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.ezenat.dto.EzenatAddressDTO;
import com.ezen.ezenat.dto.EzenatNoticeBoardDTO;

@Service
public class AdminNoticeBoardMapper {
	@Autowired
	SqlSession sqlSession;
	
// 공지사항 작성
	public int insertNoticeBoard(EzenatNoticeBoardDTO dto) {
		return sqlSession.insert("insert_notice_board", dto);
	}

// 공지사항 총 게시글 수 가져오기 (페이징 처리에 필요)
	public int getNoticeBoardCount() {
		return sqlSession.selectOne("get_notice_board_count");
	}

// 공지사항 가져오기
	public EzenatNoticeBoardDTO getNoticeBoardContent(int notice_board_num) {
		return sqlSession.selectOne("get_notice_board_content", notice_board_num);
	}
	
// 공지사항 목록
	public List<EzenatNoticeBoardDTO> listNoticeBoard(@RequestParam Map<String, Integer> params){
		return sqlSession.selectList("list_notice_board", params);
	}

//공지사항 수정
	public int updateContent(EzenatNoticeBoardDTO dto) {
		return sqlSession.update("updateContent", dto);
	}
	
	public int deleteContent(int notice_board_num) {
		return sqlSession.delete("deleteContent", notice_board_num);
	}
	
	// 공지사항 검색
	public List<EzenatNoticeBoardDTO> searchNoticeBoard(@RequestParam Map<String, String> params){
		
		return sqlSession.selectList("search_notice_board", params);
	}
	
	// 공지사항 기간별 검색
	public List<EzenatNoticeBoardDTO> searchWithDateNoticeBoard(@RequestParam Map<String, String> params){
		
		return sqlSession.selectList("search_with_date_notice_board", params);
	}
	
	
	
	
	
//	public List<EzenatNoticeBoardDTO> listNoticeBoard(){
//		return sqlSession.selectList("list_notice_board");
//	}
	
// 게시글 수정
	
	
//// 게시글 삭제	
//	public int deleteBoard(java.util.Map<String, String> params) {
//			EzenatNoticeBoardDTO dto = getNoticeBoardContent(Integer.parseInt(params.get("notice_board_num")));
//			if (dto.getNotice_board_admin_password().equals(params.get("password"))) {
//				return sqlSession.delete("delete_notice_board", Integer.parseInt(params.get("notice_board_num")));
//			}else {
//				return -1;
//			}
//	}

}

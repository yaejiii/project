package com.ezen.ezenat.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ezenat.dto.EzenatCategoryDTO;

@Service
public class EzenatCategoryMapper {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertCategory(EzenatCategoryDTO dto) {
		return sqlSession.insert("insert_category", dto);
	}
	
	public EzenatCategoryDTO getCategory(String category_code) {
		return sqlSession.selectOne("get_category", category_code);
	}
	public int updateCategory(EzenatCategoryDTO dto) {
		return sqlSession.update("update_category", dto);
	}
	
	public int deleteCategory(String category_code) {
		return sqlSession.delete("delete_category", category_code);
	}
	
	public int deleteCateCode(String category_code) {
		return sqlSession.update("delete_catecode", category_code);
	}
}

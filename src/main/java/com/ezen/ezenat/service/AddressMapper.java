package com.ezen.ezenat.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.ezenat.dto.EzenatAddressDTO;

@Service
public class AddressMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertAddress(EzenatAddressDTO dto) {
		
		return sqlSession.insert("insertAddress", dto);
	}
	
	public List<EzenatAddressDTO> listAddress() {
		
		return sqlSession.selectList("listAddress");
	}
	
	public EzenatAddressDTO getAddress(int address_num) {
		return sqlSession.selectOne("getAddress", address_num);
	}
	
	public int updateAddress(EzenatAddressDTO dto) {
		return sqlSession.update("updateAddress", dto);
	}
	
	public int deleteAddress(int address_num) {
		return sqlSession.delete("deleteAddress", address_num);
	}
}

package com.ezen.ezenat;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ezenat.dto.EzenatCategoryDTO;
import com.ezen.ezenat.dto.EzenatOfflineStoreDTO;
import com.ezen.ezenat.service.AdminMapper;

import net.sf.json.JSONArray;

@Controller
public class taeillController {
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping(value = "/admin_store.insert.do", method = RequestMethod.GET)
	public ModelAndView storeInsertAdmin() throws Exception {
	
		return new ModelAndView("admin/admin_store_insert");
	}
	
	@RequestMapping(value = "/admin_store.insert.do" , method= RequestMethod.POST)
	public String storeInsertOkAdmin(HttpServletRequest req, @ModelAttribute EzenatOfflineStoreDTO dto)throws IOException{
		int res = adminMapper.insertStore(dto);
	
		
		if(res>0) {
			req.setAttribute("msg", "지점등록이 완료되었습니다.");
			req.setAttribute("url", "admin_store_list.do");
		}else {
			req.setAttribute("msg", "지점등록 실패!!");
		}
		
		return "message";
	}
	

	@PostMapping(value = "/admin_product_restore.do")
	@ResponseBody
	public int restoreProductList(@RequestParam(value = "list", required = false) List<String> list) {
	    if (list != null) {
	        for (String str : list) {
	            str = str.split("\"")[1];
	            int res = adminMapper.moveRestoreProdList(str);
	        }
	    }
	    return 1;
	}

	
	@RequestMapping(value = "/admin_store_list.do")
	public ModelAndView storeList(){
		List<EzenatOfflineStoreDTO> list = adminMapper.listStore();
		return new ModelAndView("admin/admin_store_list","listStore", list);
	}
	
	@PostMapping(value = "/admin_delete_store.do")	 
	 @ResponseBody public int real_delete_list(@RequestParam(value = "slist", required = false) List<String> list) { 
		System.out.println("일단 요까지");
		if(list != null) { 
			for(String str : list) { 
				str = str.split("\"")[1]; 
				int res = adminMapper.deleteStore(Integer.parseInt(str));
				
				break; 
			} 
		} 
		System.out.println("여기");
					 	
		return 1; 
	}
	
	@RequestMapping(value = "/admin_store_edit.do",method = RequestMethod.GET)
	public String getStore(HttpServletRequest req, @RequestParam int store_num, EzenatOfflineStoreDTO dto2) throws ServletRequestBindingException{
		
		EzenatOfflineStoreDTO dto = adminMapper.getStore(store_num);
		System.out.println(dto2.getStore_memo());
		req.setAttribute("getStore", dto);
		
		return"/admin/admin_store_edit";
	}
	
	@RequestMapping(value = "/admin_store_edit.do", method = RequestMethod.POST)
	public String updateStore(HttpServletRequest req, @ModelAttribute EzenatOfflineStoreDTO dto) throws IllegalStateException,IOException{
		
		
		int res = adminMapper.updateStore(dto);
		System.out.println("지점주소" + dto.getStore_address());
		if(res>0) {
			req.setAttribute("msg", "지점수정 성공");
			req.setAttribute("url", "admin_store_list.do");
		}else {
			req.setAttribute("msg", "지점수정 실패");
			req.setAttribute("url", "admin_store_edit.do?store_num" + dto.getStore_num());
		}
		return "message";
	}
	
	@PostMapping("/admin_store_sNameCheck.do")
	@ResponseBody
	public int pNameCheck(@RequestParam(value = "input", required = false) String input) {
		int res = adminMapper.sNameCheck(input);
		return res;
	}
	
	/*
	 * @RequestMapping(value="/admin_store_search.do", method= RequestMethod.POST)
	 * public String adminStoreSearch(HttpServletRequest req) {
	 * 
	 * }
	 */
}

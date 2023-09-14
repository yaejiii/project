package com.ezen.ezenat;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ezenat.dto.CartBean;
import com.ezen.ezenat.dto.EzenatCategoryDTO;
import com.ezen.ezenat.dto.EzenatFAQBoardDTO;
import com.ezen.ezenat.dto.EzenatMemberDTO;
import com.ezen.ezenat.dto.EzenatOrderHistoryDTO;
import com.ezen.ezenat.dto.EzenatOrderProductDTO;
import com.ezen.ezenat.dto.EzenatPayDTO;
import com.ezen.ezenat.service.AdminMapper;
import com.ezen.ezenat.service.EzenatCategoryMapper;
import com.ezen.ezenat.service.EzenatFAQBoardMapper;
import com.ezen.ezenat.service.EzenatPaymentMapper;
import com.ezen.ezenat.service.MemberMapper;

import net.sf.json.JSONArray;

@Controller
public class SangInController {


//	Autowired
	@Autowired
	AdminMapper adminMapper;

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	EzenatCategoryMapper categoryMapper;
	
	@Autowired 
	EzenatPaymentMapper paymentMapper;
	
	@Autowired
	EzenatFAQBoardMapper ezenatFAQBoardMapper;
	

//	RequestMapping
	@RequestMapping("admin")
	public String adminLoginIndex() {
		return "admin/index";
	}

	@RequestMapping("admin_login.do")
	public ModelAndView adminLogin(HttpServletRequest req) {
		String id = req.getParameter("member_id");
		String password = req.getParameter("member_password");
		HttpSession session = req.getSession();
		// 회원 체크
		int res = memberMapper.checkLogin(id, password);

		if (res == memberMapper.OK) {
			EzenatMemberDTO dto = memberMapper.getEzenatMemberById(id);
			session.setAttribute("memInfo", dto);

			if (dto.getAdmin_power().equals("admin")) {
				return new ModelAndView("forward:/WEB-INF/views/admin/admin_main.jsp");
			} else if (dto.getAdmin_power().equals("sub")) {
				return new ModelAndView("forward:/WEB-INF/views/admin_sub/admin_main.jsp");
			} else {
				req.setAttribute("msg", "관리자 회원이 아닙니다. 일반 홈페이지로 이동합니다.");
				req.setAttribute("url", "mall_index.ezenat");
				return new ModelAndView("forward:/WEB-INF/views/message.jsp");
			}

		} else if (res == memberMapper.NOT_ID || res == memberMapper.NOT_PW) {
			req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");

		} else if (res == memberMapper.ERROR) {
			req.setAttribute("msg", "진행이 원활하지 않습니다, 잠시 후에 다시 이용해주세요.");
		}
		req.setAttribute("url", "admin");
		return new ModelAndView("forward:/WEB-INF/views/message.jsp");
	}

// 회원 로그아웃 기능
	@RequestMapping("/admin_logout.do")
	public String amdinLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();

		session.invalidate();

		req.setAttribute("msg", "정상적으로 로그아웃됐습니다.");
		req.setAttribute("url", "admin");

		return "message";
	}
//카테고리 입력 jsp	 list
	@RequestMapping("admin_category_insert.do")
	public ModelAndView insertCategory() {
		List<EzenatCategoryDTO> list = adminMapper.listCate();

		return new ModelAndView("admin/admin_category_insert", "listCate", JSONArray.fromObject(list));
	}
	
	
	
//카테고리 DB입력
	@RequestMapping("admin_insert_category.do")
	public String insertCategoryOk(HttpServletRequest req, EzenatCategoryDTO dto) {
		String category_parent = req.getParameter("category_parent_code2");
		System.out.println("category_parent : " + category_parent);
		if(category_parent.equals("")) {
			category_parent = req.getParameter("category_parent_code1");
			if(dto.getCategory_level() == 1) {
				category_parent = "";
			}
		}
			dto.setCategory_parent(category_parent);
		int res = categoryMapper.insertCategory(dto);

		if (res > 0) {
			req.setAttribute("msg", "카테고리 등록 성공.");
			req.setAttribute("url", "admin_category.do");
			return "forward:WEB-INF/views/message.jsp";
		} else {
			req.setAttribute("msg", "카테고리 등록 실패. 다시 시도해주세요.");
			req.setAttribute("url", "admin_category_insert.do");
			return "forward:WEB-INF/views/message.jsp";
		}
	}

	//카테고리 수정
	@RequestMapping("admin_category_edit.do")
	public String editCategory(HttpServletRequest req) {
		List<EzenatCategoryDTO> list = adminMapper.listCate();

		String category_code1 = req.getParameter("category1");;
		String category_code2 = req.getParameter("category2");
		String category_code3 = req.getParameter("category3");

		EzenatCategoryDTO dto = new EzenatCategoryDTO();
		if(category_code3 == null || category_code3.trim().equals("")) {
			if(category_code2 == null || category_code2.trim().equals("")) {
				dto = categoryMapper.getCategory(category_code1); 
			}else {
				dto = categoryMapper.getCategory(category_code2);		}
		}else {
			dto = categoryMapper.getCategory(category_code3);
		}
		req.setAttribute("categoryDTO", dto);
		req.setAttribute("listCate", JSONArray.fromObject(list));
		
		return "admin/admin_category_edit";
	}
	
	@RequestMapping("admin_edit_category.do")
	public String editCategoryOk(HttpServletRequest req, EzenatCategoryDTO dto) {
		int res = categoryMapper.updateCategory(dto);
		
		if(res>0) {
			req.setAttribute("msg", "카테고리 수정 성공.");
			req.setAttribute("url", "admin_category.do");
			return "forward:WEB-INF/views/message.jsp";
		}
		else {
			req.setAttribute("msg", "카테고리 수정 실패. 다시 시도해주세요.");
			req.setAttribute("url", "admin_category_edit.do");
			return "forward:WEB-INF/views/message.jsp";
		}
			
	}
// 카테고리 삭제 - 기능 필요한가?	
	@RequestMapping("admin_delete_category.do")
	public String deleteCategory(HttpServletRequest req, String caterory_code) {
		System.out.println(caterory_code);
		int res = categoryMapper.deleteCategory(caterory_code);		
		if(res>0) {
			int res2 = categoryMapper.deleteCateCode(caterory_code);
			if(res2>0) {
			req.setAttribute("msg", "카테고리 삭제 성공.");
			req.setAttribute("url", "admin_category.do");
			}else {
				req.setAttribute("msg", "카테고리 삭제 성공, 상품 삭제에 실패했습니다.\n카테고리 내에 상품이 없는 경우에도 삭제 실패가 발생할 수 있습니다.");
				req.setAttribute("url", "admin_category.do");				
			}
		}
		else {
			req.setAttribute("msg", "카테고리 삭제 실패. 다시 시도해주세요.");
			req.setAttribute("url", "admin_category.do");
		}
		return "forward:WEB-INF/views/message.jsp";
	}
	
	
	//쿠폰넘버 ajax넘겨줄 return
	@RequestMapping("admin_coupon_num.do")
	public int insertCouponNumSequence() {
//		paymentMapper.insertCouponNumSeq();
		int res = paymentMapper.selectCouponNumSeq();
		return res;
	}
	
	//쿠폰입력페이지
	@RequestMapping("admin_insert_coupon.do")
	public String insertCoupon() {
		return "admin/admin_coupon_insert";
	}
	
	
	//결제진행(포트원)
	@RequestMapping("order_payment.do")
	@ResponseBody
	public EzenatPayDTO order(HttpServletRequest req, @RequestParam Map<String,String> map) {
		EzenatPayDTO dto = new EzenatPayDTO();
		dto.setAmount(Float.parseFloat(map.get("amount")));
		dto.setBuyer_addr(map.get("buyer_addr"));
		dto.setBuyer_name(map.get("buyer_name"));
		dto.setBuyer_postcode(map.get("buyer_postcode"));
		dto.setName(map.get("name"));
		
		// 주문 번호
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		while(true) {
			int random_num = (int)(Math.random()*100000);
			String code = sdf.format(date)+random_num;
			int res = paymentMapper.checkOrderHistoryCode(code);
			if(res == 0) {
				System.out.println(code);
				System.out.println(dto);
				dto.setMerchant_uid(code);
				break;
			}
		}
		
		System.out.println("결제진행에서 : " + dto.getMerchant_uid());
		
		
		String pay_method = map.get("pay_method");
		if(pay_method.equals("card")) {
			dto.setPg("kcp.T0000");
		}else if(pay_method.equals("vbank")) {
			dto.setPg("kcp");
		}else if(pay_method.equals("phone")) {
			dto.setPg("danal.A010002002");
		}else if(pay_method.equals("kakaopay")) {
			dto.setPg("kakaopay.TC0ONETIME");
		}else if(pay_method.equals("payco")) {
			dto.setPg("payco.AUTOPAY");
		}
		
		String buyer_tel = map.get("hp1") + map.get("hp2") + map.get("hp3");
		if(map.get("hp1_direct").equals("")) {
			buyer_tel =map.get("hp1_direct") + map.get("hp2") + map.get("hp3");
		}
		dto.setBuyer_tel(buyer_tel);
		
		HttpSession session = req.getSession();
		EzenatMemberDTO memInfo = (EzenatMemberDTO)session.getAttribute("memInfo");
		
		String buyer_email = null;
		if (memInfo != null) {
			buyer_email = memInfo.getEmail();
		} else if (memInfo == null) {
			buyer_email = map.get("email_id") + "@" + map.get("email_add");
		}
		
		dto.setBuyer_email(buyer_email);
		
		dto.setRedirect_url("./order_complete.do");
		System.out.println(dto.getPg());
		return dto;
	}
	
	//결제요청 처리 완료
	@RequestMapping("order.do")
	@ResponseBody
		public String order() {
		return ""; 
	}
	
	//결제완료
	@RequestMapping("order_complete.do")
	public String orderOk(HttpServletRequest req, EzenatOrderHistoryDTO dto_history, EzenatOrderProductDTO dto_product, String mode) {
		HttpSession session = req.getSession();
		EzenatMemberDTO memInfo = (EzenatMemberDTO)session.getAttribute("memInfo");

		System.out.println("결제 완료에서 : " + dto_history.getOrder_history_num());
		
		//비회원 확인
		if(memInfo == null) {
			dto_history.setMember_num(-1);
		}else {
			dto_history.setMember_num(memInfo.getMember_num());
		}
		
		//구매상품 리스트 받아오기
		System.out.println(dto_history.getTotal_price());
		String[] product_num = req.getParameterValues("product_num");
		String[] order_product_price = req.getParameterValues("order_product_price");
		String[] order_product_qty = req.getParameterValues("order_product_qty");

		// 결제 후 해당 상품 장바구니에서 비우기
		CartBean cart = (CartBean)session.getAttribute("cart");
		
		if (mode.equals("now") || mode.equals("all")) {
			cart.deleteAllCart();
			
		} else if (mode.equals("select")) {
			for (int i = 0; i < product_num.length; ++i) {
				cart.deleteCart(Integer.parseInt(product_num[i]));
			}
		}

		// 구매내역 저장
		paymentMapper.insertOrderHistory(dto_history);
		dto_product.setOrder_history_num(dto_history.getOrder_history_num());
		for(int i = 0; i< product_num.length; ++i) {
			dto_product.setOrder_product_num(Integer.parseInt(product_num[i]));
			dto_product.setOrder_product_price(Integer.parseInt(order_product_price[i]));
			dto_product.setOrder_product_qty(Integer.parseInt(order_product_qty[i]));
			paymentMapper.insertOrderProductDTO(dto_product);
		}
		
		return "client_view/order_complete";
	}
	
	// 카테고리 리퀘스트 전송. 어느 페이지건 상관없이 접속 시
	@RequestMapping("category")
	@ResponseBody
	public void topListCategory(HttpServletRequest req) {
		List<EzenatCategoryDTO> list = adminMapper.listCate();
		req.setAttribute("list_category", list);
			}
	
	@RequestMapping("search_faq_board.do")
	public ModelAndView searchListFAQ(HttpServletRequest req) {
		String search = (String) req.getParameter("search");
		String search_string = (String) req.getParameter("search_string");
		String search_date = (String) req.getParameter("search_date");
	
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

		String end_date = date.format(today);
		String start_date = null;

		switch(search_date){
		
		case "week" :
			Calendar week = Calendar.getInstance();
		    week.add(Calendar.DATE , -7);
		    start_date = date.format(week.getTime());
		    break;

		case "month" :
			Calendar month = Calendar.getInstance();
		    month.add(Calendar.MONTH , -1);
		    start_date = date.format(month.getTime());
		    break;
		    
		case "month_3" :
			Calendar month_3 = Calendar.getInstance();
			month_3.add(Calendar.MONTH , -3);
		    start_date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(month_3.getTime());
		    break;
		    
		case "all" :
			start_date = "1999-07-05";
		}
		
		Map<String, String> params = new HashMap<>();
		params.put("search", search);
		params.put("search_string", search_string);
		params.put("start_date", start_date);
		params.put("end_date", end_date);
		List<EzenatFAQBoardDTO> list = ezenatFAQBoardMapper.searchFAQBoard(params);
		return new ModelAndView("client_view/FAQ","list_faq", list); 
	}


}

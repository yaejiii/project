package com.ezen.ezenat;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ezenat.dto.CartBean;
import com.ezen.ezenat.dto.EzenatAddressDTO;
import com.ezen.ezenat.dto.EzenatMemberDTO;
import com.ezen.ezenat.dto.EzenatOrderHistoryDTO;
import com.ezen.ezenat.dto.EzenatProductAllDTO;
import com.ezen.ezenat.dto.OrderHistoryBean;
import com.ezen.ezenat.service.AddressMapper;
import com.ezen.ezenat.service.AdminMapper;
import com.ezen.ezenat.service.MallClientMapper;
import com.ezen.ezenat.service.MemberMapper;
import com.ezen.ezenat.service.SendCertificationService;
import com.fasterxml.jackson.annotation.JsonView;

@Controller
public class MallClientController {

	//--------------------Autowired--------------------------
	@Autowired
	private SendCertificationService sendSerificationService;

	@Autowired
	private JavaMailSender mailSender;
	 
	@Autowired
	private MemberMapper memberMapper;

//	@Autowired
//	private FindPassword findPassword;
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private MallClientMapper mallClientMapper;

	@Autowired
	private AddressMapper addressMapper;
	//-------------------------------------------------------
	
	

	//-----------------------Method--------------------------
	@RequestMapping("/index")
	public ModelAndView index() {

		return new ModelAndView("/index");
	}

	// 장바구니 세션 생성, 어느 페이지건 상관없이 접속 시
	@RequestMapping("/cartSession")
	@ResponseBody
	public void cartSession(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("cart") == null) {
			CartBean cart = new CartBean();
			
			session.setAttribute("cart", cart);
		}

		if (session.getAttribute("memInfo") != null) {
			EzenatMemberDTO dto = (EzenatMemberDTO)session.getAttribute("memInfo");
			
			OrderHistoryBean orderHistory = (OrderHistoryBean)session.getAttribute("orderHistory");
			
			if (orderHistory == null) {
//				OrderHistoryBean orderHistory = new OrderHistoryBean();
				orderHistory = new OrderHistoryBean();
				
				orderHistory.setMallClientMapper(mallClientMapper);
				orderHistory.setOrderHistoryList(dto.getMember_num());

				session.setAttribute("orderHistory", orderHistory);
			} else if (orderHistory != null) {
				orderHistory.setOrderHistoryList(dto.getMember_num());
			}
			
//			req.setAttribute("orderHistoryListSize", orderHistory.getOrderHistoryListSize());
//			req.setAttribute("beforeDepositCount", orderHistory.getBeforeDepositCount());
//			req.setAttribute("preparingCount", orderHistory.getPreparingCount());
//			req.setAttribute("shippingCount", orderHistory.getShippingCount());
//			req.setAttribute("completedCount", orderHistory.getCompletedCount());
//			req.setAttribute("cancellationCount", orderHistory.getCancellationCount());
//			req.setAttribute("exchangeCount", orderHistory.getExchangeCount());
//			req.setAttribute("returnCount", orderHistory.getReturnCount());
		}
	}
	
	// 이제낫 홈페이지
	@RequestMapping("/mall_index.ezenat")
	public ModelAndView mall_index() {
		
		return new ModelAndView("/mall_client/mall_index");
	}

	// 회원가입 페이지
	@RequestMapping("/mall_member_join.ezenat")
	public ModelAndView mall_member_join() {

		return new ModelAndView("/mall_client/mall_member_join");
	}
	
	// 회원가입 페이지
	@RequestMapping("/nonmember_login.ezenat")
	public ModelAndView nonmember_login() {

		return new ModelAndView("/client_view/login");
	}

	// 사용중인 아이디 체크
	@GetMapping("/idUseCheck")

	public @ResponseBody int idUseCheck(String id) {
		int res = memberMapper.idUseCheck(id);

		return res;
	}

	// 회원가입 - 휴대폰 문자 인증
	@GetMapping("/sendSMS")
	public @ResponseBody String sendSMS(String phoneNumber) {
		Random rand = new Random();
		String numStr = "";

		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);

//		sendSerificationService.certifiedPhoneNumber(phoneNumber, numStr);

		return numStr;
	}

	// 회원가입 완료 페이지
	@RequestMapping("/mall_member_join_complete.ezenat")
	public ModelAndView mall_member_join_complete(HttpServletRequest req, @ModelAttribute EzenatMemberDTO dto,
			BindingResult result) {
//		if (result.hasErrors()) {
//			dto.setMember_rating("bronze");
//			dto.setAdmin_power("client");
//		}

		dto.setMember_rating("bronze");
		dto.setAdmin_power("client");
		dto.setNickname(dto.getName());

		System.out.println(dto.getName());

		int res = memberMapper.joinMember(dto);

		if (res > 0) {
			return new ModelAndView("/mall_client/mall_member_join_complete", "client_name", dto.getNickname());

		} else {
			req.setAttribute("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			req.setAttribute("url", "mall_member_join.ezenat");

			return new ModelAndView("forward:/WEB-INF/views/message.jsp");
		}

	}
	
	// 회원 & 비회원 주문조회 페이지 (7/3 경필님 수정한부분)
	@RequestMapping("/mall_client_order_breakdown.ezenat")
	public ModelAndView mall_client_order_breakdown(HttpServletRequest req, String mode, String tab, Integer prevDays) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		req.setAttribute("mode", mode);
		
		if (tab == null) {
			tab = "orders";
		}
		req.setAttribute("tab", tab);
		
		if (prevDays == null) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -3);
			
			req.setAttribute("prevDate", sdf.format(cal.getTime()));
			
		} else if (prevDays != null) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -prevDays);
			
			req.setAttribute("prevDate", sdf.format(cal.getTime()));
		}
		req.setAttribute("todayDate", sdf.format(date));
		
		return new ModelAndView("/mall_client/mall_client_order_breakdown");
	}

	// 회원 로그인 기능
	@RequestMapping("/mall_client_login.ezenat")
	public ModelAndView mall_client_login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		String id = req.getParameter("member_id");
		String password = req.getParameter("member_password");
		
		// 회원 체크
		int res = memberMapper.checkLogin(id, password);

		if (res == memberMapper.OK) {
			EzenatMemberDTO dto = memberMapper.getEzenatMemberById(id);
			OrderHistoryBean orderHistory = new OrderHistoryBean();
			
			orderHistory.setMallClientMapper(mallClientMapper);
			orderHistory.setOrderHistoryList(dto.getMember_num());
			
			session.setAttribute("orderHistory", orderHistory);
			session.setAttribute("memInfo", dto);
			
			if (dto.getAdmin_power().equals("admin")) {
				
				return new ModelAndView("forward:/WEB-INF/views/admin/admin_main.jsp");
				
			} else if (dto.getAdmin_power().equals("sub")) {
				
				return new ModelAndView("forward:/WEB-INF/views/admin_sub/admin_main.jsp");
			}
			
			return new ModelAndView("redirect:mall_index.ezenat");
			
		} else if (res == memberMapper.NOT_ID || res == memberMapper.NOT_PW) {
			req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
		} else if (res == memberMapper.ERROR) {
			req.setAttribute("msg", "진행이 원활하지 않습니다, 잠시 후에 다시 이용해주세요.");
		}

		req.setAttribute("url", "mall_index.ezenat");
		return new ModelAndView("forward:/WEB-INF/views/message.jsp");
	}

	// 회원 로그아웃 기능
	@RequestMapping("/mall_client_logout.ezenat")
	public String mall_client_logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		String mode = (String) session.getAttribute("social");
		if(mode != null) {
			
			// kakao 계정으로 로그아웃 할 경우
			if(mode.equals("kakao")) {
				req.setAttribute("msg", "카카오계정이 정상적으로 로그아웃 되었습니다.");
				req.setAttribute("url", "https://accounts.kakao.com/logout?continue=https%3A%2F%2Fcs.kakao.com%2F");
				
				session.invalidate();
				
				return "kakaoMessage";	// 세션 종료후 메인화면으로 넘어가기위해 별도의 kakaoMessage.jsp 만들어놓음.
			}
		}
		
		session.invalidate();
		
		req.setAttribute("msg", "정상적으로 로그아웃됐습니다.");
		req.setAttribute("url", "mall_index.ezenat");

		return "message";
	}

	// 상품 리스트 페이지
	@RequestMapping("/mall_product_list.ezenat")
	public ModelAndView mall_product_list(HttpServletRequest req) {
		String upPath = req.getServletContext().getRealPath("/resources/product_images");
		// C:\java_kkp\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ezenat\resources\product_images

		int pageSize = 20;
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = mallClientMapper.getCount();
		
		if (endRow>count) endRow = count;
		
		List<EzenatProductAllDTO> list = null;
		if (count > 0) {
			list = mallClientMapper.getProductList(startRow, endRow);
			
			int pageCount = count/pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
		}
		
		int rowNum = count - (currentPage - 1) * pageSize;
		
		req.setAttribute("rowNum", rowNum);
		req.setAttribute("count", count);
		req.setAttribute("productList", list);
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("upPath", upPath);

		return new ModelAndView("/mall_client/mall_product_list");
	}

	// 상품 상세 페이지
	@RequestMapping("/mall_product_content.ezenat")
	public ModelAndView mall_product_content(HttpServletRequest req, int product_num) {
		String upPath = req.getServletContext().getRealPath("resources/product_iamges");
		
		EzenatProductAllDTO dto = mallClientMapper.getProduct(product_num);
		
		// 아 .....
		List<String> product_images = new ArrayList<>();
		if (dto.getProduct_image1() != null) {
			product_images.add(dto.getProduct_image1());
		}
		if (dto.getProduct_image2() != null) {
			product_images.add(dto.getProduct_image2());
		}
		if (dto.getProduct_image3() != null) {
			product_images.add(dto.getProduct_image3());
		}
		if (dto.getProduct_image4() != null) {
			product_images.add(dto.getProduct_image4());
		}
		if (dto.getProduct_image5() != null) {
			product_images.add(dto.getProduct_image5());
		}
		if (dto.getProduct_image6() != null) {
			product_images.add(dto.getProduct_image6());
		}
		if (dto.getProduct_image7() != null) {
			product_images.add(dto.getProduct_image7());
		}
		if (dto.getProduct_image8() != null) {
			product_images.add(dto.getProduct_image8());
		}
		if (dto.getProduct_image9() != null) {
			product_images.add(dto.getProduct_image9());
		}
		if (dto.getProduct_image10() != null) {
			product_images.add(dto.getProduct_image10());
		}
		
		req.setAttribute("upPath", upPath);
		req.setAttribute("product_images", product_images);

		return new ModelAndView("/mall_client/mall_product_content", "productDTO", dto);
	}
	
	// 상품 상세 페이지 - 장바구니에 넣기 ajax용
	@RequestMapping("/add_cart")
	@ResponseBody
	public int add_cart(HttpServletRequest req, @RequestParam Map<String, String> params) {
		int product_num = Integer.parseInt(params.get("product_num"));
		int product_qty = Integer.parseInt(params.get("product_qty"));

		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		
		int res = cart.insertCart(product_num, product_qty, mallClientMapper);

		return res;
	}
	
	// 장바구니 페이지
	@RequestMapping("/mall_client_cart.ezenat")
	public ModelAndView mall_client_cart(HttpServletRequest req) {
		
		return new ModelAndView("/mall_client/mall_client_cart");
	}
	
	// 장바구니 페이지 - 상품 개별 삭제, 장바구니 자체에서 cart 를 불러와 하려고 했으나 삭제 여부를 묻는 다이얼로그창의 결과에 관계 없이 삭제를 해버리기에 ajax로 한다.
	@RequestMapping("/deleteSingleCart")
	@ResponseBody
	public String deleteSingleCart(HttpServletRequest req, int product_num) {
		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		cart.deleteCart(product_num);
		
		if (cart.getListCartQty() == 0) {	// 상품 구매하기 - 전체 상품인 경우에서 주문서에 있는 상품을 다 삭제했을 시
			return "emptyCart";
		}
		
		return null;
	}
	
	// 장바구니 페이지 - 상품 체크 삭제, 위 메소드와 합쳐서 하나로 할 수도 있긴 하지만 구분하기 쉽게 나누어 놓음
	@RequestMapping("/deleteSelectCart")
	@ResponseBody
	public void deleteSelectCart(HttpServletRequest req
									, @RequestParam(value = "product_num_array[]") int[] product_num_array) {
		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		
		for (int i = 0; i < product_num_array.length; ++i) {
			cart.deleteCart(product_num_array[i]);
		}
	}
	
	// 장바구니 페이지 - 상품 전체 삭제
	@RequestMapping("/deleteAllCart")
	@ResponseBody
	public void deleteAllCart(HttpServletRequest req) {
		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		cart.deleteAllCart();
	}
	
	// 장바구니 페이지 - 상품 개수 조절
	@RequestMapping("/editCart")
	@ResponseBody
	public void editCart(HttpServletRequest req, String updown, int product_num, int product_qty) {
		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		
		if (updown.equals("up")) {
			++ product_qty;
			cart.editCart(product_num, product_qty);
			
		} else if (updown.equals("down")) {
			if (product_qty > 1) {
				-- product_qty;
			}
			cart.editCart(product_num, product_qty);
		}
	}

	// 상품 구매하기
	@RequestMapping("/mall_client_order.ezenat")
	public ModelAndView mall_client_order(HttpServletRequest req
											, @RequestParam(value = "product_num", required = false) Integer product_num
											, @RequestParam(value = "product_qty", required = false) Integer product_qty
											, @RequestParam(value = "product_num_array[]", required = false) int[] product_num_array
											, String mode) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		EzenatMemberDTO memInfo = (EzenatMemberDTO)session.getAttribute("memInfo");

		if (memInfo == null) {
			if (mode.equals("now")) {
				List<EzenatProductAllDTO> list = cart.getListCart();
				if (list == null || list.size() == 0) {
					cart.insertCart(product_num, product_qty, mallClientMapper);
				}

				EzenatProductAllDTO dto = cart.getCart(product_num, mallClientMapper);
				if (dto == null) {
					cart.insertCart(product_num, product_qty, mallClientMapper);
				}
				
				req.setAttribute("product_num", product_num);
				req.setAttribute("product_qty", product_qty);
			}

			if (mode.equals("select")) {
				req.setAttribute("product_num_array", product_num_array);
			}
			
			mav.setViewName("/mall_client/mall_order_member_check");
		}

		if (memInfo != null) {
			if (mode.equals("now")) {
				List<EzenatProductAllDTO> list = cart.getListCart();
				if (list == null || list.size() == 0) {
					cart.insertCart(product_num, product_qty, mallClientMapper);
				}

				EzenatProductAllDTO dto = cart.getCart(product_num, mallClientMapper);
				if (dto == null) {
					cart.insertCart(product_num, product_qty, mallClientMapper);
				}
				
				dto = mallClientMapper.getProduct(product_num);
				dto.setProduct_pqty(product_qty);
				
				req.setAttribute("productDTO", dto);
			}
			
			if (mode.equals("select")) {
				List<EzenatProductAllDTO> list = new ArrayList<>();
				for (int i = 0; i < product_num_array.length; ++i) {
					list.add(cart.getCart(product_num_array[i], mallClientMapper));
				}

				req.setAttribute("product_num_array", product_num_array);
				req.setAttribute("productList", list);
			}
			
			mav.setViewName("/client_view/order_member");
		}

		req.setAttribute("mode", mode);
		
		return mav;
	}
	
	// 상품 구매하기 - 비회원일 경우 넘어가지는 로그인 / 비회원 주문 선택 페이지에서 비회원 주문 선택 시
	@RequestMapping("/mall_client_order_nonmember.ezenat")
	public ModelAndView mall_client_order_nonmember(HttpServletRequest req
														, @RequestParam(value = "product_num", required = false) Integer product_num
														, @RequestParam(value = "product_qty", required = false) Integer product_qty
														, @RequestParam(value = "product_num_array[]", required = false) int[] product_num_array
														, String mode) {
		
		if (mode.equals("now")) {
			EzenatProductAllDTO dto = mallClientMapper.getProduct(product_num);
			dto.setProduct_pqty(product_qty);
			
			req.setAttribute("productDTO", dto);
		}
		
		if (mode.equals("select")) {
			HttpSession session = req.getSession();
			CartBean cart = (CartBean)session.getAttribute("cart");

			List<EzenatProductAllDTO> list = new ArrayList<>();
			for (int i = 0; i < product_num_array.length; ++i) {
				list.add(cart.getCart(product_num_array[i], mallClientMapper));
			}

			req.setAttribute("product_num_array", product_num_array);
			req.setAttribute("productList", list);
		}
		
		req.setAttribute("mode", mode);
		
		return new ModelAndView("/client_view/order_non_member");
	}
	
	// 상품 구매하기 - 선택 구매인 경우 주문서 상품 삭제
	@RequestMapping("/deleteSelectOrder")
	@ResponseBody
	public ModelAndView deleteSelectOrder(HttpServletRequest req
											, @RequestParam(value = "product_num_array[]", required = false) int[] product_num_array
											, int product_num) {
		
		HttpSession session = req.getSession();
		CartBean cart = (CartBean)session.getAttribute("cart");
		EzenatMemberDTO memInfo = (EzenatMemberDTO)session.getAttribute("memInfo");
		
		List<EzenatProductAllDTO> list = new ArrayList<>();
		for (int i = 0; i < product_num_array.length; ++i) {
			if (product_num_array[i] != product_num) {
				list.add(cart.getCart(product_num_array[i], mallClientMapper));
			}
		}

		cart.deleteCart(product_num);

		product_num_array = ArrayUtils.removeElement(product_num_array, product_num);
		
		req.setAttribute("product_num_array", product_num_array);
		req.setAttribute("productList", list);
		req.setAttribute("mode", "select");
		
		if (list == null || list.size() == 0) {
			return new ModelAndView("/mall_client/mall_client_cart");
		}
		
		if (memInfo != null) {
			
			return new ModelAndView("/client_view/order_member");
		}
		
		return new ModelAndView("/client_view/order_non_member");
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/find_id.do")
	public String findId(HttpServletRequest req, String name, String email, String hp, String radio_option) {
		String mode = (String) req.getAttribute("mode");

		if (mode == null) {
			mode = "find_id";
			req.setAttribute("mode", "find_id");
		}

		return "mall_client/find_id";
	}

	// 비밀번호 찾기 페이지
	@RequestMapping("/find_pw.do")
	public String findPw(HttpServletRequest req) {
		String mode = (String) req.getAttribute("mode");
		if (mode == null) {
			mode = "find_pw";
			req.setAttribute("mode", "find_pw");
		}

		return "mall_client/find_id";
	}

	// 아이디 찾기 기능
	@RequestMapping(value = "/find_id_complete.do", method = RequestMethod.POST)
	public String findId(@RequestParam Map<String, String> map, HttpServletRequest req) {

		EzenatMemberDTO dto = new EzenatMemberDTO();
		String userId = null;
		if (map.get("mode").equals("find_id")) {
			if (map.get("radio_option").equals("hp")) {
				String hp1 = (String) map.get("hp").substring(0, 3);
				String hp2 = (String) map.get("hp").substring(3, 7);
				String hp3 = (String) map.get("hp").substring(7);
				System.out.println(hp1 + "-" + hp2 + "-" + hp3);
				String name = (String) map.get("name");
				dto.setHp1(hp1);
				dto.setHp2(hp2);
				dto.setHp3(hp3);
				dto.setName(name);
				userId = memberMapper.findIdHp(dto);
				System.out.println(userId);
			}
			if (map.get("radio_option").equals("email")) {

				dto.setName(map.get("name"));
				dto.setEmail(map.get("email"));
				userId = memberMapper.findIdEmail(dto);
				System.out.println(userId);
			}
			req.setAttribute("userId", userId);
			return "mall_client/find_id_complete";
		}
		if(map.get("mode").equals("find_pw")) {

			int res = memberMapper.findPw(map);
			
			if (res == 1) {
				char[] str = {'!','@','#','$','%','^','&','*','-','?'};	
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}		
				for(int i =0; i<4;i++) {
					char s = str[(int) ((Math.random()*9))];
					pw +=s;
				}
				
			
				map.put("password",pw);
				int rs = memberMapper.resetPw(map);
				 /* 이메일 보내기 */
		        String setFrom = "wjs9276@naver.com";
		        String toMail = map.get("email");
		        String title = "회원가입 인증 이메일 입니다.";
		        String content = 
		                "홈페이지를 방문해주셔서 감사합니다." +
		                "<br><br>" + 
		                "임시비밀번호는 " + pw + "입니다." + 
		                "<br>" + 
		                "해당 비밀번호를 비밀번호 입력창에 기입하여 주세요.";
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		        
		        
				req.setAttribute("userPw", pw);

			}
			return "mall_client/find_pw_complete";
		}

		return "mall_client/find_id_complete";
	}
	
	// 배송주소록 페이지
	@RequestMapping("/address.do")
	public ModelAndView address() {
		
		List<EzenatAddressDTO> list = addressMapper.listAddress();
		for(EzenatAddressDTO dto : list) {
			if (dto.getRcv_default() == 1){
				list.add(list.get(0));
//				list.add(0, element);
			}

		}
		return new ModelAndView("client_view/address", "listAddress", list);
	}
	
	// 배송주소록 등록 페이지
	@RequestMapping(value = "/regist_address.do", method = RequestMethod.GET)
	public String registAddress() {
		
		return "client_view/regist_address";
	}
	
	// 배송주소록 등록 기능
	@RequestMapping(value = "/insert_address.do", method = RequestMethod.POST)
	public ModelAndView insertAddress(HttpServletRequest req, EzenatAddressDTO dto) {
		ModelAndView mav = new ModelAndView("forward:WEB-INF/views/message.jsp");
		
		String rcv_request = req.getParameter("selboxDirect1"); 
		if(rcv_request != null) {
			dto.setRcv_request(rcv_request);
		}
		
		int res = addressMapper.insertAddress(dto);
		if(res>0) {
			mav.addObject("msg", "주소록 등록이 정상적으로 되었습니다.");
			mav.addObject("url", "address.do");
		}else {
			mav.addObject("msg", "주소록 등록에 실패하였습니다. 다시 시도해주세요.");
			mav.addObject("url", "regist_address.do");
		}
		
		return mav;
	}
	
	// 배송주소록 수정 페이지
	@RequestMapping("/edit_address.do")
	public ModelAndView editAddress(int address_num) {
		EzenatAddressDTO dto = addressMapper.getAddress(address_num);
		return new ModelAndView("client_view/edit_address", "getAddress", dto);
	}
	
	// 배송주소록 수정 기능
	@RequestMapping("/edit_address_ok.do")
	public ModelAndView editAddressOk(HttpServletRequest req, EzenatAddressDTO dto) {
		ModelAndView mav = new ModelAndView();

		String rcv_request = req.getParameter("selboxDirect1"); 
		if(rcv_request != null) {
			dto.setRcv_request(rcv_request);
		}
		
		int res = addressMapper.updateAddress(dto);
		if(res>0) {
			mav.addObject("msg","주소록 수정이 정상적으로 되었습니다.");
			mav.addObject("url","address.do");
		}else {
			mav.addObject("msg", "주소록 수정에 실패하였습니다. 다시 시도해주세요.");
			mav.addObject("url", "edit_address.do");
		}
		mav.setViewName("message");
		return mav;
	}
	
	// 배송주소록 삭제 기능
	@RequestMapping("/delete_address.do")
	public ModelAndView deleteAddress(int address_num) {
		ModelAndView mav = new ModelAndView();
		
		int res = addressMapper.deleteAddress(address_num);
		if(res>0) {
			mav.addObject("msg","주소록 삭제가 정상적으로 되었습니다.");
			mav.addObject("url","address.do");
		}else {
			mav.addObject("msg", "주소록 삭제에 실패했하였습니다. 다시 시도해주세요.");
			mav.addObject("url", "address.do");
		}
		mav.setViewName("message");
		
		return mav;
	}
}

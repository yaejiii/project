package com.ezen.ezenat;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ezenat.dto.EzenatFAQBoardDTO;
import com.ezen.ezenat.dto.EzenatMemberDTO;
import com.ezen.ezenat.dto.EzenatNoticeBoardDTO;
import com.ezen.ezenat.dto.EzenatOfflineStoreDTO;
import com.ezen.ezenat.dto.ReviewBoardDTO;
import com.ezen.ezenat.service.AdminMapper;
import com.ezen.ezenat.service.AdminNoticeBoardMapper;
import com.ezen.ezenat.service.EzenatFAQBoardMapper;
import com.ezen.ezenat.service.MemberMapper;
import com.ezen.ezenat.service.ReviewMapper;
import com.thoughtworks.qdox.model.Member;

@Controller
public class ClientController {

	@Autowired
	ReviewMapper reviewMapper;
	@Autowired
	EzenatFAQBoardMapper ezenatFAQBoardMapper; 
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	AdminNoticeBoardMapper adminNoticeBoardMapper;
	@Autowired
	AdminMapper adminMapper;
	
	// 전체 리뷰
	@RequestMapping(value = "list_review.do")
	public String listReview() {
		return "client_view/all_review";
	}
	
	// 상품 별 리뷰 (상품상세페이지 리뷰와 다름)
	@RequestMapping(value = "product_review.do", method=RequestMethod.GET)
	public String productReview() {
		return "client_view/product_review";
	}

	// 리뷰 쓰기
	@RequestMapping(value = "write_review.do", method=RequestMethod.GET)
	public String writeReview() {
		return "client_view/write_review";
	}

//	// 상품 상세페이지
//	@RequestMapping(value = "content_product.do")
//	public String contentProdut() {
//		return "client_view/content_product";
//	}
	
	// 공지사항 검색
	@RequestMapping ("search_notice.do")
	public ModelAndView searchNotice(HttpServletRequest req) {
		String search = (String) req.getParameter("search");
		String search_string = (String) req.getParameter("search_string");
		String search_date = (String) req.getParameter("search_date");
	
		System.out.println("search date" + search_date);
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

		String end_date = date.format(today);
		String start_date = null;

		if(search_date.equals("week")) {
			Calendar week = Calendar.getInstance();
		    week.add(Calendar.DATE , -7);
		    start_date = date.format(week.getTime());

		}else if(search_date.equals("month")) {
			Calendar month = Calendar.getInstance();
		    month.add(Calendar.MONTH , -1);
		    start_date = date.format(month.getTime());
		    
		}else if(search_date.equals("month_3")) {
			Calendar month = Calendar.getInstance();
		    month.add(Calendar.MONTH , -3);
		    start_date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(month.getTime());

		}else if(search_date.equals("all")) {
			start_date = "2023-07-05";
		}
		//paging
	String pageNum = (String) req.getParameter("pageNum");
		
		int pageSize = 5;
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminNoticeBoardMapper.getNoticeBoardCount();

		if (endRow>count) endRow = count;
		if (count>0){
			Map<String, Integer> params = new HashMap();
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			System.out.println("startRow"+ startRow +"endRow"+ endRow);
			
			int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if (endPage > pageCount) endPage = pageCount;
			
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		req.setAttribute("count", count);
		req.setAttribute("rowNum", rowNum);

		
		Map<String, String> params = new HashMap<>();
		params.put("search", search);
		params.put("search_string", search_string);
		params.put("start_date", start_date);
		params.put("end_date", end_date);

		List<EzenatNoticeBoardDTO> list = adminNoticeBoardMapper.searchNoticeBoard(params);
		
		return new ModelAndView("notice.do","list_notice",list);
	}
	

	// 자주 묻는 질문 목록
	@RequestMapping (value = "FAQ.do")
	public ModelAndView listFAQ(HttpServletRequest req, @RequestParam(required = false) String pageNum) {
		
		int pageSize = 5;
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = ezenatFAQBoardMapper.getFAQBoardCount();

		if (endRow>count) endRow = count;
		List<EzenatFAQBoardDTO> list = null;
		if (count>0){
			Map<String, Integer> params = new HashMap();
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			System.out.println("startRow"+ startRow +"endRow"+ endRow);
			
			list = ezenatFAQBoardMapper.listFAQBoard(params);
			int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if (endPage > pageCount) endPage = pageCount;
			
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		req.setAttribute("count", count);
		req.setAttribute("rowNum", rowNum);

		return new ModelAndView("client_view/FAQ","list_faq",list);
	}

	// FAQ 쓰기
	@RequestMapping(value = "write_FAQ_board.do", method = RequestMethod.GET)
	public String writeFAQBoard() {
		return "client_view/write_FAQ_board";
	}

	// 자주 묻는 질문 쓰기 등록
	@RequestMapping(value = "write_FAQ_board.do", method = RequestMethod.POST)
	public String writeFAQBoardOk(HttpServletRequest req, EzenatFAQBoardDTO dto) {
		dto.setFaq_board_writer("writer");
		dto.setFaq_board_writer_ip(req.getRemoteAddr());
		int res = ezenatFAQBoardMapper.insertFAQBoard(dto);
		if(res>0) {
			req.setAttribute("msg", "게시글 등록 성공, 게시글 목록으로 이동합니다.");
			req.setAttribute("url", "FAQ.do");
		}else {
			req.setAttribute("msg", "게시글 등록 실패, 게시글 등록페이지로 이동합니다.");
			req.setAttribute("url", "write_FAQ_board.do");
		}
		
		return "forward:WEB-INF/views/message.jsp";
	}
	
	// 로그인 페이지
	@RequestMapping(value = "login.do")
	public String login() {
		return "client_view/login";
	}

	// 마이페이지 수정 페이지
	@RequestMapping(value = "mypage_edit.do")
	public ModelAndView editMypage(HttpServletRequest req) {
		HttpSession session = req.getSession();
		EzenatMemberDTO dto = (EzenatMemberDTO) session.getAttribute("memInfo");
		
		// 생일 불러올 때 null 값일 경우 에러 발생. 예외처리함.
		if(dto.getBirth_year() == null || dto.getBirth_month() == null || dto.getBirth_day() == null)
		{
			dto.setBirth_year("");
			dto.setBirth_month("");
			dto.setBirth_day("");
		}
		return new ModelAndView("client_view/edit_mypage","memberInfo", dto);
	}
	
	//회원정보 수정 완료
	@RequestMapping("edit_mypage_complete.do")
	public String editMypageOk(HttpServletRequest req, EzenatMemberDTO dto) {
		int res = memberMapper.updateMemberInfo(dto);
		if(res > 0 ) {
			return "forward:WEB-INF/views/client_view/edit_mypage_complete.jsp";
		}else {
			req.setAttribute("msg", "회원 정보 수정을 실패했습니다. 다시 시도해주세요.");
			req.setAttribute("url", "mypage_edit.do");
			}
			return "forward:WEB-INF/views/message.jsp";
	}
	
	// 회원탈퇴
	@RequestMapping("delete_member.do")
	public String deleteMember(HttpServletRequest req, String member_id) {
		int res = memberMapper.deleteMember(member_id);
		
		if(res > 0 ) {
			HttpSession session = req.getSession();
			session.invalidate();
			return "forward:WEB-INF/views/client_view/delete_member_complete.jsp";
		}else {
			req.setAttribute("msg", "회원 탈퇴를 실패했습니다. 다시 시도해주세요.");
			req.setAttribute("url", "mypage_edit.do");
			}
			return "forward:WEB-INF/views/message.jsp";
	}

	// 환불 계좌 페이지
	@RequestMapping(value = "refund_account.do")
	public String refundAccount() {
		return "client_view/client_refund_account";
	}
	
	// 회원 주문 페이지
	@RequestMapping(value = "order_member.do")
	public String orderMember() {
		return "client_view/order_member";
	}

	// 비회원 주문 페이지
	@RequestMapping(value = "order_non_member.do")
	public String orderNonMember() {
		return "client_view/order_non_member";
	}
	
	// 지점 목록 보기
	@RequestMapping(value = "location_store_map.do")//7월17일
	public ModelAndView locationStoreMap() {
		List<EzenatOfflineStoreDTO> list = adminMapper.locationStoreMap();
		
		return new ModelAndView ("client_view/client_location_store", "StoreMap", list);
	}
	
	// 회원 쿠폰 조회 페이지
	@RequestMapping(value = "member_coupon.do")
	public String memberCoupon() {
		return "client_view/client_coupon";
	}

	// 쿠폰 다운로드(발행) 페이지
	@RequestMapping(value = "issue_coupon.do")
	public String issueCoupon() {
		return "client_view/issue_coupon";
	}
	
	// 적립금 적립 내역 조회 페이지
	@RequestMapping(value = "point.do")
	public String historyPoint() {
		return "client_view/history_point";
	}
	
	// 리뷰 작성 완료
	@RequestMapping(value = "write_review.do", method=RequestMethod.POST)
	public String writeReviewOk(MultipartHttpServletRequest multi, HttpServletRequest req, 
								ReviewBoardDTO dto) {
		
//파일 받아와 리스트에 넣기 		
		List<MultipartFile> review_images_list = multi.getFiles("imagesArray");
		//파일이 있으면 
		if (review_images_list.size() > 0) {

        	//폴더명 지정해줄 날짜와 형식 설정
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    		Date date = new Date();

    		HttpSession session = multi.getSession();
    		//폴더 경로 : resource/review_images/당일날짜/상품번호(또는 코드)
    		String upPath = session.getServletContext().getRealPath("review_images") + File.separator + sdf.format(date) + File.separator + dto.getProduct_num();

    		MultipartFile mf;
    		String filename;
    		File file = new File(upPath);
    		Path path = Paths.get(file.getPath());
    		
    		try {
                // 디렉토리 생성
        		Files.createDirectories(path);
     
                System.out.println(path + " 디렉토리가 생성되었습니다.");
     
            }catch (IOException e) {
                e.printStackTrace();
            }
        
        	for(int i=0;i<review_images_list.size();i++){
            	mf = review_images_list.get(i);		
            	//파일 이름 겹치지 않게 정해주기(uuid로 랜덤한 이름 만들어주고+원래 파일명+멤버 아이디(현재는 멤버넘버))
        		filename = UUID.randomUUID() + "_" + mf.getOriginalFilename()+ "_" + dto.getMember_num();

        		File image_file = new File(upPath, filename);
        		try {
        			mf.transferTo(image_file);
        		} catch (IOException e) {
        			e.printStackTrace();
        		}
        		int img_res = reviewMapper.insertReviewImage(filename);
        		if(img_res>0) {
        			System.out.println(i+"번 째 리뷰 이미지 db에 저장 완");
        		}
            }
		
		int res = reviewMapper.insertReview(dto);
		if(res>0) {
//정상적으로 글쓰기 성공 시, list_review로 이동
			req.setAttribute("url", "list_review.do");
		}else {
//글쓰기 실패 시, write_review로 이동
			req.setAttribute("url", "write_review.do");
		}
	}return "forward:WEB-INF/view/message.jsp";
}

	
//	@RequestMapping("list_review.do")
//	public ModelAndView listReview(HttpServletRequest req, @RequestParam(required = false) String pageNum) {
//		int pageSize = 5;
//		if (pageNum == null){
//			pageNum = "1";
//		}
//		
//		int currentPage = Integer.parseInt(pageNum);
//		int startRow = (currentPage - 1) * pageSize + 1;
//		int endRow = startRow + pageSize - 1;
//		int count = reviewMapper.getCount();
//		if (endRow>count) endRow = count;
//		List<ReviewBoardDTO> list = null;
//		if (count>0){
//			Map<String, Integer> params = new HashMap();
//			params.put("startRow", startRow);
//			params.put("endRow", endRow);
//			list = reviewMapper.listReview(params);
//			int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
//			int pageBlock = 3;
//			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
//			int endPage = startPage + pageBlock - 1;
//			
//			if (endPage > pageCount) endPage = pageCount;
//			
//			req.setAttribute("startPage", startPage);
//			req.setAttribute("endPage", endPage);
//			req.setAttribute("pageBlock", pageBlock);
//			req.setAttribute("pageCount", pageCount);
//		}
//		int rowNum = count - (currentPage - 1) * pageSize;
//		req.setAttribute("count", count);
//		req.setAttribute("rowNum", rowNum);
//		return new ModelAndView("views/review_product.jsp", "list_review", list);
//	}
	
	
}

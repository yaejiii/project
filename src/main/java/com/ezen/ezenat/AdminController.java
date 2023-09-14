package com.ezen.ezenat;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ezenat.dto.EzenatCategoryDTO;
import com.ezen.ezenat.dto.EzenatFAQBoardDTO;
import com.ezen.ezenat.dto.EzenatMemberDTO;
import com.ezen.ezenat.dto.EzenatNoticeBoardDTO;
import com.ezen.ezenat.dto.EzenatOrderHistoryDTO;
import com.ezen.ezenat.dto.EzenatPqtyManageDTO;
import com.ezen.ezenat.dto.EzenatProductAllDTO;
import com.ezen.ezenat.dto.EzenatProductDTO;
import com.ezen.ezenat.dto.EzenatProductImageDTO;
import com.ezen.ezenat.service.AdminMapper;
import com.ezen.ezenat.service.AdminNoticeBoardMapper;
import com.ezen.ezenat.service.EzenatFAQBoardMapper;
import com.ezen.ezenat.service.MemberMapper;

import net.sf.json.JSONArray;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private AdminNoticeBoardMapper adminNoticeBoardMapper;
	@Autowired
	private EzenatFAQBoardMapper ezenatFAQBoardMapper;
	
	@RequestMapping(value = "/admin_member_list.do" , method = RequestMethod.GET)
	public String memberlist_admin(HttpServletRequest req
									, @RequestParam(required=false) Map<String, String> map
									, @RequestParam(required = false) String mode) throws Exception {
	
		int pageSize = 10;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListMemCount();
			
		if (endRow>count) endRow = count;
		List<EzenatMemberDTO> list = null;
		
		if(count > 0) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = memberMapper.listMember(map);
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
		
		
		if(mode==null || mode.equals("")) {
			req.setAttribute("listMember", list);
			req.setAttribute("mode", "N");
			
		}else if(mode.equals("Y")) {
			
			list = adminMapper.memberBlackList(map);
			req.setAttribute("listMember", list);
			req.setAttribute("mode", "Y");
		}

		return "admin/admin_member_list";
	}
	
	@RequestMapping(value = "/admin_member_rating.do" ,method =  RequestMethod.GET)
	public String memberRating(HttpServletRequest req, @RequestParam(required=false) Map<String,String>map) {
	
		int pageSize = 10;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListMemCount();
			
		if (endRow>count) endRow = count;
		List<EzenatMemberDTO> list = null;
		
		if(count > 0) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = memberMapper.listMember(map);
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
		
		list = memberMapper.listMember(map);
		req.setAttribute("listMember", list);
		
		return "admin/admin_member_rating";
	}
	
	@RequestMapping(value = "/admin_member_rating.do" ,method =  RequestMethod.POST)
	public String memberRating(@RequestParam Map<String,String>map,HttpServletRequest req) {
	
		List<EzenatMemberDTO> list = null;
		if(map.get("search").equals("all")) {			
			list = adminMapper.searchRatingList(map);
		 	
		} else {
			map.put("searchString","%" + map.get("searchString") + "%");
			list = adminMapper.searchList(map);
		}
		
		req.setAttribute("listMember", list);
		
		return "admin/admin_member_rating";
	}
		/*
		 * List<EzenatMemberDTO> list = null; if (search.trim().equals("id") ||
		 * rating.trim().equals("bronze")) { list =
		 * adminMapper.searchRatingBronzeId(searchString,rating); } else if
		 * (search.trim().equals("id") || rating.trim().equals("silver")) { list =
		 * adminMapper.searchRatingSilverId(searchString); } else if
		 * (search.trim().equals("id") || rating.trim().equals("gold")) { list =
		 * adminMapper.searchRatingGoldId(searchString); }else if
		 * (search.trim().equals("name") || rating.trim().equals("bronze")) { list =
		 * adminMapper.searchRatingBronzeName(searchString); }else if
		 * (search.trim().equals("name") || rating.trim().equals("silver")) { list =
		 * adminMapper.searchRatingSilverName(searchString); }else if
		 * (search.trim().equals("name") || rating.trim().equals("gold")) { list =
		 * adminMapper.searchRatingGoldName(searchString); }
		 */
	/*
	 * req.setAttribute("listMember", list); return "admin/admin_member_rating";
	 */

	@RequestMapping("/admin_main.do")
	public String mainAdmin() {
		
		return "admin/admin_main";
	}

	@RequestMapping(value = "/admin_category.do", method = RequestMethod.GET)
	public ModelAndView categoryAdmin(HttpServletRequest req) throws Exception {

		List<EzenatCategoryDTO> list = adminMapper.listCate();
		System.out.println("listsize..." + list);

		return new ModelAndView("admin/admin_category", "listCate", JSONArray.fromObject(list));
	}

	//7월 18일자 변경.(페이지추가)
	@RequestMapping(value = "/admin_product_list.do")
	public String productListAdmin(HttpServletRequest req, @RequestParam(required = false) Map<String, String> map,@RequestParam(required = false)String mode) {
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListProdCount();
		
		if (endRow>count) endRow = count;
		List<EzenatProductAllDTO> list = null;
		
		if(count > 0) {
			
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = adminMapper.listProd(map);
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
			
		HttpSession session = req.getSession();
		String upPath = (String) session.getAttribute("upPath");
		if (upPath == null) {
			session.setAttribute("upPath", session.getServletContext().getRealPath("/resources/images"));
		}
		
		System.out.println(mode);
		if(mode==null || mode.equals("")) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			list = adminMapper.listProd(map);
			req.setAttribute("listProd", list);
			
		}else if(mode.equals("Y")) {
			System.out.println("들어왔다");
			list = new ArrayList<>();
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = adminMapper.deleteProdList(map);
			
			req.setAttribute("listProd", list);
			req.setAttribute("mode", "Y");
		}
		
		return "admin/admin_product_list";
	}

	@RequestMapping(value = "/admin_product_insert.do", method = RequestMethod.GET)
	public ModelAndView productInsertAdmin() throws Exception {
		
		List<EzenatCategoryDTO> list = adminMapper.listCate();
		
		return new ModelAndView("admin/admin_product_insert","listCate", JSONArray.fromObject(list));
	}

	@RequestMapping(value = "/admin_product_insert.do", method = RequestMethod.POST)
	public String productInsertOkAdmin(HttpServletRequest req, @ModelAttribute EzenatProductDTO dto
										, MultipartFile mf, BindingResult result) throws IOException {
		
		String[] product_size = req.getParameterValues("product_size");
		System.out.println(dto.getProduct_code());
		System.out.println("마진값"+"="+dto.getProduct_margin());
		System.out.println("디자인"+dto.getProduct_explain_design());
		System.out.println("원단"+dto.getProduct_explain_fabric());
		System.out.println("사이즈"+dto.getProduct_explain_size());
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		Iterator<String> it = (Iterator<String>) mr.getFileNames();
		String upPath = req.getServletContext().getRealPath("/resources/product_images");
		EzenatProductImageDTO imgDTO = new EzenatProductImageDTO();
		
	    dto.setProduct_size(product_size[0]);
	    
		String a = "test";
		int b = 1;
		dto.setProduct_code(dto.getCategory_code()+dto.getProduct_code());
		System.out.println(dto.getProduct_code());
		
//		dto.setProduct_largecategory(a); 
//		dto.setProduct_mediumcategory(a);
//		dto.setProduct_smallcategory(a);
		 
//		dto.setProduct_explain_design(a);
//		dto.setProduct_explain_fabric(a);
//		dto.setProduct_explain_size(a);

		dto.setProduct_exchanged(b);
		dto.setProduct_refunded(b);

		int count = adminMapper.getProductCount(dto);
	
		if(count >= 1) {
			req.setAttribute("msg", "중복되는 상품이 존재합니다.");
			req.setAttribute("url", "admin_product_insert.do");
			return "/message";
		}
		
		int res = adminMapper.insertProduct(dto);
		int product_num = adminMapper.getProductNum(dto);
		if (res > 0) {
			
			imgDTO.setProduct_num(product_num);
			while (it.hasNext()) {
				String img = it.next();
				mf = mr.getFile(img);
				String prod_image = mf.getOriginalFilename();
				File file = new File(upPath, prod_image);
				
				if (mf.getSize() != 0) {
					if (!file.exists())
						file.mkdirs();
					try {
						mf.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
				
				System.out.println(prod_image);
				if (prod_image == null || prod_image.equals("")) {
					break;
				}
				
				// 사진 순서대로 넣기
				if (imgDTO.getProduct_image1() == null || imgDTO.getProduct_image1().equals("")) {
					imgDTO.setProduct_image1(prod_image);
				} else if (imgDTO.getProduct_image2() == null || imgDTO.getProduct_image2().equals("")) {
					imgDTO.setProduct_image2(prod_image);
				} else if (imgDTO.getProduct_image3() == null || imgDTO.getProduct_image3().equals("")) {
					imgDTO.setProduct_image3(prod_image);
				} else if (imgDTO.getProduct_image4() == null || imgDTO.getProduct_image4().equals("")) {
					imgDTO.setProduct_image4(prod_image);
				} else if (imgDTO.getProduct_image5() == null || imgDTO.getProduct_image5().equals("")) {
					imgDTO.setProduct_image5(prod_image);
				}	else if (imgDTO.getProduct_image6() == null || imgDTO.getProduct_image6().equals("")) {
					imgDTO.setProduct_image6(prod_image);
				}	else if (imgDTO.getProduct_image7() == null || imgDTO.getProduct_image7().equals("")) {
					imgDTO.setProduct_image7(prod_image);
				}	else if (imgDTO.getProduct_image8() == null || imgDTO.getProduct_image8().equals("")) {
					imgDTO.setProduct_image8(prod_image);
				}	else if (imgDTO.getProduct_image9() == null || imgDTO.getProduct_image9().equals("")) {
					imgDTO.setProduct_image9(prod_image);
				}	else if (imgDTO.getProduct_image10() == null || imgDTO.getProduct_image10().equals("")) {
					imgDTO.setProduct_image10(prod_image);
				}
			
				//이미지 없는거에 "" 값 정해주기
				if (imgDTO.getProduct_image2() == null || imgDTO.getProduct_image2().equals("")) {
					imgDTO.setProduct_image2("");
				}
				if (imgDTO.getProduct_image3() == null || imgDTO.getProduct_image3().equals("")) {
					imgDTO.setProduct_image3("");
				}
				if (imgDTO.getProduct_image4() == null || imgDTO.getProduct_image4().equals("")) {
					imgDTO.setProduct_image4("");
				}
				if (imgDTO.getProduct_image5() == null || imgDTO.getProduct_image5().equals("")) {
					imgDTO.setProduct_image5("");
				}
				if (imgDTO.getProduct_image6() == null || imgDTO.getProduct_image6().equals("")) {
					imgDTO.setProduct_image6("");
				}
				if (imgDTO.getProduct_image7() == null || imgDTO.getProduct_image7().equals("")) {
					imgDTO.setProduct_image7("");
				}
				if (imgDTO.getProduct_image8() == null || imgDTO.getProduct_image8().equals("")) {
					imgDTO.setProduct_image8("");
				}
				if (imgDTO.getProduct_image9() == null || imgDTO.getProduct_image9().equals("")) {
					imgDTO.setProduct_image9("");
				}
				if (imgDTO.getProduct_image10() == null || imgDTO.getProduct_image10().equals("")) {
					imgDTO.setProduct_image10("");
				}
			}
			int res2 = adminMapper.insertProductImage(imgDTO);
			req.setAttribute("msg", "상품등록 성공");
			req.setAttribute("url", "admin_product_list.do");
			
		} else {
			req.setAttribute("msg", "상품 등록실패!");
			req.setAttribute("url", "admin_product_insert.do");
		}
		
		return "message";
	}
			

	@RequestMapping(value = "/admin_product_view.do",method = RequestMethod.GET)
	public String admin_prod_view(HttpServletRequest req) throws ServletRequestBindingException{
		
		int product_num = ServletRequestUtils.getIntParameter(req, "product_num");
		EzenatProductAllDTO dto = adminMapper.getProd(product_num);
				
		List<String> list = new ArrayList<>();
		list.add(dto.getProduct_image1());
	
		if(dto.getProduct_image2() != null) {
			if(!dto.getProduct_image2().equals("")) {
				list.add(dto.getProduct_image2());
			}
		}
		if(dto.getProduct_image3() != null) {
			if(!dto.getProduct_image3().equals("")) {
				list.add(dto.getProduct_image3());
			}
		}
		if(dto.getProduct_image4() != null) {
			if(!dto.getProduct_image4().equals("")) {
				list.add(dto.getProduct_image4());
			}
		}
		if(dto.getProduct_image5() != null) {
			if(!dto.getProduct_image5().equals("")) {
				list.add(dto.getProduct_image5());
			}
		}
		if(dto.getProduct_image6() != null) {
			if(!dto.getProduct_image6().equals("")) {
				list.add(dto.getProduct_image6());
			}
		}
		if(dto.getProduct_image7() != null) {
			if(!dto.getProduct_image7().equals("")) {
				list.add(dto.getProduct_image7());
			}
		}
		if(dto.getProduct_image8() != null) {
			if(!dto.getProduct_image8().equals("")) {
				list.add(dto.getProduct_image8());
			}
		}
		if(dto.getProduct_image9() != null) {
			if(!dto.getProduct_image9().equals("")) {
				list.add(dto.getProduct_image9());
			}
		}
		if(dto.getProduct_image10() != null) {
			if(!dto.getProduct_image10().equals("")) {
				list.add(dto.getProduct_image10());
			}
		}
		
		req.setAttribute("getProd", dto);
		req.setAttribute("imageList", list);	
		
		return "/admin/admin_product_view";					
	}
	
	@RequestMapping(value = "/admin_product_view.do", method = RequestMethod.POST)
	public ModelAndView admin_prod_viewUpdate(String beforeSize, HttpServletRequest req,
												@ModelAttribute EzenatProductDTO dto,
												@ModelAttribute EzenatProductImageDTO imgDTO) throws IllegalStateException, IOException {
		
		System.out.println("요까지");
		System.out.println(dto.getProduct_num());
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		Iterator<String> it = (Iterator<String>) mr.getFileNames();
		
		String upPath = req.getServletContext().getRealPath("/resources/images/");
		String[] product_size = req.getParameterValues("product_size");
		
		ModelAndView mav = new ModelAndView("message");

		if(product_size != null) {
			for(int i=0;i<product_size.length;i++) {
				if(product_size[i] != null) {
					dto.setProduct_size(product_size[i]);
				}
			}
		}
		
		if(dto.getProduct_size() == null) {
			dto.setProduct_size(beforeSize);
		}
		System.out.println(dto.getProduct_size());
		/*
		 * String a = "test"; int b = 1;
		*/
		 		
		while (it.hasNext()) {
			String img = it.next();
			MultipartFile mf = mr.getFile(img);			
			String prod_image = mf.getOriginalFilename();
			File file = new File(upPath, prod_image);
			if (mf.getSize() != 0) {
				if (!file.exists())
					file.mkdirs();
				try {
					mf.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			System.out.println(prod_image);
			if (prod_image == null || prod_image.equals("")) {
				break;
			}
			// 사진 순서대로 넣기
			if (imgDTO.getProduct_image1() == null || imgDTO.getProduct_image1().equals("")) {
				imgDTO.setProduct_image1(prod_image);
			} else if (imgDTO.getProduct_image2() == null || imgDTO.getProduct_image2().equals("")) {
				imgDTO.setProduct_image2(prod_image);
			} else if (imgDTO.getProduct_image3() == null || imgDTO.getProduct_image3().equals("")) {
				imgDTO.setProduct_image3(prod_image);
			} else if (imgDTO.getProduct_image4() == null || imgDTO.getProduct_image4().equals("")) {
				imgDTO.setProduct_image4(prod_image);
			} else if (imgDTO.getProduct_image5() == null || imgDTO.getProduct_image5().equals("")) {
				imgDTO.setProduct_image5(prod_image);
			}	else if (imgDTO.getProduct_image6() == null || imgDTO.getProduct_image6().equals("")) {
				imgDTO.setProduct_image6(prod_image);
			}	else if (imgDTO.getProduct_image7() == null || imgDTO.getProduct_image7().equals("")) {
				imgDTO.setProduct_image7(prod_image);
			}	else if (imgDTO.getProduct_image8() == null || imgDTO.getProduct_image8().equals("")) {
				imgDTO.setProduct_image8(prod_image);
			}	else if (imgDTO.getProduct_image9() == null || imgDTO.getProduct_image9().equals("")) {
				imgDTO.setProduct_image9(prod_image);
			}	else if (imgDTO.getProduct_image10() == null || imgDTO.getProduct_image10().equals("")) {
				imgDTO.setProduct_image10(prod_image);
			}
		}
		
		if(imgDTO.getProduct_image1() == null || imgDTO.getProduct_image1().equals("")) {
			if	(imgDTO.getProduct_image2() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image2());
				imgDTO.setProduct_image2("");
			}	
			if	(imgDTO.getProduct_image3() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image3());
				imgDTO.setProduct_image3("");
			}
			if	(imgDTO.getProduct_image4() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image4());
				imgDTO.setProduct_image4("");
			}
			if	(imgDTO.getProduct_image5() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image5());
				imgDTO.setProduct_image5("");
			}
			if	(imgDTO.getProduct_image6() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image6());
				imgDTO.setProduct_image6("");
			}
			if	(imgDTO.getProduct_image7() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image7());
				imgDTO.setProduct_image7("");
			}
			if	(imgDTO.getProduct_image8() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image8());
				imgDTO.setProduct_image8("");
			}
			if	(imgDTO.getProduct_image9() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image9());
				imgDTO.setProduct_image9("");
			}
			if	(imgDTO.getProduct_image10() != null) {
				imgDTO.setProduct_image1(imgDTO.getProduct_image10());
				imgDTO.setProduct_image10("");
			}
		}
		
		if (imgDTO.getProduct_image2() == null || imgDTO.getProduct_image2().equals("")) {
			imgDTO.setProduct_image2("");
		}
		if (imgDTO.getProduct_image3() == null || imgDTO.getProduct_image3().equals("")) {
			imgDTO.setProduct_image3("");
		}
		if (imgDTO.getProduct_image4() == null || imgDTO.getProduct_image4().equals("")) {
			imgDTO.setProduct_image4("");
		}
		if (imgDTO.getProduct_image5() == null || imgDTO.getProduct_image5().equals("")) {
			imgDTO.setProduct_image5("");
		}
		if (imgDTO.getProduct_image6() == null || imgDTO.getProduct_image6().equals("")) {
			imgDTO.setProduct_image6("");
		}
		if (imgDTO.getProduct_image7() == null || imgDTO.getProduct_image7().equals("")) {
			imgDTO.setProduct_image7("");
		}
		if (imgDTO.getProduct_image8() == null || imgDTO.getProduct_image8().equals("")) {
			imgDTO.setProduct_image8("");
		}
		if (imgDTO.getProduct_image9() == null || imgDTO.getProduct_image9().equals("")) {
			imgDTO.setProduct_image9("");
		}
		if (imgDTO.getProduct_image10() == null || imgDTO.getProduct_image10().equals("")) {
			imgDTO.setProduct_image10("");
		}
		
		int res = adminMapper.updateProdImage(imgDTO);
		System.out.println(res);
		if(res == 0) {
			req.setAttribute("msg", "이미지 수정 실패!");
			req.setAttribute("url", "admin_product_view.do?product_num="+dto.getProduct_num());
			
		}else{			
			req.setAttribute("msg", "이미지 수정 성공");	
			req.setAttribute("url", "admin_product_list.do");
		}
		
		int prod_res = adminMapper.updateProd(dto);
		System.out.println("들왔니" + prod_res);
		if(prod_res==0) {
			req.setAttribute("msg", "상품 수정 실패");
			req.setAttribute("url", "admin_product_view.do?product_num="+dto.getProduct_num());
			
		}else {
			req.setAttribute("msg", "상품 수정 성공");
			req.setAttribute("url", "admin_product_list.do");
		}
		
		return mav;
	}
	
	 @PostMapping(value = "/admin_product_realDelete.do")	 
	 @ResponseBody public int real_delete_list(@RequestParam(value = "dlist", required = false) List<String> list) { 
		 
		if(list != null) { 
			for(String str : list) { 
				str = str.split("\"")[1]; 
				int res = adminMapper.deleteRealProdList(str);
				
				break; 
			}
		}
					 	
		return 1; 
	}
	
	@PostMapping(value = "/admin_product_moveDeleteList.do")
	@ResponseBody
	public int move_delete_list(@RequestParam(value="list", required=false) List<String> list) {
		
		if(list != null) {
			for(String str : list) {
				str = str.split("\"")[1];				
				int res = adminMapper.moveDeleteProdList(str);
			}
		}
		
		return 1;
	}
	
//	@PostMapping("/admin_product_codeCheck.do")
//	@ResponseBody
//	public int code_check(@RequestParam(value = "input", required = false) String input){
//		System.out.println("컨트롤러도착");
//		int res = adminMapper.codeCheck(input);
//		return res;
//	}

	@PostMapping("/admin_product_pNameCheck.do")
	@ResponseBody
	public int pNameCheck(@RequestParam(value = "input", required = false) String input) {
		int res = adminMapper.pNameCheck(input);
		
		return res;
	}
	/*
	 * @PostMapping("/admin_product_editPqty.do")
	 * 
	 * @ResponseBody public int
	 * productEditPqty(@RequestParam(value="input",required=false)int input){
	 * System.out.println("컨트롤러도착"); int res = adminMapper.editPqty(input); return
	 * res; }
	 */
	
	@RequestMapping(value="/admin_product_search.do", method = RequestMethod.POST)
	public String adminProductSearch(String search, String searchString, HttpServletRequest req,
											@RequestParam(required = false) Map<String, String> map) {
		
		System.out.println("search: " + search);
		if(searchString == null || searchString.trim().equals("")) {
			return "redirect:admin_product_list.do";
			
		}
		
		if(map.get("mode")==null || map.get("mode").equals("")) {		
			List<EzenatProductAllDTO> list = null;
			if(search.trim().equals("product_name")) {
				System.out.println(searchString);
					list = adminMapper.searchProductname(searchString);
			}else if(search.trim().equals("product_code")) {
				list = adminMapper.searchProductcode(searchString);
			}
			req.setAttribute("listProd", list);
		
		}else if(map.get("mode").contentEquals("Y")) {
			List<EzenatProductAllDTO> list = null;
			if(search.trim().equals("product_name")) {
				System.out.println(searchString);
				list = adminMapper.searchProductnameDel(searchString);
				
			}else if(search.trim().equals("product_code")) {
				list = adminMapper.searchProductcodeDel(searchString);
			}
			req.setAttribute("listProd", list);
			req.setAttribute("mode", "Y");
			
		}
		return "admin/admin_product_list";
	}

	@PostMapping(value = "/admin_member_delete.do")
	@ResponseBody
	public int member_delete_list(@RequestParam(value="list",required=false)List<String> list ) {
		System.out.println("요까지왔나?");
		if(list != null) {
			for(String str : list) {
				str = str.split("\"")[1];				
				int res = adminMapper.adminDeleteMember(str);
				
			}
		}
		
		return 1;
	}
	
	@RequestMapping(value = "/admin_member_search.do", method = RequestMethod.GET)
	public String searchMember() {
		return "admin/admin_member_list";
	}

	@RequestMapping(value = "/admin_member_search.do", method = RequestMethod.POST)
	public String searchMember(@RequestParam Map<String,String> map, HttpServletRequest req) {
		map.put("searchString",map.get("searchString")+"%");
		if(map.get("gender").equals("all")){
			map.put("gender", "female");
			map.put("gender2", "male");
		}else {
			System.out.println("남자,여자선택시");
			map.put("gender2", map.get("gender"));
		}
		List<EzenatMemberDTO> list = adminMapper.searchList(map);
		req.setAttribute("listMember", list);
		return "admin/admin_member_list";
	}
	
	@PostMapping("/admin_member_moveBlackList.do")
	@ResponseBody
	public int move_black_list(@RequestParam String mode, @RequestParam(value = "dlist", required = false) List<String> list) {
		
		if(mode.equals("N")) {
			if(list != null) {
				for(String str : list) {
					str = str.split("\"")[1];				
					int res = adminMapper.memberMoveBlackList(str);
					
				}
			}
			return  -1;
		}
		
		if(mode.equals("Y")) {
			if(list != null) {
				for(String str : list) {
					str = str.split("\"")[1];
					int res = adminMapper.memberMoveNormalList(str);
				}
			}
			
			return 1;
		}
	
		return 0;
	}
	
	
	/*
	 * @RequestMapping(value = "/admin_category_search.do" ,method =
	 * RequestMethod.POST) public String searchCategory(HttpServletRequest
	 * req,String search,@ModelAttribute EzenatProductDTO dto) {
	 * System.out.println("search: " + search); List<EzenatProductDTO> list = null;
	 * 
	 * if(search.trim().equals("product_code")) { list =
	 * adminMapper.searchCategory(search);
	 * 
	 * 
	 * }
	 * 
	 * req.setAttribute("listProd", list); return "admin/admin_category";
	 * 
	 * 
	 * }
	 * 
	 * 
	 */
		
	@PostMapping(value = "/admin_member_updateRating.do")
	@ResponseBody
	public int member_updateRating(@RequestParam(value = "list", required = false) List<String> list
									, @RequestParam(value = "rank", required = false) String rank) {
		System.out.println("요기왔어?");
		Map<String,String> map = new HashMap<String, String>();
		map.put("rank", rank);
		if(list != null) {
			for(String str : list) {
				str = str.split("\"")[1];
				map.put("id", str);
				int res = adminMapper.updateRating(map);
			}
		}
		
		return 1;
	}
	
	// 태일님 구역
//	@PostMapping(value = "/admin_product_restore.do")
//	@ResponseBody
//	public int restoreProductList(@RequestParam(value = "list", required = false) List<String> list) {
//	    if (list != null) {
//	        for (String str : list) {
//	            str = str.split("\"")[1];
//	            int res = adminMapper.moveRestoreProdList(str);
//	        }
//	    }
//	    
//	    return 1;
//	}
	// end - 태일님 구역
	
	
	
	// 진성님 구역
	//7월 12일자 추가
	@RequestMapping("/admin_upgradeAdminPower.do")
	public String upgradeAdminPower(HttpServletRequest req,@RequestParam(required=false) int member_num) {
		
		System.out.println("컨트롤러도착 : " + member_num);
		int res = adminMapper.upgradeAdminPower(member_num);
		System.out.println(res);
		
		if(res>0) {
			req.setAttribute("msg", "어드민 권한 부여 성공");
			req.setAttribute("url", "admin_member_rating.do");
			
		}else {
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_member_rating.do");
		}
		
		return "message";
	}

	@RequestMapping("/admin_downgradeAdminPower.do")
	public String downgradeAdminPower(HttpServletRequest req,@RequestParam(required=false) int member_num) {
	
		System.out.println("컨트롤러도착 : " + member_num);
		int res = adminMapper.downgradeAdminPower(member_num);
		System.out.println(res);
		
		if(res>0) {
			req.setAttribute("msg", "일반회원 전환 성공");
			req.setAttribute("url", "admin_member_rating.do");
			
		}else {
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_member_rating.do");
		}
		
		return "message";
	}
	
	@RequestMapping("/admin_order_card.do")
	public String orderCard() {
		
		return "admin/admin_order_card";
	}
	// 7월 12일자 요기까지.
	
	// 7월 25일 수정
	//주문목록
	@RequestMapping("/admin_order_list.do")
	public ModelAndView listOrder(HttpServletRequest req,@RequestParam(required = false) Map<String,String>map) {
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListOrderCount();
		
		if (endRow>count) endRow = count;
		List<EzenatOrderHistoryDTO> list = null;
		
		
		if(count > 0) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = adminMapper.listOrder(map);
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
		
		return new ModelAndView("admin/admin_order_list", "listOrder", list);
	}
	
	@RequestMapping("/admin_order_statusDeliver.do")
	 public String orderStatusDeliver(HttpServletRequest req
			 							,@RequestParam(required = false) int order_product_num,@RequestParam(required=false) String order_history_num ) {
	  
	 System.out.println("컨트롤러도착 : " + order_product_num); 
	 int res =  adminMapper.updateStatusDeliver(order_product_num); 
	 System.out.println(res);
		
		if(res>0) {
			req.setAttribute("msg", "배송중으로 변경");
			req.setAttribute("url", "admin_order_view.do?order_history_num"+order_history_num); 
		
		} else {
			req.setAttribute("msg", "변경실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num"+order_history_num);
		}
		return "message"; 
	}

	@RequestMapping(value = "/admin_order_search.do", method = RequestMethod.POST) 
	public String searchOrder(@RequestParam Map<String, String> map, HttpServletRequest req) {
		
		System.out.println(map.get("datepicker_start")); 
		List<EzenatOrderHistoryDTO> list = adminMapper.searchOrderNum(map);
		req.setAttribute("listOrder", list);
		
		return  "admin/admin_order_list";
	}
	
	//환불
	@RequestMapping("/admin_order_refund.do") 
	public ModelAndView orderRefund(HttpServletRequest req,@RequestParam(required = false) Map<String, String>map) {
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListOrderRefundCount();
		
		if (endRow>count) endRow = count;
		List<EzenatProductAllDTO> list = null;
		
		if(count > 0) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = adminMapper.listOrderRefund(map);
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
		
		return new ModelAndView ("admin/admin_order_refund", "listOrderRefund", list); 
	}
	 
	@RequestMapping("/admin_order_refundComplete.do") 
		public String orderRefundComplete(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
		
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res = adminMapper.orderRefundComplete(order_product_num);
		System.out.println(res);
		
		if(res>0) { 
			req.setAttribute("msg", "환불처리완료 "); 
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
			
		} else { req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		}
		return "message"; 
	}
		 
	@RequestMapping("/admin_order_refundWaiting.do") 
	public String orderRefundWaiting(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
		
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res =  adminMapper.orderRefundWaiting(order_product_num); 
		System.out.println(res);
		
		if(res>0)  { 
			req.setAttribute("msg", "환불대기중"); 
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
			
		} else { 
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
			
		}
		return "message"; 
	}																		
																											
	@RequestMapping(value = "/admin_order_refund_search.do", method = RequestMethod.POST) 
	public String searchOrderRefund(@RequestParam Map<String, String> map, HttpServletRequest req) {
		
		System.out.println(map.get("datepicker_start")); 
		List<EzenatProductAllDTO> list = adminMapper.searchOrderNumRefund(map);
		req.setAttribute("listOrderRefund", list);
		
		return "admin/admin_order_refund";
	}
	
	//반품
	@RequestMapping("/admin_order_return.do") 
	public ModelAndView orderReturn(HttpServletRequest req,@RequestParam(required = false) Map<String,String>map) {
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListOrderReturnCount();
		
		if (endRow>count) endRow = count;
		List<EzenatProductAllDTO> list = null;
		
		if(count > 0) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = adminMapper.listOrderReturn(map);
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
						
		return new ModelAndView ("admin/admin_order_return", "listOrderReturn", list); 
	}
	
	@RequestMapping("/admin_order_returnComplete.do") 
	public String orderReturnComplete(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
		
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res = adminMapper.orderReturnComplete(order_product_num); System.out.println(res);
		
		if(res>0) { 
			req.setAttribute("msg", "반품처리완료 "); 
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		}else { req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		}
		return "message"; 
	}
	  
	@RequestMapping("/admin_order_returnWaiting.do") 
	public String orderReturnWaiting(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
	 
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res =  adminMapper.orderReturnWaiting(order_product_num); 
		System.out.println(res);
		
		if(res>0)  { 
			req.setAttribute("msg", "반품대기중"); 
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
			
		}else { 
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
			
		} 
		return "message"; 
	}
	  
	  
	@RequestMapping(value = "/admin_order_return_search.do", method = RequestMethod.POST) 
	public String searchOrderReturn(@RequestParam Map<String, String> map, HttpServletRequest req) {
		
		System.out.println(map.get("datepicker_start")); 
		List<EzenatProductAllDTO>	list = adminMapper.searchOrderNumReturn(map);
		req.setAttribute("listOrderReturn", list);
		
		return "admin/admin_order_return";
	}
	
	//교환
	@RequestMapping("/admin_order_exchange.do") 
	public ModelAndView orderExchange(HttpServletRequest req,@RequestParam Map<String,String>map) {
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListOrderExchangeCount();
		
		if (endRow>count) endRow = count;
		List<EzenatProductAllDTO> list = null;
		
		if(count > 0) {
				map = new HashMap<>();
				map.put("start", String.valueOf(startRow));
				map.put("end", String.valueOf(endRow));
				
				list = adminMapper.listOrderExchange(map);
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

		map = new HashMap<>();
		map.put("start", String.valueOf(startRow));
		map.put("end", String.valueOf(endRow));
		list = adminMapper.listOrderExchange(map);
				
		return new ModelAndView ("admin/admin_order_exchange", "listOrderExchange", list); 
	}
	
	@RequestMapping("/admin_order_exchangeComplete.do") 
	public String orderExchangeComplete(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
		
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res = adminMapper.orderExchangeComplete(order_product_num); 
		System.out.println(res);
		
		if(res>0) { 
			req.setAttribute("msg", "교환처리완료 "); 
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num); 
			
		} else { req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num); 
			
		}
		return "message"; 
	}
	
	@RequestMapping("/admin_order_exchangeWaiting.do") 
	public String orderExchangeWaiting(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
	
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res =  adminMapper.orderExchangeWaiting(order_product_num); 
		System.out.println(res);
		
		if(res>0)  { 
		req.setAttribute("msg", "교환 대기중"); 
		req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		} else { 
		req.setAttribute("msg", "교환 실패");
		req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		}
		return "message"; 
	}
	
	@RequestMapping(value = "/admin_order_exchange_search.do", method = RequestMethod.POST) 
	public String searchOrderExchange(@RequestParam Map<String, String> map, HttpServletRequest req) {
		
		System.out.println(map.get("datepicker_start")); 
		List<EzenatProductAllDTO>	list = adminMapper.searchOrderNumExchange(map);
		req.setAttribute("listOrderExchange", list);
		
		return "admin/admin_order_exchange";
	}
	
	
	//취소  
	@RequestMapping("/admin_order_cancel.do") 
	public ModelAndView orderCancel(HttpServletRequest req,@RequestParam Map<String,String>map) {
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminMapper.getListOrderCancelCount();
		
		if (endRow>count) endRow = count;
		List<EzenatProductAllDTO> list = null;
		
		if(count > 0) {
			map = new HashMap<>();
			map.put("start", String.valueOf(startRow));
			map.put("end", String.valueOf(endRow));
			
			list = adminMapper.listOrderCancel(map);
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
							
		return new ModelAndView ("admin/admin_order_cancel", "listOrderCancel", list);
	}
	  
	@RequestMapping(value = "/admin_order_cancel_search.do", method = RequestMethod.POST) 
	public String searchOrderCancel(@RequestParam Map<String, String> map, HttpServletRequest req) {
		
		System.out.println(map.get("datepicker_start")); 
		List<EzenatProductAllDTO> list = adminMapper.searchOrderNumCancel(map); 
		
		req.setAttribute("listOrderCancel", list);
		
		return "admin/admin_order_cancel";
	}
	
	@RequestMapping("/admin_order_orderCancel.do") 
	public String orderCancel(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
		
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res = adminMapper.orderCancel(order_product_num); 
		System.out.println(res);
		
		if(res>0) { 
			req.setAttribute("msg", "주문취소완료 "); 
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		} else { req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		}
		return "message"; 
	}
  
	@RequestMapping("/admin_order_orderProceeding.do") 
	public String orderProceeding(HttpServletRequest req,@RequestParam(required=false) int order_product_num,@RequestParam(required=false) String order_history_num) {
		
		System.out.println("컨트롤러도착 : " + order_product_num); 
		int res =  adminMapper.orderProceeding(order_product_num); 
		System.out.println(res);
		
		if(res>0) {
			req.setAttribute("msg", "주문 진행중으로 변경");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
		
		}else {
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "admin_order_view.do?order_history_num="+order_history_num);
			
		}
		return "message"; 
	}

	//주문상세페이지
	@RequestMapping(value = "/admin_order_view.do", method=RequestMethod.GET)
	public String orderView(HttpServletRequest req) throws ServletRequestBindingException {
		
		String order_history_num = req.getParameter("order_history_num");
		List<EzenatProductAllDTO> list = adminMapper.getListOrderProd(order_history_num);
		
		req.setAttribute("getListOrderProd", list);
		return "admin/admin_order_view";
	}

		
	@RequestMapping("/admin_product_graph.do")
		public String productGraph() {
			
		return "admin/admin_product_graph";
	}
	// 7월 23일자 수정 요기까지.
	// end - 진성님 구역
	
	
	// 예지님 구역
	// 상품 재고관리 페이지
	 @RequestMapping("/admin_product_pqty.do")
     public ModelAndView adminProductPqty(@RequestParam(required = false) Map<String,String>map, HttpServletRequest req) {

        HttpSession session = req.getSession();
        String upPath = (String) session.getAttribute("upPath");
        if (upPath == null) {
            session.setAttribute("upPath", session.getServletContext().getRealPath("/resources/product_images"));
        }

         List<EzenatProductAllDTO> list = null;

         if(map.get("mode")==null || map.get("mode").equals("")) {
           list = adminMapper.listPqty();
         }
 
         for (EzenatProductAllDTO dto : list) {
             int offline_pqty = dto.getStore_gangnam_pqty() + dto.getStore_nowon_pqty() + dto.getStore_hongdae_pqty(); 

             dto.setOffline_pqty(offline_pqty);
         }

         return new ModelAndView("admin/admin_product_pqty", "listPqty", list);
    }
	
	 @RequestMapping("/admin_product_moveSoldoutList.do")
	    public String moveSoldoutList(HttpServletRequest req, @RequestParam(required = false) Map<String,String>map) {
	        List<EzenatProductAllDTO> list = null;
	        if(map.get("mode").contentEquals("Y")) {
	            list = adminMapper.moveSoldoutList();
	            req.setAttribute("listPqty", list);
	            req.setAttribute("mode", "Y");
	        }
	        return "admin/admin_product_pqty";
	    }
	// 상품 재고관리 검색 기능
	@RequestMapping(value="/admin_product_pqty_search.do", method = RequestMethod.POST)
	public String amdinProductPqtySearch(String search, String searchString, HttpServletRequest req
											,@RequestParam (required=false)Map<String, String>map) {
		System.out.println("search: " + search);
      
	if(searchString == null || searchString.trim().equals("")) {
    	  
		return "redirect:admin_product_pqty.do";
	}
      
	if(map.get("mode")==null || map.get("mode").equals("")) {      
		List<EzenatProductAllDTO> list = null;
	      
		if(search.trim().equals("product_name")) {
			System.out.println(searchString);
			list = adminMapper.searchPqtyProductName(searchString);
	            
		}else if(search.trim().equals("product_code")) {
			list = adminMapper.searchPqtyProductCode(searchString);
	            
		}else if(search.trim().equals("offline_place")) {
            list = adminMapper.searchOfflinePlace(searchString);
		}
		
		req.setAttribute("listPqty", list);
      
		}else if(map.get("mode").contentEquals("Y")) {
			List<EzenatProductAllDTO> list = null;
         
			if(search.trim().equals("product_name")) {
				System.out.println(searchString);
				list = adminMapper.searchProductnameDel(searchString);
			    
			}else if(search.trim().equals("product_code")) {
				list = adminMapper.searchProductcodeDel(searchString);
			
			}else if(search.trim().equals("offline_place")) {
				list = adminMapper.searchOfflinePlaceDel(searchString);
			}
			req.setAttribute("listPqty", list);
			req.setAttribute("mode", "Y");
     
		}
		return "admin/admin_product_pqty";
	}
	
	// 각 지점별 상품 재고목록 페이지
	@RequestMapping("/admin_offline_pqty.do")
	public ModelAndView adminOfflinePqty() {
	   List<EzenatProductAllDTO> list = adminMapper.listPqty();
	   
	   for (EzenatProductAllDTO dto : list) {
			dto.getStore_gangnam_pqty();
			dto.getStore_nowon_pqty();
			dto.getStore_hongdae_pqty();
		}
	   
	   return new ModelAndView("admin/admin_offline_pqty", "listPqty", list);
	}
	
	// 지점별 재고관리 검색 기능
	@RequestMapping(value="/admin_offline_place_search.do", method = RequestMethod.POST)
	public String amdinOfflinePlaceSearch(String search, String searchString, HttpServletRequest req,@RequestParam(required = false)Map<String, String> map) {
		System.out.println("search: " + search);
		if(searchString == null || searchString.trim().equals("")) {
			return "redirect:admin_offline_pqty.do";
			
		}
		
		if(map.get("mode")==null || map.get("mode").equals("")) {	
		List<EzenatProductAllDTO> list = null;
		
			if(search.trim().equals("product_name")) {
				System.out.println(searchString);
				list = adminMapper.searchPqtyProductName(searchString);
				
			}else if(search.trim().equals("product_code")) {
				list = adminMapper.searchPqtyProductCode(searchString);
				
			}else if(search.trim().equals("offline_place")) {
				list = adminMapper.searchOfflinePlace(searchString);
			}
			req.setAttribute("listPqty", list);
		
		} else if (map.get("mode").contentEquals("Y")) {
			List<EzenatProductAllDTO> list = null;
			
			if(search.trim().equals("product_name")) {
				System.out.println(searchString);
				list = adminMapper.searchProductnameDel(searchString);
				
			}else if(search.trim().equals("product_code")) {
				list = adminMapper.searchProductcodeDel(searchString);
				
			}else if(search.trim().equals("store_name")) {
				list = adminMapper.searchOfflinePlaceDel(searchString);
			}
			
			req.setAttribute("listPqty", list);
			req.setAttribute("mode", "Y");
		}
			
		return "admin/admin_offline_pqty";
	}
		
	
	//전체 재고관리
	 @RequestMapping("/admin_update1_pqty.do")
	    public String adminUpdateOnlinePqty(HttpServletRequest req) {
	        String[] product_pqty = req.getParameterValues("product_pqty");
	        String[] online_pqty = req.getParameterValues("online_pqty");
	        String[] offline_pqty = req.getParameterValues("offline_pqty");
	        String[] product_num = req.getParameterValues("product_num");

	        for(int i=0; i<product_pqty.length; ++i) {
	                System.out.println("product_pqty" + i + " : " + Integer.parseInt(product_pqty[i])
	                                    + ", online_pqty" + i + " : " + Integer.parseInt(online_pqty[i])
	                                    + ", offline_pqty" + i + " : " + Integer.parseInt(offline_pqty[i])
	                                    + ", product_num" + i + " : " + Integer.parseInt(product_num[i])
	                                    );

	            int online_update_res = adminMapper.updateOnlinePqty(Integer.parseInt(product_pqty[i]), Integer.parseInt(product_num[i]));
	            int offline_update_res = adminMapper.updateOfflinePqty(Integer.parseInt(offline_pqty[i]), Integer.parseInt(product_num[i]));
	            req.setAttribute("msg", "상품재고 저장이 정상적으로 되었습니다.");
	            req.setAttribute("url","admin_product_pqty.do");
	        }
	        return "message";
	    }
	//지점별 재고관리 수정(저장버튼) 기능
	     @RequestMapping("/admin_update_store_pqty.do")
	     public String adminUpdateStorePqty(EzenatPqtyManageDTO dto, HttpServletRequest req) {

	          String[] store_gangnam_pqty = req.getParameterValues("store_gangnam_pqty");
	          String[] store_nowon_pqty = req.getParameterValues("store_nowon_pqty");
	          String[] store_hongdae_pqty = req.getParameterValues("store_hongdae_pqty");
	          String[] product_num = req.getParameterValues("product_num");

	          for(int i=0; i<store_gangnam_pqty.length; ++i) {
	              System.out.println("store_gangnam_pqty" + i + " : " + Integer.parseInt(store_gangnam_pqty[i])
	                + ", store_gangnam_pqty" + i + " : " + Integer.parseInt(store_gangnam_pqty[i])
	                + ", store_nowon_pqty" + i + " : " + Integer.parseInt(store_nowon_pqty[i])
	                + ", store_hongdae_pqty" + i + " : " + Integer.parseInt(store_hongdae_pqty[i])
	                + ", product_num" + i + " : " + Integer.parseInt(product_num[i])
	                     );

	          int store_gangnam_pqty_res = adminMapper.updateStoreGangnamPqty(Integer.parseInt(store_gangnam_pqty[i]),Integer.parseInt(product_num[i]));
	          int store_nowon_pqty_res = adminMapper.updateStoreNowonPqty(Integer.parseInt(store_nowon_pqty[i]),Integer.parseInt(product_num[i]));
	          int store_hongdae_pqty_res = adminMapper.updateStoreHongdaePqty(Integer.parseInt(store_hongdae_pqty[i]),Integer.parseInt(product_num[i]));

	          req.setAttribute("msg", "상품재고 저장이 정상적으로 되었습니다.");
	          req.setAttribute("url","admin_offline_pqty.do");
	          }
	          return "message";
	     }
	// 7/25 end
	
	// 공지사항 목록
	@RequestMapping(value = "admin_notice.do")
	public ModelAndView adminNotice(HttpServletRequest req, @RequestParam(required = false) String pageNum) {
		
		int pageSize = 5;
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = adminNoticeBoardMapper.getNoticeBoardCount();

		if (endRow>count) endRow = count;
		
		List<EzenatNoticeBoardDTO> list = null;
		if (count>0){
			Map<String, Integer> params = new HashMap();
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			System.out.println("startRow"+ startRow +"endRow"+ endRow);
			
			list = adminNoticeBoardMapper.listNoticeBoard(params);
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

		return new ModelAndView("admin/admin_notice","list_notice", list);
	}

	// 공지사항 내용
	@RequestMapping(value = "admin_content_notice_board.do")
	public ModelAndView adminContentNoticeBoard(HttpServletRequest req) {
		int notice_board_num = Integer.parseInt(req.getParameter("num"));
		EzenatNoticeBoardDTO dto = adminNoticeBoardMapper.getNoticeBoardContent(notice_board_num);

		return new ModelAndView("admin/admin_content_notice_board","content", dto);
	}

	// 공지사항 등록 페이지
	@RequestMapping(value = "admin_write_notice_board.do", method = RequestMethod.GET)
	public String adminWriteNoticeBoard() {
		return "admin/admin_write_notice_board";
	}

	// 공지사항 등록 기능
	@RequestMapping(value = "admin_write_notice_board.do", method = RequestMethod.POST)
	public String adminWriteNoteceBoardOk(HttpServletRequest req, EzenatNoticeBoardDTO dto) {
		dto.setNotice_board_writer("커버낫");
		dto.setNotice_board_writer_ip(req.getRemoteAddr());
		int res = adminNoticeBoardMapper.insertNoticeBoard(dto);
		
		if(res>0) {
			req.setAttribute("msg", "게시글 등록 성공, 게시글 목록으로 이동합니다.");
			req.setAttribute("url", "admin_notice.do");
		}else {
			req.setAttribute("msg", "게시글 등록 실패, 게시글 등록페이지로 이동합니다.");
			req.setAttribute("url", "admin_write_notice_board.do");
		}
		
		return "forward:WEB-INF/views/message.jsp";
	}

	//공지사항 수정 페이지
	@RequestMapping("/admin_update_notice_board.do")
	public ModelAndView editNoticeBoard(int notice_board_num) {
		EzenatNoticeBoardDTO dto = adminNoticeBoardMapper.getNoticeBoardContent(notice_board_num);
		return new ModelAndView("admin/admin_update_notice_board", "get_notice_board_content", dto);
	}

	//공지사항 삭제 기능
	@RequestMapping("/admin_delete_notice_board.do")
	public ModelAndView adminDeleteNoticeBoard(int notice_board_num) {
		ModelAndView mav = new ModelAndView();
		
		int res = adminNoticeBoardMapper.deleteContent(notice_board_num);
		if(res>0) {
			mav.addObject("msg","공지사항 삭제가 정상적으로 되었습니다.");
			mav.addObject("url","admin_notice.do");
		}else {
			mav.addObject("msg", "공지사항 삭제에 실패했하였습니다. 다시 시도해주세요.");
			mav.addObject("url", "admin_content_notice_board.do");
		}
		mav.setViewName("message");
		
		return mav;
	}
	
	//공지사항 수정 기능
	@RequestMapping("/admin_update_notice_board_ok.do")
	public ModelAndView adminUpdateNoticeBoardOk(EzenatNoticeBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int res = adminNoticeBoardMapper.updateContent(dto);
		if(res>0) {
			mav.addObject("msg","공지사항 수정이 정상적으로 되었습니다.");
			mav.addObject("url","admin_notice.do");
		}else {
			mav.addObject("msg", "공지사항 수정에 실패하였습니다. 다시 시도해주세요.");
			mav.addObject("url", "admin_update_notice_board.do");
		}
		
		mav.setViewName("message");
		
		return mav;
	}
	// end - 예지님 구역
	
	// 상인님 구역
	// FAQ 수정 페이지
	@RequestMapping("/admin_update_faq_board.do")
	public ModelAndView editFAQBoard(int faq_board_num) {
		EzenatFAQBoardDTO dto = ezenatFAQBoardMapper.getFAQBoardContent(faq_board_num);
		return new ModelAndView("admin/admin_update_faq_board", "get_faq_board_content", dto);
	}

	// FAQ 삭제 기능
	@RequestMapping("/admin_delete_faq_board.do")
	public ModelAndView adminDeleteFAQBoard(int faq_board_num) {
		ModelAndView mav = new ModelAndView();
	
		int res = ezenatFAQBoardMapper.deleteContent(faq_board_num);
		if(res>0) {
			mav.addObject("msg","자주묻는질문 게시글 삭제가 정상적으로 되었습니다.");
		}else {
			mav.addObject("msg", "자주묻는질문 게시글 삭제에 실패하였습니다. 다시 시도해주세요.");
		}
		mav.addObject("url","list_faq.do");
		mav.setViewName("message");
		
		return mav;
	}
		
	// FAQ 수정 기능
	@RequestMapping("/admin_update_faq_board_ok.do")
	public ModelAndView adminUpdateFAQBoardOk(EzenatFAQBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int res = ezenatFAQBoardMapper.updateContent(dto);
		if(res>0) {
			mav.addObject("msg","자주묻는질문 게시글 수정이 정상적으로 되었습니다.");
			mav.addObject("url","list_faq.do");
		}else {
			mav.addObject("msg", "자주묻는질문 게시글 수정에 실패하였습니다. 다시 시도해주세요.");
			mav.addObject("url", "admin_update_faq_board.do");
		}
		mav.setViewName("message");
		return mav;
	}
	// end - 상인님 구역
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<div class="community-cate"><ul class="cate_sub"><li><a href="/board/free/list.html?board_no=2">자주 묻는 질문</a></li>
                               <li><a href="#none" onclick="ChannelIO('show')">챗봇문의</a></li>
                               <li><a href="">공지사항</a></li>
                               <li><a href="" class="selected">제품 후기</a></li>
                         </ul></div>

<div>
	    <table border="1" summary="">
        <c:if test="${empty listBoard}">
		<tr>
			<td>-</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${listBoard}">
        <tr>
                <th scope="col" class="thumb">상품정보</th>
                <th scope="col" class="category displaynone">카테고리</th>
                <th scope="col" class="subject">제목</th>
                <th scope="col" class="writer">작성자</th>
                <th scope="col" class="date ">작성일</th>
                <th scope="col" class="hit ">조회</th>
                <th scope="col" class="recom displaynone">추천</th>
                <th scope="col" class="grade ">평점</th>
            </tr></thead>
<tr style="background-color:#FFFFFF; color:#555555;">
<td class="number"> ${dto.num}</td>
                <td class="thumb"><a href="/product/detail.html?productNum=${dto.productNum}">
                <img src="//covernat.net/web/product/tiny/202305/6b251960dd5f33d4fdfeefbe15362bea.jpg" border="0" alt=""></a></td>
                <td class="category displaynone"></td>
                <td class="subject star-rating-5">
                    <span class="star-wrap ">
                      <span class="star-fill" style="display: inline;">   
                        <span class="star-icon">★</span>
                        <span class="star-icon">★</span>
                        <span class="star-icon">★</span>
                        <span class="star-icon">★</span>
                        <span class="star-icon">★</span>                                                 
                      </span>                                                 
                    </span>                                         
                    <span class="displaynone">
                        <a href="#none" onclick="BOARD.viewTarget('24059','4',this);">
                        <img src="//img.echosting.cafe24.com/design/skin/default/board/btn_unfold.gif" alt="내용 보기"></a>
                    </span>
                    <span class="prd_name"><a href="/board/product/read.html?no=24059&amp;board_no=4"><strong>데님 쇼츠 라이트 블루</strong></a></span>
                    <div class="prd_text">
<a href="/board/product/read.html?num=${dto.num}" style="color:#555555;"> ${dto.title}</a> <img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_new.gif" alt="NEW" class="ec-common-rwd-image"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_attach2.gif" alt="파일첨부" class="ec-common-rwd-image" onmouseover="BOARD.load_attached_image('afile_24059','1','4');" onmouseout="BOARD.load_attached_image('afile_24059','0','4');"><span id="afile_24059" style="display:none;"></span><span class="impact"></span>
</div>
                </td>
                <td class="board-rigth">
                    <div class="writer">${dto.member_num에서 이름 받아오기}</div>
                    <div class="date ">${dto.write_date}</div>
                    <div class="hit ">${dto.}</div>
                    <div class="recom displaynone">${dto.}</div>
                    <div class="grade "><img src="//img.echosting.cafe24.com/design/skin/default/board/ico_point5.gif" alt="5점"></div>                    
                </td>    
            </tr>
</tbody>
</c:forEach>
</table>
</div>
<div style="display: none;"><!--
        $count=5
    -->
    
    <c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			[<a href="list_reboard.do?pageNum=${startPage-pageBlock}">&lt;</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="list_reboard.do?pageNum=${i}">${i}</a>]
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			[<a href="list_reboard.do?pageNum=${startPage+pageBlock}">다음</a>]
		</c:if> 
	</c:if>		
    <input id="page" name="page" value="1" type="hidden">
<select id="search_date" name="search_date" class="option-select search_date">
<option value="week">일주일</option>
<option value="month">한달</option>
<option value="month3">세달</option>
<option value="all">전체</option>
</select> 
<select id="search_key" name="search_key" class="option-select search_key">
<option value="subject">제목</option>
<option value="content">내용</option>
<option value="writer_name">글쓴이</option>
<option value="member_id">아이디</option>
<option value="nick_name">별명</option>
<option value="product">상품정보</option>
</select> <input id="search" name="search" class="inputTypeText" placeholder="" value="" type="text"> <a href="#none" onclick="BOARD.form_submit('boardSearchForm');" class="btn s-btn"> 검색</a></p>
    </fieldset>
</div>
</form>

<!-- adinsight 공통스크립트 end -->   

<!-- CMC3 script -->
<div id="kmp_common_top_script" style="display:none;">
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
kakaoPixel('8349692795848705144').pageView();
</script>
</div>
<!-- CMC3 script -->
 
<!-- External Script End -->

<script type="text/javascript" src="//t1.daumcdn.net/adfit/static/kp.js" charset="utf-8"></script>
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&amp;domain=front&amp;v=2305251207" charset="utf-8"></script>

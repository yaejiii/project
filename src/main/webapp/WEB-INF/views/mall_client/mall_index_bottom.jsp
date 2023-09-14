<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
		
		</main>
		
		<footer class="footer">
			<div class="xans-element- xans-layout xans-layout-footer layout-row ">
				<div class="footer-inside">
					<div class="footer-top">
						<div id="footer-accordion">
							<div class="fbox open-info accordion-list">
								<div class="mobile-content-hide">
									<h2>INFORMATION</h2>
								</div>
								
								<div class="accordion-header mobile-content-show">
									<h2>INFORMATION</h2>
								</div>
							
								<ul class="accordion-content">
									<li><a href="index">Index</a></li>
									<li><a href="https://www.ezenac.co.kr/ezen/campus/campus_info.asp" target="_blank">ABOUT</a></li>
									<li><a href="">매장안내</a></li>
									<li><a href="https://www.ezenac.co.kr/ezen/intro/franchise.asp">대리점 개설문의</a></li> 
									<li><a href="https://www.ezenac.co.kr/ezen/etc/terms_conditions.asp">이용약관</a></li>
									<li><a href="https://www.ezenac.co.kr/ezen/etc/privacy_policy.asp">개인정보처리방침</a></li>
								</ul>
							</div>
							
							<div class="fbox information-info accordion-list">
								<div class="mobile-content-hide">
									<h2>CUSTOMER SERVICE</h2>
								</div>
								
								<div class="accordion-header mobile-content-show">
									<h2>CUSTOMER SERVICE</h2>
								</div>
								
								<ul class="accordion-content">
									<li><a href="/board/free/list.html?board_no=2">자주묻는질문</a></li>
									<li><a href="/board/free/list.html?board_no=2">배송</a></li>
									<li><a href="/board/free/list.html?board_no=2">교환/반품</a></li>
									<li><a href="/myshop/order/list.html">주문조회</a></li>
								</ul>
							</div>
							
							<div class="fbox privacy-info accordion-list">
								<div class="mobile-content-hide">
									<h2>SOCIAL</h2>
								</div>
								
								<div class="accordion-header mobile-content-show">
									<h2>SOCIAL</h2>
								</div>
								
								<ul class="accordion-content">
									<li><a href="https://www.instagram.com/ezen_academy_computer/" target="_blank">INSTAGRAM</a></li>
									<li><a href="https://www.facebook.com/ezenac.co.kr" target="_blank">FACEBOOK</a></li>
									<li><a href="https://blog.naver.com/ezenkn" target="_blank">BLOG</a></li>
									<li><a href="https://pf.kakao.com/_Wzxkwxb" target="_blank">KAKAOTALK</a></li>
									<li><a href="https://www.youtube.com/channel/UCSmmLUH4x14hzJNpLshJIGA" target="_blank">YOUTUBE</a></li>
								</ul>
							</div>
							
							<div class="fbox sns-link accordion-list">
								<div class="mobile-content-hide">
									<h2>CS</h2>
								</div>
								
								<div class="accordion-header mobile-content-show">
									<h2>CS</h2>
								</div>
								
								<ul class="accordion-content">
									<li>
										<a href="tel:0215448147">
											02-1544-8147
										</a>
									</li>
									
									<li>
										MON - FRI 09:30 ~ 18:00
										<br>
										LUNCH TIME 12:00 ~ 13:00
										<br>
										WEEKEND.HOLIDAY OFF
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="footer-bottom">
						<div class="company-info">
							<span>
								(주)이젠아카데미
							</span>
							<br>
							<br>
							<span>
								서울특별시 서초구 서초대로77길 54 (서초더블유타워 13,14층)
							</span>
							<br>
							<span>
								[54, SEOCHODAE-RO, SEOCHO-GU, SEOUL, REPUBLIC OF KOREA]
							</span>
							<br>
							<span>
								대표. 고태곤 [KOH, TAEGON]
							</span>
							<br>
							<span>
								사업자 등록번호. 153-88-00321
								
								<i class="mobile-content-hide"></i>
							</span>
							<br class="mobile-content-show">
							<span>
								통신판매업. 신고번호 제 2016-서울서초-1204호
							</span>
							<br>
							<span>
								개인정보 보호책임자 . 고필곤[REAVER75@EZENAC.CO.KR]
							</span>
							<br class="mobile-content-show">
							<span>
								TEL.02-1544-8147 .
							</span>
							
							<span>
								FAX. 070-8835-3316
							</span>
							<br>
							<span>
								COPYRIGHT(C) BY EZEN ALL RIGHTS RESERVED.
							</span>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</body>
	<script type="text/javascript">
		$(function() {
			setInterval(function() {
				var footer_height = $("footer").css("height")
				$("#layout-contents").css("padding-bottom", footer_height)
			})
			
			$.ajax({
				url : "./cartSession"
			})
		})
	</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="pi" class="pi">
		<ul>
			<li class=""><a href="#piCont1" class="piLink pil1">상품상세정보</a>
				<div class="piCont pic1" id="piCont1">
				
					<h3 class="product_read">상품사양</h3>

					<table class="table_goodsDetail"
						summary="상품상세정보 : 제품명, 식품의 유형, 제조사, 제조사의 소재지, 제조국, 제조일, 용량, 원재료명 및 함량, 영양성분, 유전자재조합식품, 영유아식 또는 체중조절식품, 수입식품, 포장상태 및 보관방법, 유통전문판매원, 소비자 상담번호">
						<caption>상품상세정보</caption>
						<colgroup>
							<col width="240">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<td colspan="2" class="tit"></td>
							</tr>

							<tr class="first">
								<th scope="row">본상품구성</th>
								<td>스팸클래식 200g</td>
							</tr>

							<tr>
								<th scope="row">원재료 및 함량</th>
								<td>돼지고기92.44%(수입산,국산),정제수,정제소금(국산),비타민C,백설탕,아질산나트륨(발색제),카라기난,혼합제제(산도조절제)</td>
							</tr>

						</tbody>
					</table>
					<div>&nbsp;</div>

				</div></li>
			<li class=""><a href="#piCont2" class="piLink pil2">상품평</a>
				<div class="piCont pic2" id="piCont2">
					<iframe name="reviewList" id="reviewList"
						src="/shopping/product/reviewNewListFrame.do?iFrameName=reviewList&amp;pcd=30100001"
						scrolling="no" frameborder="0px" width="100%" height=""
						title="상품평" style="height: 530px;"></iframe>
				</div></li>
			<li class=""><a href="#piCont3" class="piLink pil3">상품
					Q&amp;A</a>
				<div class="piCont pic3" id="piCont3">
					<div class="area_h3 clfix">
						<h3 class="h3_B">
							<img src="/images/product/h3_product_detail_3.gif"
								alt="상품Q&amp;A">
						</h3>

						<div class="area_btn_B">
							<a href="javascript:inquireFormPopup()"> <img
								src="/images/product/btn_B_question.gif" alt="문의하기"></a>
						</div>

					</div>
					<div class="infoBox box_A" style="padding: 18px 0 13px 20px">
						<strong class="tit">상품 관련 궁금하신 사항이 있으면 궁금하신 점을 문의해 주세요.</strong>
						<ul>
							<li class="active">고객님의 질문에 정성껏 빠르게 답변해 드리겠습니다.</li>
							<li>작성해주신 문의내역 및 답변은 <a href="/myPage/qna/qnaList.do"
								class="impo link_B">나의온마트 &gt; 활동정보 &gt; 1:1 문의내역</a> 메뉴에서 확인
								가능합니다
							</li>
						</ul>
					</div>
				</div></li>

			<li class=""><a href="#piCont4" class="piLink pil4">배송정보</a>
				<div class="piCont pic4" id="piCont4">
					<strong class="piTitle">배송안내</strong>
					<div class="pic pic41">
						<ul class="dot">
							<li class="active">기본 배송비 : <span class="fw700 c-bk">3,000원</span></li>
							<li>무료배송 기준 : ① 동일 유형별 상품 <span class="fw700 c-bk">30,000원
									이상</span> 구매 시 &nbsp; ② <span class="fw700 c-bk">‘무료배송’</span>으로 표시된
								상품 구매 시 ( <span class="llb llb1">무료배송</span> )
							</li>
						</ul>
						<strong class="dot">배송 유형별 상품 안내</strong>
						<table class="cols" summary="배송 유형별 상품 안내">
							<caption>배송 유형별 상품 안내</caption>
							<colgroup>
								<col width="28%">
								<col width="28%">
								<col width="16%">
								<col width="14%">
								<col width="14%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col">상온 배송 상품</th>
									<th scope="col">저온 배송 상품</th>
									<th scope="col">세제</th>
									<th rowspan="2" scope="col">반려동물<br>먹거리
									</th>
									<th rowspan="2" scope="col">선물세트<br>상품
									</th>
								</tr>
								<tr>
									<td>[상온], [상온&amp;실온] 표기된 상품<br>햇반, 스팸, 밀가루, 구강/생활용품
										등
									</td>
									<td>[냉장], [냉장&amp;냉동] 표기된 상품<br>김치, 국수, 어묵, 만두, 푸딩 등
									</td>
									<td>세탁, 생활,<br>주방 세제상품
									</td>
								</tr>
							</tbody>
						</table>
						<ul class="dot">
							<li class="active">주문한 상품은 결제완료 후 다음날부터 3일이내 출고 됩니다.
								(토,일,공휴일 제외)</li>
							<li>상품 출고일은 상품/지역/업체별 상황에 따라 변경될 수 있으며, 주문량 증가 시 배송이 지연될 수
								있습니다.</li>
							<li>냉장·냉동·신선제품은 신선도 유지를 위해 제주도 및 도서산간 지역의 배송이 제한될 수 있습니다.</li>
							<li>고객님의 주소 기입 오류, 임의 수취거부, 고객 부재로 인해 반송될 경우 배송비가 청구될 수
								있습니다.</li>
							<li>주문 수량이 많거나 BOX 제품을 동시에 구매하는 경우, 안전배송을 위해 다수의 박스로 배송될 수
								있으며 택배사 사정에 따라 박스별 배송 일정이 다를 수 있습니다.<br>(<a class="c-bl"
								href="/myPage/order/orderList.do">나의온마트 &gt; 주문내역/배송현황</a> &gt;
								[배송현황] 버튼 클릭 시, 출력되는 ‘운송장번호’로 택배 개수 확인 가능)
							</li>
						</ul>
					</div>
					<strong class="piTitle">안심 포장 안내</strong>
					<div class="pic pic42">
						<ol>
							<li class="active">① 비식품 상품(세제, 반려동물먹거리 등)이 배송중 포장이 손상되어 식품을
								오염시키지 않도록 별도 배송합니다.</li>
							<li>② 냉장, 냉동상품은 합배송 됩니다.</li>
						</ol>
						<div class="fr">
							<div>
								<p class="dot">제품의 신선도 유지를 위한 냉매제와 제품 포장</p>
								<p>
									냉장, 냉동제품의 신선도를 위해 계절에 따라<br> 냉매제의 수량이 달라집니다.
								</p>
								<ul>
									<li class="active">ⓐ 냉장상품 배송시 <strong class="fw700">아이스팩</strong></li>
									<li>ⓑ 냉동상품 배송시 <strong class="fw700">드라이 아이스</strong></li>
								</ul>
							</div>
							<img alt="냉장/냉동 배송별 냉매제 및 제품 포장 비교"
								src="/images/product/pack.jpg">
						</div>
						<div class="fl">
							<div>
								<p class="dot">밀껍질이 함유되어 자연까지 생각한 ‘친환경 에어캡’으로 안심 포장</p>
								<p>
									밀껍질이 25% 함유된 친환경 에어캡은 특유의 색상과 질감을 가집니다. <br>환경까지 생각하는
									CJ온마트가 되겠습니다.
								</p>
							</div>
							<img alt="일반 에어캡과 친환경 에코밀 에어캡 생김새 비교"
								src="/images/product/aircab.png">
						</div>
					</div>
					<strong class="piTitle">주문 변경/취소 안내</strong>
					<div class="pic pic44">
						<ul class="dot">
							<li class="active">당사 판매 정책 및 제조사 사정에 따라 사전예고 없이 상품 가격변동 혹은
								품절 될 수 있으며, 이로 인한 가격 보상은 불가합니다.</li>
							<li>주문후에는 <span class="c-or">주문상품 및 결제 수단 변경이 불가</span>합니다.
								주문 시 유의해 주시기 바랍니다.
							</li>
							<li>상품이 ‘배송준비’를 시작하면 <span class="c-or">배송지변경, 주문변경,
									주문취소가 불가</span>합니다.
							</li>
							<li>주문진행 단계별 변경 / 취소 가능여부를 확인해 주시기 바랍니다.</li>
						</ul>
						<div class="process">

							<div class="process1">
								<strong class="prcs11">입금대기</strong> <strong class="prcs12">신규주문</strong>
								<div>
									<a class="btn_tp"
										href="/myPage/order/orderReceiveUpdateList.do">배송지 변경하기</a> <a
										class="btn_tp" href="/myPage/order/orderCancelPossibleList.do">주문취소하기</a>
								</div>
							</div>
							<div class="process2">
								<strong class="prcs21">배송준비</strong> <strong class="prcs22">배송중</strong>
								<p>
									<span class="c-or">배송지변경, 주문변경, 주문취소 불가</span>
								</p>
							</div>
							<div class="process3">
								<strong class="prcs31">배송완료</strong>
								<div>
									<a class="btn_tp"
										href="/myPage/order/orderCancelPossibleList.do">교환하기</a> <a
										class="btn_tp" href="/myPage/order/orderCancelPossibleList.do">반품하기</a>
								</div>
							</div>
						</div>
					</div>
				</div></li>
			<li class=""><a href="#piCont5" class="piLink pil5">교환반품정보</a>
				<div class="piCont pic5" id="piCont5">
					<strong class="piTitle">교환 및 반품 안내</strong>
					<div class="pic pic51">
						<table class="rows" summary="교환 및 반품 안내">
							<caption>교환 및 반품 안내</caption>
							<colgroup>
								<col width="133">
								<col width="807">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">교환 / 반품 기간</th>
									<td>
										<p class="dot">
											상품 수령일로부터 <span class="c-or">7일 이내</span> (냉장/냉동, 신선식품은 상품
											수령일로부터 <span class="c-or">1~2일 이내</span>)
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">교환 / 반품<br>불가 안내
									</th>
									<td>
										<p class="dot">다음의 경우 교환 / 반품 기간 내라도 교환 / 반품 불가 (단, 제품 불량
											및 하자, 오배송 제외)</p>
										<ul class="d2">
											<li class="active">① 상품 수령일로부터 7일이 경과한 경우</li>
											<li>② <span class="c-bk">고객님의 단순변심으로 교환 / 환불을 신청한
													경우</span></li>
											<li>③ 포장을 개봉하거나 상품을 취식한 경우</li>
											<li>④ <span class="c-bk">패키지 상품, 묶음 상품, 특가 상품의 부분
													교환/반품을 원하는 경우</span></li>
											<li>⑤ 구성품 또는 사은품을 반납하지 않은 경우</li>
											<li>⑥ <span class="c-bk">냉장·냉동·신선제품은 제품하자 이외의 사유로
													인한 교환/반품/취소 절대 불가</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">교환 / 반품비</th>
									<td>
										<ul class="dot">
											<li class="active">고객님의 단순변심으로 인한 교환 / 반품 시, 택배 박스단위로
												배송비 부과
												<ul class="d2">
													<li class="active">– 교환 배송비 : <span class="c-or">박스
															당 6,000원</span>(왕복)
													</li>
													<li>– 반품 배송비 : <span class="c-or">박스 당 6,000원</span>(왕복)
														단, 남은 결제금액이 택배비 무료 기준 금액 이상인 경우 3,000원(편도) 부과
													</li>
												</ul>
											</li>
											<li>제품 불량 및 하자, 오배송 시 교환 / 반품비 <span class="c-or">무료</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">교환/반품 절차</th>
									<td>
										<ul class="dot">
											<li class="active">교환/반품 신청 (임의반품 시, 처리불가)
												<ul class="d2">
													<li class="active">– [나의 온마트 &gt; 쇼핑정보 &gt; 주문교환 / 반품
														/ 취소신청] 페이지에서 바로 접수 <a class="btn_tp s"
														href="/myPage/order/orderCancelPossibleList.do">바로가기</a>
													</li>
													<li>– 고객행복센터 080-850-2000로 신청 (평일 09:00~18:00, 토 / 일 /
														공휴일 휴무)</li>
													<li>– 반품신청 접수 후 필요 시 고객님께 전화를 드리며, 전화상담 후 반품이 최종 결정
														됩니다.</li>
												</ul>
											</li>
											<li>상품불량 및 누락 시, 교환/반품 유의사항
												<ul class="d2">
													<li class="active">– 상품불량 및 누락 시 반드시 사진 첨부하여 교환/반품 신청</li>
													<li>– 불량 및 하자 상품은 회수 후 처리 가능하므로 보관</li>
												</ul>
											</li>
											<li>교환/반품 접수 후, 2~5일이내 택배기사님이 방문하여 상품 교환 및 회수 진행</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">환불 안내</th>
									<td>
										<ul class="dot">
											<li class="active">반품 시, 반품된 상품이 물류센터로 입고되어 검수가 완료되면
												‘취소완료’ 처리 됩니다. 환불은 취소완료 후 영업일 기준 7일이내 처리됩니다.</li>
											<li>현금으로 결제하신 경우 '취소완료' 후 신청하신 환불계좌로 영업일 기준 2~3일 내
												입금됩니다.</li>
											<li>카드로 결제하신 경우 '취소완료' 후 영업일 기준 4~7일이내 승인취소 처리 됩니다.</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div></li>
		</ul>
	</div>
</body>
</html>
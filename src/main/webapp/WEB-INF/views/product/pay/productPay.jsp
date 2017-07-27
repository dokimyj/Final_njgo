<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../../resources/css/common/basic.css">
<style type="text/css">
	.main_section{
		margin-top: 80px;
		min-height: 1000px;
	}
	.container{
		width: 100%;
	}
	.ct_inner {
    	position: relative;
    	width: 100%;
    	margin: 26px auto 50px;
	}
	.ct_header {
	    position: relative;
	    height: 100px;
	    padding-top: 34px;
	}
	.step_tit_1 {
	    float: left;
	    margin-right: 6px;
	}
	.step_tit_1 i{
	    font-size: 35px;
	    font-family: Tahoma;
	    font-style: normal;
	    font-weight: bold;
	}
	h2{
		margin-top: 15px;
	}
	.ct_header .step_location {
	    float: right;
	    margin-top: 20px;
	}
	.ct_header .step_location span{
	    font-size: 22px;
	    color: gray;
	}
	.ct_header .step_location>span:first-child {
	    padding-left: 0;
	}
	.ct_header .step_location .step_location_2 {
	    color: #ff5000;
	    font-weight: bold;
	}
	.pay .product {
		width: 100%;
	    height: 160px;
	    padding: 20px 20px;
	    border-top: 3px #959da6 solid;
	    border-bottom: 1px #dfe2e6 solid;
	    margin-top: 20px;
	}
	.pay .product .thumb {
	    display: block;
	    float: left;
	    width: 124px;
	    height: 120px;
	    margin-right: 26px;
	}
	.pay .product .p_title {
    float: left;
    width: 820px;
    margin: 30px 0 0 0;
}
.pay .product .p_title span.txt1 {
    font-weight: 700;
    font-size: 18px;
    line-height: 17px;
    color: #16181a;
    letter-spacing: -.5px;
}
.col_orange {
    color: #ff5000;
}
.pay .product .p_title span.txt1 .col_orange {
    margin-left: 4px;
}
i, em{
    font-style: normal;
}
.pay .product .p_title span.txt2 {
    margin-top: 16px;
    font-size: 13px;
    line-height: 16px;
    color: #959da6;
}
.info_section {
    position: relative;
    margin-top: 60px;
}
.info_section h4 {
    font-weight: 700;
    font-size: 18px;
    -webkit-font-smoothing: antialiased;
}
.info_section .tbl_wrap {
    position: relative;
    margin-top: 14px;
}
table {
	width: 100%;
    border-top: 2px #959da6 solid;
    border-bottom: 1px #dfe2e6 solid;
}
table th {
    height: 60px;
    padding-left: 20px;
    font-size: 15px;
    letter-spacing: -1px;
    color: #5b5e63;
    text-align: left;
    -webkit-font-smoothing: antialiased;
}
table td{
	color: #16181a;
}
table td, table th {
    
	border-bottom: 1px #dfe2e6 solid;
    
    vertical-align: middle;
}
.selectric-hide-select select{
	width: 250px;
    height: 30px;
    border: 1px #dfe2e6 solid;
}
table thead {
    background-color: #fafafa;
}
table td .coupon_thead {
    height: 31px;
    font-size: 14px;
    line-height: 31px;
    color: #16181a;
    vertical-align: middle;
}
.valPoint{
	width: 150px;
    height: 30px;
    float: left;
    border: 1px #dfe2e6 solid;
    text-align: right;
    padding-right: 10px;
}
.curPoint{
	    width: 500px;
    height: 30px;
    float: left;
    vertical-align: middle;
    margin-left: 10px;
}
.curPoint span{
	font-weight: bold;
}
table.product_table {
    border-bottom: 1px #6c7580 solid;
}
table.product_table th {
    padding: 0;
    background-color: #fff;
    text-align: center;
}
table.product_table td {
    height: auto;
}
table.product_table td.thumb {
    padding: 29px 0;
    vertical-align: top;
}
table td .product_thumb {
    padding: 0 0 0 20px;
}
table td .product_thumb img {
    width: 120px;
    height: 120px;
    vertical-align: top;
}
table td .product_title {
    padding: 39px 30px 30px 0;
}
table td .product_title .info li {
    position: relative;
    padding-right: 60px;
    border-bottom: 1px #dfe2e6 solid;
    font-size: 11px;
    color: #5b6065;
}
li {
    list-style: none;
}
table td .product_title .info li .name {
	width: 400px;
    display: block;
    padding: 15px 0 14px 0;
    line-height: 16px;
    font-weight: 700;
    font-size: 14px;
    color: #16181a;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
table td .product_title .info li .num {
    position: absolute;
    top: 0;
    right: 0;
    line-height: 46px;
    font-size: 13px;
}
table td .product_title .amountBtn {
    margin-top: 10px;
}
table td .product_title .amountBtn button{
    width: 100px;
    height: 30px;
    border-width: 1px;
    border: 1px gray solid;
    background-color: white;
}
table .align_center {
    padding: 0;
    text-align: center;
}
.int_blue {
    font-weight: 700;
    font-size: 14px;
    font-family: tahoma,"돋움",Dotum,sans-serif;
    color: #06349d;
}
.int_blue .won {
    font-weight: 700;
    font-size: 12px;
}
.delivery_cont [class^=delivery_] {
    width: 60px;
    margin: 0 auto;
    font-size: 11px;
    line-height: 1.3;
    letter-spacing: -.8px;
}
.delivery_cont .delivery_free {
    margin-bottom: 10px;
    padding: 5px 0 3px;
    border: 1px solid #ff5000;
    color: #ff5000;
}
.delivery_cont .delivery {
    color: #16181a;
}
.int {
    font-size: 14px;
    font-family: tahoma,"돋움",Dotum,sans-serif;
    color: #16181a;
    letter-spacing: -.4px;
}
.int .won {
    font-weight: 700;
    font-size: 12px;
    font-family: tahoma,"돋움",Dotum,sans-serif;
}
.int_black_big {
    font-weight: 700;
    font-size: 16px;
    font-family: tahoma,"돋움",Dotum,sans-serif;
    color: #16181a;
}
table tfoot {
    background-color: #fafafa;
}
table td .money_sum ul {
    float: right;
    width: 317px;
    padding: 16px 20px 16px 0;
}
table td .money_sum ul li {
    overflow: hidden;
    padding: 13px 0;
    border-top: 1px #dfe2e6 solid;
    text-align: left;
}
table td .money_sum ul li:first-child {
    border-top: 0;
}
table td .money_sum ul li .title {
    float: left;
    font-weight: 700;
    font-size: 14px;
    font-family: "Nanum Gothic","돋움",dotum,"Apple SD Gothic Neo",sans-serif;
    -webkit-font-smoothing: antialiased;
}
.int_black_big {
    font-weight: 700;
    font-size: 16px;
    font-family: tahoma,"돋움",Dotum,sans-serif;
    color: #16181a;
}
table td .money_sum ul li .int_black_big {
    float: right;
    margin-top: -1px;
}
table .bd0 {
    border-bottom: 0 none;
}
table td .money_tot {
    height: 76px;
    padding: 0 20px;
    line-height: 76px;
}
table td .money_tot em {
    float: left;
    font-weight: 700;
    font-size: 20px;
    -webkit-font-smoothing: antialiased;
}
table td .money_tot .int_black_big {
    float: right;
}
table td .money_tot .int_black_big i {
    line-height: 80px;
}

.btn_buy_area {
    margin-top: 60px;
    text-align: center;
}
.btn_buy_area .btn_cancel {
    width: 276px;
    height: 64px;
    margin-right: 4px;
    border: 2px solid #ff5000;
    background-color: white;
    color: #ff5000;
    
    font-size: 25px;
    font-weight: bold;
}
.btn_buy_area .btn_buy {
    width: 276px;
    height: 64px;
    background-color: #ff5000;
    color: white;
    font-size: 25px;
    font-weight: bold;
}
</style>
</head>
<body>
	<c:import url="../../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="container">
			<div class="ct_inner">
				<div class="pay">
					<div class="ct_header">
						<h2 class="step_tit_1">
							<i>주문/결제</i>
						</h2>
						<div class="step_location">
							<span class="step_location_1">01 장바구니 〉</span>
							<span class="step_location_2 on">02 주문/결제  〉</span>
							<span class="step_location_3">03 결제 완료</span>
						</div>
					</div>

					<div id="_productSummery" class="product" style="">
						<span class="thumb">
							<img src="../../resources/upload/${proList[0].f_mainimg}" width="124px" height="120px">
						</span>
						<p class="p_title">
							<span class="txt1">
								<em class="col_orange">
									<i>${proList[0].name}</i> 상품 외 <i>${fn:length(proList)-1}</i>개
								</em>의 상품을 주문합니다.
							</span><br><br> 
							<span class="txt2">선택하신 상품의 가격과 옵션정보는 하단 주문상품 정보에서 확인하실 수 있습니다.</span>
						</p>
					</div>
					
					<div class="checkout_content">
						<!-- 배송지 정보 -->
						<div class="checkout_delivery">
							<div class="info_section">
								<h4>배송지 정보</h4>
								<div class="tbl_wrap">
									<table>
										<colgroup>
											<col style="width: 170px;">
											<col>
										</colgroup>
										<tbody id="_shipping_content">
											<tr>
												<th scope="row">배송지 선택</th>
												<td>
												</td>
											</tr>
											<tr>
												<th scope="row" class="bd0">이름</th>
												<td><em class="oname">최소영</em></td>
											</tr>
											<tr>
												<th scope="row" class="bd0">연락처</th>
												<td><em class="text ophone">010-9871-9917</em>
												</td>
											</tr>
											<tr>
												<th scope="row" class="bd0">주소</th>
												<td><em class="text oaddress">(440-831) 경기 수원시 장안구 정자2동
														정자KTe-편한세상아파트 103동 701호</em></td>
											</tr>
											<tr>
												<th scope="row" class="bd0">배송 메모</th>
												<td class="memo" id="_shipping_memo">
													<div class="select_div memo">
														<div class="selectric-wrapper">
															<div class="selectric-hide-select">
																<select id="_shipping_select_memo" tabindex="0" class="oaddmsg">
																	<option value="">배송메모를 선택해 주세요.</option>
																	<option value="배송 전 연락바랍니다.">배송 전 연락바랍니다.</option>
																	<option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
																	<option value="집앞에 놔주세요.">집앞에 놔주세요.</option>
																	<option value="택배함에 놔주세요.">택배함에 놔주세요.</option>
																	<option value="부재시 핸드폰으로 연락주세요.">부재시 핸드폰으로 연락주세요.</option>
																	<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
																	<option value="부재시 집 앞에 놔주세요.">부재시 집 앞에 놔주세요.</option>
																	<option value="AI">직접 입력</option>
																</select>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="info_section" id="_benefit">
							<h4>적립금 혜택</h4>
							<div class="tbl_wrap">
								<table>
									<colgroup>
										<col style="width: 170px;">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="bg_gray">적용 포인트</th>
											<td class="coupon_td">
												<div class="coupon_thead">
													<input type="text" class="valPoint">
													<div class="curPoint">P (총 사용 가능 포인트: <span class="col_orange totalPoint">10,240</span>P)</div>
												</div>
											</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">적립예정 금액</th>
											<td><span class="int"><em class="apPoint">0</em><i class="won">원</i></span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="info_section" id="_product" style="">
							<h4>주문상품 정보</h4>
							<div class="tbl_wrap">
								<table class="product_table">
									<colgroup>
										<col >
										<col >
										<col style="width: 160px;">
										<col style="width: 160px;">
										<col style="width: 160px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">상품정보</th>
											<th scope="col">상품금액</th>
											<th scope="col">배송비</th>
											<th scope="col">주문금액</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${proList}" var="dto" varStatus="i">
											<tr class="_deal">
												<td class="thumb">
													<div class="product_thumb">
														<img src="../../resources/upload/${dto.f_mainimg}">
													</div>
												</td>
												<td class="v_top">
													<div class="product_title">
														<div class="info">
															<ul>
																<li><em class="name"> ${dto.name} </em>
																	<em class="num"><i class="oNum" data-pronum="${dto.pronum}">${pAmountList[i.index]}</i>개</em></li>
															</ul>
														</div>
														<div class="amountBtn">
															<button type="button">수량 변경</button>
														</div>
													</div>
												</td>
												<td class="mgl align_center"><span class="int_blue">
													<em class="priceOne"><fmt:formatNumber value="${dto.price*pAmountList[i.index]}" groupingUsed="true" /></em><i class="won">원</i></span>
												</td>
												
												<td rowspan="1" class="mgl align_center">
													<div class="delivery_cont">
														<p class="delivery_free">
															30,000원<br>이상<br>무료배송
														</p>
														<p class="delivery">
															<span class="int"><em>3,000</em><i class="won">원</i></span>
														</p>
													</div>
												</td>
												<td rowspan="1" class="mgl align_center sum"><span
													class="int_black_big"><em class="sumPrice">9,160</em><i class="won">원</i></span>
												</td>
											</tr>
										
										</c:forEach>										
									</tbody>
									<tfoot>
										<tr>
											<td colspan="6">
												<div class="money_sum">
													<ul>
														<li><em class="title">상품금액</em> <span
															class="int_black_big"><em class="oriPrice"></em><i
																class="won">원</i></span></li>
														<li><em class="title">할인금액</em> <span
															class="int_black_big"> <em class="pointVal">0</em><i class="won">원</i>
														</span></li>
														<li><em class="title">배송비</em> <span
															class="int_black_big"><em class="delPrice"></em><i class="won">원</i></span>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="6" class="bd0">
												<div class="money_tot">
													<em>총 주문금액</em> <span class="int_black_big"><em class="totalPrice"></em><i
														class="won">원</i></span>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>

					<%-- <div class="layer_pop pop_amount" style="display: block; position: absolute; top: 1049px; left: 50%; margin-left: -303px; z-index: 1000;">
						<button type="button" class="close _checkout_layer_btn_close">닫기</button>
						<dl>
							<dt>상품 수량 변경</dt>
							<dd>
								<div class="product">
									<span class="thumb">
										<img src="" >
									</span>
									<p class="p_title">
										<span class="txt1">[종가집] 김치/반찬/탕 골라담기!</span> 
									</p>
								</div>
								<p class="col_gray f11">
									<em class="col_orange"> (1인당 최대 10개, 30,000원 이상 무료배송)</em>
								</p>
								<div class="amount _product_options"
									data-main-deal-srl="292782777">
									<table>
										<colgroup>
											<col style="width: 283px;">
											<col style="width: 100px;">
											<col style="width: 90px;">
											<col>
										</colgroup>
										<tbody>
											<tr class="_product_option" >
												<td class="title"><em> a02))소풍세트))맛김치 500g*2ea </em></td>
												<td><span class="count">
														<button type="button"
															class="btn_minus _btn_decrease_option_count">빼기</button>
														<input class="_input_option_count" type="text" value="2">
														<button type="button"
															class="btn_plus _btn_increase_option_count">추가</button>
												</span></td>
												<td class="money"><em class="_option_total_amount">12,320</em>원</td>
												<td class="center">
													<button type="button" class="btn_del _btn_delete_option">삭제</button>
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="4">
													<div class="money_tot">
														<em>총 주문금액</em> <span class="int_black_big"><em
															class="_deal_total_amount">12,320</em><i class="won">원</i></span>
													</div>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
								<div class="layer_btn_area">
									<button type="button"
										class="btn_cancel _checkout_layer_btn_close">취소</button>
									<button type="button" class="btn_ok _btn_change_options">변경하기</button>
								</div>
							</dd>
						</dl>
					</div> --%>
					
					<form action="payProcess" name="frm" id="frm" method="post">
						<input type="hidden" name="memberid" id="memberid">
						<input type="hidden" name="o_name" id="o_name">
						<input type="hidden" name="o_phone" id="o_phone">
						<input type="hidden" name="o_address" id="o_address">
						<input type="hidden" name="o_admsg" id="o_admsg">
						<input type="hidden" name="uPoint" id="uPoint">
						<input type="hidden" name="orderlist" id="orderlist">
						<input type="hidden" name="totprice" id="totprice">
					</form>
					
					
					<div class="btn_buy_area">
						<button id="_cancelCheckout" class="btn_cancel">취소</button> 
						<button id="_confirmCheckout" class="btn_buy">구매하기</button>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		var proList = $(".priceOne");
		var price = 0;
		$(".priceOne").each(function() {
			sumPrice($(this));
		});
		totalPrice(price);
		
		//적용 포인트 입력
		$(".valPoint").keydown(function(e) {
			if( e.keyCode == 13 || e.keyCode == 9){
				$(this).blur();
			}
		});
		
		$(".valPoint").blur(function() {
			var totalPoint = 10920;
			var inputPoint = $(this).val();
			if(inputPoint != ''){
				if(Math.floor(inputPoint) == inputPoint && $.isNumeric(inputPoint)){
					//입력한 포인트 값이 숫자이고 정수인지 체크
					if(inputPoint < 0){
						alert("적립금은 -가 될 수 없습니다.\n적립금 사용금액을 다시 입력해 주세요.");
						$(this).val("");
					}else if(inputPoint > totalPoint){
						alert("사용가능 적립금보다 많습니다.\n적립금 사용금액을 다시 입력해 주세요.");
						$(this).val("");
					}else{
						//숫자 잘 입력
						apPoint(inputPoint);
						totalPrice(price);
					}
				}else{
					alert("입력하신 적립금이 숫자가 아닙니다.");
					$(this).val("");
				}
			}
		});
		
		
		//각각의 가격 합계
		function sumPrice(proOne) {
			var priceOne = proOne.html().replace(",", "")*1;
			if(priceOne < 30000){
				priceOne += 3000;
			}
			price += priceOne;
			proOne.parents(".mgl").siblings(".sum").find(".sumPrice").html(Number(priceOne).toLocaleString('en'));
		}
		
		//총 가격 합계
		function totalPrice(price){
			var del = 0;
			var point = $(".pointVal").html().replace(",", "")*1;
			if(price < 30000){
				del = 3000;
			}
			$(".oriPrice").html(Number(price).toLocaleString('en'));
			$(".delPrice").html(Number(del).toLocaleString('en'))
			$(".totalPrice").html(Number(price - point + del).toLocaleString('en'));
		}
		
		//포인트 적용
		function apPoint(point) {
			$(".apPoint").html(Number(point).toLocaleString('en'));
			$(".pointVal").html(Number(point).toLocaleString('en'));
		}
		
		$(".btn_buy").click(function() {
			var oNum = $(".oNum");
			var i = 0;
			var json = '[';
			oNum.each(function(index) {
				json += JSON.stringify({
					pronum: $(this).attr("data-pronum"),
					amount: $(this).html()
				})				
				if(index != oNum.length-1){
					json += ',';
				}				
			});
			json += ']';
			alert(json);
			alert($(".oaddmsg").val());
			
			frm.memberid.value = 'soyoung';
			frm.o_name.value = $(".oname").html();
			frm.o_phone.value = $(".ophone").html().replace(/-/gi,"");
			frm.o_address.value = $(".oaddress").html();
			frm.o_admsg.value = $(".oaddmsg").val();
			frm.uPoint.value = $(".pointVal").html().replace(/,/gi,"");
			frm.orderlist.value = json;
			frm.totprice.value = $(".totalPrice").html().replace(/,/gi,"")*1;
			
			//frm.submit();
			
			/* $.ajax({
				type: "POST",
				url: "payProcess",
				success: function(data) {
					alert(data);
					frm.submit();
				}				
			}); */
			
			var str = frm.serializeObject();
			alert(str);
		});
	</script>
</body>
</html>
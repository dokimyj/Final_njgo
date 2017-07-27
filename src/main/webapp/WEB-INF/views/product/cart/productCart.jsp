<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	.ct_header .step_num {
	    float: left;
	    font-size: 35px;
	    font-family: Tahoma;
	    color: #ff5000;
	    letter-spacing: -.02em;
	}
	.ct_header .step_num .num {
	    display: inline-block;
	    position: relative;
	    top: 3px;
	    padding-top: 3px;
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
	.ct_header .step_location .step_location_1 {
	    color: #ff5000;
	    font-weight: bold;
	}
	
	.cart #ct_cont {
    margin-bottom: 20px;
}
.prod_header {
    height: 46px;
    border-top: 2px solid #959da6;
    border-bottom: 1px solid #d6dadd;
}
.cart .prod_header {
    position: relative;
    padding-left: 53px;
}
label {
    vertical-align: -1px;
}
.chk_type {
    display: block;
    position: relative;
    width: 22px;
    height: 22px;
    border: 1px solid #ff5000;
    cursor: pointer;
}
.cart .chk_type {
    position: absolute;
    top: 0;
    left: 20px;
}
.cart .prod_header .chk_type {
    top: 10px;
}
input[type=checkbox], input[type=radio] {
    width: 13px;
    height: 13px;
    vertical-align: text-top;
}
label input[type=checkbox], label input[type=radio] {
    margin-top: -1px;
}
.chk_type input[type=checkbox] {
    position: absolute;
    left: -9999px;
}
.blind {
    visibility: hidden;
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    font: 0/0 a;
}
.prod_header .title {
	position: absolute;
    overflow: hidden;
    width: 95%;
}
.prod_header .title li {
    float: left;
    font-weight: 700;
    font-size: 14px;
    font-family: "Nanum Gothic","돋움",dotum,"Apple SD Gothic Neo",sans-serif;
    line-height: 45px;
    color: #000;
    letter-spacing: -.4px;
    text-align: center;
    -webkit-font-smoothing: antialiased;
}
li{
display: block;
}
.prod_header .title li.info {
    width: 60%;
}
.prod_header .title li.order {
    width: 20%;
}
.prod_header .title li.delivery {
    width: 20%;
}
.ct_prod_wp {
    border-bottom: 1px solid #d6dadd;
}
.cart .ct_prod_wp {
    position: relative;
    width: 990px;
    background: #d6dadd;
}

.bt_cnt {
    overflow: hidden;
}
.prod .item .bt_cnt {
    display: inline-block;
    width: 80px;
    vertical-align: middle;
    float: right;
    margin-top: 5px;
    
}
.bt_cnt .cnt_minus {
    width: 24px;
    height: 24px;
    background: url(../../resources/images/csy/sp-cart.png) no-repeat;
    background-position: -444px -102px;
}
.bt_cnt .cnt_plus {
    width: 24px;
    height: 24px;
    background: url(../../resources/images/csy/sp-cart.png) no-repeat;
    background-position: 0 -294px;
}
.bt_cnt [class^=cnt_] {
    float: left;
    width: 26px;
    height: 26px;
    border: 1px solid #c2c7cc;
    vertical-align: top;
}
.bt_cnt .ip_quantity {
    display: inline-block;
    float: left;
    width: 28px;
    height: 26px;
    border: 1px solid #c2c7cc;
    border-right: 0 none;
    border-left: 0 none;
    line-height: 26px;
    color: #000;
    text-align: center;
    vertical-align: top;
}
header > input, select, table, textarea {
    font-size: 12px;
    font-family: "돋움",dotum,"Apple SD Gothic Neo",sans-serif;
}

.cart_sts_wrap{
	width: 100%;
	padding: 10px 20px;
}
.cart_sts{
	border-top: 2px solid #959da6;
    border-bottom: 1px solid #d6dadd;
    width: 100%;
}
.cart_sts td{
	vertical-align: middle;
	text-align: center;
}
.sts_top, .sts_one{
	border-bottom: 1px solid #d6dadd;
}
.sts_one.none{
	height: 200px;
    font-size: 15px;
    font-style: italic;
}
.sts_top td{
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -1px;
}
.pro_info img{
	width: 100px;
	height: 100px;
	float: left;
	margin-top: 15px;
}
.pro_name{
    text-overflow: ellipsis;
	float: left;
	font-size: 16px;
	letter-spacing: -1.5px;
	width: 400px;
    text-align: left;
    text-indent: 20px;
    line-height: 130px;
    overflow: hidden;
    white-space: nowrap;
}
.pro_cnt{
	float: right;
	margin-top: 54px;
	margin-right: 20px;
}
.one_info, .one_price{
	border-right: 1px solid #d6dadd;
}
.pro_price span{
	font-size: 18px;
}
.pro_delivery .del_price span{
	font-size: 18px;
}
.pro_delivery .del_free{
	font-size: 18px;
	font-weight: bold;
	color: #ff5000;
}
.check_btn{
	width: 25px;
	height: 25px;	
	border: 1px solid #d6dadd;
    margin-left: 5px;
    cursor: pointer;
}
.check_btn.on{
	background: url(../../resources/images/csy/tick.png) no-repeat;
}

.chk_del{
	width: 100px;
    height: 30px;
    text-align: center;
    vertical-align: middle;
    line-height: 30px;
	border: 1px solid #d6dadd;
	font-size: 12px;
	cursor: pointer;
	float: left;
	margin: 10px 0;
}
.guide_txt{
	margin-top: 17px;
	float: right;
}
.ct_total {
	margin-top: 20px;
    float: left;
    clear: both;
    width: 100%;
    padding-top: 30px;
    border-top: 1px solid #d6dadd;
    border-bottom: 1px solid #6c7580;
    background-color: #fffdfd;
}
.ct_total .ct_total_tit {
    float: left;
    padding-left: 20px;
    font-weight: 700;
    font-size: 30px;
    font-family: "Nanum Gothic","돋움",dotum,"Apple SD Gothic Neo",sans-serif;
    color: #16181a;
    -webkit-font-smoothing: antialiased;
    letter-spacing: -2px;
}
.ct_total .matter {
    float: right;
    width: 302px;
    padding-right: 20px;
}
.ct_total .matter>dd, .ct_total .matter>dt {
    float: left;
    height: 34px;
    padding: 14px 0 0;
    border-top: 1px solid #dfe2e6;
    color: #16181a;
}
.ct_total .matter>dt {
    position: relative;
    width: 109px;
    font-weight: 700;
    font-size: 15px;
    font-family: "Nanum Gothic","돋움",dotum,"Apple SD Gothic Neo",sans-serif;
    -webkit-font-smoothing: antialiased;
    letter-spacing: -1px;
}
.ct_total .matter>dd {
    width: 173px;
    font-weight: 700;
    font-size: 14px;
    text-align: right;
}
.ct_total .matter>dd>span {
    display: inline-block;
    margin-top: -3px;
}
.ct_total .benefit em+span, .ct_total .matter em+span, .ct_total .total em+span {
    position: relative;
    top: -1px;
}
.ct_total .total {
    clear: both;
    height: 99px;
    padding: 0 20px;
    border-top: 1px solid #d6dadd;
    font-weight: 800;
    font-size: 20px;
    font-family: "Nanum Gothic","돋움",dotum,"Apple SD Gothic Neo",sans-serif;
    line-height: 99px;
    color: #ff5000;
    -webkit-font-smoothing: antialiased;
}
.ct_total .total>dt {
    float: left;
    line-height: 120px;
}
.ct_total .total>dd {
    float: right;
    line-height: 120px;
}
.ct_total .total>dd>em {
    font-weight: 700;
    font-size: 36px;
    font-family: tahoma;
    text-align: right;
}
.ct_total .total>dd>em+span {
    font-weight: 700;
    font-size: 18px;
    font-family: Dotum;
}
.ct_total .matter>dd:first-child, .ct_total .matter>dd:first-child+dd, .ct_total .matter>dt:first-child, .ct_total .matter>dt:first-child+dd {
    padding-top: 0;
    border-top: none;
}
dl{
	margin-bottom: 30px;
}

.bt_area {
    float: left;
    position: relative;
    width: 100%;
    font-size: 0;
    text-align: center;
    padding: 107px 25% 100px;
}
.bt_area [class^=bt_] {
    overflow: hidden;
    font-size: 0;
    line-height: 999px;
    color: transparent;
    vertical-align: top;
    vertical-align: top;
    float: left;
}
.bt_area .bt_continue {
    width: 276px;
    height: 64px;
    background: url(../../resources/images/csy/sp-cart.png) no-repeat;
    background-position: 0 0;
}
.bt_area .bt_submit {
    width: 276px;
    height: 64px;
    margin-left: 8px;
    background: url(../../resources/images/csy/sp-cart.png) no-repeat;
    background-position: 0 -68px;
}
</style>
</head>
<body>
	<c:import url="../../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="container">
			<div class="ct_inner">
				<div class="cart">
					
					<!-- Cart Header -->
					<div class="ct_header">
						<h2 class="step_tit_1">
							<i>장바구니</i>
						</h2>
						<p class="step_num">
							(<span class="_cart_cnt num">1</span>)
						</p>
						<div class="step_location">
							<span class="step_location_1 on">01 장바구니 〉</span>
							<span class="step_location_2">02 주문/결제  〉</span>
							<span class="step_location_3">03 결제 완료</span>
						</div>
					</div>
					<!-- Cart Header -->

					<div class="cart_sts_wrap">
						
					
					</div>
					
				

					<div class="ct_total">
						<h3 class="ct_total_tit">총 주문금액</h3>
						<dl class="matter">
							<dt>총 상품금액</dt>
							<dd>
								<em class="_buy_amount"> </em><span> 원</span>
							</dd>
							<dt>배송비</dt>
							<dd>
								<em class="_delivery_amount"> </em><span> 원</span>
							</dd>
						</dl>

						<dl class="total">
							<dt>결제 예상금액</dt>
							<dd>
								<em class="_total_amount"> </em><span> 원</span>
							</dd>
						</dl>
					</div>
					
					
					<div class="bt_area">
						<a href="productList" class="bt_continue">쇼핑 계속하기</a>
						<button type="button" class="bt_submit">구매하기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		var memberid = 'soyoung';
		$.ajax({
			url: "cartNMList",
			type: "POST",
			data:{
				memberid: memberid
			},
			success: function(data) {
				$(".cart_sts_wrap").html(data);
			}
		});
	
	
		
		
		
		
		/********** 새로고침시 스크롤 이동 **********/
		window.onload=function(){
			setTimeout(function() {
				scrollTo(0,0);
			}, 1);
			
		}
	</script>
</body>
</html>
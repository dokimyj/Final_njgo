<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">

<style type="text/css">
	header{
		position: static;
	}
	.main_section{
		margin-top: 30px;
		height: auto;
	}
	.container{
		width: 100%;
		padding: 0 0;
	}
	.pro_title_wrap {
	    position: relative;
	    width: 100%;
		height: 40px;
	    margin: 0 0 10px 0;
	    border-bottom: 3px solid #ddd;
	}
	.pro_title{
		float: left;
	    width: 835px;
	    padding: 3px 0 10px;
	    color: #333;
	    font-family: 'Malgun Gothic', sans-serif;
	    font-size: 24px;
	    line-height: 24px;
	    font-weight: bold;
	    letter-spacing: -1px;
	}
	.pro_detail_left {
	    position: relative;
	    float: left;
	    width: 50%;
	    padding-bottom: 20px;
	}
	.pro_detail_left img{
		width: 450px;
	    height: 450px;
	    margin-left: 10%;
	}
	.pro_detail_right{
	    float: right;
	    width: 50%;
	}
	.pro_price_info{
		padding: 5px 0;
		margin-top: 50px;
	    border-bottom: 1px solid #e5e5e5;
	    color: #555;
	    line-height: normal;
	}
	.detail_price{
		font-weight: bold;
    	color: #ec5d46;
    	position: relative;
    	padding: 4px 0 4px 135px;
	}
	.pro_price_info strong {
		left: 0;
		top: 14px;
	    position: absolute;
	    width: 135px;
	    display: block;
	    padding-left: 11px;
	    font-weight: normal;
	    color: #888;
	}
	.pro_price_info span {
	    font-weight: bold;
	    color: #ec5d46;
	    font-size: 25px;
	}
	.pro_detail_info{
		padding: 5px 0;
	    border-bottom: 1px solid #e5e5e5;
	    color: #555;
	    line-height: normal;
	}
	.pro_detail_info strong{
		position: absolute;
	    left: 0;
	    width: 135px;
	    display: block;
	    padding-left: 11px;
	    font-weight: normal;
	    color: #888;
	}
	.pro_detail_info div{
		position: relative;
    	padding: 4px 0 4px 135px;
	}
	.detail_3{
		color: #ec5d46;
    	font-weight: bold;
	}
	.detail_3 span{
		margin: 5px 0 0;
	    font-size: 12px;
	    font-weight: normal;
	    color: #999;
	    line-height: 120%;
	}
	.detail_4 span{
		margin: 5px 0 0;
	    font-size: 12px;
	    font-weight: normal;
	    color: #999;
	    line-height: 120%;
	}
	.pro_detail_btn{
		margin-top: 20px;
		padding: 15px 0;
    	text-align: center;
	}
	.clear{
		clear: both;
	}
	li{
		display: block;
	}
	.recomm {
	    margin: 32px 0 52px;
	}
	.recomm strong{
		font-size: 17px;
	    color: #333;
	    letter-spacing: -0.05em;
	}
	.picoSlider {
	    position: relative;
	    margin-top: 12px;
	    padding: 24px 3px 0 37px;
	    border-top: 1px solid #ddd;
	}
	.picoSlider .count {
	    position: absolute;
	    top: -30px;
	    right: 0;
	    font-size: 14px;
	    color: #3f3f3f;
	}
	.picoSlider>button {
	    position: absolute;
	    top: 81px;
	    width: 25px;
	    height: 54px;
	    background-color: #ddd;
	    border: none;
	}
	.picoSlider>button.prev {
	    left: 0;
	}
	.picoSlider .picoInner {
	    overflow: hidden;
	    position: relative;
	    width: 1080px;
	    height: 230px;
	}
	.picoSlider .picoInner>ul {
	    position: absolute;
	    overflow: hidden;
	    width: 2256px;
	}
	.picoSlider .picoInner>ul>li {
	    float: left;
	    width: 150px;
	    height: 230px;
	    margin: 0 33px;
	}
	.picoSlider .picoInner .img {
	    border: 1px solid #eaeaea;
	    width: 150px;
	    height: 150px;
	}
	.picoSlider .picoInner .img img{
		width: 148px;
	    height: 148px;
	}
	.picoSlider .iName {
	    display: block;
	    overflow: hidden;
	    margin: 18px 0 7px;
	    max-height: 34px;
	    line-height: 17px;
	    font-size: 12px;
	    letter-spacing: -0.05em;
	    color: #555;
	}
	.picoSlider .iHowmuch {
	    overflow: hidden;
	}
	.picoSlider .iHowmuch>span {
	    font-size: 13px;
	}
	.picoSlider .iCost {
	    float: left;
	    color: #333;
	}
	.picoSlider .iCost>span {
	    font-weight: bold;
	}
	.picoSlider .iCost>span, .picoSlider .iPrice>span {
	    font-family: Tahoma;
	}
	.picoSlider>button.next {
	    right: 0;
	}
	.detail_bann{
		width: 100%;
		height: 100px;
		margin-bottom: 20px;
	}
	.detail_bann_img{
		width: 100%;
		height: 100%;
	}
	
	.view_menu{
		margin: 0 auto;
		width: 60%;
		height: 77px;
		min-width: 1150px;
		border-bottom: 1px solid #a0a0a0;
		padding: 13px 0 14px;
		background-color: rgba(255,255,255,0.97);
		z-index: 10;
		
	}
	.vmenu{
		float: left;	
	    text-align: center;
	    text-decoration: none;
	    font-size: 16px;
	    letter-spacing: -0.05em;
	    color: #999;
	    height: 30px;
	    line-height: 30px;
	    width: 18%;
	    margin-right: 2.5%;
	    margin-top: 20px;
	    cursor: pointer;
	    background-color: none;
    }
    .active {
	    padding-bottom: 40px;
	    /* color: #029aff; */
	    color: #029aff;
	    border-bottom: 4px solid #029aff;
	}
    
    .m_refund{
    	margin-right: 0px;
    }
    
    .product_read {
	    font-family: 'Malgun Gothic', 'Dotum', sans-serif;
	    font-size: 20px;
	    font-weight: bold;
	    width: 680px;
	    margin: 30px auto 10px;
	    letter-spacing: normal;
	    color: rgb(118, 118, 118);
	    
	}
	.table_goodsDetail {
	    width: 680px;
	    margin: 0 auto;
	}
	.table_goodsDetail td.tit {
	    border: 0;
	    padding: 0;
	    background: none;
	}
	.table_goodsDetail th {
	    color: #666;
	    font-weight: normal;
	    background-color: #f6f6f6;
	    border-top: 1px solid #dfdfdf;
	    border-bottom: 1px solid #dfdfdf;
	    border-right: 1px solid #dfdfdf;
	    padding: 10px 12px 8px 20px;
	}
	.table_goodsDetail td {
	    color: #666;
	    border-bottom: 1px solid #dfdfdf;
	    padding: 10px 12px 8px 20px;
	    letter-spacing: -.1em;
	}
	.table_goodsDetail tr.first th, .table_goodsDetail tr.first td {
	    border-top: 2px solid #dfdfdf;
	}
	
	.detail_img img{
		margin: 0 auto;
		display: table-cell;
	}
	.v_review{
		width: 100%;
		height: 500px;
	}
	.v_title{
		width: 100%;
		font-family: 'Noto Sans KR' !important;
    	font-size: 20px;
    	font-weight: bold;
    	letter-spacing: -0.03em;
    	color: #333;
    	border-bottom: 1px solid #999;
    	margin-top: 30px;
    	
	}
	.v_num{
		font-family: Tahoma, sans-serif;
	    color: #ec5d46;
	    font-size: 14px;
	    line-height: normal;
	}
	.v_qna{
		width: 100%;
		height: 500px;
	}
	.v_delivery{
		width: 100%;
		margin-bottom: 100px;
	}
	.v_refund{
		width: 100%;
		margin-bottom: 100px;
	}
	
	.goods-review--board {
	    width: 100%;
	    height: auto;
	   	margin-top: -5px;
	}
	.goods-review--board td {
	    position: relative;
	    height: 50px;
	    border-bottom: 1px solid #e1e1e1;
	    font-family: 'Dotum';
	    font-size: 12px;
	    color: #676767;
	    text-align: center;
	    vertical-align: middle;
	}
	.goods-review--board .review-star {
	    display: inline-block;
	    width: 100px;
	    height: 14px;
	    margin-left: 19px;
	    background-image: url(../resources/images/csy/star-package99x99.gif);
	    background-repeat: no-repeat;
	    background-position: left top;
	    text-indent: -9999px;
	}
	.goods-review--board .review-star4{
		background-position: 0 -17px;
	}
	.goods-review--board .review-star3{
		background-position: 0 -33px;
	}
	.goods-review--board .review-star2{
		background-position: 0 -52px;
	}
	.goods-review--board .review-star1{
		background-position: 0 -69px;
	}
	.goods-review--board .review-star0{
		background-position: 0 -85px;
	}
	
	.goods-review--board td.__left {
	    padding-left: 50px;
	    text-align: left;
	}
	.goods-review--board tr.detail td {
	    height: auto;
	    border: 0;
	}
	
	
	/**/
	.pic {
	    overflow: hidden;
	    padding: 22px 20px 20px;
	    font-family: 'Noto Sans KR' !important;
	    font-size: 14px;
	    line-height: 1.71em;
	    letter-spacing: -0.05em;
	    color: #666;
/* 	     padding: 20px 0 0; */
	}
	.pic ul.dot>li:before {
	    display: inline-block;
	    content: "·";
	}
	.pic table {
	    width: 100%;
	}
	.pic .rows tr:first-child th, .pic .rows tr:first-child td {
	    border-top: 0;
	}
	.pic .rows th {
	    padding: 20px;
	    font-weight: bold;
	}
	.pic .dot, .pic ul.dot>li {
	    display: block;
	    padding-left: 6px;
	    text-indent: -4px;
	}
	.pic .c-or {
	    color: #fc3f19;
	}
	.pic .rows th, .pic .rows td {
	    border-top: 1px solid #e0e0e0;
	}
	.pic th {
	    font-weight: 400;
	    line-height: 1.29em;
	    color: #333;
	    background-color: #f4f4f4;
	}
	.pic .rows td {
	    padding: 10px 16px;
	}
	.pic .d2 li {
	    padding-left: 20px;
	    color: #999;
	}
	.pic .c-bk {
	    color: #111;
	}
	.pic li:not(:last-child) .d2 {
	    margin-bottom: 20px;
	}
	.pic41 ul.dot {
	    overflow: hidden;
	    margin-bottom: 12px;
	}
	.pic41 ul.dot li {
	    float: left;
	    margin-right: 30px;
	}
	.pic .fw700 {
	    font-weight: 700;
	    color: #333;
	}
	.pic .llb1 {
	    padding: 0 4px;
	    font-size: 12px;
	    line-height: 1.25em;
	    color: #fff;
	    background-color: #a8a8a8;
	}
	.pic41 .cols {
	    margin: 8px 0;
	}
	.pic .cols {
	    border: 1px solid #e0e0e0;
	}
	.pic .cols th {
	    padding: 12px 5px;
	}
	.pic .cols th, .pic .cols td {
	    text-align: center;
	    border-left: 1px solid #e0e0e0;
	    border-right: 1px solid #e0e0e0;
	}
	.pic th {
	    font-weight: 400;
	    line-height: 1.29em;
	    color: #333;
	    background-color: #f4f4f4;
	}
	.pic .cols td {
	    padding: 10px;
	    text-align: center;
	    line-height: 1.57em;
	}
	.pic41 ul.dot {
	    overflow: hidden;
	    margin-bottom: 12px;
	}
	.pic41 ul.dot li {
	    float: left;
	    margin-right: 30px;
	}
	.pic44 .process {
	    overflow: hidden;
	    margin: 10px 0;
	}
	.pic44 .process>div {
	    float: left;
	    width: 31%;
	    height: 110px;
	    margin-left: 1%;
	    padding: 26px 20px 20px;
	    text-align: center;
	    background-color: #f4f4f4;
	}
	.pic44 .process .process1 {
	    margin-left: 0;
	}
	.pic44 .process strong {
	    color: #333;
	}
	.pic44 .process strong:before {
	    display: inline-block;
	    margin-right: 9px;
	    vertical-align: -1px;
	    content: "";
	    font-size: 0;
	    width: 10px;
	    height: 12px;
	    background: url(../resources/images/csy/order-processing.png) no-repeat;
	}
	.pic44 .process .prcs11:before {
	    margin-left: 40px;
	    width: 12px;
	}
	.pic44 .process .prcs11:after, .pic44 .process .prcs21:after {
	    width: 6px;
	    margin: 0 8px 0 12px;
	    background-position: -95px 0;
	}
	.pic44 .process strong:after {
	    display: inline-block;
	    vertical-align: -2px;
	    content: "";
	    font-size: 0;
	    width: 5px;
	    height: 14px;
	    background: url(../resources/images/csy/order-processing.png) no-repeat;
	}
	.pic strong {
	    font-weight: 400;
	}
	.pic44 .process .prcs12:before {
	    background-position: -17px 0;
	}
	.pic44 .process .prcs12:after {
	    margin-left: 31px;
	}
	.pic44 .process .prcs12:after, .pic44 .process .prcs22:after {
	 	background: none;
	    margin-left: 24px;
	    background-position: -85px 0;
	}
	.pic44 .process div div, .pic44 .process div p {
	    margin-top: 14px;
	}
	.pic .btn_tp {
	    display: inline-block;
	    padding: 2px 22px 3px 16px;
	    vertical-align: middle;
	    font-size: 12px;
	    letter-spacing: -0.05em;
	    color: #333;
	    border: 1px solid #d2d2d2;
	    border-radius: 4px;
	    background: #fff url(../resources/images/csy/bg_btntp.png) no-repeat 100% 11px;
	}
	.pic .btn_tp+.btn_tp {
	    margin-left: 8px;
	}
	.pic44 .process .prcs21:before {
	    width: 11px;
	    background-position: -32px 0;
	}
	.pic44 .process .prcs22:before {
	    width: 17px;
	    margin-left: 0;
	    background-position: -48px 0;
	}
	.pic44 .process .prcs31:before {
	    background-position: -69px 0;
	}
	.pic44 .process .prcs12:after, .pic44 .process .prcs22:after, .pic44 .process .prcs31:after {
	    background: none;
	}
	.cart_view_layer{
    display: none;
    position: relative;
    width: 269px;
    height: auto;
    border-bottom: 1px solid #d9d9d9;
    background: #fff;
    color: #333;
}
.cart_view_layer .inner{
    display: block;
    position: relative;
    border: 1px solid #666;
    width: auto;
    height: auto;
    margin: 0;
    padding: 28px 0 18px;
    background: #fff;
}
.cart_view_layer .CartInBtn{
    display: block;
    width: auto;
    height: auto;
    margin: 10px 0 0;
    background: transparent;
}
.cart_view_layer .btn_clse{
    position: absolute;
    top: 10px;
    right: 10px;
    width: 13px;
    height: 13px;
    text-decoration: none;
    cursor: pointer;
    color: black;
}
.cart_view_layer .CartInBtn a{
    display: inline-block;
    width: 100px;
    height: 24px;
    vertical-align: middle;
    text-decoration: none;
    margin-top: 5px;
    
    letter-spacing: -1.5px;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
    line-height: 24px;
}
.cart_view_layer .arr_btm {
    position: absolute;
    bottom: -6px;
    left: 50%;
    width: 7px;
    height: 6px;
    background: url(http://img1.tmon.kr/static/img/sp_pop.png?v=1499309043) no-repeat -290px -44px;
}
.btn_shopping{
	border: 1px solid black;
	color: black;
}
.btn_cart_view{
	background-color: black;
	color: white;
}
.btn_shopping:HOVER {
	color: black;
}
.btn_cart_view:HOVER {
	color: white;
}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	<section class="main_section">
		<div class="container">
		<div class="pro_title_wrap">
			<div class="pro_title">
				${productDTO.name}
			</div>
			<div class="pro_line"></div>
		</div>
		<div class="pro_detail">
			<div class="pro_detail_left">
				<img src="../resources/upload/${productDTO.f_mainimg}">
				<div></div>
			</div>
			<div class="pro_detail_right">
				<div class="pro_price_info">
					<div class="detail_price">
						<strong>판매가</strong>
						<span><fmt:formatNumber value="${productDTO.price}" groupingUsed="true"/></span>
						원
					</div>
				</div>
				<div class="pro_detail_info">
					<div class="detail_1">
						<strong>제조사/제조국</strong>
						냉장GO㈜ / 한국
					</div>
					<div class="detail_2">
						<strong>주원료/원산지</strong>
						하단 상품사양 원산지표시 참조
					</div>
					<div class="detail_5">
						<strong>상품코드</strong>
						${productDTO.procode}
					</div>
					<div class="detail_3">
						<strong>배송정보</strong>
						3,000원
						<span class="info">(주말,공휴일 제외 3일 내 발송)</span><br>
						<span class="info">30,000원 이상시 무료배송</span>
					</div>
					<div class="detail_4">
						<strong>주문수량</strong>
						<form action="" name="cartFrm" id="cartFrm">
							<input type="hidden" name="pronum" value="${productDTO.pronum}">
							<input type="hidden" name="memberid" value="">
							<input type="hidden" name="amount" id="amount">
						</form>
						<select class="proAmount">
							<option>1개</option>
							<option>2개</option>
							<option>3개</option>
							<option>4개</option>
							<option>5개</option>
							<option>6개</option>
							<option>7개</option>
							<option>8개</option>
							<option>9개</option>
							<option>10개</option>							
						</select><br>
						<span class="info">최대 주문수량은 총 10개 입니다.</span>
					</div>
					
				</div>
				<div class="pro_detail_btn">
					<img alt="" src="../resources/images/csy/btn_product_1.gif">
					<img alt="" src="../resources/images/csy/btn_product_2.gif" class="cartBtn">
					<div class="cartForm" style="width: 0; height: 0;"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="recomm">
			<strong>이 상품과 관련된 상품</strong>
			<div class="picoSlider">
				<div class="count">
					<strong>1</strong>/<span>3</span>
				</div>
				<button class="prev">
					<span><img alt="" src="../resources/images/csy/btn_prevSlide.png"> </span>
				</button>
				<div class="picoInner">
					<ul>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src="../resources/images/csy/1480395671755_0.jpg"></div>
								<span class="iName">스팸 마일드 200g 1</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src="../resources/images/csy/CJON20170605111516_2_01.jpg"></div>
								<span class="iName">스팸 마일드 200g 2</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 3</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 4</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 5</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 6</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 7</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 8</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 9</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 10</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 11</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 12</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="recomm_one">
								<div class="img"><img alt="" src=""></div>
								<span class="iName">스팸 마일드 200g 13</span>
								<div class="iHowmuch">
									<span class="iCost">
										<span>3,680</span>원
									</span>
								</div>
							</div>
						</li>
						
					</ul>
				</div>
				<button type="button" class="next">
					<span><img alt="" src="../resources/images/csy/btn_nextSlide.png"> </span>
				</button>
			</div>
			
		</div>
		<div class="clear"></div>
		<div class="detail_bann"><img class="detail_bann_img" alt="" src="../resources/images/csy/detail_ban5_3.jpg"></div>
		<div class="clear"></div>
		<div class="view_menu">
			<div class="vmenu m_detail" data-m="v_detail">상품상세정보</div>
			<div class="vmenu m_review" data-m="v_review">상품평</div>
			<div class="vmenu m_qna" data-m="v_qna">상품 Q＆A</div>
			<div class="vmenu m_delivery" data-m="v_delivery">배송정보</div>
			<div class="vmenu m_refund" data-m="v_refund">교환반품정보</div>
		</div>
		<div class="view v_detail" data-n="v_detail">
			<!-- 상품사양 table -->
			<div class="piCont pic1" id="piCont1">

				<h3 class="product_read">상품사양</h3>

				<table class="table_goodsDetail"
					summary="상품상세정보 : 제품명, 식품의 유형, 제조사, 제조사의 소재지, 제조국, 제조일, 용량, 원재료명 및 함량, 영양성분, 유전자재조합식품, 영유아식 또는 체중조절식품, 수입식품, 포장상태 및 보관방법, 유통전문판매원, 소비자 상담번호">
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
							<td>${productDTO.name}</td>
						</tr>

						<tr>
							<th scope="row">원재료 및 함량</th>
							<td>${productDTO.contents}</td>
						</tr>

					</tbody>
				</table>
			</div>
			<!-- 상세 이미지 -->
			<div class="detail_img"><img alt="" src="../resources/upload/${productDTO.f_detailimg}"></div>
			
		</div>
		
		<div class="view v_review" data-n="v_review">
			<p class="v_title">상품평 <span class="v_num">(29)</span></p>
			<table id="js-review-board-table" class="goods-review--board"
				cellspacing="0" border="1">
				<colgroup>
					<col width="218px">
					<col>
					<col width="225px">
					<col width="89px">
				</colgroup>
				<!--<thead>
				    <tr>
				        <th>평점</th>
				        <th>제목</th>
				        <th>작성자</th>
				        <th>작성일</th>
				    </tr>
				</thead>-->
				<tbody>
					<tr class="preview js-data-row" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td class="__border"><span class="__border-span"></span> 평점
							<span class="review-star review-star5">5점</span></td>
						<td class="__border __left"><span class="__border-span"></span> 너무 맛있어요 </td>
						<td class="__third">m*****</td>
						<td class="__fourth">2017.06.22</td>
					</tr>
					<tr class="review_cont">
						<td colspan="4"></td>
					</tr>
					<tr class="detail js-detail" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td colspan="4"></td>
					</tr>
					<tr class="preview js-data-row" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td class="__border"><span class="__border-span"></span> 평점
							<span class="review-star review-star4">5점</span></td>
						<td class="__border __left"><span class="__border-span"></span> 너무 맛있어요 </td>
						<td class="__third">m*****</td>
						<td class="__fourth">2017.06.22</td>
					</tr>
					<tr class="detail js-detail" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td colspan="4"></td>
					</tr>
					<tr class="preview js-data-row" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td class="__border"><span class="__border-span"></span> 평점
							<span class="review-star review-star3">5점</span></td>
						<td class="__border __left"><span class="__border-span"></span> 너무 맛있어요 </td>
						<td class="__third">m*****</td>
						<td class="__fourth">2017.06.22</td>
					</tr>
					<tr class="detail js-detail" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td colspan="4"></td>
					</tr>
					<tr class="preview js-data-row" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td class="__border"><span class="__border-span"></span> 평점
							<span class="review-star review-star2">5점</span></td>
						<td class="__border __left"><span class="__border-span"></span> 너무 맛있어요 </td>
						<td class="__third">m*****</td>
						<td class="__fourth">2017.06.22</td>
					</tr>
					<tr class="detail js-detail" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td colspan="4"></td>
					</tr>
					<tr class="preview js-data-row" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td class="__border"><span class="__border-span"></span> 평점
							<span class="review-star review-star1">5점</span></td>
						<td class="__border __left"><span class="__border-span"></span> 너무 맛있어요 </td>
						<td class="__third">m*****</td>
						<td class="__fourth">2017.06.22</td>
					</tr>
					<tr class="detail js-detail" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td colspan="4"></td>
					</tr>
					<tr class="preview js-data-row" data-bdid="goodsreview"
						data-sno="616" data-auth="y">
						<td class="__border"><span class="__border-span"></span> 평점
							<span class="review-star review-star0">5점</span></td>
						<td class="__border __left"><span class="__border-span"></span> 너무 맛있어요 </td>
						<td class="__third">m*****</td>
						<td class="__fourth">2017.06.22</td>
					</tr>
				</tbody>
			</table>
			
			<div>1 2 3 4 5</div>
		</div>
		
		<div class="view v_qna" data-n="v_qna">
			<p class="v_title">상품 Q＆A <span class="v_num">(29)</span></p>
		</div>
		
		<div class="view v_delivery" data-n="v_delivery">
			<p class="v_title">배송정보</p>
				<div class="pic pic41">
					<ul class="dot">
						<li class="d_active">기본 배송비 : <span class="fw700 c-bk">3,000원</span></li>
						<li>무료배송 기준 : ① 동일 유형별 상품 <span class="fw700 c-bk">30,000원
								이상</span> 구매 시 &nbsp; ② <span class="fw700 c-bk">‘무료배송’</span>으로 표시된 상품
							구매 시 ( <span class="llb llb1">무료배송</span> )
						</li>
					</ul>
					<strong class="dot">배송 유형별 상품 안내</strong>
					<table class="cols" summary="배송 유형별 상품 안내">
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
								<td>[상온], [상온&amp;실온] 표기된 상품<br>햇반, 스팸, 밀가루, 구강/생활용품 등
								</td>
								<td>[냉장], [냉장&amp;냉동] 표기된 상품<br>김치, 국수, 어묵, 만두, 푸딩 등
								</td>
								<td>세탁, 생활,<br>주방 세제상품
								</td>
							</tr>
						</tbody>
					</table>
					<ul class="dot">
						<li class="d_active">주문한 상품은 결제완료 후 다음날부터 3일이내 출고 됩니다. (토,일,공휴일
							제외)</li>
						<li>상품 출고일은 상품/지역/업체별 상황에 따라 변경될 수 있으며, 주문량 증가 시 배송이 지연될 수
							있습니다.</li>
						<li>냉장·냉동·신선제품은 신선도 유지를 위해 제주도 및 도서산간 지역의 배송이 제한될 수 있습니다.</li>
						<li>고객님의 주소 기입 오류, 임의 수취거부, 고객 부재로 인해 반송될 경우 배송비가 청구될 수 있습니다.</li>
						<li>주문 수량이 많거나 BOX 제품을 동시에 구매하는 경우, 안전배송을 위해 다수의 박스로 배송될 수
							있으며 택배사 사정에 따라 박스별 배송 일정이 다를 수 있습니다.<br>(나의온마트 &gt; 주문내역/배송현황 &gt;
							[배송현황] 버튼 클릭 시, 출력되는 ‘운송장번호’로 택배 개수 확인 가능)
						</li>
					</ul>
				</div>
				
				<p class="v_title">주문 변경/취소 안내</p>
				<div class="pic pic44">
					<ul class="dot">
						<li class="d_active">당사 판매 정책 및 제조사 사정에 따라 사전예고 없이 상품 가격변동 혹은
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
								<a class="btn_tp" href="/myPage/order/orderReceiveUpdateList.do">배송지
									변경하기</a> <a class="btn_tp"
									href="/myPage/order/orderCancelPossibleList.do">주문취소하기</a>
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
			</div>
		
		
		<div class="view v_refund" data-n="v_refund">
			<p class="v_title">교환반품정보</p>
							<div class="pic pic51">
					<table class="rows" summary="교환 및 반품 안내">
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
										<li class="d_active">① 상품 수령일로부터 7일이 경과한 경우</li>
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
										<li class="d_active">고객님의 단순변심으로 인한 교환 / 반품 시, 택배 박스단위로
											배송비 부과
											<ul class="d2">
												<li class="d_active">– 교환 배송비 : <span class="c-or">박스
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
										<li class="d_active">교환/반품 신청 (임의반품 시, 처리불가)
											<ul class="d2">
												<li class="d_active">– [나의 온마트 &gt; 쇼핑정보 &gt; 주문교환 / 반품
													/ 취소신청] 페이지에서 바로 접수
												</li>
												<li>– 고객행복센터 080-850-2000로 신청 (평일 09:00~18:00, 토 / 일 /
													공휴일 휴무)</li>
												<li>– 반품신청 접수 후 필요 시 고객님께 전화를 드리며, 전화상담 후 반품이 최종 결정
													됩니다.</li>
											</ul>
										</li>
										<li>상품불량 및 누락 시, 교환/반품 유의사항
											<ul class="d2">
												<li class="d_active">– 상품불량 및 누락 시 반드시 사진 첨부하여 교환/반품 신청</li>
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
										<li class="d_active">반품 시, 반품된 상품이 물류센터로 입고되어 검수가 완료되면
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
		</div>

	</div>
	</section>
	<c:import url="../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		/****************관련상품 슬라이드 넘기기*******************/
		function picoSlider() {
			var $slider = $(".picoSlider"), $btn = $slider.children("button"), $prev = $slider
					.children(".prev"), $next = $slider.children(".next"), $inner = $slider
					.children(".picoInner"), $cntW = $slider.children(".count"), $cnt = $cntW
					.children("strong"), $ul = $inner.children("ul"), $li = $ul
					.children("li");
			liL = $li.length, liw = $li.outerWidth(), innerW = $inner
					.outerWidth(), cnt = 0;
			//initial
			$ul.width(liL * (liw + 66)); //li의 갯수 * li의 width (margin 포함)
			$cntW.children("span").text(Math.ceil(liL / 5));
			$cnt.text(cnt + 1);
			$btn.click(function() {
				var ml = parseInt($ul.css("marginLeft") / 5);
				if ($(this).hasClass("prev")) {
					if (cnt == "0") {
						return;
					} else {
						cnt--;
					}
					;
				} else if ($(this).hasClass("next")) {
					if (cnt == Math.ceil(liL / 5) - 1) {
						return;
					} else {
						cnt++;
					}
					;
				} else {
					alert("I see dead peaple.");
				}
				;
				ml = -cnt * ((liw + 66) * 5); //슬라이드 넘기기 ()
				$cnt.text(cnt + 1);
				//easeInCubic
				$ul.stop(false, true).animate({
					marginLeft : ml
				}, 300);
			});
		};
		picoSlider();

		/******** wheelscroll  ************/
		var topHeadHeight = -20; //header height
		var marginHeight = $('.view_menu').height();
		var trigger = $('.view_menu').offset().top;
		$(window).scroll(function() {
			//메뉴고정
			var scroll = $(window).scrollTop();
			if (scroll > trigger - topHeadHeight) {
				$('.view_menu').css({
					'position' : 'fixed',
					'top' : topHeadHeight,
					'left' : '0px',
					'right' : '0px'
				});
				$('header').css('margin-bottom', marginHeight);
			} else {
				$('.view_menu').css('position', 'static');
				$('header').css('margin-bottom', 0);
			};
			
			//메뉴 색상
		    $('.view').each(function() {
		        if(scroll >= $(this).offset().top - 80) {
		            var id = $(this).attr('data-n');
		            $('.vmenu').removeClass('active');
		            $("div[data-m='"+id+"']").addClass('active');
		        }
		    });
			
		});
		
		/********** 새로고침시 스크롤 이동 **********/
		window.onload=function(){
			setTimeout(function() {
				scrollTo(0,0);
			}, 1);
			
		}

		/*********** 메뉴 클릭 **********/
		$(".vmenu").click(function() {
			//스크롤 이동
			var menu = $(this).attr("data-m");
			var offset = $("." + menu).offset();
			$('html, body').animate({
				scrollTop : offset.top - 80
			}, 400);
			/* $('.vmenu').removeClass('active');
            $(this).addClass('active'); */
		});
		
		/*********** 장바구니 클릭 **********/
		$(".cartBtn").click(function() {
			var path = '';
			var proAmount = $(".proAmount").val().replace("개","")*1;
			var pronum = '${productDTO.pronum}';
			$("#amount").val(proAmount);
			
			var memberid = 'soyoung';
			if(memberid == ''){
				path = "cart/cartNMInsert";
			}else{
				path = "cart/cartMInsert";
			}
			//cartFrm.submit();
			$.ajax({
				url: path,
				type: "POST",
				data: {
					amount: proAmount,
					memberid: memberid,
					pronum: pronum
				},
				success: function(data) {
					$(".cartForm").html(data);
					var cartBtn = $(".cartBtn").position();
					/* $(".cart_view_layer").css("bottom", cartBtn.top-343); */
					$(window).resize(function() {
						var offset = $(".cartBtn").position();
						$(".cart_view_layer").css({
							"display": "block",
							"bottom": cartBtn.top-343,
							"left": cartBtn.left - 910
						});				
					}).resize();
				}
			});			
		});
		
		
	</script>
</body>
</html>
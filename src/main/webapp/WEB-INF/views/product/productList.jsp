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
	.top_section {
		width: 100%;
		clear: both;
		margin-top: 110px;
	}
	
	.carousel-inner>.item>img {
		width: 100%;
		height: 360px;
		min-width: 1200px;
	}
	
	.carousel-inner {
		height: 360px;
		min-width: 1200px;
	}
	
	.container {
		width: 100%;
		padding: 0px 0px;
	}
	
	.main_section {
		margin-top: 0px;
	}
	
	.main_menu {
		margin: 0 auto;
		width: 60%;
		height: 50px;
		background-color: #38332f;
		min-width: 1150px;
	}
	
	li {
		display: block;
	}
	
	.ul_nav {
		width: 100%;
	}
	
	.has_nav {
		float: left;
		width: 16%;
		position: relative;
	}
	
	.ul_nav>li {
		float: left;
		position: relative;
		height: 50px;
	}
	
	.ul_nav>li>div {
		display: block;
		text-align: center;
		font-size: 14px;
		color: #fff;
		line-height: 50px;
		border-right: 1px solid #555;
		cursor: pointer;
	}
	
	.has_nav:HOVER {
		background-color: #ffcc00;
	}
	
	.ul_nav>li:first-child {
		width: 20%;
	}
	
	.ul_nav>li:first-child div {
		display: block;
		background: url(../resources/images/csy/hams.png) 12px 13px no-repeat
			#252221;
		text-indent: 20px;
	}
	
	.ul_nav>li.all .child {
		border-left: 1px solid #797979;
		background-color: #ffcc00;
	}
	
	.ul_nav>li.all .child img {
		margin-top: 20px;
		margin-left: 40px;
		width: 150px;
		height: 50px;
	}
	
	.ul_nav>li .child {
		display: none;
		position: absolute;
		width: 100%;
		height: 120px;
		background: #fff;
		border: 1px solid #c4c4c4;
		z-index: 9999;
		border-bottom: 1px solid #797979;
		overflow: hidden;
		padding-top: 10px;
		border-collapse: collapse;
	}
	
	.ul_nav>li .child li div {
		text-indent: 24px;
		font-size: 12px;
		line-height: 2;
		display: block;
		cursor: pointer;
	}
	
	.ul_nav>li .child li div:HOVER {
		color: #ffcc00;
	}
	
	.child div {
		margin-left: 10px;
	}
	
	.wrap {
		width: 100%;
		height: 1500px;
	}
	
	.sort_wrap {
		height: 35px;
		padding-top: 10px;
		margin-top: 10px;
	}
	
	.sort_wrap em {
		color: #222;
		font-weight: 700;
		vertical-align: baseline;
		display: inline;
		font-style: normal;
	}
	.sort_left{
		margin-top: 5px;
	}
	.sort_right{
		float: right;
		font-size: 18px;
		font-weight: bold;
	}
	
	.pro_list {
		margin-top: 15px;
		clear: both;
	}
	
	.pro_one {
		width: 23.5%;
		height: 310px;
		border: 1px solid #cfcfcf;
		margin-bottom: 20px;
		margin-right: 2%;
		float: left;
	}
	
	.pro_one img {
		margin: 0 auto;
		width: 200px;
		height: 200px;
		display: table-cell;
		cursor: pointer;
	}
	
	.pro_one:nth-child(4n) {
		margin-right: 0px;
	}
	
	.pro_one_intro {
		padding: 20px 25px 0 25px;
		border-top: 1px solid #cfcfcf;
		line-height: normal;
	}
	
	.pro_name {
		font-size: 14px !important;
		color: #565656 !important;
		text-align: left;
		display: inline-block;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
		width: 100%;
		margin-bottom: 15px;
		font-weight: bold;
		cursor: pointer;
	}
	.price_title {
	    font-size: 13px;
	    color: #aaaaaa;
	    letter-spacing: -1px;
	    line-height: 15px;
	    width: 30%;
	    display: inline-block;
	    text-align: left;
	}
	.price {
		font-size: 14px;
		color: #000000; 
		font-weight : bold; 
		line-height : 16px;
		width: 60%; 
		display : inline-block;
		text-align: right;
	}
	
	.price_one {
		font-size: 12px;
		color: #000000; 
		font-weight : bold; 
		line-height : 16px; 
		width : 5%;
		display : inline-block;
		text-align: right;
	}
	.pro_hover{
	    left: -1px;
	    bottom: -1px;
	    width: 100%;
	    height: 23px;
	    background-color: #38332f;
	    color: white;
	    text-align: center;
	    display: none;
	    cursor: pointer;
	}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	<section class="top_section">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="../resources/images/csy/main_img1.jpg" height= "360px">
				</div>
				<div class="item">
					<img src="../resources/images/csy/main_img3.jpg" height= "360px">
				</div>
				<div class="item">
					<img src="../resources/images/csy/main_img4.jpg" height= "360px">
				</div>				
				<div class="item">
					<img src="../resources/images/csy/main_img5.jpg" height= "360px">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		
	</section>
	<section class="main_section">
		<div class="container">
			<div class="main_menu">
				<ul class="ul_nav">
					<li class="all" data-sts="n">
						<div class="all_open">전체 카테고리</div>
						<ul class="child">
							<li><img alt="" src="../resources/images/common/logo3.png"></li>
						</ul>
					</li>					
					<li class="has_nav">
						<div class="menu_nav">농산물</div>
						<ul class="child" style="border-left: 1px solid #797979">
							<li><div class="child_nav" data-cat="곡류">곡류</div></li>
							<li><div class="child_nav" data-cat="채소">채소</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav">수산물</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="생선어패류">생선/어패류</div></li>
							<li><div class="child_nav" data-cat="해조류">해조류</div></li>
							<li><div class="child_nav" data-cat="건어물">건어물</div></li>
							<li><div class="child_nav" data-cat="수산가공">수산가공</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav">정육</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="양념가공육">양념/가공육</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav">가공식품</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="반찬류">반찬류</div></li>
							<li><div class="child_nav" data-cat="냉동식품">냉동식품</div></li>
							<li><div class="child_nav" data-cat="밥면류">밥/면류</div></li>
							<li><div class="child_nav" data-cat="맛살어묵단무지">맛살/어묵/단무지</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav" style="border-right: none;">양념류</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="기름류">기름류</div></li>
							<li><div class="child_nav" data-cat="장류">장류</div></li>
							<li><div class="child_nav" data-cat="조미료">조미료</div></li>
						</ul>
					</li>
				</ul>					
			</div>
			<div class="wrap">
				
			</div>
			
			<a href="productWrite">제품 등록</a>
			<a href="productUpdate?pronum=2">제품 수정</a>
			<a href="cart/productCart">장바구니 Form</a>
			<a href="pay/payProcess">결제창</a>
		</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		var m = '${message}';
		if(m != ''){
			alert(m);
		}
		var curPage=1;
		$.ajax({
			url: "productList_wrap",
			type: "POST",
			data: {
				curPage: curPage,
				cate_major: "",
				cate_minor: ""
			},
			success: function(data) {
				$(".wrap").html(data);
			}
		});
		
		/******** 스크롤 이동시 상단 메뉴 고정 ************/
		var topHeadHeight = 110;	//header height
		var marginHeight = $('.main_menu').height();
		var trigger = $('.main_menu').offset().top;
		$(window).scroll(function() {
			var scroll = $(window).scrollTop();
			if(scroll > trigger-topHeadHeight) {
				$('.main_menu').css({					
					'position': 'fixed',
					'top': topHeadHeight,
					'left': '0px',
					'right': '0px'
				});
				$('header').css('margin-bottom', marginHeight);
			} else{
				$('.main_menu').css('position', 'static');
				$('header').css('margin-bottom', 0);
			}
		});
		
		/*********** 메뉴 Toggle **********/
		$(".all").click(function(){
			var sts = $(this).attr("data-sts");
			if(sts == 'n'){
        		$(".child").slideDown("slow");
        		$(this).attr("data-sts", "y")
			}else{
				$(".child").slideUp("slow");
        		$(this).attr("data-sts", "n")
			}
		});		
		
		/********** 새로고침시 스크롤 이동 **********/
		window.onload=function(){
			setTimeout(function() {
				scrollTo(0,0);
			}, 1);
			
		}
		
		/*********** 메뉴 Hover **********/
		$(".has_nav").hover(function() {
			var sts = $(".all").attr("data-sts");
			if (sts == 'n') {
				$(this).find(".child").css("display", "block");
			}
		}, function() {
			var sts = $(".all").attr("data-sts");
			if (sts == 'n') {
				$(this).find(".child").css("display", "none");
			}
		});
		
		/*********** product list Hover **********/
		$(".pro_one").hover(function() {
			$(this).find(".pro_hover").css("display","block");
		}, function() {
			$(this).find(".pro_hover").css("display","none");
		});
		
		
		$(".menu_nav, .child_nav").click(function() {			
			//스크롤 이동
			var offset = $(".main_menu").offset();
			$('html, body').animate({scrollTop: offset.top-110}, 400);
			$(".child").slideUp("slow");
    		$(".all").attr("data-sts", "n");
		});	
		
		
		/*********** 카테고리 클릭 **********/
		$(".menu_nav, .child_nav").click(function() {
			//페이지 이동
			var major = '';
			var minor = '';
			var curPage = 1;
			var t = $(this).hasClass("child_nav");
			if(t){
				minor = $(this).attr("data-cat");
				major = $(this).parents("ul").siblings(".menu_nav").html();
			}else{
				major = $(this).html();
			}
			$.ajax({
				url: "productList_wrap",
				type: "POST",
				data: {
					curPage: curPage,
					cate_major: major,
					cate_minor: minor
				},
				success: function(data) {
					$(".wrap").html(data);
				}
			});
		});
		$(".all_open").click(function() {
			$.ajax({
				url: "productList_wrap",
				type: "POST",
				data: {
					curPage: 1,
					cate_major: '',
					cate_minor: ''
				},
				success: function(data) {
					$(".wrap").html(data);
				}
			});
		});

	</script>
</body>
</html>
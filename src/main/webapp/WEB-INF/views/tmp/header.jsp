<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('[data-toggle="tooltip"]').tooltip({ position: { my: "left+15 center", at: "right center" } });
		
		$("#arrow_left img").click(function() {
			changeSearch(0);
		});
		$("#arrow_right img").click(function() {
			changeSearch(1);
		});
				
		$("#memberBtn").click(function() {
			if( $(".member_box").attr("title") != "off" ) {
				$(".member_box").attr("title", "off");
				$(".member_box").hide();
			} else {
				$(".member_box").attr("title","on");
				memberTab();
			}
		});
		
		$(document).mouseup(function(e) {
			if($(".member_box").has(e.target).length == 0) {
				if($("#person").has(e.target).length == 0) {
					$(".member_box").attr("title", "off");
					$(".member_box").hide();
				}
			}
		})
	});
	
	function changeSearch(status) {		
		var totalNum = $(".associativeSearch_ul").length;
		var curNum;
		
		$(".associativeSearch_ul").each(function() {
			if($(this).css("display") != "none") {
				curNum = $(this).attr("id").substring(17,18) * 1;
			}
			$(this).css("display", "none");
		});
		
		if(status == 0) {	// left
			if(curNum > 1) {
				curNum -= 1;
			}
		} else {			// right
			if(curNum < totalNum) {
				curNum += 1;
			}
		}
		$("#associativeSearch"+curNum).css("display", "inline");
	}
	
	function memberTab() {
		$(".member_box").attr("title","on");
		$(window).resize(function(){
			var obj = $("#memberBtn").position();
			
			$(".member_box").css("left", obj.left - 60);
			$(".member_box").css("top", obj.top + 2);
			$(".member_box").css("display","inline-block");
			$(".member_box").attr("title","on");
		}).resize();
		$(".member_box").attr("title","on");
	}
</script>
<header>
	<div class="search">
		<div class="search_wrap">
			<input type="text" id="searchInput" placeholder="음식명, 재료명으로 검색해주세요." onkeydown="search(this)">
			<div class="pictureBtn">
				<div id="person">
					<c:if test="false">	<!-- 로그인 안 했을 때 -->
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/images/common/user-silhouette.png"
								onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette-over.png'"
								onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette.png'">
							<span class="tooltiptext">로그인</span>
						</a>
					</c:if>
					<c:if test="true">	<!-- 로그인 했을 때 -->
						<img alt="회원" src="${pageContext.request.contextPath}/resources/images/common/user-silhouette.png"
							onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette-over.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette.png'" id="memberBtn">
					</c:if>
				</div>
				<div id="writer">
					<a href="${pageContext.request.contextPath}/recipe/recipeWrite">
						<img alt="레시피 등록" src="${pageContext.request.contextPath}/resources/images/common/pen-tool.png" 
							onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/pen-over.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/pen-tool.png'">
						<span class="tooltiptext">내 레시피 등록하기</span>
					</a>
				</div>
				<div id="refrigerator">
					<a href="#">
						<img alt="냉장고 추천" src="${pageContext.request.contextPath}/resources/images/common/fridge.png"
							onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/fridge-over.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/fridge.png'">
						<span class="tooltiptext">있는재료로 추천받기</span>
					</a>
				</div>
			</div>
		</div>
		<div class="member_box" style="display: none;" title="off">
			<ul>
				<li><a href="#">MY홈</a></li>
				<li><a href="#">스크랩한 레시피</a></li>
				<li><a href="#">레시피 노트</a></li>
				<li><a href="#">알림</a></li>
				<li><a href="#">메시지</a></li>
				<li><a href="#">문의내역</a></li>
				<li><a href="#">주문조회</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">회원정보수정</a></li>
				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</div>
	<div class="menu">
		<div class="menu_wrap">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/resources/images/common/logo_yellow.png"></a>
			</div>
			<div class="menu_sub">
				<nav class="menu_sub_nav">
					<ul class="menu_sub_ul">
						<li><a href="${pageContext.request.contextPath}/recipe/recipeList">레시피</a></li>
						<li><a href="#">플래너</a></li>
						<li><a href="#">쇼핑몰</a></li>
					</ul>
				</nav>
			</div>
			<div class="associativeSearch">
				<nav class="associativeSearch_nav">
					<ul class="associativeSearch_ul" id="associativeSearch1">
						<li><a href="#">삼겹살</a></li>
						<li><a href="#">초간단요리</a></li>
						<li><a href="#">치킨</a></li>
						<li><a href="#">야식</a></li>
						<li><a href="#">피크닉</a></li>
						<li><a href="#">메인반찬</a></li>
						<li><a href="#">다이어트</a></li>
					</ul>
					<ul class="associativeSearch_ul" id="associativeSearch2" style="display: none;">
						<li><a href="#">###</a></li>
						<li><a href="#">###</a></li>
						<li><a href="#">###</a></li>
						<li><a href="#">###</a></li>
						<li><a href="#">###</a></li>
						<li><a href="#">###</a></li>
						<li><a href="#">###</a></li>
					</ul>
				</nav>
			</div>
			<div class="arrow">
				<div id="arrow_right">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/common/btn_arrow2_r.gif">
				</div>
				<div id="arrow_left">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/common/btn_arrow2_l.gif">
				</div>
			</div>
		</div>
	</div>
</header>
    <script>
        function search(find){
            if(event.keyCode == 13)
                {
                    location.href=${pageContext.request.contextPath}+"/recipe/search?find="+find.value;
                }
        }
    </script>


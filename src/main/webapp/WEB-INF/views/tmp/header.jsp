<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		function logout() {
			Kakao.init('cd868dba3cc2bd18d62a147752f2347c');
			
			Kakao.Auth.logout(function(data) {
				if(data){
					location.href ="${pageContext.request.contextPath}/member/logout";
				}
			}); 
			
		}
		
		$("#logout").click(function() {
			logout();
		
		});

		$('[data-toggle="tooltip"]').tooltip({
			position : {
				my : "left+15 center",
				at : "right center"
			}
		});

		$("#arrow_left img").click(function() {
			changeSearch(0);
		});
		$("#arrow_right img").click(function() {
			changeSearch(1);
		});

		$("#memberBtn").click(function() {
			if ($(".member_box").attr("title") != "off") {
				$(".member_box").attr("title", "off");
				$(".member_box").hide();
			} else {
				$(".member_box").attr("title", "on");
				memberTab();
			}
		});

		$(document).mouseup(function(e) {
			if ($(".member_box").has(e.target).length == 0) {
				if ($("#person").has(e.target).length == 0) {
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
			if ($(this).css("display") != "none") {
				curNum = $(this).attr("id").substring(17, 18) * 1;
			}
			$(this).css("display", "none");
		});

		if (status == 0) { // left
			if (curNum > 1) {
				curNum -= 1;
			}
		} else { // right
			if (curNum < totalNum) {
				curNum += 1;
			}
		}
		$("#associativeSearch" + curNum).css("display", "inline");
	}

	function memberTab() {
		$(".member_box").attr("title", "on");
		$(window).resize(function() {
			var obj = $("#memberBtn").position();

			$(".member_box").css("left", obj.left - 60);
			$(".member_box").css("top", obj.top + 2);
			$(".member_box").css("display", "inline-block");
			$(".member_box").attr("title", "on");
		}).resize();
		$(".member_box").attr("title", "on");
	}
</script>
<header>
	<div class="search">
		<div class="search_wrap">
			<input type="text" id="searchInput" placeholder="음식명, 재료명으로 검색해주세요.">
			<div class="pictureBtn">
				<div id="person">
					<c:if test="${sessionScope.memberDTO == null}">	<!-- 로그인 안 했을 때 -->
						<a href="${pageContext.request.contextPath}/member/login">
							<img src="${pageContext.request.contextPath}/resources/images/common/user-silhouette.png"
								onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette-over.png'"
								onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette.png'">
							<span class="tooltiptext">로그인</span>
						</a>
					</c:if>
					<!-- 로그인 했을 때 -->
					<c:if test="${sessionScope.memberDTO !=null }">	
						<!-- SNS 회원    -->
						<c:if test="${sessionScope.memberDTO.login_mode eq 'SNS_join' }">
						      <!-- 카카오 프로필 사진 유무 -->
						      <!-- 맨처음 가입하면 카카오 프로필 사진으로 저장됨, 하지만 프로필 설정에서 
						      이미지를 바꾸면 서버에 저장되있는 경로로가서 이미지를 가져옴  -->
							<c:choose>
								<c:when test="${memberDTO.myPhoto eq 'sns'  }">
									
									<img alt="회원" style="width:35px;border-radius: 50%;" src=${memberDTO.sns_photo } id="memberBtn">	
								</c:when>
								
							
								<c:when test="${memberDTO.myPhoto != 'sns' }">
									<img style="width:35px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}" id="memberBtn">
								</c:when>
							</c:choose>
							
						</c:if>
						<!-- 일반회원   -->
						<c:if test="${sessionScope.memberDTO.login_mode eq 'general_join' }">
							
							<c:if test="${memberDTO.myPhoto eq '' || memberDTO.myPhoto eq null }">
								<img alt="회원" style="width:35px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/images/common/default.png"
								onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/default.png'"
								onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/default.png'" id="memberBtn">
							</c:if>
							<c:if test="${memberDTO.myPhoto != null } ">
								<img alt="회원" style="width:35px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}"
								onmouseover="this.src='${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}'"
								onmouseout="this.src='${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}'" id="memberBtn">
							</c:if>
						</c:if>
							
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
				<li><a href="${pageContext.request.contextPath}/member/myPage/myPage?nickName=${memberDTO.nickName}">MY홈</a></li>
				<li><a href="#">스크랩한 레시피</a></li>
				<li><a href="#">레시피 노트</a></li>
				<li><a href="#">알림</a></li>
				<li><a href="#">메시지</a></li>
				<li><a href="#">문의내역</a></li>
				<li><a href="#">주문조회</a></li>
				<li><a href="#">장바구니</a></li>
				<li>
					<c:if test="${memberDTO.login_mode eq 'SNS_join' }">
						<a href="${pageContext.request.contextPath}/member/info_correct">회원정보수정</a>	
					</c:if>
					<c:if test="${memberDTO.login_mode eq 'general_join' }">
						<a href="${pageContext.request.contextPath}/member/info_check">회원정보수정</a>	
					</c:if>
				</li>
				<li><a role="button" id="logout">로그아웃</a></li>
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
						<li><a href="#">레시피</a></li>
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
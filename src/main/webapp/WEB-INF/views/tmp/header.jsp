<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
		<div class="search">
			<div class="search_wrap">
				<input type="text" id="searchInput" placeholder="음식명, 재료명으로 검색해주세요.">
				<div class="pictureBtn">
					<div id="person">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/common/user-silhouette.png">
					</div>
					<div id="writer">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/common/pen-tool.png">
					</div>
					<div id="refrigerator">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/common/fridge.png">
					</div>
				</div>
			</div>
		</div>
		<div class="menu">
			<div class="menu_wrap">
				<div class="logo">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/common/logo_yellow.png">
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
						<ul class="associativeSearch_ul">
							<li><a href="#">삼겹살</a></li>
							<li><a href="#">초간단요리</a></li>
							<li><a href="#">치킨</a></li>
							<li><a href="#">야식</a></li>
							<li><a href="#">피크닉</a></li>
							<li><a href="#">메인반찬</a></li>
							<li><a href="#">다이어트</a></li>
						</ul>
					</nav>
				</div>
				<div class="arrow">
					<div id="arrow_left">
						<a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/images/common/btn_arrow2_l.gif"></a>
					</div>
					<div id="arrow_right">
						<a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/images/common/btn_arrow2_r.gif"></a>
					</div>
				</div>
			</div>
			
		</div>
	</header>
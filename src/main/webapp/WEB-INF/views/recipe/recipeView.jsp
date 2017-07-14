<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>?</title>
<link rel="stylesheet" media="all" href="http://d1hk7gw6lgygff.cloudfront.net/assets/application-661e969b01a864ad51eee95fed275e3a.css">
<script src="http://d1hk7gw6lgygff.cloudfront.net/assets/application-777082a56ce39297607bc88c49a5e6e7.js"></script>
<script type="text/javascript" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_js/social-0eb941356390963d3dc232d378dcdc5d.js?1499676485"></script>
<script src="../resources/js/kdk/recipeShow.js"></script>
</head>
<body>
<!-- header파트 -->
	<c:import url="./tmp/header.jsp"/>
	<!-- 메뉴 옆의 내용은 전부 고정, hidden으로 태그 검색 -->
<!-- 메인파트 -->
	<section class="main_section">
		<!-- 1. 재료검색으로 들어온 경우 내가 선택한 재료들이 쿼리로 들어와있어야 함. -->
		<!-- 2. ingredients, recipe, steps, hashtag 총 4개의 DTO가 직접 들어옴. -->
		<!-- 3. 리뷰나 리플은 ajax를 통해 다른 jsp를 도입해올 예정임. -->
		<!-- 4. 리뷰와 댓글은 같은 폼을 유지하되, 리플에 별점 제도를 별도로 도입(마우스오버/클릭 형식으로 별점주기) -->
	</section>
<!-- 각주 파트 -->
	<c:import url="./tmp/footer.jsp"/>
</body>
</html>
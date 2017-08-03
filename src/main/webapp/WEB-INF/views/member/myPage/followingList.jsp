<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<div class="in_mypage">
		<ul class="lst_follow">
			<!-- 팔로잉 리스트 -->
			<c:forEach items="" step="1">
				<li>
					<div class="user_follow">
						<img alt=""
							src="">
						<strong><a href="#"></a></strong>
						<div class="follow">
							<em>1명</em>이 팔로잉
							
						</div>
						<p class="count">0개 레시피</p>
	
					</div>
					<div class="thmb_follow"></div>
				</li>
			</c:forEach>
		</ul>
		<!--=========================== paging==============================   -->
		<div class="paging">

		</div>

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${result.searchResult }" var="dto">
	<div class=main_concep_channel title=${dto.num }>		
		<div class="channel_img" style='background-image:url("../resources/upload/${dto.rep_pic }")'>
			<div id="overlays${dto.num }" class=overlays>
				&nbsp;
					<br>
					<br>
					<br>
					<br>
					<div id="counts${dto.num }" class=counts></div>
					<br>					
					<br>
					<br>
					<div id="creators${dto.num }" class=creators>by ${dto.writer}</div>
					<br>
					</div>
				</div>
				
		<div class="channel_title">				
			<div>${dto.foodname }</div>		
		</div>
		<div class="channel_info">
			<div>${dto.title }</div><div></div>
		</div>	
	</div>
</c:forEach>
<!-- TV-만개의레시피에서 두 프로그램정도 가져오기(DB에 전부 넣어야 함, 동영상 태그까지) -->
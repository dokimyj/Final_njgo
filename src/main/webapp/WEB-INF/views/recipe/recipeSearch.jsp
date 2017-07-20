<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id=searchresult>
	<c:forEach items="${list.listPack }" var="dto">
		<div class=main_concep_channel title=${dto.num }>
			<div class="channel_img"
				style='background-image:url("resources/upload/${dto.rep_pic }")'>
				<div id="overlays${dto.num }" class=overlays>
					&nbsp; <br> <br> <br> <br>
					<div id="counts${dto.num }" class=counts></div>
					<br> <br> <br>
					<div id="creators${dto.num }" class=creators>by ${dto.writer}</div>
					<br>
				</div>
			</div>
			<div class="channel_title">
				<div>${dto.foodname }</div>
			</div>
			<div class="channel_info">
				<div>${dto.title }</div>
				<div></div>
			</div>
		</div>
	</c:forEach>
</div>

<div id=pagers title="${list.totalCount}">
	<ul class="pagination">
		<c:if test="${list.listInfo.curBlock>1 }">
			<li><span>&lt;&lt;</span></li>
		</c:if>
		<c:forEach begin="${list.listInfo.startNum }" end="${listInfo.lastNum }" step="1" var="i">
			<li><span>${i}</span></li>
		</c:forEach>
		<c:if test="${list.listInfo.curBlock<listInfo.totalBlock }">
			<li><span>&gt;&gt;</span></li>
		</c:if>
	</ul>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<c:import url="../temp/bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/communityList.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- section -->
	<section>
		<div id="section_wrap">
			<div class="community_wrap">
				<div class="fl c-d-s2">
					<div class="article-board">
						<div class="list-tit">
							<c:choose>
								<c:when test="${board == 'notice'}">
									<h3><a href="#" class="m-tcol-t" title="공지사항">공지사항</a></h3>
								</c:when>
								<c:when test="${board == 'qna'}">
									<h3><a href="#" class="m-tcol-t" title="질문게시판">질문게시판</a></h3>
								</c:when>
							</c:choose>						
						</div>
						<!-- Table -->
						<table cellspacing="0" cellpadding="0" border="0"
							class="board-box">
							<colgroup>
								<!-- NUM -->
								<col width="48">
								<!-- TITLE -->
								<col width="*">
								<!-- WRITER -->
								<col width="70">
								<!-- date -->
								<col width="110">
								<!-- HIT -->
								<col width="42">
							</colgroup>
							<thead>
								<tr>
									<td style="padding-left: 12">번호</td>
									<td style="padding-left: 240">제목</td>
									<!--  style="padding: 10 0 8 200;" -->
									<td>글쓴이</td>
									<td style="padding: 10 0 8 32;">작성일</td>
									<td style="padding-left: 7">조회</td>
								</tr>
								<tr>
									<td colspan="7" class="board-line"></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="dto">
								<tr align="center" class="bg-color">
									<!-- 공지 -->
									<td><!-- <img src="http://cafeimgs.naver.net/style/s03_01/ico-list-notice.gif" width="27" height="16" alt="공지"> -->${dto.num}</td>
									<!-- TITLE -->
									<td align="left" class="board-list" style="font-weight: bold; padding: 10px 0 8px 0;" width=""><span>
											<a href="${board}View.${board}?num=${dto.num}" class="m-tcol-p" title="${dto.title}">${dto.title}</a><a href="#" class="m-tcol-p">
											<span class="m-tcol-p" style="float: right;">[<strong>13</strong>]</span></a>
									</span></td>
									<!-- WRITER -->
									<td align="left"><div class="pers_nick_area"><table cellspacing="0"><tbody><tr><td class="p-nick">
									<a href="#" class="m-tcol-c">${dto.writer}</a></td></tr></tbody></table></div></td>
									<!-- DATE -->
									<td class="m-tcol-c">${dto.reg_date}</td>
									<!-- HIT -->
									<td class="view-count m-tcol-c">${dto.hit}</td>
								</c:forEach>
								<tr>
									<td colspan="7" class="board-line"></td>
								</tr>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="main-widget-area">
				<ul class="com">

				</ul>
			</div>
			
			<div class="list-btn">
				<div class="fr">
					<!-- 질문답변 게시판인 경우 '질문하기'를, 일반 게시판인 경우에는 '글쓰기' 버튼을 보여준다 -->
				</div>
			</div>
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr>
						<td class="board-line" style="height: 3px !important;"></td>
					</tr>
				</tbody>
			</table>

			<div class="prev-next">
				<table summary="페이지 네비게이션" class="Nnavi" align="center">
					<tbody>
						<tr>
							<td class="on"><a href="#" class="m-tcol-p">1</a></td>
							<td><a href="#" class="m-tcol-c">2</a></td>
							<td><a href="#" class="m-tcol-c">3</a></td>
							<td><a href="#" class="m-tcol-c">4</a></td>
							<td><a href="#" class="m-tcol-c">5</a></td>
							<td><a href="#" class="m-tcol-c">6</a></td>
							<td><a href="#" class="m-tcol-c">7</a></td>
							<td><a href="#" class="m-tcol-c">8</a></td>
							<td><a href="#" class="m-tcol-c">9</a></td>
							<td><a href="#" class="m-tcol-c">10</a></td>
							<td class="pgR"><a href="#" class="m-tcol-c pn"><span>다음</span><span
									class="ico-bl ico">▶</span></a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>






	
	

</body>
</html>


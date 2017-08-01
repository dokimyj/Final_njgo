<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="recipeView" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" style="height: 1500px">
				<div class="view_left" style="background-color: green; height:100%; width:70%; float:left; padding:5%;">
					<input type=hidden id=recipenum>
						<!-- (num 히든) -->
					<div class=rep_pic>
						<img src="" style="overflow:hidden; width:50%; height:50%;">				
				</div>
				<div class=r_intro>
					${recipe.recipeDTO.r_intro }
				</div>
				<div class=cart_preview>
					<!-- 쇼핑몰쪽 DB에서 재료를 비교(hidden에 있는 curIng를 받아서 사용) -->
				</div>
				<div class=hashtags>
					<c:forEach items="${hashtags }" var="tags">
						<a class="btn btn-warning tags" style="margin: 0 1% 1% 0; display: inline;" href="/recipe.recipeDTO/search?find=${tags }">${tags }</a>
					</c:forEach>
				</div>

				<div class=steps>
					<table>
					<c:forEach items="${steps }" var="steps">
						<tr>
							<td>${steps.step }</td>
							<td>${steps.explain }</td>
							<td><img src="../resources/upload/${steps.fname }"></td>
						</tr>
					</c:forEach>
					</table>
				</div>
				<hr>
				<div class=reply-review-btns>
				<ul class="nav nav-tabs">
  					<li class="active"><a href="#">Home</a></li>
 					<li><a href="#">Menu 1</a></li>
				</ul>
				</div>
				
				</div>
				<div class="view right" style="background-color: black; height: 100%; width: 30%; float:right; padding-top:2%;"> <!-- width: 30%; float: right; background-color: black;  -->
					<div class="profile_section">
						<!-- 		세션의 profile writer 회원 url(블로그 등)-->
					</div>
					<div class="title_section">
						<span class=titles>${recipe.recipeDTO.title }</span>
						<span class=foodname>${recipe.recipeDTO.foodname }</span>
					</div>
					<div class="elapsedtime-scrap">
						<span class=elapsedtime></span>
						<span class=scrap></span>				
					</div>
					<div class=scrapbtn>
						<!-- button width: 145px; height: 35px; border: none;font-size: 14px;
    border-radius: 35px;    cursor: pointer;    vertical-align: middle;text-indent: 25px;
    					input type hidden 2개, value=세션닉네임 과 이 글 넘버.-->
					</div>
					<div class=rating-hit-claim>
						<span class=rating><img src="../resources/images/kdk/fridge.png" style="display:inline">&nbsp;&nbsp;${recipe.recipeDTO.rating }&nbsp;&nbsp;/&nbsp;&nbsp;5.00</span>
						<br>
						<span class=hit></span>
						<span class=claim>신고하기</span>
					</div>

					<div class=ingre style="position:fixed; display:inline-block;">
						<strong>재료리스트</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${recipe.recipeDTO.amount }인 기준</span>
						<table>
							<c:forEach items="${ingredients }" var="ings">
								<tr>
									<td>${ings.kind }</td>
									<td>${ings.name }</td>
									<td>${ings.amount }</td>
								</tr>
							</c:forEach>
						</table>
					</div>

reply, review
list.: num, writer, contents, time, ref, step, depth
list.: num, writer, contents, rating

				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
				<span style='background-image: url("../resources/images/kdk/btn_top-62b456f2a56a031d3b40e64137fe8aa9.png")' id=topbtn>&nbsp;&nbsp;</span>
			</div>
		</div>
	</div>
<script>
	$('#topbtn').click(function(){
		$('#recipeView').scrollTop(0);
	});
</script>
</div>
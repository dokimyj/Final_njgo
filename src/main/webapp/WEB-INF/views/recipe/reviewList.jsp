<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id=pagearea>
	<div id=ratings title="0">
		<img class="njgo_off" title="1" name="uncheck" style="cursor:pointer" src="../resources/images/kdk/fridge-rating-out.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img class="njgo_off" title="2" name="uncheck" style="cursor:pointer" src="../resources/images/kdk/fridge-rating-out.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img class="njgo_off" title="3" name="uncheck" style="cursor:pointer" src="../resources/images/kdk/fridge-rating-out.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img class="njgo_off" title="4" name="uncheck" style="cursor:pointer" src="../resources/images/kdk/fridge-rating-out.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img class="njgo_off" title="5" name="uncheck" style="cursor:pointer" src="../resources/images/kdk/fridge-rating-out.png">
	</div>
	<hr>
	<div id=inputarea>
		<input type="text" name="contents" id="reply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=reply_btn class="btn btn-warning" value="등록">
	</div>
<c:forEach items="${list}" var="rdto">
	<div class="reply_list" id="${rdto.num}">
		<%-- <c:if test='${rdto.writer eq member.nickname}'> --%>
			<span class="rdel" title="${rdto.num}">삭제</span>
		<%-- </c:if> --%>
		<span class="r_id">${rdto.writer}</span><span class="r_date">${rdto.rating}.0 / 5.0</span>
		<p><div class="r_con">${rdto.contents}</div></p>
	</div>
</c:forEach>
				<div id=pagers>
					<ul class="pagination">
						<c:if test="${listInfo.curBlock>1 }">
							<li><span title='${listInfo.startNum-1 }' style='cursor:pointer'>&lt;</span></li>
						</c:if>
						<c:forEach begin="${listInfo.startNum }" end="${listInfo.lastNum }" step="1" var="i">
							<li><span title='${i}' style='cursor:pointer'>${i}</span></li>
						</c:forEach>
						<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
							<li><span title='${listInfo.lastNum+1 }' style='cursor:pointer'>&gt;</span></li>
						</c:if>
					</ul>
				</div>
<script>
	$('#ratings').on("mouseenter", "img", function(){
		var njgo_off=document.getElementsByClassName('njgo_off');
		$('#ratings').attr('title', $(this).attr('title'));
		for(i=0;i<$(this).attr('title');i++){
			njgo_off[i].src="../resources/images/kdk/fridge-rating-mouseover.png";
		}
		for(i=4;i>$(this).attr('title')-1;i--){
			njgo_off[i].src="../resources/images/kdk/fridge-rating-out.png";
		}
	});
	$('#reply_btn').click(function(){
		var repcont=$('#reply_contents').val();
		var rating=$('#ratings').attr('title');
		if(repcont!=''){
			$.ajax({
				url:'reviewWrite',
				method:"POST",
				data:{
					recipenum:$('#recipenum').val(),
					/* writer:session의 닉네임 */
					contents:repcont,
					rating:rating
				},
				success:function(data){
					$('.reply-review').attr('title', 'inactive');
					$('#review').attr('title', 'active');
					$('#comment_area').load('reviewList?rnum='+$('#recipenum').val());
				}
			});	
		}else{
			alert('내용이 필요합니다!');
		}
	});
	$(".reply_list").on("click",".rdel",function(){
		var num=$(this).attr("title");
		var rnum=$('#recipenum').val();
		if(confirm('정말로 삭제하시겠습니까?')){
			$.get("../recipe/reviewDelete?num="+num+"&rnum="+rnum,function(data){
				$('.reply-review').attr('title', 'inactive');
				$('#review').attr('title', 'active');
				$('#comment_area').load('reviewList?rnum='+$('#recipenum').val());
			});
		}
	});
	$('.pagination').on("click", "span", function(){
		$.ajax({
			url: "reviewList",
			method: "GET",
			data:{
				curPage:$(this).attr('title'),
				rnum:$('#recipenum').val()
			},
			success:function(data){
				$('#pagearea').html(data.trim());
			}
		});
	});
</script>
</div>
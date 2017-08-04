<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<hr>
<c:forEach items="${list}" var="rdto">
	<div class="reply_list" id="${rdto.num}">
		<%-- <c:if test='${rdto.writer eq member.nickname}'> --%>
			<span class="rdel" title="${rdto.num}">삭제</span>
		<%-- </c:if> --%>
		<span class="r_id">${rdto.writer}</span><span class="r_date">${rdto.rating}.0 / 5.0</span>
		<p><div class="r_con">${rdto.contents}</div></p>
	</div>
</c:forEach>
<script>
	
	$('#ratings').on("mouseenter", "img", function(){
		var njgo_off=document.getElementsByClassName('njgo_off');
		for(i=0;i<$(this).attr('title');i++){
			njgo_off[i].src="../resources/images/kdk/fridge-rating-mouseover.png";
		}
	});
	$('#ratings').on("click", "img", function(){
		var njgo_off=document.getElementsByClassName('njgo_off');
		$('#ratings').attr('title', $(this).attr('title'));
		for(i=0;i<$(this).attr('title');i++){
			njgo_off[i].src="../resources/images/kdk/fridge-rating-mouseover.png";
			njgo_off[i].name="check";
		}
	});
	if($('#ratings').attr('title')=='0'){
		$('#ratings').on("mouseleave", "img", function(){
			$('.njgo_off').attr("src","../resources/images/kdk/fridge-rating-out.png");
		});
	}
	$('#reply_btn').click(function(){
		var repcont=$('#reply_contents').val();
		var rating=$('#rating').attr('title');
		if(repcont!=''){
			$.ajax({
				url:'reviewWrite',
				method:"POST",
				data:{
					recipenum:reptype+$('#recipenum').val(),
					/* writer:session의 닉네임 */
					contents:repcont,
					rating:rating
				},
				success:function(data){
					location.reload();
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
				location.reload();
			});
		}
	});
</script>

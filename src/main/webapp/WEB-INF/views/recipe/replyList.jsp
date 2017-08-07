<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id=pagearea>
<div id=inputarea>
	<input type="text" name="contents" id="reply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=reply_btn class="btn btn-warning" value="등록">
</div>
<hr>
<div id=replyarea>
<c:forEach items="${list}" var="rdto">
	<div class="reply_list" id="${rdto.num}">
		<c:if test="${rdto.depth>0 }">
		<c:forEach begin="1" end="${rdto.depth }" step="1">
			&nbsp;&nbsp;
		</c:forEach>
		</c:if>
		<%-- <c:if test='${rdto.writer eq member.nickname}'> --%>
		<span class="rmod" title="${rdto.num}" style="border:1px solid black; border-radius:3px; cursor:pointer;">수정</span>
		<span class="rdel" title="${rdto.num}" style="border:1px solid black; border-radius:3px; cursor:pointer;">삭제</span>
		<%-- </c:if> --%>
		<span class="r_reply" title="${rdto.num}" style="border:1px solid black; border-radius:3px; cursor:pointer;">답글</span>
		<span class="r_id" style="cursor:pointer;">${rdto.writer}</span><span class="r_date">${rdto.time}</span>
		<br>
		<c:if test="${rdto.depth>0 }">
		<c:forEach begin="1" end="${rdto.depth }" step="1">
			<img src="../resources/images/kdk/reply_icon.png">
		</c:forEach>
		</c:if>
			<div class="r_con" style="display:inline">${rdto.contents}</div>
		<p id=replyinput style="display:none"><input type="text" name="contents" id="replyReply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type=button id=replyReply_btn class="btn btn-warning" style="background-color:#ffcc00" value="등록">&nbsp;&nbsp;
			<input type=button id=replyMod_cancel class="btn btn-warning" style="background-color:#ffcc00" value="취소">
		</p>
	</div>
</c:forEach>
</div>
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
	$('#reply_btn').click(function(){
		var repcont=$('#reply_contents').val();
		if(repcont!=''){
			$.ajax({
				url:'replyWrite',
				method:"POST",
				data:{
					recipenum:$('#recipenum').val(),
					/* writer:session의 닉네임 */
					contents:repcont
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
			$.get("../recipe/replyDelete?num="+num+"&rnum="+rnum,function(data){
				location.reload();
			});
		}
	});
	$(".reply_list").on("click",".rmod",function(){
    	var num = $(this).attr("title");
    	var rnum=$('#recipenum').val();
    	$("#replyarea").load("../recipe/replyUpdate?num="+num+"&recipenum="+rnum);
     });	
	$(".reply_list").on("click", ".r_reply", function(){
		var num = $(this).attr("title");
    	var rnum=$('#recipenum').val();
    	$('#replyinput').css('display', 'block');
    	$("#replyReply_btn").click(function(){
    		var modcon = $("#replyReply_contents").val();
    		$.get("replyReply", {num:num, recipenum:rnum, contents:modcon}, function(data){
    			location.reload();
    		});
     	}); 
	});
	$('.pagination').on("click", "span", function(){
		$.ajax({
			url: "replyList",
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
	$("#replyMod_cancel").on("click", function(){
		if(confirm('작성을 취소하시겠습니까?')){
			location.reload();	
		}
	});
</script>
</div>
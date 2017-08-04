<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="text" name="contents" id="replyMod_contents" value="${content.contents}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=replyMod_btn class="btn btn-warning" value="등록">
<input type="hidden" id="replynum" value="${content.num }">
<input type="hidden" id="recnum" value="${content.recipenum }">
<script>
$("#replyMod_btn").on("click", function(){
	var modcon = $("#replyMod_contents").val();
	var num=$("#replynum").val();
	$.post("replyUpdate", {num:num, contents:modcon}, function(data){
		location.reload();
	});
});
</script>
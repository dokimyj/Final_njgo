<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<div class="clear"><input type="hidden" id="pagetype" value="${pagetype }"></div>	
<br>
<div id=pagers title="${list.totalCount}">
	<ul class="pagination">
		<c:if test="${list.listInfo.curBlock>1 }">
			<li><span title="${list.listInfo.startNum-1 }" style='cursor:pointer'>&lt;</span></li>
		</c:if>
		<c:if test="${list.listInfo.curBlock<listInfo.totalBlock }">
			<li><span title="${list.listInfo.lastNum+1 }" style='cursor:pointer'>&gt;</span></li>
		</c:if>
	</ul>
</div>
<script>	
		$('.overlays').css("background", "none");
		$('.creators').css("visibility", "hidden");
		$('.counts').css("visibility", "hidden");
			
		$('.main_concep_channel').mouseover(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background-image", "url('./resources/images/kdk/thumb_over_rev1.png')");
			$('#creators'+num).css("visibility", "visible");
			$('#counts'+num).css("visibility", "visible");
		});
		$('.main_concep_channel').mouseleave(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background", "none");
			$('#creators'+num).css("visibility", "hidden");
			$('#counts'+num).css("visibility", "hidden");		
		});
		$('.main_concep_channel').click(function(){
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			$.ajax({
				url: "./recipe/recipeView",
				method: "GET",
				data:{
					curIng:ar,
					num:$(this).attr('title')
				},
				success:function(data){	
				}
			});
		});
		$('.more').click(function(){
			$.ajax({
				url: "./recipe/tvsearch",
				method: "GET",
				data: {
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
				},
				success:function(data){	
				}
			});
		});
</script>
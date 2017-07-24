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
	$('.c_kind').click(function(){
		$('.c_kind').attr('title', 'inactive');
		$(this).attr('title', 'active');
		$.ajax({
			url: "./recipe/catesearch",
			type: "GET",
			data:{
				c_kind:$(this).html(),
				c_situation:$('.c_situation[title=active]').html(),
				c_ingredient:$('.c_ingredient[title=active]').html(),
				c_procedure:$('.c_procedure[title=active]').html()
			},
			success:function(data){
				$('#results').html(data.trim());
			}
		});	
	});
	if($('#pagers').attr('title')<9){
		$('.pagination>ul>li>span').css('display', 'none');
	}
</script>
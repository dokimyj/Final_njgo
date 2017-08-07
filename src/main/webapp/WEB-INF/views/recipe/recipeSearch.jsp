<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:forEach items="${list.listPack }" var="dto">
				<div class=main_concep_channel title=${dto.num } data-toggle="modal" style="cursor:pointer" data-target="#recipeView">		
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
						<div style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${dto.title }</div><div></div>
					</div>
					<div class=misc>
						<div class="elaspedtime" style="display:inline">
							<div style="display:inline"><img src="../resources/images/kdk/icon-157349_640.png" style="display:inline">&nbsp;&nbsp;${dto.elapsedtime }</div>
						</div>	
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<div class="scraps" style="display:inline">
							<div style="display:inline"><img src="../resources/images/kdk/blackheart.png" style="display:inline">&nbsp;&nbsp;${dto.scrap }</div>
						</div>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<div class="ratings" style="display:inline">
							<div style="display:inline"><img src="../resources/images/kdk/fridge-over.png" style="display:inline">&nbsp;&nbsp;${dto.rating }</div>
						</div>
					</div>	
				</div>
			</c:forEach>
		
		<div class="clear"></div>
		<div id=pagers title='${list.totalCount }'>
			<ul class="pagination">
				<c:if test="${list.listInfo.curBlock>1 }">
					<li><span title='${list.listInfo.startNum-1 }' style='cursor:pointer'>&lt;</span></li>
				</c:if>
				<c:forEach begin="${list.listInfo.startNum }" end="${list.listInfo.lastNum }" step="1" var="i">
					<li><span title='${i}' style='cursor:pointer'>${i}</span></li>
				</c:forEach>
				<c:if test="${list.listInfo.curBlock<listInfo.totalBlock }">
					<li><span title='${list.listInfo.lastNum+1 }' style='cursor:pointer'>&gt;</span></li>
				</c:if>
			</ul>
		</div>
		<div id=tvresult>
			<c:forEach items="${list.tvlist }" var="tvdto">
				<div class=main_concep_channel title=${tvdto.num } data-toggle="modal" style="cursor:pointer" data-target="#recipeView">		
					<div class="channel_img" style='background-image:url("../resources/upload/${tvdto.rep_pic }")'>
					<div id="overlays${tvdto.num }" class=overlays>
						&nbsp;
						<br>
						<br>
						<br>
						<br>
						<div id="counts${tvdto.num }" class=counts></div>
						<br>					
						<br>
						<br>
						<div id="creators${tvdto.num }" class=creators>by ${tvdto.writer}</div>
						<br>
					</div>
					</div>			
					<div class="channel_title">				
						<div>${tvdto.foodname }</div>		
					</div>
					<div class="channel_info">
						<div style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${tvdto.title }</div><div></div>
					</div>
					<div class=misc>
							<div class="elaspedtime" style="display:inline">
								<div style="display:inline"><img src="../resources/images/kdk/icon-157349_640.png" style="display:inline">&nbsp;&nbsp;${tvdto.elapsedtime }</div>
							</div>	
							&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<div class="scraps" style="display:inline">
								<div style="display:inline"><img src="../resources/images/kdk/blackheart.png" style="display:inline">&nbsp;&nbsp;${tvdto.scrap }</div>
							</div>
							&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<div class="ratings" style="display:inline">
								<div style="display:inline"><img src="../resources/images/kdk/fridge-over.png" style="display:inline">&nbsp;&nbsp;${tvdto.rating }</div>
							</div>
					</div>		
				</div>
		</c:forEach>
		</div>
		<div class="clear"></div>
			<div id=pagers title='${list.totalCount }'>
				<ul class="pagination">
					<c:if test="${list.listInfo.curPage>1 }">
						<li><span title='${list.listInfo.curPage-1 }' style='cursor:pointer'>&lt;</span></li>
					</c:if>
					<c:if test="${list.listInfo.curPage<list.totalCount/3 }">
						<li><span title='${list.listInfo.curPage+1 }' style='cursor:pointer'>&gt;</span></li>
					</c:if>
				</ul>
			</div>
		<c:forEach items="${curIng }" var="ings">
			<input type="hidden" name="curIng" value="${ings }">
		</c:forEach>
		<input type="hidden" id="find" value="${list.listInfo.find }">			
		<script>
		$('.overlays').css("background", "none");
		$('.creators').css("visibility", "hidden");
		$('.counts').css("visibility", "hidden");
			
		$('.main_concep_channel').mouseover(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background-image", "url('../resources/images/kdk/thumb_over_rev1.png')");
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
			var curIng=document.getElementsByName('curIng');
			var url="recipeView?num="+$(this).attr('title');
			if(curIng.length*1!=0){
				for(i=0;i<curIng.length;i++){
					url+="&curIng="+curIng[i].value;
				}
			}else{
				url+="&curIng=undefined"
			}
			location.href=url;
		});
		$('.c_kind').click(function(){
			$('.c_kind').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "catesearch",
				type: "GET",
				data:{
					c_kind:$(this).html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.c_situation').click(function(){
			$('.c_situation').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "catesearch",
				type: "GET",
				data:{
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$(this).html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.c_ingredient').click(function(){
			$('.c_ingredient').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "catesearch",
				type: "GET",
				data:{
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$(this).html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.c_procedure').click(function(){
			$('.c_procedure').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "catesearch",
				type: "GET",
				data:{
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$(this).html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.pagination').on("click", "span", function(){
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "catesearch",
				method: "GET",
				data:{
					curPage:$(this).attr('title'),
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});
		});
		function search(find){
		    if(event.keyCode == 13){
		    	location.href="search?find="+find.value
			}
		}
		function ingsearch(find){
			$.ajax({
				url:"inglist",
				type:"GET",
				data:{
					find:find.value
				},
				success:function(data){
					$('.ings').html(data.trim());
				}
			});
		}
		$('.ing_btn').click(function(){
			var ings=$('.ingkeyword').val();
			$('.ing_search').append('<span class="btn btn-warning ingx" style="margin: 0 1% 1% 0" title="'+ings+'">'+ings+'<strong class="badge ing" style="cursor:pointer">X</strong></span>');
			$('.ingkeyword').val('');
		});
		$('.ing_search').on("click", ".ingx", function(){
			$(this).remove();
		});
		$('.isearch_btn').click(function(){
			var url="isearch";
			var x=document.getElementsByClassName('ingx');
			for(i=0;i<x.length;i++){
				url+="?ingredients="+x[i].title+"&";
			}
			url+="curPage=1";
			if($('.ing_search').html()!=''){
				location.href=url;
			}else{
				alert('재료를 선택하신 후 검색해 주세요!');
			}
		});
		</script>
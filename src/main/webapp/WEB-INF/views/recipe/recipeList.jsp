<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>N.J.GO</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/kdk/recipeList_Search.css">
<link rel="stylesheet" href="../resources/css/kdk/Main_Ingre.css">
<link rel="stylesheet" href="http://d1hk7gw6lgygff.cloudfront.net/assets/application-661e969b01a864ad51eee95fed275e3a.css">
<style>
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
	<!-- 태그별 검색 -->
		<div class=categories>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="cate">종류별</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_kind title=active>전체</span>&nbsp;&nbsp;<span class=c_kind>밑반찬</span>&nbsp;&nbsp;<span class=c_kind>메인반찬</span>&nbsp;&nbsp;<span class=c_kind>국/탕</span>&nbsp;&nbsp;<span class=c_kind>찌개</span>&nbsp;&nbsp;<span class=c_kind>디저트</span>&nbsp;&nbsp;<span class=c_kind>면/만두</span>&nbsp;&nbsp;<span class=c_kind>밥/죽/떡</span>&nbsp;&nbsp;<span class=c_kind>퓨전</span>&nbsp;&nbsp;<span class=c_kind>김치/젓갈/장류</span>&nbsp;&nbsp;<span class=c_kind>양념/소스/잼</span>&nbsp;&nbsp;<span class=c_kind>양식</span>&nbsp;&nbsp;<span class=c_kind>샐러드</span>&nbsp;&nbsp;<span class=c_kind>스프</span>&nbsp;&nbsp;<span class=c_kind>빵</span>&nbsp;&nbsp;<span class=c_kind>과자</span>&nbsp;&nbsp;<span class=c_kind>차/음료/술</span>&nbsp;&nbsp;<span class=c_kind>기타</span><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="cate">상황별</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_situation title=active>전체</span>&nbsp;&nbsp;<span class=c_situation>일상</span>&nbsp;&nbsp;<span class=c_situation>초스피드</span>&nbsp;&nbsp;<span class=c_situation>손님접대</span>&nbsp;&nbsp;<span class=c_situation>술안주</span>&nbsp;&nbsp;<span class=c_situation>다이어트</span>&nbsp;&nbsp;<span class=c_situation>도시락</span>&nbsp;&nbsp;<span class=c_situation>영양식</span>&nbsp;&nbsp;<span class=c_situation>간식</span>&nbsp;&nbsp;<span class=c_situation>야식</span>&nbsp;&nbsp;<span class=c_situation>푸드스타일링</span>&nbsp;&nbsp;<span class=c_situation>해장</span>&nbsp;&nbsp;<span class=c_situation>명절</span>&nbsp;&nbsp;<span class=c_situation>이유식</span>&nbsp;&nbsp;<span class=c_situation>기타</span><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="cate">재료별</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_ingredient title=active>전체</span>&nbsp;&nbsp;<span class=c_ingredient>소고기</span>&nbsp;&nbsp;<span class=c_ingredient>돼지고기</span>&nbsp;&nbsp;<span class=c_ingredient>육류</span>&nbsp;&nbsp;<span class=c_ingredient>채소류</span>&nbsp;&nbsp;<span class=c_ingredient>해물류</span>&nbsp;&nbsp;<span class=c_ingredient>달걀/유제품</span>&nbsp;&nbsp;<span class=c_ingredient>가공식품류</span>&nbsp;&nbsp;<span class=c_ingredient>쌀</span>&nbsp;&nbsp;<span class=c_ingredient>밀가루</span>&nbsp;&nbsp;<span class=c_ingredient>건어물류</span>&nbsp;&nbsp;<span class=c_ingredient>버섯류</span>&nbsp;&nbsp;<span class=c_ingredient>과일류</span>&nbsp;&nbsp;<span class=c_ingredient>콩/견과류</span>&nbsp;&nbsp;<span class=c_ingredient>곡류</span>&nbsp;&nbsp;<span class=c_ingredient>기타</span><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="cate">방법별</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_procedure title=active>전체</span>&nbsp;&nbsp;<span class=c_procedure>볶음</span>&nbsp;&nbsp;<span class=c_procedure>끓이기</span>&nbsp;&nbsp;<span class=c_procedure>부침</span>&nbsp;&nbsp;<span class=c_procedure>조림</span>&nbsp;&nbsp;<span class=c_procedure>무침</span>&nbsp;&nbsp;<span class=c_procedure>비빔</span>&nbsp;&nbsp;<span class=c_procedure>찜</span>&nbsp;&nbsp;<span class=c_procedure>절임</span>&nbsp;&nbsp;<span class=c_procedure>튀김</span>&nbsp;&nbsp;<span class=c_procedure>삶기</span>&nbsp;&nbsp;<span class=c_procedure>굽기</span>&nbsp;&nbsp;<span class=c_procedure>데치기</span>&nbsp;&nbsp;<span class=c_procedure>회</span>&nbsp;&nbsp;<span class=c_procedure>기타</span><br>
			<hr>
		</div>
		<div id="order"> <span class="orders" id="regdate" title="active">최신순</span> | <span class="orders" id="hit">조회순</span> </div>
		<br>
		<!-- 레시피 리스트 3*3, 최신순/hit순 -->
		<div id=searchresult>
			<c:forEach items="${list.listPack }" var="dto">
				<div class=main_concep_channel title=${dto.num } style="cursor:pointer">		
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
						<div>${dto.title }</div><div></div>
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
							<div class="channel_img" style='background-image:url("../resources/upload/${dto.rep_pic }")'>
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
								<div id="creators${tvdto.num }" class=creators>by ${dto.writer}</div>
								<br>
							</div>
							</div>			
							<div class="channel_title">				
								<div>${tvdto.foodname }</div>		
							</div>
							<div class="channel_info">
								<div>${tvdto.title }</div><div></div>
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
				<br>
		<c:forEach items="${curIng }" var="ings">
			<input type="hidden" name="curIng" value="${ings }">
		</c:forEach>
		<input type="hidden" id="find" value="${list.listInfo.find }">
		</div>
	</section>
	<c:import url="../tmp/footer.jsp"/>
	<c:import url="ingSearch.jsp"></c:import>
</body>
<script>	
		$('#order>span').click(function(){
			$('.orders').attr('title', 'inactive');
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
				method: "GET",
				data:{
					order:$(this).attr("id"),
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
</html>
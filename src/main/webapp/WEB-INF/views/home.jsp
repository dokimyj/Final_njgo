<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>N.J.GO</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/common/reset.css">
<c:import url="./tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="./resources/css/common/basic.css">
<link rel="stylesheet" href="./resources/css/kdk/Main_Ingre.css">
<style>
</style>
</head>
<body>
	<c:import url="./tmp/header.jsp"/>
	
	<section class="main_section">
	<!-- 냉장고 재료 검색파트 -->
		<article class="fridge">
			<h3>냉장고를 부탁해! 냉장고에 숨어 있는 재료로 맛있는 요리를 만들어보세요.</h3>
			<h1>내가 가진 재료로 레시피 추천받기</h1>
			<br>
			<div class=selections>
				<input type=text list="ings" autocomplete="on" placeholder="재료명을 쓰고 Enter를 누르면 쉽게 찾을 수 있어요!" onkeydown="ingsearch(this)" class="ingkeyword">
					<datalist id="ings" class="ings">
					</datalist>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary ing_btn" value="추가">
			</div>
			<div class=ing_search></div>
				<input type="button" class="btn btn-primary isearch_btn" value="이 재료로 추천받기" data-dismiss="modal">
		</article>
	<!-- 날씨추천 파트 -->
		<!-- 사용자의 태그를 우선으로 정렬예정 -->
	<!-- 인기(HIT순) 정렬 파트 -->
		<!-- listInfo에 3개를 넣어서 보여주기 -->
	</section>
	<c:import url="./tmp/footer.jsp"/>
<c:import url="./recipe/ingSearch.jsp"></c:import>
</body>
<script>
	function search(find){
	    if(event.keyCode == 13){
	    	location.href="./recipe/search?find="+find.value
		}
	}
	function ingsearch(find){
		$.ajax({
			url:"./recipe/inglist",
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
		var url="./recipe/isearch?curPage=1";
		var x=document.getElementsByClassName('ingx');
		for(i=0;i<x.length;i++){
			url+="&ingredients="+x[i].title;
		}
		if($('.ing_search').html()!=''){
			location.href=url;
		}else{
			alert('재료를 선택하신 후 검색해 주세요!');
		}
	});
	function ingsearch2(find){
		$.ajax({
			url:"./recipe/inglist",
			type:"GET",
			data:{
				find:find.value
			},
			success:function(data){
				$('.ings2').html(data.trim());
			}
		});
	}
	$('.ing_btn2').click(function(){
		var ings=$('.ingkeyword2').val();
		$('.ing_search2').append('<span class="btn btn-warning ingx2" style="margin: 0 1% 1% 0" title="'+ings+'">'+ings+'<strong class="badge ing2" style="cursor:pointer">X</strong></span>');
		$('.ingkeyword2').val('');
	});
	$('.ing_search2').on("click", ".ingx2", function(){
		$(this).remove();
	});
	$('.isearch_btn2').click(function(){
		var url="./recipe/isearch?curPage=1";
		var x=document.getElementsByClassName('ingx2');
		for(i=0;i<x.length;i++){
			url+="&ingredients="+x[i].title;
		}
		if($('.ing_search2').html()!=''){
			location.href=url;
		}else{
			alert('재료를 선택하신 후 검색해 주세요!');
		}
	});
</script>
</html>
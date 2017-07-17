<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>?</title>
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<style>
	.main_concep_channel{
		width: 25%;
	    height: 15%;
	    border-radius: .8rem;
	    background: rgba(255, 255, 255, .9) fixed;
	    margin: 0 4% 5%;
	    display: inline-block;
	    float: left;
	    cursor: pointer;
	    box-shadow: 0 0 15px 2px black;
	    padding: 1% 1% 1% 1%; 
	}
	
	.channel_img{
		position: relative;
	    overflow: hidden;
	    background-size: 100% 100%;
	    background-repeat: no-repeat;
	    width: 99%;
	    /* min-width: 50%; */
	    height: 100%;
	    /* height: 90%; */
	    border-radius: .8rem;
	    margin: % auto;
	    margin: 2% 0% 2% 0%;
	    margin: 2% auto;
	    filter: contrast(80%);
		
	}
	
	.channel_title{
		width: 100%;
		height: 15%;
		margin: 2% 3% 2% 3%;
		float: none;
		color: black;
		max-width: 94%;
		font-size: 30px;
		text-align: left;
		white-space: nowrap;
	}
	
	.channel_info{
		width: 100%;
	    height: 15%;
	    padding: 2% 2% 2% 2%;
	    margin: 0% 0% % 0%;
	    float: left;
	    color: black;
	    max-width: 100%;
	    font-size: 100%;
	    text-align: left;
	    border-radius: .4rem;
	    white-space: nowrap;
	}
	.overlays{
		width: 100%;
		height: 100%;
		
	}	
	.creators{
		color: black;
		font-weight: bold;
		float: right;
		margin-bottom: 0px;
		margin-right: 0.1%;
	}
	.counts{
		color: black;
		font-weight: bolder;
		font-size: 20px;
		text-align: center;
	}
</style>
</head>
<body>
<!-- header파트 -->
	<c:import url="../tmp/header.jsp"/>
	<!-- 메뉴 옆의 내용은 전부 고정, hidden으로 태그 검색 -->
<!-- 메인파트 -->
	<section class="main_section">
		<!-- 태그별 검색 -->
		<div>
		</div>
		<!-- 레시피 리스트 3*3, 최신순/hit순 -->
		<div>
			<c:forEach items="${result }" var="dto">
				<div class=main_concep_channel title=${dto.num }>		
					<div class="channel_img" style='background-image:url("../resources/upload/${dto.rep_pic }")'>
						<div id="overlays${dto.num }" class=overlays>
						&nbsp;
						<br>
						<br>
						<br>
						<br>
						<div id="counts${dto.num }" class=counts>보기</div>
						<br>					
						<br>
						<br>
						<div id="creators${dto.num }" class=creators>${dto.writer}</div>
						<br>
						</div>
					</div>
				
				<div class="channel_title">
									
					<div>${dto.foodname }</div>
							
				</div>
				<div class="channel_info">
					<div>${dto.title }</div>
				</div>	
				</div>
			</c:forEach>
		</div>
		<!-- TV-만개의레시피에서 두 프로그램정도 가져오기(DB에 전부 넣어야 함, 동영상 태그까지) -->
	</section>
<!-- 각주 파트 -->
	<c:import url="../tmp/footer.jsp"/>
		<script>	
			$('.overlays').css("background", "none");
			$('.creators').css("visibility", "hidden");
			$('.counts').css("visibility", "hidden");
			
			$('.main_concep_channel').mouseover(function(){	
				var num=$(this).attr('title');
				$('#overlays'+num).css("background", "rgba(153, 204, 255, .5) fixed");
				$('#creators'+num).css("visibility", "visible");
				$('#counts'+num).css("visibility", "visible");
			});
			$('.main_concep_channel').mouseleave(function(){	
				var num=$(this).attr('title');
				$('#overlays'+num).css("background", "none");
				$('#creators'+num).css("visibility", "hidden");
				$('#counts'+num).css("visibility", "hidden");
			});
		</script>
</body>
</html>
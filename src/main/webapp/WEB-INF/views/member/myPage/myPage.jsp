<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<link rel="stylesheet" media="all" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample_haemeog.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/kdy/member/memberCheck.js"></script>
<!-- 카카오톡 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 해먹남겨 css -->

<style type="text/css">
	/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}


</style>

</head>
<body>
	<c:import url="../../tmp/header.jsp" />

	<section class="main_section">
		<div id="container">



			<div id="dialog-message" title="알림"
				class="haemuk-dialog-with-jquery-ui"></div>
			<!-- TODO 페이지별로 다른 리소스를 사용하는 경우 처리 -->
			<link rel="stylesheet" type="text/css"
				href="http://d1hk7gw6lgygff.cloudfront.net/assets/_css/mypage-0485c54c43e2bfff2e6096a8445ef9fc.css?1501056816">

			<div id="content">
				<section class="sec_mypage">

					<!-- [D] 상단 사용자정보 영역 -->
					<div class="user_information">
						<div class="inner">
							<img alt="${memberDTO.nickName }" id="myPhoto"			
								src="" >

							<strong>냉장고살인마</strong>
							<!-- [D] 베스트유저인 경우	<strong class="best">김문어씨</strong>-->
						<span class="follow"><em>0명 </em>팔로잉</span>

							<p class="link">
								<a target="_blank" href="http://"></a>
							</p>
							<p class="dsc">${memberDTO.info }</p>

							<div class="btn_area">
								<!-- [D] 내 콜렉션인 경우 -->
								<button id="profile_btn" class="btn_config call_profile">프로필설정&gt;</button>
						<!-- =============================The Modal ===============================-->
								<div id="profileModal" class="modal">
								
									  <!-- Modal content -->
									  <div class="modal-content">
									    <span class="close">&times;</span>
									    <p>Some text in the Modal..</p>
									  </div>
								</div>
								
								
								
								
								<!-- <a href="javascript:;" class="btn_share">소개하기</a> -->
							</div>
						</div>
					</div>

					<!-- //상단 사용자정보 영역 -->

					<div class="tab_st1">
						<div class="inner">
							<ul>
								<li class="on"><a href="/mypage"> <strong>마이레시피</strong><em>0</em>
								</a></li>
								<li><a href="/mypage/scraps"> <strong>스크랩</strong><em>2</em>
								</a></li>
								<li><a href="/mypage/following"> <strong>팔로잉</strong><em>1</em>
								</a></li>
									<li><a href="/mypage/following"> <strong>쪽지함</strong><em>1</em>
								</a></li>
									<li><a href="/mypage/following"> <strong>주문내역</strong><em>1</em>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="in_mypage">
						<ul class="lst_recipe">
							<li class="btn_add"><a href="#">나의 레시피 추가하기</a></li>
							<li class="no-recipes">
								<div class="no-content">
									아직 등록하신 레시피가 없습니다.<br>나만의 레시피를 등록해주세요.
								</div>
							</li>
						</ul>
					</div>

				</section>
			</div>

		</div>
	</section>

	<c:import url="../../tmp/footer.jsp" />
</body>
<script type="text/javascript">
	$(function() {
	
		
		if("${memberDTO.myPhoto}"==""||"${memberDTO.myPhoto}"==null){
			$("#myPhoto").attr("src","${pageContext.request.contextPath}/resources/images/common/default.png");
		}
		else{
			$("#myPhoto").attr("src","${memberDTO.myPhoto}");	
		}	
	})
	$("#profile_btn").click(function() {
		$(".modal").css("display","block");
	});
	$(".close").click(function() {
		$(".modal").css("display","none");
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>
</html>
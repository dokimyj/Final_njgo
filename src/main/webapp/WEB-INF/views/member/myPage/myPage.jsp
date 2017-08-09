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
<script type="text/javascript">
	if("${memberDTO}"==""){
		alert("로그인 해주세요.");
		location.href="../login";
	}
	if("${memberDTO.grade}"==1 && "${myPage.grade}">1){
		alert("일반회원 따위가 들어올곳이 아니다. 돌아가라!!!");
		location.href="../../";
	}
	
	
</script>
 <style>
	div.scrollmenu {
		margin-top :-60px;
	    background-color: #333;
	    overflow: auto;
	    white-space: nowrap;
	} 
	
	div.scrollmenu a {
	    display: inline-block;
	    color: white;
	    text-align: center;
	    padding: 14px;
	    text-decoration: none;
	}
	
	div.scrollmenu a:hover {
	   
	    color:black;
	}
</style>
</head>  
<body style="background-color: white">
	<c:import url="../../tmp/header.jsp" />

	<section class="main_section">
		<div id="container">



			<div id="dialog-message" title="알림"
				class="haemuk-dialog-with-jquery-ui"></div>
			<!-- TODO 페이지별로 다른 리소스를 사용하는 경우 처리 -->
		
			<div id="content">
				<section class="sec_mypage">
					
					<!-- [D] 상단 사용자정보 영역 -->
					<div class="user_information">
						<div class="inner">
							<img alt="" id="myPhoto" >
							<strong>${myPage.nickName }</strong>
						
						<span class="follow"><em>${followingCount}명 </em>팔로워</span>

							<p class="link">
								<a target="_blank" href="http://"></a>
							</p>
							<p class="dsc">${myPage.info }</p>

							<div class="btn_area"> 
					   <!-- ========================Follow , 프로필성정 버튼 ================================ -->
								<c:if test="${myPage.nickName eq memberDTO.nickName }">
									<button id="profile_btn" class="btn_config call_profile">프로필설정&gt;</button>
								</c:if>
								<c:if test="${follow eq 'follow' && myPage.nickName ne memberDTO.nickName }">
									<button id="follow_btn" class="btn_config call_profile">팔로우</button>
								</c:if>
								<c:if test="${following eq 'following' && myPage.nickName ne memberDTO.nickName }">
									<button id="followCancel_btn" class="btn_config call_profile">팔로우 취소</button>
								</c:if> 
						<!-- =============================The Profile Modal Start===============================-->
								<div class="modal in" id="profileModal" role="dialog" aria-hidden="false" style="display: none; padding-right: 17px;">
							      <div class="modal-dialog" style="width:570px">
							        <div class="modal-content" style="padding:0;">
							          <div class="modal-header">
							            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/images/common/btn_close.gif" alt="닫기"></span></button>
							            <h4 class="modal-title">프로필 사진 / 자기소개 편집</h4>
							          </div>
							          <div class="modal-body" style="padding:10px;text-align:center;">
							                      <img id="profile_img" src="" style="max-width:550px;max-height:500px;">
							            <div style="margin-top:10px;">
							            <!-- form  -->
							            <form action="profile_upload" method="post" enctype="multipart/form-data">
								            <input type="file" name="myPhoto" id="file_1" style="display:none;" onchange="profileLoad(this)">
								            <input type="hidden" name="email" value="${myPage.email }">
											<p><input type="text" name="info" id="info" class="input-sm" size="60" maxlength="100" placeholder="자기소개를 100자 이내로 작성해 주세요."></p>
							            </form>
							            <button type="button" onclick="document.getElementById('file_1').click();" class="btn btn-primary">프로필 사진 바꾸기</button>
							            <button type="button" id="profileSubmitBtn" class="btn btn-primary" disabled="disabled">저장</button>
							            </div>
							                    </div>
							        </div>
							      </div>
							    </div>
							<!-- =================================== Profile Modal End ======================================= -->	
							
							
	
							</div>
						</div>
					</div>

					<!-- //상단 사용자정보 영역 -->

					<div class="tab_st1">
						<div class="inner">
							<!-- =============================== MyPage 기능 (일반 회원 메뉴) =============================  -->
							<c:if test="${myPage.grade < 2 }">
								<ul>
									<li class="off"><a href="/mypage"> <strong>마이레시피</strong><em></em>
									</a></li>
									<li><a href="/mypage/scraps"> <strong>스크랩</strong><em></em>
									</a></li>
									<li><a role="button" onclick="followingList()"> <strong>팔로잉</strong><em>${followerCount }</em>
									</a></li>
									<c:if test="${myPage.nickName eq memberDTO.nickName }">
											<li><a role="button" onclick="messageList()" > <strong>쪽지함</strong><em></em></a>
												
											</li>
										<li><a href="/mypage/following"> <strong>주문내역</strong><em></em>
									</a></li>
									</c:if>
								</ul>	
							</c:if>
							<!--============================== 운영자, 관리자 메뉴 ====================================  -->
							<c:if test="${myPage.grade > 1 }">
								<ul>
									<li class="off"><a role="button" id="userList"> <strong>사용자 리스트</strong>
									</a></li>
									<li class="off"><a role="button" onclick="messageList(1,'reportList')"> <strong>신고함 </strong><em></em>
									</a></li>
								</ul>
							</c:if>
							
						</div>
					</div>
					<!-- =============================================== 쪽지 Message  ==================================================  -->
					<div class="scrollmenu"  id="message" style="display:none ;margin-left: 470px; width: 50%;text-align: center; background-color: #ffcc00">
					  <a role="button" onclick="messageList(1,'general')"><strong>받은쪽지함</strong></a>
					  <a role="button" onclick="messageList(1,'send')"><strong>보낸쪽지함</strong></a>
					  <a role="button" onclick="messageList(1,'report')"><strong>운영자 쪽지함</strong></a>
					</div>

					<!-- 뿌려주는 곳  -->
					<div class="in_mypage" style="margin-left: 20px;">
						<ul class="lst_recipe" id="result">
								
						</ul>
			
						
					</div>
					

				</section>
			</div>

		</div>
	</section>
	
	<!-- =============================The Message Modal Start===============================-->
								<div id="messageModal" class="modal in" role="dialog" aria-hidden="false" style="display: none; padding-right: 17px;">
							      <div class="modal-dialog" style="width:570px">
							        <div class="modal-content" style="padding:0;">
							          <div class="modal-header">
							            <button type="button" class="close" id="message_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/images/common/btn_close.gif" alt="닫기"></span></button>
							            <h4 class="modal-title" id="msgModalTitle"></h4>
							          </div>
							          <!-- ============= Modal body ==============  -->
								          <div class="modal-body" id="messageModal_body" style="padding:10px;text-align:center;">
								               
									          
								           </div>
							           <!-- ============= Modal body ==============  -->
							        </div>
							      </div>
							    </div>
	<!-- =================================== Message Modal End ======================================= -->	
								
								
	<c:import url="../../tmp/footer.jsp" />
</body>
<script type="text/javascript">
	$(function() {
		
		/* 마이페이지 이미지   */
		// 이미지가 없을경우 기본값
		if("${myPage.myPhoto}"==""||"${myPage.myPhoto}"==null){
			$("#myPhoto").attr("src","${pageContext.request.contextPath}/resources/images/common/default.png");
			$("#profile_img").attr("src","${pageContext.request.contextPath}/resources/images/common/default.png");
		}
		// SNS 회원 처음 가입하면 myPhoto = "sns" 값 , 즉 카카오에 설정되있는 기본 이미지 경로이므로 
		// sns 값이라면 프로필 수정하기 전 이므로 세션에 저장해놓은 kakao 이미지 경로를 src에 넣어준다.
		else if("${myPage.myPhoto}"=="sns"){
			$("#myPhoto").attr("src","${myPage.sns_photo}");	
			$("#profile_img").attr("src","${memberDTO.sns_photo}");	
		}
		// 세션에 저장된 member의 myPhoto 파일 이름을 가져옴
		else {
			$("#myPhoto").attr("src","${pageContext.request.contextPath}/resources/upload/${myPage.myPhoto}");
			$("#profile_img").attr("src","${pageContext.request.contextPath}/resources/upload/${myPage.myPhoto}");
		}
		
	})
	
	/* ========================================== Modal Script ===================================================  */	
	    // 프로필 사진이 수정되면 "저장버튼" 활성화
		$("#file_1").change(function(e) {
			$("#profileSubmitBtn").removeAttr("disabled");
			 	/* if (e.target.files[0].size > (2*1024*1024)) {
			        alert("사진은 2MB까지만 허용됩니다.");
			        return false;
			    }  */	 	
		 }); 
		$("#info").change(function() {
			$("#profileSubmitBtn").removeAttr("disabled");
		});
		
		$("#profileSubmitBtn").click(function() {
			$("form").submit();            
	    });
	
	// 미리보기기능 FileReader사용  
	function profileLoad(value) {
					  var inputImg = $("#file_1").val();
					  alert(inputImg);
			          var reader = new FileReader();         //파일을 읽기 위한 FileReader객체 생성
			          if(inputImg == ''){
		  		            $("#profile_img").removeAttr("src");
		  		            $("#profile_img").hide();
		  		         }
			         if(value.files && value.files[0]){
			           
			            reader.onload = function(e) {         //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			            	
			               $("#profile_img").show();
			               $("#profile_img").attr("src", e.target.result);
			            }
			            reader.readAsDataURL(value.files[0]);    //File내용을 읽어 dataURL형식의 문자열로 저장		          
			         }
			         reader.onerror = function(e){
			        	  alert("읽기 오류:" + e.target.error.code);
			        	  return;
			        	}
  			} // profileLoad
	
	$("#profile_btn").click(function() {
		$("#profileModal").css("display","block");
	});
	$(".close").click(function() {
		$("#profileModal").css("display","none");
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == "modal") {
	        modal.style.display = "none";
	    }
	}
	
	/* ============================================ UserList ======================================================== */
	// 모든 멤버 리스트형식으로 불러옴
	$("#userList").click(function() {
		$(".inner ul li:nth-child(n)").removeClass("on");
		$(".inner ul li:nth-child(1)").addClass("on");
		$.ajax({
			url : "userList",
			data : {
				curPage : 1
			},
			success : function(data) {
				$("#result").html(data);
			}
			
		});//ajax
	}); // functuon
	function userList(num) {
		var type = $("#type").val();
		var url ="userList";
		
		if(type=='grade'){
			url ="grade_view"
		}
		else if(type =='warn'){
			url ="warning_view"
		}

		$.ajax({
			url : url,
			data : {
				curPage : num
			},
			success : function(data) {
				$("#result").html(data);
			}
			
		});//ajax
	}
	
	// 수정 버튼 누르면 -> 저장 버튼으로 바꿔줌 , 읽기전용 -> 수정가능하게 함
	function correct_user(num) {
		$(".user"+num).removeAttr("readonly");
		$(".user"+num).removeAttr("style");
		$("#correct_user"+num).val("저장");
		$("#correct_td"+num).html("<input type='button' class=' btn btn-success'  onclick='store_user("+num+")' value='저장'>");
		
	}
	//저장버튼 누르면 데이터 수정 
	function store_user(num) {
		email = $("#user_email"+num).val();
		nickName = $("#user_nickName"+num).val();
		grade = $("#user_grade"+num).val();
		point = $("#user_point"+num).val();
		curPage = $("#user_curPage").val();
		w_count =$("#user_warn"+num).val();
		$.ajax({
			url : "userUpdate",
			type : "POST",
			data :{
				email : email,
				nickName : nickName,
				grade : grade,
				point : point,
				w_count : w_count,
				curPage : curPage
			},
			success : function(data) {
				$("#result").html(data);
			}
		});
	}
	// 경고 1회 추가
	function warning_user(num) {
		nickName = $("#user_nickName"+num).val();
		email = $("#user_email"+num).val();
		w_count =$("#user_warn"+num).val();
		curPage = $("#user_curPage").val();
		$.ajax({
			url : "userWarn",
			type : "POST",
			data :{
				email : email,
				nickName : nickName,
				w_count : w_count,
				curPage : curPage
			},
			success : function(data) {
				$("#result").html(data);
			}
		});
		
	}
	// 탈퇴시키기
	function delete_user(num) {
		email = $("#user_email"+num).val();
		curPage = $("#user_curPage").val();
		if(confirm("정말로 탈퇴시키시겠습니까?")){
			$.ajax({
				url : "userDelete",
				type : "POST",
				data :{
					email : email,
					curPage : curPage
				},
				success : function(data) {
					$("#result").html(data);
				}
			});	
		}
	}
	// 닉네임으로 검색
	function userSearch() {
			
				nickName = $("#userSearch").val();
				if(nickName ==''){
					alert("닉네임을 입력하세요.");
				}
				else{
					$.ajax({
						url : "userSearch",
						type : "POST",
						data :{
							nickName : nickName
						},
						success : function(data) {
							$("#result").html(data);
						}
					});	
					
				}
	}
	// 경고 순서대로 
	function warning_view() {
		
		$.ajax({
			url : "warning_view",
			type : "POST",
			data :{
				curPage : 1 ,
				
			},
			success : function(data) {
				$("#result").html(data);
			}
		});	
	}		
	// 등급 순으로 보여줌
	function grade_view() {
		$.ajax({
			url : "grade_view",
			type : "POST",
			data :{
				curPage : 1
				
			},
			success : function(data) {
				$("#result").html(data);
			}
		});	
	}
	 /* ========================================= follow ============================================ */
	 
	 $("#follow_btn").click(function() {
		 var login_nickName = "${memberDTO.nickName}";
		 var myPage_nickName = "${myPage.nickName}";
		$.ajax({
			url : "follow",
			type : "POST",
			data :{
				login_nickName : login_nickName,
				myPage_nickName :myPage_nickName
				
			},
			success : function() {
				location.href = "myPage?nickName="+myPage_nickName;
			}
		});	
	});	
	 $("#followCancel_btn").click(function() {
		 var login_nickName = "${memberDTO.nickName}";
		 var myPage_nickName = "${myPage.nickName}";
			$.ajax({
				url : "followCancel",
				type : "POST",
				data :{
					login_nickName : login_nickName,
					myPage_nickName : myPage_nickName
					
				},
				success : function() {
					location.href = "myPage?nickName="+myPage_nickName;
				}
			});	
	});
	 
	 function followingList(num) {
		 var nickName ="${myPage.nickName}";
		 var curPage = num;
		$.ajax({
			url : "followingList",
			type : "POST",
			data :{
				curPage : curPage,
				nickName : nickName
			},
			success : function(data) {
				/* 특정 태그를 선택하면 class="on" 으로 설정 */
				$("#message").css("display","none");
				$(".inner ul li:nth-child(n)").removeClass("on");
				$(".inner ul li:nth-child(3)").addClass("on");
				$("#result").html(data);
			}
		});
	}
	 
	 //===================================== 쪽지함 =======================================
	 //기본적으로 받은 메세지 리스트를 보여줌
     function messageList(curPage,category) {
		 var nickName ="${memberDTO.nickName}";
		 	
		 if(category=='reportList'){
			 $(".inner ul li:nth-child(n)").removeClass("on");
			 $(".inner ul li:nth-child(2)").addClass("on");
		 }else{
    		$(".inner ul li:nth-child(n)").removeClass("on");
			$(".inner ul li:nth-child(4)").addClass("on");
			$("#message").css("display","block"); 
		 }
			$.ajax({
				url : "messageList",
				type :"POST",
				data :{
					nickName : nickName,
					curPage : curPage,
					category : category
				},
				success : function(data) {
					$("#result").html(data);
				}
			});
	 }
	 
   
	 
	 // 쪽지 쓰기
	 // messageWrite.jsp -> messageModal-body에 넣어줌
	 function messageWrite(category) {
		 if(category =='general'){
			 $("#msgModalTitle").text("쪽지 보내기");
		 }else{
			 $("#msgModalTitle").text("신고쪽지 보내기");
		 }
		//var nickName = "${memberDTO.nickName}";
		//1. 제목
		//2. 받는사람
	
		$.ajax({
			url : "messageWrite",
			data : {
			//	nickName : nickName,
				category :category
			},
			success : function(data) {
				$("#messageModal_body").html(data);
				$("#messageModal").css("display","block");
			}
		});
	}
	
	 // message send  쪽지 보내기
	 $(".modal-body").on("click","#message_send",function() {
		 
		 	var get_nickName = 	$("#get_nickName").val(); 								
		 	var contents = $("#contents").val();				// 메세지 내용
		 	var title = $("#title").val();						
		 	var category = $("#category").val();				// 작성자에게 질문 하는 메세지 : general , 신고 = report
		 	var send_nickName = "${memberDTO.nickName}";		// 로그인한 계정의 닉네임
		 	if(category =='reportList'){
		 		send_nickName ='운영자';
		 	}
		 	
			$.ajax({
				url : "messageSend",
				type : "POST",
				data : {
					send_nickName : send_nickName,
					get_nickName : get_nickName,
					contents : contents,
					title : title,
					category : category,
					
				},
				success : function(data) {
					alert("쪽지를 보냈습니다.");
					messageList(1 , category);
					$("#messageModal").css("display","none");
				}
			})
	});
	 
	 //message View  쪽지 보기
	 function messageView(m_num) {
		 $("#msgModalTitle").text("쪽지 보기");
		var category = $("#message_category").val();
		 $.ajax({
				url : "messageView",
				data : {
					m_num : m_num,
					category : category
				},
				success : function(data) {
					$("#messageModal_body").html(data);
					$("#messageModal").css("display","block");
				}
			}); 
	}
	 
	 $("#message_close").click(function() {
			$("#messageModal").css("display","none");
			
			messageList(1 , $("#category").val());
	});
	 
	 
	 //messageReply 쪽지 답변
	 function messageReply(nickName) {
		 $("#msgModalTitle").text("답변 쪽지 보내기");
		 var category = $("#category").val();
		 
		 $.ajax({
				url : "messageWrite",
				data : {
				 	nickName : nickName,
					category :category
				},
				success : function(data) {
					$("#messageModal_body").html(data);
					$("#messageModal").css("display","block");
				}
			});
	}
	 
	
</script>
</html>
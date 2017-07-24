<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>냉장GO Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
</head>
<body>
	<c:import url="../tmp/header.jsp"/>

	<section class="main_section">
	
		<div class="container_etc" style="width:460px;">
		  <h2 style="font-size: 2em;">로그인</h2>
		  <div class="panel-body"> 
		    <form name="form_login" id="formLogin" method="post" action="memberLogin" autocomplete="off" onsubmit="return doSubmit()">
		  
		      <div class="form-group">
		        <input type="text" name="email" class="form-control" id="id_user" placeholder="email">
		          <input type="hidden" name="login_mode" class="form-control" id="login_mode"  value="general_join">
		        <span id="idMsg" style="display:none;color:#FF0000;">아이디를 입력해주세요.</span>
		      </div>
		      <div class="form-group">
		        <input type="password" name="pw" class="form-control" id="tx_passwd" placeholder="비밀번호">
		        <span id="pwMsg" style="display:none;color:#FF0000;">비밀번호를 입력해주세요.</span>
		      </div>
		        <input type="hidden" name="kakaoID" class="form-control" id="kakaoID" >
		      <button type="submit" id="btn_login" class="btn-primary btn-lg btn-block" style="margin-left: 0px;">로그인</button>
		      
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" name="login_perma" value="1"><span class="guide_txt">로그인 상태 유지</span>
		        </label>
		      </div>
		    </form>
		    <p class="help-block">개인정보 보호를 위해 개인 PC에서만 사용하세요.</p>
		    <div class="etc_line"></div>
		    <div class="join_btn">
		        <a href="provision?login_mode=general_join&access_token=">회원가입</a><span class="space_line">|</span>
		        <a href="${pageContext.request.contextPath}/member/find_password">비밀번호 찾기</a><span class="space_line">|</span>
		        
		    </div>
		    
		  <button type="button" onclick="loginWithKakao()" class="btn btn-primary btn-lg btn-block join_k"><span>카카오톡으로 로그인</span></button>
		  </div>
		</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
<script>
	if("${message}"!=""){
		alert("${message}");
	}
	$(function() {
	    $('#id_user').focus();
	    Kakao.init('cd868dba3cc2bd18d62a147752f2347c');
	});

	
	function doSubmit()
	{
	    if(!$('#id_user').val())
	    {
	        $('#idMsg').show();
	        $('#id_user').focus();
	        return false;
	    }
	    if(!$('#tx_passwd').val())
	    {
	        $('#pwMsg').show();
	        $('#tx_passwd').focus();
	        return false;
	    }
	    return true;
	}


	function loginWithKakao() { 
		//1. 로그인
	    Kakao.Auth.login({
	        persistAccessToken : true,  // 세션이 종료된 뒤에도 Access Token을 사용할수 있도록 로컬 스토리지에 저장
	        success: function(authObj) {				
	        	 alert(JSON.stringify(authObj));
	        	
	        	  //2. 앱 연결 유무 확인
		       	  Kakao.API.request({
		       		url : "/v1/user/signup",
		       		success: function(res){	 //앱에 가입되지 안앗음... 바로 회원가입 약관 페이지로 이동
		       		 location.href ="provision?login_mode=SNS_join&access_token="+Kakao.Auth.getAccessToken(); 
		       		} ,
		       		// 이미 앱에 연결되있는 상태 즉,  회원가입 신청을 위해 1번이라도 kakao 로그인함
		       		// 냉장GO에 가입했을수도잇고 안했을수도 잇음, 단지 앱 연결만 된상태
		       	    fail: function() {
		       	    	
		       	    	// 3. 연결된 앱에 사용자 아이디 정보 가져오기
			       	  	Kakao.API.request({
			 	     		url : "/v1/user/me",
			 	     		
			 	     		success: function(data){
			 	     			var kakaoID = JSON.stringify(data.id);
			 	     			/* var result = JSON.stringify(data); */
			 	     		
			 	     			//data = JSON으로 앱에 연결된 사용자 정보를 가져옴 
			 	     			//data.id = 앱에 연결됫을때 고유한 id값을 부여받음 그걸 가져옴
			 	     			// 왜냐면 앱 연결은 됫지만 냉장GO 홈페이지에선 "가입"했는지 " 미가입" 했는지 모르기때문.
			 	     			$.ajax({
			 	     				url : "kakaoIDCheck",
			 	     				type: "POST",
			 	     				data : {
			 	     					kakaoID : data.id
			 	     				},
			 	     				//
			 	     				success : function(result) {
			 	     					/* alert(result.trim()); */
			 	     					// 냉장GO DB에 앱에 연결된 고유한 id값이 저장되 있다는뜻,
			 	     					// 즉, 회원가입이 되있는 상태이므로 로그인을 가능
									 	if(result.trim()==0){
									 		location.href="memberLogin?login_mode=SNS_join&kakaoID="+kakaoID;
											/* $("#kakaoID").val(data.id);
											$("#btn_login").submit(); */
										} 
									 	if(result.trim()==1){
									 		 location.href ="provision?login_mode=SNS_join&access_token="+Kakao.Auth.getAccessToken(); 
										} 
									}
			 	     			});
			 	     			
			 	     		}
			 	     	}); 
					}
		       	  
		   	      }); 
   	
	        },
	        fail: function(err) {
	            console.log(JSON.parse(err));
	        }
	    });
	}

	
	</script>

</html>
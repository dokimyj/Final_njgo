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

<!-- 카카오톡 로그인 추가 -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <!-- 카카오톡 로그인 추가 --> 
  
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
		        <span id="idMsg" style="display:none;color:#FF0000;">아이디를 입력해주세요.</span>
		      </div>
		      <div class="form-group">
		        <input type="password" name="pw" class="form-control" id="tx_passwd" placeholder="비밀번호">
		        <span id="pwMsg" style="display:none;color:#FF0000;">비밀번호를 입력해주세요.</span>
		      </div>
		      <button type="submit" class="btn-primary btn-lg btn-block" style="
		    margin-left: 0px;
		">로그인</button>
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
	    Kakao.Auth.login({
	        persistAccessToken : false,
	        success: function(authObj) {
				
	        	alert(JSON.stringify(authObj));
		      /*  Kakao.Auth.logout();    */
	        	 Kakao.API.request({
	        		url : "/v1/user/signup",
	        		success: function(res){
	        			
	        		}
	        		
	        	});   
	        		
	        	location.href ="provision?login_mode=SNS_join&access_token="+Kakao.Auth.getAccessToken(); 
	        	
	        },
	        fail: function(err) {
	            console.log(JSON.parse(err));
	        }
	    });
	}

	
	</script>

</html>
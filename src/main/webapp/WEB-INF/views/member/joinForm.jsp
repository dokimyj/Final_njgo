<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/kdy/member/memberCheck.js"></script>
<!-- 카카오톡 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<script type="text/javascript">
//form Check
function doSubmit(login_mode)
{	
	if(login_mode =='general_join'){
		if(chkEmail()==0){
			return false;
		}
		if(chkPw1()==0){
			return false;
		}
		if(chkPw2()==0){
			return false;
		}
	}
	if(chkNick()==0	){
		return false;
	}
	if(chkName()==0){
		return false;
	}
	if(chkPhone()==0){
		return false;
	}
	
    if($("#gender").val()=="" || $("#gender").val()==null)
    {
    	$("#genderMsg").css("color","red");
		$("#genderMsg").css("display","block");
		$("#genderMsg").text("성별을 선택해주세요.");
        return false;
    }

    
    return true;
}
</script>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="container_etc" style="width:460px;">
	      <h2 style="font-size: 2em;">회원가입</h2>
	        <form name="form_insert" id="frmInsert" method="post" action="${path }" autocomplete="off" onsubmit="return doSubmit('${login_mode}')">
	          <input type="hidden" id="kakao" value="">
	          <!-- Email 입력 -->
	          <!-- 일반회원  -->
	          <c:if test="${login_mode eq 'general_join' }">
	          
		          <div id="idFrms" class="form-group has-feedback has-error">
		            <input type="email" name="email" class="form-control" id="email" required="required" autocomplete="off" onblur="chkEmail()" placeholder="email, 예)email@naver.com">
		            <span id="emailStatus" class="glyphicon form-control-feedback glyphicon-remove" aria-hidden="true"></span>
		            <span id="emailMsg" style="display:none;" class="text-danger"></span>
		          </div>
		          <!-- 비밀번호 입력 -->
		          <div id="pwFrms" class="form-group has-feedback">
		            <input type="password" name="pw" class="form-control" id="pw" onblur="chkPw1()"  placeholder="비밀번호">
		            <span id="pwStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
		            <span id="pwMsg" style="display:none;"></span>
		          </div>
		          <div id="pwFrms2" class="form-group has-feedback mag_b_10">
		            <input type="password" name="pw2" class="form-control" id="pw_check" onblur="chkPw2()" placeholder="비밀번호확인">
		            <span id="pwStatus2" class="glyphicon form-control-feedback" aria-hidden="true"></span>
		            <span id="pwMsg2" style="display:none;" class="text-danger">비밀번호 확인을 입력해주세요.</span>
		          </div>
		          <!-- KAKAO ID 입력 -->
		          <div id="emailFrms" class="form-group has-feedback">
		            <input type="text" name="kakaoID" class="form-control" id="kakaoID" onblur="chkKakao()" placeholder="카카오 아이디 ,나중에 추가하셔도됩니다!">
		           
		          </div>
	          </c:if>
	           <!-- 닉네임 --> 
	          <div id="nickFrms" class="form-group has-feedback mag_b_10">
	            <input type="text" name="nickName" class="form-control" id="nickName" onblur="chkNick()" placeholder="닉네임" required="required">
	            <span id="nickNameStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
	            <span id="nickMsg" style="display:none;"></span>
	          </div>
	          
	          <!-- 이름  -->
	           <div id="nameFrms" class="form-group has-feedback ">
	            <input type="text" name="name" class="form-control" id="name" onblur="chkName()" placeholder="이름" required="required">
	            <span id="nameStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
	            <span id="nameMsg" style="display:none;"></span>
	          </div>
	           
	          <!-- 주소 API 필요 -->
	          <div id="addressFrms" class="form-group has-feedback">
				<input type="text" id="roadFullAddr" class="form-control"  name="address" placeholder="주소입력, 마우스 클릭!" onClick="goPopup();" required="required"/>
	            <span id="addressStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
	            <span id="addressMsg" style="display:none;"></span>
	          </div>
	          
	          <!-- 핸드폰 번호  -->
	           <div id="phoneFrms" class="form-group has-feedback">
	            <input type="text" name="phone" class="form-control" id="phone" onblur="chkPhone()" placeholder="휴대전화번호 " required="required">
	            <span id="phoneStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
	            <span id="phoneMsg" style="display:none;"></span>
	          </div>
	          
	
	          <!-- 성별 -->
	          <div class="form-group has-feedback" >
	            <div class="btn_gender" style="width:220px;left:20px;">
	              <span class="input-group-btn">
	                <button type="button" id="tg_male" class="btn btn-sm btn-default" style="width:100px;" onclick="chkGender('m')">남자</button>
	              </span>
	              <span class="input-group-btn">
	                <button type="button" id="tg_female" class="btn btn-sm btn-default" style="width:100px;" onclick="chkGender('f')">여자</button>
	              </span>
	            </div>
	            <input type="text" class="form-control" disabled="">
	            <span id="genderMsg" style="display:none;"></span>
	          </div>
	          <input type="hidden" name="gender" id="gender">
	          <input type="hidden" name="joinCode" value="${joinCode }"> 
	          <input type="hidden" name="login_mode" value="${login_mode }"> 
	          <!-- 카카오톡 가입시 필요  -->
	          <c:if test="${login_mode eq 'SNS_join' }">  
	          	  <input type="hidden" name="grade" value="1">
		          <input type="hidden" name="email" id="SNS_email" value="">
		          <input type="hidden" name="myPhoto"  value="sns">
		          <input type="hidden" name="SNS_photo" id="SNS_photo">
		          <input type="hidden" name="kakaoID" id="SNS_id" value=""> <!-- 앱에 처음 연결시 저장되는 고유 id값 -->
	          </c:if>
	          <!-- 이미지 테스트  -->
	         <!--  <div>
					<img alt="" id="SNS_photo2" src="">	          
	          </div> -->
	          <button type="button" id="join_btn" class="btn btn-primary btn-block btn-lg">회원가입</button>
	      </form></div>
      </section>
      
      <c:import url="../tmp/footer.jsp"/>
</body>
<script type="text/javascript">
	$(function() {
	 Kakao.init('cd868dba3cc2bd18d62a147752f2347c');
		if("${login_mode}"=="SNS_join"){
			 	 
			 Kakao.API.request({
	     		url : "/v1/user/me",
	     		
	     		success: function(res){
	     			var result = JSON.stringify(res);
	     			$("#SNS_email").val(res.kaccount_email);
	     			$("#SNS_photo").val(res.properties.profile_image);
	     			$("#SNS_id").val(res.id);
	     			
	     		}
	     	});  		
		}
	});
	// 회원가입 Button
	$("#join_btn").click(function() {
		
		// 나에게 메세지 보내기
		if("${login_mode}"=='SNS_join'){
			Kakao.API.request({
				url : "/v2/api/talk/memo/send",
				data : {
					template_id : 4970
				},
				success : function(data) {	
				}
			});		
		}
		
		$("form").submit();
	});
	
</script>

</html>
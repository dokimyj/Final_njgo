<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/kdy/member/memberCheck.js"></script>
<script type="text/javascript">
	if("${memberDTO}"==""){
		alert("로그인 해주세요.");
		location.href="login";
		
	}
</script>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>

	<section class="main_section">
		<div class="container_etc" style="width:460px;">
  <h2>회원정보 수정</h2>
  <div class="panel-body etc_wrap">
      <!--======================================== 닉네임 변경 ================================================-->
    <p style="margin:15px 0;line-height:34px;"><span id="cur_nick"><strong>${memberDTO.nickName }</strong>
        <button type="button" onclick="$('#updNick').show()" class="btn btn-default" style="float:right;">닉네임 수정</button>
        </span></p>
       <div id="updNick" style="display:none;margin-top:20px;">
          <div id="nickFrms" class="form-group has-feedback">
            <input type="text" name="nickName" class="form-control" id="nickName" placeholder="닉네임" onblur="chkNick()">
            <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nickMsg" style="display:none;"></span>
          </div>
          <p style="text-align:center"><button type="button" onclick="infoCorrectSend($('#nickName').val(),'nickName','${memberDTO.email}')" class="btn btn-primary" style="width:150px">변경</button></p>
          <p class="help-block">닉네임은 변경후 24시간동안 다시 변경할 수 없습니다.<br>변경전에 잘 확인해 주세요.</p>
        </div>
        <div class="etc_line"></div>
     <!--======================================== 이름 변경 ================================================-->
    <p style="margin:15px 0;line-height:34px;"><span id="cur_nick"><strong>${memberDTO.name }</strong>
        <button type="button" onclick="$('#updName').show()" class="btn btn-default" style="float:right;">이름 수정</button>
        </span></p>
       <div id="updName" style="display:none;margin-top:20px;">
          <div id="nameFrms" class="form-group has-feedback">
            <input type="text" name="name" class="form-control" id="name" placeholder="이름" onblur="chkName()">
            <span id="nameStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nameMsg" style="display:none;"></span>
          </div>
          <p style="text-align:center"><button type="button" onclick="infoCorrectSend($('#name').val(),'name','${memberDTO.email}')" class="btn btn-primary" style="width:150px">변경</button></p>
        </div>
        <div class="etc_line"></div>
     <!--======================================== 카카오톡 아이디 변경 ================================================-->
    <p style="margin:15px 0;line-height:34px;"><span id="cur_nick"><strong>${memberDTO.kakaoID }</strong>
        <button type="button" onclick="$('#updkakaoID').show()" class="btn btn-default" style="float:right;">카카오아이디 수정</button>
        </span></p>
       <div id="updkakaoID" style="display:none;margin-top:20px;">
          <div id="kakaoIDFrms" class="form-group has-feedback">
            <input type="text" name="kakaoID" class="form-control" id="kakaoID" placeholder="카카오아이디" onblur="chkKakao()">
            <span id="kakaoIDStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="kakaoIDMsg" style="display:none;"></span>
          </div>
          <p style="text-align:center"><button type="button" onclick="infoCorrectSend($('#kakaoID').val(),'kakaoID','${memberDTO.email}')" class="btn btn-primary" style="width:150px">변경</button></p>
          <p class="help-block">카카오아이디는 변경후 24시간동안 다시 변경할 수 없습니다.<br>변경전에 잘 확인해 주세요.</p>
        </div>
        <div class="etc_line"></div>
         <!--======================================== 주소 변경 ================================================-->
    <p style="margin:15px 0;line-height:34px;"><span id="cur_nick"><strong>${memberDTO.address }</strong>
        <button type="button" onclick="$('#updAddress').show()" class="btn btn-default" style="float:right;">주소 수정</button>
        </span></p>
       <div id="updAddress" style="display:none;margin-top:20px;">
          <div id="addressFrms" class="form-group has-feedback">
            <input type="text" name="address" class="form-control" id="roadFullAddr" placeholder="주소" onClick="goPopup();">
            <span id="addressStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="addressMsg" style="display:none;"></span>
          </div>
          <p style="text-align:center"><button type="button" onclick="infoCorrectSend($('#roadFullAddr').val(),'address','${memberDTO.email}')" class="btn btn-primary" style="width:150px">변경</button></p>
        </div>
        <div class="etc_line"></div>
         <!--======================================== 핸드폰번호 변경 ================================================-->
    <p style="margin:15px 0;line-height:34px;"><span id="cur_nick"><strong>${memberDTO.phone }</strong>
        <button type="button" onclick="$('#updPhone').show()" class="btn btn-default" style="float:right;">핸드폰번호 수정</button>
        </span></p>
       <div id="updPhone" style="display:none;margin-top:20px;">
          <div id="phoneFrms" class="form-group has-feedback">
            <input type="text" name="phone" class="form-control" id="phone" placeholder="핸드폰번호" onblur="chkPhone()">
            <span id="phoneStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="phoneMsg" style="display:none;"></span>
          </div>
          <p style="text-align:center"><button type="button" onclick="infoCorrectSend($('#phone').val(),'phone','${memberDTO.email}')" class="btn btn-primary" style="width:150px">변경</button></p>
 
        </div>
        <div class="etc_line"></div>
      <!--============================================ 비밀번호 변경 ========================================-->  
    <p style="margin:15px 0;line-height:34px;"><span id="pwResult">&nbsp; <button type="button" onclick="$('#updPw').show()" class="btn btn-default" style="float:right;">비밀번호 수정</button></span></p>
        <div id="updPw" style="display:none;margin-top:20px;">
          <div id="opwFrms" class="form-group has-feedback">
            <input type="password" name="pw" class="form-control" id="pw" onblur="chkPasswdOld()" placeholder="현재 비밀번호">
            <span id="opwStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="opwMsg" style="display:none;"></span>
          </div>
          <div id="pwFrms" class="form-group has-feedback">
            <input type="password" name="new_pw" class="form-control" id="new_pw" onblur="chkPasswd1()" onkeyup="chkShiftUp(event)" onkeypress="chkCapslock(event)" onkeydown="chkShiftDown(event)" placeholder="새로운 비밀번호">
            <span id="pwStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="pwMsg" style="display:none;"></span>
          </div>
          <div id="pwFrms2" class="form-group has-feedback">
            <input type="password" name="new_pw2" class="form-control" id="new_pw2" onblur="chkPasswd2()" placeholder="새 비밀번호 확인">
            <span id="pwStatus2" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="pwMsg2" style="display:none;" class="text-danger">비밀번호 확인을 입력해주세요.</span>
          </div>
          <p style="text-align:center"><button type="button" onclick="doChangePassword()" class="btn btn-primary" style="width:150px">변경</button></p>
        </div>
        <div class="etc_line"></div>
        <p style="margin:15px 0;line-height:34px;">회원탈퇴 <button type="button" onclick="location.href='/user/out.html'" class="btn btn-default" style="float:right;">탈퇴하기</button></p>
  </div>
</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
</html>
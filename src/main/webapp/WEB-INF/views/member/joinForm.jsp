<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/kdy/member/memberCheck.js"></script>
</head>
<script>
function doSubmit()
{
   
    if(!$("#pro_tg_gender").val())
    {
        viewMsg("gender","성별을 선택해 주세요.","error");
        return false;
    }
    return true;
}
</script>
<body>
	<div class="container_etc" style="width:460px;">
      <h2>회원가입</h2>
        <form name="form_insert" id="frmInsert" method="post" action="" autocomplete="off" onsubmit="return doSubmit()">
        <input type="hidden" name="q_mode" value="insert">
        <input type="hidden" name="q_path" value="">
          <!-- Email 입력 -->
          <div id="idFrms" class="form-group has-feedback has-error">
            <input type="email" name="frm[pro_id_user]" class="form-control" id="email" autocomplete="off" onblur="chkEmail()" placeholder="email">
            <span id="idStatus" class="glyphicon form-control-feedback glyphicon-remove" aria-hidden="true"></span>
            <span id="idMsg" style="" class="text-danger">email를 입력해 주세요.</span>
          </div>
          <!-- 비밀번호 입력 -->
          <div id="pwFrms" class="form-group has-feedback">
            <input type="password" name="frm[pro_tx_password]" class="form-control" id="pw" onblur="chkPw1()" onkeyup="chkShiftUp(event)" onkeypress="chkCapslock(event)" onkeydown="chkShiftDown(event)" placeholder="비밀번호">
            <span id="pwStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="pwMsg" style="display:none;"></span>
          </div>
          <div id="pwFrms2" class="form-group has-feedback mag_b_10">
            <input type="password" name="tx_passwd_con" class="form-control" id="pw_check" onblur="chkPw2()" placeholder="비밀번호확인">
            <span id="pwStatus2" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="pwMsg2" style="display:none;" class="text-danger">비밀번호 확인을 입력해주세요.</span>
          </div>
          <!-- KAKAO ID 입력 -->
          <div id="emailFrms" class="form-group has-feedback">
            <input type="text" name="frm[pro_id_email]" class="form-control" id="kakaoID" onblur="chkKakao()" placeholder="카카오 아이디 ,나중에 추가하셔도됩니다!">
            <span id="emailStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="emailMsg" style="display:none;"></span>
          </div>
           <!-- 닉네임 --> 
          <div id="nickFrms" class="form-group has-feedback mag_b_10">
            <input type="text" name="frm[pro_nm_user]" class="form-control" id="nickname" onblur="chkNick()" placeholder="닉네임">
            <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nickMsg" style="display:none;"></span>
          </div>
          
          <!-- 이름  -->
           <div id="nameFrms" class="form-group has-feedback ">
            <input type="text" name="frm[pro_name]" class="form-control" id="name" onblur="chkName()" placeholder="이름">
            <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nickMsg" style="display:none;"></span>
          </div>
          
          <!-- 주소 API 필요 -->
          <div id="addressFrms" class="form-group has-feedback">
			<input type="text" id="roadFullAddr" class="form-control"  name="roadFullAddr" placeholder="주소입력" onClick="goPopup();"/>
            <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nickMsg" style="display:none;"></span>
          </div>
          
          <!-- 핸드폰 번호  -->
           <div id="phoneFrms" class="form-group has-feedback">
            <input type="text" name="frm[pro_phone]" class="form-control" id="phone" onblur="chkPhone()" placeholder="휴대전화번호">
            <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <span id="nickMsg" style="display:none;"></span>
          </div>
          

          
          <div class="form-group has-feedback">
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

          <input type="hidden" name="frm[pro_tg_gender]" id="pro_tg_gender">
          <button type="submit" class="btn btn-primary btn-block btn-lg">회원가입</button>
      </form></div>
</body>
</html>
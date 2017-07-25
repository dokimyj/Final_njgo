/**
 * 
 */



/* ===============================Logout ================================ */








/* ============================ 주소 API  =================================*/
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}



function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		
		//document.form_insert.roadFullAddr.value = roadFullAddr;
		$("#roadFullAddr").val(roadFullAddr);
		var address = $("#roadFullAddr").val();
		if(address==""|| address==null){
			$("#addressStatus").addClass("glyphicon-remove");
			$("#addressStatus").removeClass("glyphicon-ok");
			$("#addressStatus").css("color","#a94442");
			$("#addressMsg").css("color","red");
			$("#addressMsg").css("display","block");
			$("#addressMsg").text("email를 입력해 주세요.");
			return 0;
		}else{
			$("#addressStatus").removeClass("glyphicon-remove");
			$("#addressStatus").addClass("glyphicon-ok");
			$("#addressStatus").css("color","#42a967");
			$("#addressMsg").css("display","block");
			$("#addressMsg").css("color","green");

			return 1;
		}
}




function infoCorrectSend(data,type,email) {
	
	if($("#"+type+"Status").css("color")=="rgb(66, 169, 103)"){
		$.ajax({
			type : "POST",
			url : "infoCorrectSend",
			data : {
				data : data,
				type : type,
				email : email
			},
			success:function(data){
				alert("수정 성공!");
				location.href = "info_correct";
			}
		});
	}
	// 비밀번호 수정하는곳
	// 비밀번호 확인 하는곳 id가 pwStatus2 임...
	else if($("#"+type+"Status2").css("color")=="rgb(66, 169, 103)"){
		
		$.ajax({
			type : "POST",
			url : "infoCorrectSend",
			data : {
				data : data,
				type : type,
				email : email
			},
			success:function(data){
				alert("수정 성공!");
				location.href = "info_correct";
			}
		});
	}
	else{
		alert("다시 확인해주세요.");
	}
	
}


/* ============================ 회원 가입 Check 사항  =================================*/

  

function chkEmail() {
	
	var email = $("#email").val();
	var patt = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var result = patt.test(email);
	
	// 빈공간 체크
	if(email=="" || email==null){
		$("#emailStatus").addClass("glyphicon-remove");
		$("#emailStatus").removeClass("glyphicon-ok");
		$("#emailStatus").css("color","#a94442");
		$("#emailMsg").css("color","red");
		$("#emailMsg").css("display","block");
		$("#emailMsg").text("email를 입력해 주세요.");
		return 0;
	}
	
	//중복체크
	else{
		//email 형식이 맞으면 
		if(result){
			$.ajax({
				type : "POST",
				url : "emailCheck",
				data : {
					email : email
				},
				success:function(data){
					if(data.trim()==1){
						$("#emailStatus").removeClass("glyphicon-remove");
						$("#emailStatus").addClass("glyphicon-ok");
						$("#emailStatus").css("color","#42a967");
						$("#emailMsg").css("display","block");
						$("#emailMsg").css("color","green");
						$("#emailMsg").text("사용가능한 email입니다.");
						return 1;
					}
					else{
						$("#emailStatus").addClass("glyphicon-remove");
						$("#emailStatus").removeClass("glyphicon-ok");
						$("#emailStatus").css("color","#a94442");
						$("#emailMsg").css("color","red");
						$("#emailMsg").css("display","block");
						$("#emailMsg").text("중복된 eamil입니다.");
						return 0;
					}
				}
			});	
		}
		//email 형식이 틀리면
		else{
			$("#emailStatus").addClass("glyphicon-remove");
			$("#emailStatus").removeClass("glyphicon-ok");
			$("#emailStatus").css("color","#a94442");
			$("#emailMsg").css("color","red");
			$("#emailMsg").css("display","block");
			$("#emailMsg").text("잘못된 email형식 입니다.");
			return 0;
		}
		
	}
}

function chkPw1() {
	var pw = $("#pw").val();
	var patt = new RegExp("^([a-zA-Z!@#$%^&*()_+=<>?0-9]{6,15})$");
	var result = patt.test(pw);
	
	if(pw==""){
		$("#pwStatus").addClass("glyphicon-remove");
		$("#pwStatus").removeClass("glyphicon-ok");
		$("#pwStatus").css("color","#a94442");
		$("#pwMsg").css("color","red");
		$("#pwMsg").css("display","block");
		$("#pwMsg").text("비밀번호를 입력해 주세요.");
		return 0;
	}
	if(result){
		$("#pwStatus").removeClass("glyphicon-remove");
		$("#pwStatus").addClass("glyphicon-ok");
		$("#pwStatus").css("color","#42a967");
		$("#pwMsg").css("display","block");
		$("#pwMsg").css("color","green");
		$("#pwMsg").text("사용가능한 비밀번호입니다.");
		return 1;
	}
	else{
		$("#pwStatus").addClass("glyphicon-remove");
		$("#pwStatus").removeClass("glyphicon-ok");
		$("#pwStatus").css("color","#a94442");
		$("#pwMsg").css("color","red");
		$("#pwMsg").css("display","block");
		$("#pwMsg").text("6~15자리 비밀번호를 입력해주세요.");
		return 0;
	}
	
	//정규표현식 숫자영문만 
}

function chkPw2() {
	//pw1 재확인
	var pw = $("#pw").val();
	var pw_check = $("#pw_check").val();
	
	if(pw_check==""){
		$("#pwStatus2").addClass("glyphicon-remove");
		$("#pwStatus2").removeClass("glyphicon-ok");
		$("#pwStatus2").css("color","#a94442");
		$("#pwMsg2").show();
		return 0;
	}
	
	if(pw ==pw_check && pw_check!=""){
		$("#pwStatus2").removeClass("glyphicon-remove");
		$("#pwStatus2").addClass("glyphicon-ok");
		$("#pwStatus2").css("color","#42a967");
		$("#pwMsg2").css("display","block");
		$("#pwMsg2").css("color","green");
		$("#pwMsg2").text(" 비밀번호 확인 완료 ");
		return 1;
	}
	else{
		$("#pwStatus2").addClass("glyphicon-remove");
		$("#pwStatus2").removeClass("glyphicon-ok");
		$("#pwStatus2").css("color","#a94442");
		$("#pwMsg2").css("color","red");
		$("#pwMsg2").css("display","block");
		$("#pwMsg2").text(" 비밀번호와 동일하게 입력해주세요.");
		return 0;
	}
	
}



function chkNick() {
	//중복확인
	var nickName = $("#nickName").val();
	
	if(nickName=="" || nickName==null || nickName.length <4){
		$("#nickNameStatus").addClass("glyphicon-remove");
		$("#nickNameStatus").removeClass("glyphicon-ok");
		$("#nickNameStatus").css("color","#a94442");
		$("#nickMsg").css("color","red");
		$("#nickMsg").css("display","block");
		$("#nickMsg").text("닉네임을 입력해 주세요.(4글자이상)");
		return false;
	}
	else{
		$.ajax({
			type : "POST",
			url : "nickNameCheck",
			data : {
				nickName : nickName
			},
			success:function(data){
				if(data.trim()==1){
					$("#nickNameStatus").removeClass("glyphicon-remove");
					$("#nickNameStatus").addClass("glyphicon-ok");
					$("#nickNameStatus").css("color","#42a967");
					$("#nickMsg").css("display","block");
					$("#nickMsg").css("color","green");
					$("#nickMsg").text("사용가능한 닉네임 입니다.");	
					
					return true;
				}
				else{
					$("#nickNameStatus").addClass("glyphicon-remove");
					$("#nickNameStatus").removeClass("glyphicon-ok");
					$("#nickNameStatus").css("color","#a94442");
					$("#nickMsg").css("color","red");
					$("#nickMsg").css("display","block");
					$("#nickMsg").text("중복된 닉네임 입니다.");
					return false;
				}
			}
		});
	}
}
function chkName() {
	var name = $("#name").val();
	if(name=="" || name==null){
		$("#nameStatus").addClass("glyphicon-remove");
		$("#nameStatus").removeClass("glyphicon-ok");
		$("#nameStatus").css("color","#a94442");
		$("#nameMsg").css("color","red");
		$("#nameMsg").css("display","block");
		$("#nameMsg").text("이름을 입력해 주세요.");
		return 0;
	}
	else{
		$("#nameStatus").removeClass("glyphicon-remove");
		$("#nameStatus").addClass("glyphicon-ok");
		$("#nameStatus").css("color","#42a967");
		$("#nameMsg").css("display","block");
		$("#nameMsg").css("color","green");
		$("#nameMsg").text("Thank you");	
		return 1;
	}
	
}
function chkPhone() {
	var phone = $("#phone").val();
	var patt = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
	var result = patt.test(phone);
	
	
	if(phone=="" || phone==null){
		$("#phoneStatus").addClass("glyphicon-remove");
		$("#phoneStatus").removeClass("glyphicon-ok");
		$("#phoneStatus").css("color","#a94442");
		$("#phoneMsg").css("color","red");
		$("#phoneMsg").css("display","block");
		$("#phoneMsg").text("핸드폰 번호를 입력해 주세요.");
		return 0;
	}else{
		//숫자,핸드폰번호 표현식이 올바른 경우
		if(result){
			$("#phoneStatus").removeClass("glyphicon-remove");
			$("#phoneStatus").addClass("glyphicon-ok");
			$("#phoneStatus").css("color","#42a967");
			$("#phoneMsg").css("color","green");
			$("#phoneMsg").css("display","block");
			$("#phoneMsg").text("입력완료");
			return 1;
		}
		//표현식이 잘못된경우
		else{
			$("#phoneStatus").addClass("glyphicon-remove");
			$("#phoneStatus").removeClass("glyphicon-ok");
			$("#phoneStatus").css("color","#a94442");
			$("#phoneMsg").css("color","red");
			$("#phoneMsg").css("display","block");
			$("#phoneMsg").text("'-'없이 숫자 또는 01x 형식으로 입력해주세요");
			return 0;
		}
		
	}
}
function chkKakaoID() {
	//중복확인
	var kakaoID = $("#kakaoID").val();
	
	$.ajax({
		type : "POST",
		url : "kakaoIDCheck",
		data : {
			kakaoID : kakaoID
		},
		success:function(data){
			if(data.trim()==1){
				$("#kakaoIDStatus").removeClass("glyphicon-remove");
				$("#kakaoIDStatus").addClass("glyphicon-ok");
				$("#kakaoIDStatus").css("color","#42a967");
				$("#kakaoIDMsg").css("display","block");
				$("#kakaoIDMsg").css("color","green");
				
				
				return 1;
			}
			else{
				$("#kakaoIDStatus").addClass("glyphicon-remove");
				$("#kakaoIDStatus").removeClass("glyphicon-ok");
				$("#kakaoIDStatus").css("color","#a94442");
				$("#kakaoIDMsg").css("color","red");
				$("#kakaoIDMsg").css("display","block");
				$("#kakaoIDMsg").text("중복된 닉네임 입니다.");
				return 0;
			}
		}
	});
}

function chkGender(gender) {
	
	
	if(gender=='m'){
		$("#tg_male").addClass("btn-success");
		$("#tg_male").removeClass("btn-default");
		$("#tg_female").addClass("btn-default");
		$("#tg_female").removeClass("btn-success");
	
	}else{
		$("#tg_male").removeClass("btn-success");
		$("#tg_male").addClass("btn-default");
		$("#tg_female").removeClass("btn-default");
		$("#tg_female").addClass("btn-success");
	}
	$("#gender").val(gender);

}





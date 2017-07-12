/**
 * 
 */

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
		
		document.form_insert.roadFullAddr.value = roadFullAddr;	
}



/* ============================ 회원 가입 Check 사항  =================================*/




function chkEmail() {
	//중복체크
	var email = $("#email").val();
	
	if(email=="" || email==null){
		$("#idMsg").css("color","red");
		$("#idMsg").css("display","block");
		$("#idMsg").text("email를 입력해 주세요.");
	}
	else{
		$.ajax({
			type : "POST",
			url : "emailCheck",
			data : {
				email : email
			},
			success:function(data){
				if(data.trim()==1){
					$("#idMsg").css("display","block");
					$("#idMsg").css("color","green");
					$("#idMsg").text("사용가능한 email입니다.");	
				}
				else{
					$("#idMsg").css("color","red");
					$("#idMsg").css("display","block");
					$("#idMsg").text("중복된 eamil입니다.");
				}
			}
		});
	}
}

function chkPw1() {
	var pw = $("#pw").val();
	var patt = new RegExp("^([a-zA-Z!@#$%^&*()_+=<>?0-9]{6,15})$");
	var result = patt.test(pw);
	alert(pw);
	alert(result);
	
	//정규표현식 숫자영문만 
}

function chkPw2() {
	//pw1 재확인
}

function chkKakao() {
	
}

function chkNick() {
	//중복확인
	var nickName = $("#nickName").val();
	
	if(nickName=="" || nickName==null){
		$("#nickMsg").css("color","red");
		$("#nickMsg").css("display","block");
		$("#nickMsg").text("닉네임을 입력해 주세요.");
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
					$("#nickMsg").css("display","block");
					$("#nickMsg").css("color","green");
					$("#nickMsg").text("사용가능한 닉네임 입니다.");	
				}
				else{
					$("#nickMsg").css("color","red");
					$("#nickMsg").css("display","block");
					$("#nickMsg").text("중복된 닉네임 입니다.");
				}
			}
		});
	}
}
function chkName() {
	
}
function chkPhone() {
	
}

function chkGender(gender) {
	
}





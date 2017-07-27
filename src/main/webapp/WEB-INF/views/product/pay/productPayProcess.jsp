<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../../resources/css/common/basic.css">
<style type="text/css">
	.main_section{
		min-height: 1000px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	var newJquery = $.noConflict(true);	//jQuery 다른 버전 선언 => 충돌 방지
	
	var IMP = window.IMP;
	IMP.init('imp34990553');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:미현이카드',
	    amount : 1,
	    buyer_name : '박미현',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	newJquery.ajax({
	    		url: "paySuccess", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		$(".done").html(data);
	    		/* //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다. 
	    		}*/
	    	});
	    } else {
	        /* var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg; */
	        //alert(msg);
	        
	        
	        //Test Mode (실패해도 결제 된걸로)
	    	/* jQuery.ajax({
	    		url: "paySuccess",
	    		type: 'POST',
	    		data: {
		    		imp_uid : '결제성공'
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		$(".payDone").html(data.trim());
	    		//msg = '주문이 완료되었습니다.';
	    	}); */
	    	
	    	
	    }

	    //alert(msg);
	});
	

</script>


</head>
<body>
	<c:import url="../../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="payDone">
			
		</div>	
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
</body>
</html>
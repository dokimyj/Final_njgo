<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<style type="text/css">
	.main_section{
		min-height: 500px;
	}
	li {
	    display: block;
	}
	legend{
		margin-bottom: 10px;
		border-bottom: none;
		font-weight: bold;
	}
	.form-style-tbl {
	    width: 100%;
	    height: auto;
	    border-top: 1px solid #252525;
	}
		.table1 > table {
	    width: 100%;
	    border-top: 1px solid #717171;
	}
	.form-style-tbl th {
	    padding: 0;
	    border: 1px solid #e1e1e1;
	    border-top: 0;
	    border-left: 0;
	    background-color: #f5f5f5;
	    font-family: 'Dotum';
	    font-size: 12px;
	    color: #676767;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: normal;
	}
	.table1 table tbody th {
	    padding: 30px 0 30px 0;
	    vertical-align: middle;
	    text-align: center;
	    width: 130px;
	    background: #f9f9f9;
	    border-bottom: 1px solid #dbdbdb;
	    color: #777;
	}
	.table1 > table > tbody > tr > th {
	    background: #f9f9f9;
	    border-bottom: 1px solid #dbdbdb;
	    padding: 10px 16px;
	    color: #777;
	}
	.board-write td {
	    padding-left: 20px;
	    padding-right: 20px;
	}
	.table1 td {
	    padding: 15px 19px;
	    font-family: 'Dotum';
	    font-size: 12px;
	    line-height: 1.5;
	}
	.form-style-tbl td {
	    padding: 15px 19px;
	    border-bottom: 1px solid #e1e1e1;
	}
	.table1 > table > tbody > tr >td {
	    border-bottom: 1px solid #dbdbdb;
	    color: #444;
	}
	.table1 .txt-field {
	    width: 310px;
	    height: 40px;
	    line-height: 40px;
	    position: relative;
	    padding: 0 10px;
	    background: #fff;
	    border: 1px solid #d0d0d0;
	}
	 .img_name{
	 	width: 260px;
	    height: 260px;
	    position: relative;
	    padding: 10px 10px;
	    background: #fff;
	    border: 1px solid #d0d0d0;
	    display: table-cell;
	    text-align: center;
	    vertical-align: middle;
	 }
	 .detailimg_name{
	 	width: 500px;
	    height: 800px;
	    position: relative;
	    padding: 10px 10px;
	    background: #fff;
	    border: 1px solid #d0d0d0;
	    display: table-cell;
	    text-align: center;
	    vertical-align: middle;
	 }
	 #load_Img{
	 	width: auto;
	 	max-width: 98%;
	    height: auto;
	    max-height: 98%;
	 }
	 #load_detailImg{
	 	width: auto;
	 	max-width: 98%;
	    height: auto;
	    max-height: 98%;
	 }
	.board-write .txt-field {
	    width: 310px !important;
	}
	.form-style-tbl .txt-field {
	    height: 43px;
	    padding: 0;
	    border: 1px solid #e1e1e1;
	    float: left;
	}
	.form-style-tbl .txt-field input[type=text], .form-style-tbl .txt-field input[type=number] {
	    height: 38px;
	    border: 0;
	    line-height: 38px;
	}
	
	.board-write td .textarea textarea {
	    width: 100%;
	    height: 213px;
	    padding: 15px;
	    resize: none;
	    font-family: 'Dotum';
	    font-size: 12px;
	    box-sizing: border-box;
	}
	.form-style-tbl .file-upload input[type=file].file {
	    width: 120px;
	    height: 43px;
	    right: 130px;
	}
	div.file-upload div.upload-btn input.file {
	    position: absolute;
	    top: 0;
	    height: 25px;
	    cursor: pointer;
	    opacity: 0;
	    }
	input[type=text], input[type=number], select {
		width: 100%;
	    height: 38px;
	    line-height: 38px;
	}
	.category{
		width: 310px; 
		height: 46px; 
		float: left;
		border: 1px solid #e1e1e1;
		margin-right: 20px;
	}
	    
	.submit_btn{
		color: white;
	    margin: 0 auto;
	    display: table;
	    margin-top: 20px;
	    /* background: #002f6b; */
	    background: #252221; 
	    width: 150px; 
	    height: 42px; 
	    font-family: 'SpoqaHanSans'; 
	    border: none;
	}
	.submit_btn:HOVER {
		color: #ffcc00;
	}	
	.amount_zero{
		float: left;
		color: red;
		margin-left: 10px;
    	margin-top: 11px;
    	display: none;
	}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="join-form">
			<form name="frmWrite" id="frmWrite" action="product${path}" method="post" enctype="multipart/form-data" class="frmWrite">
				<c:if test="${path eq 'Update'}">
					<input type="hidden" name="pronum" value="${productDTO.pronum}">
				</c:if> 
				<fieldset>
					<legend>상품 등록</legend>
					<div class="table1 board-write">
						<table class="form-style-tbl">
							<colgroup>
								<col style="width: 133px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th class="ta-l">상품명</th>
									<td>
										<div class="txt-field hs" style="width: 250px; height: 100%;">
											<input type="text" name="name" id="name" class="text" value="${productDTO.name}">
										</div>
									</td>
								</tr>
								<tr>
									<th class="ta-l">가격</th>
									<td>
										<div class="txt-field hs" style="width: 250px; height: 100%;">
											<input type="number" name="price" id="price" class="text" value="${productDTO.price}" min="0">
										</div>
									</td>
								</tr>
								<tr>
									<th class="ta-l">재고량</th>
									<td>
										<div class="txt-field hs" style="width: 250px; height: 100%;">
											<input type="number" name="amount" id="amount" class="text" value="${productDTO.amount}" min="0">
											
										</div>
										<div class="amount_zero">품절된 상품으로 표시됩니다.</div>
									</td>
								</tr>
								<tr>
									<th class="ta-l">상품코드</th>
									<td>
										<div class="txt-field hs" style="width: 250px; height: 100%;">
											<input type="text" name="procode" id="procode" class="text" value="${productDTO.procode}">
										</div>
									</td>
								</tr>
								<tr>
									<th class="ta-l">카테고리<br>(대분류/소분류)</th>
									<td><span class="st-hs" style="width: 250px;">										
										<select class="category" id="cate_major" name="cate_major" >
											<option	value="농산물">농산물</option>
											<option value="수산물">수산물</option>
											<option value="정육">정육</option>
											<option value="가공식품">가공식품</option>
											<option value="양념류">양념류</option>
										</select>
										<select class="category" id="cate_minor" name="cate_minor">
											<option	value="곡류">곡류</option>
											<option	value="채소">채소</option>
										</select>
									</span></td>
								</tr>
								<tr>
									<th class="ta-l">원재료 및 함량</th>
									<td colspan="3">
										<div class="textarea m1 ">
											<textarea cols="30" name="contents" rows="10" class="w100"
												id="contents" placeholder="예) 돼지고기92.44%(수입산,국산),정제수,정제소금(국산),비타민C,백설탕,아질산나트륨(발색제),카라기난,혼합제제(산도조절제)">${productDTO.contents}</textarea>
										</div>
									</td>
								</tr>
								

								<tr>
									<th class="ta-l">대표 이미지</th>
									<td id="uploadBox" colspan="3">
										<div class="file-upload" style="margin-top: 5px;">
											<div class="upload-btn">
												<input type="file" id="main_img" name="f1" style="display: none" onchange="loadImg(this);">
													<div class="img_name">
														<c:if test="${path eq 'Update'}">
															<img id="load_Img" src="../resources/upload/${productDTO.f_mainimg}">
														</c:if>
														<c:if test="${path eq 'Write'}">
															<img id="load_Img">
														</c:if>
													</div>												
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="ta-l">상세 이미지</th>
									<td id="uploadBox" colspan="3">
										<div class="file-upload" style="margin-top: 5px;">
											<div class="upload-btn">
												<input type="file" id="detail_img" name="f2"  style="display: none" onchange="loadDetailImg(this);">
												<div class="detailimg_name">
													<c:if test="${path eq 'Update'}">
														<img id="load_detailImg" src="../resources/upload/${productDTO.f_detailimg}">
													</c:if>
													<c:if test="${path eq 'Write'}">
														<img id="load_detailImg">
													</c:if>
												</div>		
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						
					</div>
				</fieldset>

				<div class="btm-btn">
					<button type="button" class="submit_btn" value="저장">
						<em>등록하기</em>
					</button>
				</div>
			</form>
		</div>
	</section>	
	
	<c:import url="../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		/**************** Update일 경우 카테고리  *******************/
		var pDTO = '${productDTO}';
		if(pDTO != ''){
			var major = '${productDTO.cate_major}';
			var minor = '${productDTO.cate_minor}';
			$("select[id=cate_major] option[value="+major+"]").attr("selected",true);
			change_category();
			$("select[id=cate_minor] option[value="+minor+"]").attr("selected",true);
			
		}
		
		/**************** category 대분류/소분류 change 이벤트 *******************/
		$("#cate_major").change(function() {
			change_category();
		});		
		function change_category() {
			var major = $("#cate_major").val();
			var innerHtml = '';
			if(major == '수산물'){
				innerHtml = '<option value="생선어패류">생선/어패류</option><option value="해조류">해조류</option><option value="건어물">건어물</option><option value="수산가공">수산가공</option>'
			}else if(major == '정육'){
				innerHtml = '<option value="양념가공육">양념/가공육</option>';
			}else if(major == '가공식품'){
				innerHtml = '<option value="반찬류">반찬류</option><option value="냉동식품">냉동식품</option><option value="밥면류">밥/면류</option><option value="맛살어묵단무지">맛살/어묵/단무지</option>';
			}else if(major == '양념류'){
				innerHtml = '<option value="기름류">기름류</option><option value="장류">장류</option><option value="조미료">조미료</option>';
			}else if(major == '농산물'){
				innerHtml = '<option value="곡류">곡류</option><option	value="채소">채소</option>';
			}
			$("#cate_minor").html(innerHtml);
		}
		
		
		/**************** 파일 선택시 이미지 미리보기 *******************/
		$(".img_name").click(function() {
			$("#main_img").trigger("click");
			
		});
		$(".detailimg_name").click(function() {
			$("#detail_img").trigger("click");
			
		});
		function loadImg(value) {
			var inputImg = $("#main_img").val();
			if(inputImg == ''){
				$("#load_Img").removeAttr("src");
				$("#load_Img").hide();
			}
			if(value.files && value.files[0]){
				$("#load_Img").hide();
				var reader = new FileReader();			//파일을 읽기 위한 FileReader객체 생성
				reader.onload = function(img) {			//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$("#load_Img").show();
					$("#load_Img").attr("src", img.target.result);
				}
				reader.readAsDataURL(value.files[0]);	 //File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		function loadDetailImg(value) {
			var inputImg = $("#detail_img").val();
			if(inputImg == ''){
				$("#load_detailImg").removeAttr("src");
				$("#load_detailImg").hide();
			}
			if(value.files && value.files[0]){
				$("#load_detailImg").hide();
				var reader = new FileReader();			//파일을 읽기 위한 FileReader객체 생성
				reader.onload = function(img) {			 //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$("#load_detailImg").show();
					$("#load_detailImg").attr("src", img.target.result);
				}
				reader.readAsDataURL(value.files[0]);	 //File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		$("#amount").blur(function() {
			var amount = $("#amount").val();
			if(amount==0){
				$(".amount_zero").show();
			}else{
				$(".amount_zero").hide();
			}
		});
		
		
		/**************** Submit 버튼  *******************/
		$(".submit_btn").click(function() {
			var name = $("#name").val();
			var price = $("#price").val();
			var amount = $("#amount").val();
			var procode = $("#procode").val();
			var contents = $("#contents").val();			
			var m_attr = $("#load_Img").attr("src");
			var d_attr = $("#load_detailImg").attr("src");
			
			if(name == ''){
				alert("상품명을 입력해주세요");
			}else if(price == ''){
				alert("가격을 입력해주세요");
			}else if(amount == ''){
				alert("재고량을 입력해주세요");
			}else if(procode == ''){
				alert("상품코드를 입력해주세요");
			}else if(contents == ''){
				alert("원재료 및 함량을 입력해주세요");
			}else if(typeof m_attr == typeof undefined && m_attr !== false){
				alert("대표 이미지를 등록해주세요");
			}else if(typeof d_attr == typeof undefined && d_attr !== false){
				alert("상세 이미지를 등록해주세요");
			}else{
				frmWrite.submit();
			}
		});
	</script>
</body>
</html>
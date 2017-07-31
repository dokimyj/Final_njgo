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
<link rel="stylesheet" href="../resources/css/psy/recipeWrite.css">
<script src="../resources/js/psy/recipeWrite.js" type="text/javascript"></script>
<script type="text/javascript">
	var nameArray = ["돼지고기", "양배추", "참기름", "소금", "고추가루 약간"];
	var amountArray = ["300g", "1/2개", "1T", "2t", ""];
	var stepArray = ["소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요.", "준비된 양념으로 먼저 고기를 조물조물 재워 둡니다.", 
		"그 사이 양파와 버섯, 대파도 썰어서 준비하세요.", "고기가 반쯤 익어갈 때 양파를 함께 볶아요."];
	var tagArray = new Array();
	$(function() {
		$( ".ingredientSection_ul" ).sortable();
	    $( ".ingredientSection_ul" ).disableSelection();
	    $( ".box2_sub" ).sortable();
	    $( ".box2_sub" ).disableSelection();
	    
		/* box1 시작 */
		$(".upload").change(function() {
			readURL(this, "main");
			
			if( $(".upload").val() == '' ) {
				$(".replace").css("background-image","url('../resources/images/psy/pic_none4.gif')");
			}
		});
		
		$(".main_picture").mouseover(function() {
			if($(".upload").val() != '') {
				$("#deleteMainPic").css("display","inline-block");
			}
		});
		
		$(".main_picture").mouseout(function() {
			$("#deleteMainPic").css("display","none");
		});
		
		$("#deleteMainPic").click(function() {
			$("#deleteMainPic").css("display","none");
			$(".replace").css("border", "1px solid #e1e1e1");
			$(".replace").css("background-image","url('../resources/images/psy/pic_none4.gif')");
			$(".upload").val("");
		});
		
		$("#video").change(function() {
			video();
		});
		/* box1 끝*/
		
		/* box2 시작 */
		$(document).on("mouseover", ".ingredientSection li", function() {
			var num = ($(this).parent()).attr("data-ul");
			
			$(".delBtn_" + num).eq($(this).index()).css("display", "inline-block");
		});
		
		$(document).on("mouseleave", ".ingredientSection li", function() {
			var num = $(this).parent().attr("data-ul");
			
			
			$(".delBtn_" + num).eq($(this).index()).css("display", "none");			
		});
		
		$(document).on("click", ".addBtn", function() {
			var index = $(this).attr("data-ul");
			var num = $(".ingredientSection li").length % 5;
			
			addIngredient(num, index);
		});
		
		$(document).on("click", ".deleteBtn", function() {
			$(this).parent().remove();
		});
		
		$(document).on("click", ".allDeleteBtn", function() {
			allDelete($(this));
		});
		
		$(document).on("click", ".addAllBtn", function() {
			addIngredientSec($(".box2_sub_1 ul").length);
		});
		$(document).on("click", ".allInsertBtn", function() {
			$(".modal_section").css("display", "inline-block");
			
		});
		$(document).on("mouseover", ".dragBtn", function() {
			var offset = $(this).position();
			
			$(".dragTooltip").css("top", offset.top - 30);
			$(".dragTooltip").css("left", offset.left - 45);
			$(".dragTooltip").css("visibility", "visible");
		});
		$(document).on("mouseleave", ".dragBtn", function() {
			$(".dragTooltip").css("visibility", "hidden");
		});
		/* box2 끝 */
		
		/* box3 시작 */
		$(document).on("mouseover", ".step", function() {
			var num = ($(this).attr("data-step") * 1) - 1;
			
			$(".step_menu").eq(num).css("display","inline-block");
		});
		
		$(document).on("mouseleave", ".step", function() {
			$(".step_menu").css("display","none");
		});
		
		$(document).on("change", ".upload_step", function() {
			readURL(this, $(this).closest('article').attr("data-step"));
			
			if( $(".upload_step").val() == '' ) {
				$(this).prevAll("button").css("background-image","url('../resources/images/psy/pic_none2.gif')");
			}
		});
		
		$(document).on("mouseover", ".step_picture", function() {
			var num = $(this).closest('article').attr("data-step") - 1;
			
			if( $(".upload_step").eq(num).val() != '' ) {
				$(".deleteStepPic").eq(num).css("top", $(this).offset().top);
				$(".deleteStepPic").eq(num).css("left", $(this).offset().left + 130);
				$(".deleteStepPic").eq(num).css("display","inline-block");
			}
		});
		
		$(document).on("mouseout", ".step_picture", function() {
			$(".deleteStepPic").css("display","none");
		});
		
		$(document).on("click", ".deleteStepPic", function() {
			deleteStepPicture($(this));
		});
		
		$(document).on("click", ".addStepButton", function() {
			addStep();
		});
		
		$(document).on("click", ".deleteStepButton", function() {
			deleteStep($(this));
		});
		
		$(document).on("click", ".upStepButton", function() {
			moveUp($(this));
		});
		
		$(document).on("click", ".downStepButton", function() {
			moveDown($(this));
		});
		/* box3 끝 */
		
		/* box4 시작 */
		$(document).on("click", ".tag_form", function() {
			$(".tag_view *").css("animation-name", "");
			$(".tag_view *").css("animation-duration", "");
			
			$(".tag_input").focus();
		});
		
		$(document).on("blur", ".tag_input", function() {			
			tagDuplication($(this));
		});
		
		$(document).on("keydown", ".tag_input", function(key) {
			$(".tag_view_div").css("animation-name", "");
			$(".tag_view_div").css("animation-duration", "");
			
			if(key.keyCode == 13 || key.keyCode == 9) {	// enter나 tab을 눌렀을 때
				tagDuplication($(this));
				key.preventDefault();
	        }
		});
		
		$(document).on("click", "#deleteTagBtn", function() {
			var removeValue = $(this).prevAll(".tag_text").html();
			$(this).closest('li').remove();
			
			tagArray.splice(tagArray.indexOf(removeValue), 1);
		});
		
		/* box4 끝 */
		$("#saveBtn").click(function() {			
			for(var i=0;i<$(".kindInput").length;i++) {
				$(".kind_count").eq(i).val($(".ingredientSection_ul_"+ i).find("li").length);
			}
		});
		
		$("#cancleBtn").click(function() {
			var r = confirm("취소하시겠습니까?");
			
			if(r) {
				location.href = "../";
			}
		});
		
		/* modal */
		$(window).resize(function(){
			var screenWidth = $(window).width();
			var screenHeight = $(window).height();
			var height = $(document).scrollTop();
			
			var myWidth = 680;
			var popupWidth = (screenWidth-myWidth)/ 2;
			
			$(".modal_section").css("left", popupWidth);
			$(".modal_section").css("top", height);
		}).resize();
		
		$('html').click(function(e) {
			if(! $('.modal_section').has(e.target).length) {
				$(".modal_section").fadeOut();
			}
		});
		$('#title_img img').click(function() {
			$(".modal_section").fadeOut();
		});
		$('#m_cancleBtn').click(function() {
			$(".modal_section").fadeOut();
		});
		$(document).on("click", "#m_saveBtn", function() {
			var modal_str = $(".modal_input").val();
			$(".modal_section").fadeOut();
			
			var kind = modal_str.split('['); // 줄 바꿈
			
			for(var i=0;i<kind.length;i++) {
				var cut_title = kind[i].split(']');
				
				if(cut_title.length < 2) {
					kind.splice(i,1);
				}
			}
			var kindCount = kind.length;
			var title, food;	// title은 파싱 완전히 끝남
			
			for(var i=0;i<kindCount;i++) {
				var cut_title = kind[i].split(']');
				title = cut_title[0];
				food = cut_title[1];
				
				alert(food);
			}
			
			var foodCount;
			alert(food.length);
			alert(title.length);
			
			for(var i=0;i<food.length;i++) {
				/* alert(food[i]); */
				var cut_foodname = food[i].split(',');
				/* foodCount = cut_foodname.length;
				
				alert(foodCount); */
				
				/* alert(cut_foodname); */
			}
		});
	});
</script>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
		<form id="frm" action="./recipeWrite" method="post" enctype="multipart/form-data">
			<div class="box1 box">
				<div class="titlePart">레시피 등록</div>
				<div class="contentPart">
					<div class="main_picture">
						<input type="button" class="replace">
						<input type="file" class="upload" name="main" accept="image/*" required="required"><!-- ".gif, .jpg, .png" -->
						<img id="deleteMainPic"alt="" src="../resources/images/psy/delete.png">
					</div>
					<div class="content_divisor" style="margin-bottom: 15px;">
						<p class="content_title">레시피 제목</p>
						<input type="text" name="title" class="content_input" id="title" required="required" placeholder="예) 소고기 미역국 끓이기">
					</div>
					<div class="content_divisor" style="margin-bottom: 15px;">
						<p class="content_title">음식이름</p>
						<input type="text" name="foodname" class="content_input" id="foodname" required="required" placeholder="예) 소고기 미역국">
					</div>
					<div class="content_divisor">
						<p class="content_title">요리소개</p>
						<textarea class="content_input" name="r_intro" id="explanation" required="required" placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다."></textarea>
					</div>
					<div class="content_divisor">
						<p class="content_title">동영상</p>
						<textarea class="content_input" id="video" name="" placeholder="동영상이 있으면 주소를 입력하세요. (Youtube, 네이버tvcast, 다음tvpot만 가능)&#13;&#10;예) https://youtu.be/gFjy1Gkh4gc"></textarea>
						<div class="divPhotoBox">
							<img id="videoPicture" alt="" src="../resources/images/psy/pic_none5.gif">
						</div>
					</div>
					<div class="content_divisor">
						<p class="content_title">카테고리</p>
						<select name="c_kind" id="kind_select" class="content_input select">
							<option value="%%">종류별</option>
							<option value="밑반찬">밑반찬</option>
							<option value="메인반찬">메인반찬</option>
							<option value="국/탕">국/탕</option>
							<option value="찌개">찌개</option>
							<option value="디저트">디저트</option>
							<option value="면/만두">면/만두</option>
							<option value="밥/죽/떡">밥/죽/떡</option>
							<option value="퓨전">퓨전</option>
							<option value="김치/젓갈/장류">김치/젓갈/장류</option>
							<option value="양념/소스/잼">양념/소스/잼</option>
							<option value="양식">양식</option>
							<option value="샐러드">샐러드</option>
							<option value="스프">스프</option>
							<option value="빵">빵</option>
							<option value="과자">과자</option>
							<option value="차/음료/술">차/음료/술</option>
							<option value="기타">기타</option>
						</select>
						<select name="c_situation" id="situation_select" class="content_input select">
							<option value="%%">상황별</option>
							<option value="일상">일상</option>
							<option value="초스피드">초스피드</option>
							<option value="손님접대">손님접대</option>
							<option value="술안주">술안주</option>
							<option value="다이어트">다이어트</option>
							<option value="도시락">도시락</option>
							<option value="영양식">영양식</option>
							<option value="간식">간식</option>
							<option value="야식">야식</option>
							<option value="푸드스타일링">푸드스타일링</option>
							<option value="해장">해장</option>
							<option value="명절">명절</option>
							<option value="이유식">이유식</option>
							<option value="기타">기타</option>
						</select>
						<select name="c_procedure" id="procedure_select" class="content_input select">
							<option value="%%">방법별</option>
							<option value="볶음">볶음</option>
							<option value="끓이기">끓이기</option>
							<option value="부침">부침</option>
							<option value="조림">조림</option>
							<option value="무침">무침</option>
							<option value="비빔">비빔</option>
							<option value="찜">찜</option>
							<option value="절임">절임</option>
							<option value="튀김">튀김</option>
							<option value="삶기">삶기</option>
							<option value="굽기">굽기</option>
							<option value="데치기">데치기</option>
							<option value="회">회</option>
							<option value="기타">기타</option>
						</select>
						<select name="c_ingredient" id="ingredient_select" class="content_input select">
							<option value="%%">재료별</option>
							<option value="소고기">소고기</option>
							<option value="돼지고기">돼지고기</option>
							<option value="닭고기">닭고기</option>
							<option value="육류">육류</option>
							<option value="채소류">채소류</option>
							<option value="해물류">해물류</option>
							<option value="달걀/유제품">달걀/유제품</option>
							<option value="가공식품류">가공식품류</option>
							<option value="쌀">쌀</option>
							<option value="밀가루">밀가루</option>
							<option value="건어물류">건어물류</option>
							<option value="버섯류">버섯류</option>
							<option value="과일류">과일류</option>
							<option value="콩/건과류">콩/건과류</option>
							<option value="곡류">곡류</option>
							<option value="기타">기타</option>
						</select>
						<p class="tip_category tip">
							<img alt="" src="../resources/images/psy/icon_tip.png">
							분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.
						</p>
					</div>
					
					<div class="content_divisor">
						<p class="content_title">요리정보</p>
						<span class="small">인원</span>
						<select name="amount" id="amount_select" class="content_input select">
							<option value="1">1인분</option>
							<option value="2">2인분</option>
							<option value="3">3인분</option>
							<option value="4">4인분</option>
							<option value="5">5인분</option>
							<option value="6">6인분이상</option>
						</select>
						<span class="small" style="margin-left: 50px;">시간</span>
						<select name="elapsedtime" id="elapsedTime_select" class="content_input select">
							<option value="5분이내">5분이내</option>
							<option value="10분이내">10분이내</option>
							<option value="15분이내">15분이내</option>
							<option value="30분이내">30분이내</option>
							<option value="60분이내">60분이내</option>
							<option value="90분이내">90분이내</option>
							<option value="2시간이내">2시간이내</option>
							<option value="2시간이상">2시간이상</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="box2 box">
				<div class="contentPart">
					<p class="tip">
						<img alt="" src="../resources/images/psy/icon_tip.png">
						재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.
					</p>
					<div class="box2_sub">
						<ul class="box2_sub_1">
							<li class="kindSection">
								<a href="#" class="dragBtn"></a>
								<input type="text" name="kind" class="kindInput box2_input" required="required">
								<input type="hidden" class="kind_count" name="kind_count">
								<p class="kindSection_btns">
									<input class="allInsertBtn allBtn" type="button" value="한번에 넣기">
									<input class="allDeleteBtn allBtn" type="button" value="묶음삭제">
								</p>
							</li>
							<li class="ingredientSection">
								<ul class="ingredientSection_ul_0 ingredientSection_ul" data-ul="0">
									<li data-id="0">
										<a href="#" class="dragBtn" ></a>
										
										
										<input type="text" name="i_name" class="ingredientInput box2_input" id="ingredientInput_1" placeholder="예) 돼지고기" required="required">
										<input type="text" name="i_amount" class="ingredientInput box2_input" id="ingredientInput_2" placeholder="예) 300g">
										<div class="deleteBtn delBtn_0"></div>
									</li>
									<li data-id="1">
										<a href="#" class="dragBtn"></a>
										<input type="text" name="i_name" class="ingredientInput box2_input" id="ingredientInput_1" placeholder="예) 양배추" required="required">
										<input type="text" name="i_amount" class="ingredientInput box2_input" id="ingredientInput_2" placeholder="예) 1/2개">
										<div class="deleteBtn delBtn_0"></div>
									</li>
									<li data-id="2">
										<a href="#" class="dragBtn"></a>
										<input type="text" name="i_name" class="ingredientInput box2_input" id="ingredientInput_1" placeholder="예) 참기름" required="required">
										<input type="text" name="i_amount" class="ingredientInput box2_input" id="ingredientInput_2" placeholder="예) 1T">
										<div class="deleteBtn delBtn_0"></div>
									</li>
								</ul>
							</li>
							<input type="button" class="addBtn" value="추가" data-ul="0">
						</ul>
						
					</div>
					
					<div class="box2_sub_2">
						<div>
							<p>※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.</p>
							<input class="addAllBtn" type="button" value="재료/양념 묶음 추가">
						</div>
					</div>
				</div>
			</div>
			
			<div class="box3 box">
				<div class="contentPart">
					<div class="box3_title">
						<span>요리순서</span>
						<input type="button" value="순서사진 한번에 넣기">
					</div>
					<div class="tip">
						<div id="tip_step_1">
							<img alt="" src="../resources/images/psy/icon_tip.png">
							 요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.
						</div>
						<div id="tip_step_2">
							예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.
						</div>
					</div>
					<div class="stepSection">
						<article class="step" data-step="1">
							<p class="step_title">Step<span>1</span></p>
							<textarea name="explain" class="step_contents content_input" required="required" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea>
							<div class="step_picture">
								<input type="button" class="replace_step">
								<input type="file" class="upload_step" name="step_pic" accept="image/*" required="required">
								<img class="deleteStepPic" alt="" src="../resources/images/psy/delete.png">
							</div>
							<div class="step_menu">
								<p class="upStepButton">
									<span class="glyphicon glyphicon-chevron-up moveUp"></span>
								</p>
								<p class="downStepButton">
									<span class="glyphicon glyphicon-chevron-down moveDown"></span>
								</p>
								<p class="addStepButton">
									<span class="glyphicon glyphicon-plus"></span>
								</p>
								<p class="deleteStepButton">
									<span class="glyphicon glyphicon-remove"></span>
								</p>
							</div>
						</article>
					</div>
					<input type="button" class="addStepBtn addStepButton" value="순서추가" data-ul="0">
				</div>
			</div>
			<div class="box4 box">
				<div class="contentPart">
					<span class="box4_title">태그</span>
					<ul class="tag_ul">
						<li class="tag_form">
							<ul>
								<li class="tag_insert">
									<input type="text" class="tag_input">
								</li>
							</ul>
						</li>
					</ul>
					<div>
						<span class="tag_tip">주재료, 목적, 효능, 대상 등을 태그로 남겨주세요.</span>
						<span class="tip">예) 돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단</span>
					</div>
				</div>
			</div>
			
			<span class="dragTooltip">드래그로 순서변경할 수 있습니다.</span>
			<div class="finalBtns">
				<button id="saveBtn" >저장</button>
				<button type="button" id="cancleBtn" >취소</button>
			</div>
		</form>
		<div class="popUp"></div>		
	</section>
	
	<!-- modal -->
	<section class="modal_section">
		<div class="modal_title">
			<span id="title_text">재료 한 번에 넣기</span>
			<span id="title_img">
				<img alt="" src="../resources/images/psy/btn_close.gif">
			</span>
		</div>
		<div class="modal_content">
			<div id="content_text1">요리에 들어갈 재료, 양념을 작성 또는 따로 작성된 것을 복사/붙여넣기 해주세요.</div>
			<textarea class="modal_input" placeholder="<예시>&#13;&#10;[스테이크 재료]돼지고기 500g, 양파 1/2개, 고추 1개, 간장&#13;&#10;[파절임]대파 3개, 고춧가루 1숟가락, 매실엑기스 3숟가락, 식초 3숟가락&#13;&#10;[양념]고춧가루 2T, 진간장 1T, 참치액 1T, 참기름1T"></textarea>
			<div class="content_text2">
				*재료가 남거나 부족하지 않도록 <strong>정확히</strong> 작성<br>
				*각 식재료는 <strong>","쉼표로</strong> 구분<br>
				*한개, 반개, 한개반과 같은 표기는 1개, <strong>1/2개, 1+1/2개(또는 1.5개)</strong>와 같이 작성<br>
				*재료 및 양념, 소스 등을 구분할 경우 <strong>"[]"대괄호를 사용</strong><br>
				*입력란에 작성된 <strong>예시를 참고</strong><br>
			</div>
			<div class="modal_buttons">
				<button type="button" id="m_saveBtn">확인</button>
				<button type="button" id="m_cancleBtn">취소</button>
			</div>
			<div class="explain">
				<img alt="" src="../resources/images/psy/modal_explain.jpg">
			</div>
		</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
</html>
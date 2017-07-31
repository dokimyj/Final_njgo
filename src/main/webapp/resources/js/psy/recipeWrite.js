function readURL(input, flag) {
	if(input.files && input.files[0]) {		// files : 파일의 정보를 알 수 있음
		var reader = new FileReader();		// FileReader : 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해줌
		
		if(input.files[0].type.indexOf('image') < 0) {
			alert("이미지 파일을 선택해주십시오.");
			return;
		}
		
		reader.onload = function (e) {		// 파일을 다 읽었을 때 실행되는 부분
			// e.target : 이벤트가 일어난 곳
			
			if(flag == "main") {
				$(".replace").css("border", "0");
				$(".replace").css("background-image", "url('../resources/images/psy/loading.gif')");
				setTimeout(function(){
					  $('.replace').css("background-image", "url('" + e.target.result + "')");
					}, 1300);// 해당 파일의 base64값(이미지를 base64형식으로 변환한 것)을 가져옴
			} else {
				$(".replace_step").eq(flag - 1).css("border", "0");
				$(".replace_step").eq(flag - 1).css("background-image", "url('../resources/images/psy/loading.gif')");
				setTimeout(function(){
					  $('.replace_step').eq(flag - 1).css("background-image", "url('" + e.target.result + "')");
					}, 1100);// 해당 파일의 base64값(이미지를 base64형식으로 변환한 것)을 가져옴
			}
		}
		// Blob이나 File에서 읽어오는 역할. 이 작업이 끝나면 load 이벤트가 트리거된다. 즉, 이 작업 완료 후 reader.onload 실행
		reader.readAsDataURL(input.files[0]);	// 이와 함께 base64 인코딩된 스트링 데이터가 result 속성에 담아지게 된다.
	}
}
function addIngredient(num, index) {
	var str ='<li data-id="' + num + '">';
	str += '<a href="#" class="dragBtn"></a>';
	str += '<input type="text" name="i_name" class="ingredientInput box2_input" id="ingredientInput_1" placeholder="예) ' + nameArray[num] + '" required="required">';
	str += '<input type="text" name="i_amount" class="ingredientInput box2_input" id="ingredientInput_2" placeholder="예) ' + amountArray[num] + '">';			
	str += '<div class="deleteBtn delBtn_' + index + '"></div>';
	str += '</li>';
	
	$(".ingredientSection_ul_" + index).append(str);
}
function video() {
	var str = $("#video").val();
	var substr = str.substring(0, 16);
	
	if(substr == "https://youtu.be") {
		var video_id = str.substring(17);
		$("#videoPicture").attr("src", "../resources/images/psy/loading.gif");
		setTimeout(function(){
			$("#videoPicture").attr("src", "http://img.youtube.com/vi/" + video_id + "/mqdefault.jpg");
			}, 1000);
		
	}
}
function addIngredientSec(index) {
	var str = '';
	str += '<ul class="box2_sub_1">';
	str += '<li class="kindSection">';
	str += '<a href="#" class="dragBtn"></a>';
	str += '<input type="text" name="kind" class="kindInput box2_input" required="required">';
	str += '<input type="hidden" class="kind_count" name="kind_count">';
	str += '<p class="kindSection_btns">';
	str += '<input class="allInsertBtn allBtn" type="button" value="한번에 넣기">';
	str += '<input class="allDeleteBtn allBtn" type="button" value="묶음삭제">';
	str += '</p>';
	str += '</li>';
	str += '<li class="ingredientSection">';
	str += '<ul class="ingredientSection_ul_' + index + ' ingredientSection_ul" data-ul="' + index + '">';
	
	for(var i=0;i<3;i++) {
		str += '<li data-id="' + i + '">';
		str += '<a href="#" class="dragBtn"></a>';
		str += '<input type="text" name="i_name" class="ingredientInput box2_input" id="ingredientInput_1" placeholder="예) ' + nameArray[i] + '"  required="required">';
		str += '<input type="text" name="i_amount" class="ingredientInput box2_input" id="ingredientInput_2" placeholder="예) ' + amountArray[i] + '">';
		str += '<div class="deleteBtn delBtn_' + index + '"></div>';
		str += '</li>';
	}

	str += '</ul>';
	str += '</li>';
	str += '<input type="button" class="addBtn" value="추가" data-ul="' + index + '">';
	str += '</ul>';
	
	$(".box2_sub").append(str);
	$(".ingredientSection_ul").sortable();
}
function allDelete(selector) {
	if( ($(".box2_sub").find("ul").length)/2 > 1 ) {
		selector.closest('ul').remove();
	} else {
		$(".box2_sub").find(".box2_input").val("");
	}
}
function addStep() {
	var num = $(".stepSection").find(".step").length + 1;
	var ph_num = ( $(".stepSection").find(".step").length ) % 4;
	
	var str = '<article class="step" data-step="' + num + '">';
	str += '<p class="step_title">Step<span>' + num + '</span></p>';
	str += '<textarea name="explain" class="step_contents content_input" required="required" placeholder="예) ' + stepArray[ph_num] + '"></textarea>';
	str += '<div class="step_picture">';
	str += '<input type="button" class="replace_step">';
	str += '<input type="file" class="upload_step" name="step_pic" accept="image/*" required="required">';
	str += '<input type="hidden" class="upload_step_check" name="step_pic_check" value="yes">';
	str += '<img class="deleteStepPic" alt="" src="../resources/images/psy/delete.png">';
	str += '</div>';
	str += '<div class="step_menu">';
	str += '<p class="upStepButton">';
	str += '<span class="glyphicon glyphicon-chevron-up moveUp"></span>';
	str += '</p>';
	str += '<p class="downStepButton">';
	str += '<span class="glyphicon glyphicon-chevron-down moveDown"></span>';
	str += '</p>';
	str += '<p class="addStepButton">';
	str += '<span class="glyphicon glyphicon-plus"></span>';
	str += '</p>';
	str += '<p class="deleteStepButton">';
	str += '<span class="glyphicon glyphicon-remove"></span>';
	str += '</p>';
	str += '</div>';	
	str += '</article>';
	
	$(".stepSection").append(str);
}
function deleteStepPicture(selector) {
	var num = (selector.closest('article').attr("data-step") * 1) - 1;
	
	$(".deleteStepPic").eq(num).css("display","none");
	$(".replace_step").eq(num).css("border","1px solid #e1e1e1");
	$(".replace_step").eq(num).css("background-image","url('../resources/images/psy/pic_none2.gif')");
	$(".upload_step").eq(num).val("");
}
function deleteStep(selector) {
	if($(".step").length > 1) {
		var num = (selector.closest('article').attr("data-step") * 1) - 1;
		
		$(".step").eq(num).remove();
		
		for(var i=num;i<$(".step").length;i++) {
			var tmp = $(".step").eq(i).attr("data-step") * 1;
			
			$(".step").eq(i).attr("data-step", tmp - 1);
			$(".step").find(".step_title span").eq(i).text(tmp - 1);
		}
	} else {
		$(".step").contents().val('');
		$('.deleteStepPic').trigger('click');
	}
}
function moveUp(selector) {
	var num = selector.closest('article').attr("data-step") * 1;
	
	if(num > 1) {
		selector.closest('article').prev().attr("data-step", num);
		selector.closest('article').prev().find(".step_title span").text(num);
		selector.closest('article').after(selector.closest('article').prev());
		selector.closest('article').attr("data-step", num - 1);
		selector.closest('article').find(".step_title span").text(num - 1);
	}
}
function moveDown(selector) {
	var num = selector.closest('article').attr("data-step") * 1;
	
	if(num < $('.step').length) {
		selector.closest('article').next().attr("data-step", num);
		selector.closest('article').next().find(".step_title span").text(num);
		selector.closest('article').before(selector.closest('article').next());
		selector.closest('article').attr("data-step", num + 1);
		selector.closest('article').find(".step_title span").text(num + 1);
	}
}
function tagDuplication(selector) {	
	var flag = 'on';
	var duplication = null;
	
	if(selector.val() != '') {
		for(var i=0;i<tagArray.length;i++) {
			if(selector.val() == tagArray[i]) {
				flag = 'off';
				$(".tag_input").val("");
				duplication = i;
				break;
			}
		}
		
		if(duplication != null) {
			$(".tag_view_div").eq(duplication).css("animation-name", "example");
			$(".tag_view_div").eq(duplication).css("animation-duration", "0.5s");
		}
		
		if(flag == 'on') {
			addTag(selector.val());
		}
	}
}
function addTag(inputVal) {
	var str = '<li class="tag_view">';
	str += '<div class="tag_view_div">';
	str += '<span class="tag_text">' + inputVal + '</span>';
	str += '<input type="hidden" name="hashtag" value="' + inputVal + '">';
	str += '<img id="deleteTagBtn" src="../resources/images/psy/remove-small.png">';
	str += '</div>';
	str += '</li>';
	
	$(".tag_insert").before(str);
	$(".tag_input").val("");
	tagArray.push(inputVal);
}
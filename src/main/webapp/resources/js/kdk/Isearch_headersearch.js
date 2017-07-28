/**
 * 
 */

function search(find){
    if(event.keyCode == 13){
    	$.ajax({
    		url:"./recipe/search",
    		type:"GET",
    		data:{
    			find:find.value
    		},
    		success:function(data){
    			$('.main_section').html(data.trim());
    		}
    	});
	}
}
function ingsearch(find){
	$.ajax({
		url:"./recipe/inglist",
		type:"GET",
		data:{
			find:find.value
		},
		success:function(data){
			$('.ings').html(data.trim());
		}
	});
}
$('.ing_btn').click(function(){
	var ings=$('.ingkeyword').val();
	$('.ing_search').append('<span class="btn btn-warning ingx" style="margin: 0 1% 1% 0" title="'+ings+'">'+ings+'<strong class="badge ing" style="cursor:pointer">X</strong></span>');
	$('.ingkeyword').val('');
});
$('.ing_search').on("click", ".ingx", function(){
	$(this).remove();
});
$('.isearch_btn').click(function(){
	jQuery.ajaxSettings.traditional = true;
	var ar=new Array();
	var x=document.getElementsByClassName('ingx');
	for(i=0;i<x.length;i++){
		ar.push(x[i].title);
	}
	if($('.ing_search').html()!=''){
		$.ajax({
			url:"./recipe/isearch",
			data:{
				ingredients:ar
			},
			success:function(data){
				for(i=0;i<ar.length;i++){
					$('.main_section').html('<input type=hidden name=curIng value='+ar[i]+'>');
					//나중에 레시피를 클릭했을 때 해당 재료들을 넘기기 위함, 컨트롤러 view에서 string배열로 받아 그대로 전달 예정.
				}
				$('.main_section').append(data.trim());
			}
		});
	}else{
		alert('재료를 선택하신 후 검색해 주세요!');
	}
});
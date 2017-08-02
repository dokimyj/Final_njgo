<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" media="all" href="http://d1hk7gw6lgygff.cloudfront.net/assets/application-661e969b01a864ad51eee95fed275e3a.css">
<div class="modal fade" id="recipeView" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" style="height: 1500px">
				<div class="view_left" style="background-color: green; height:100%; width:70%; float:left; padding:5%;">
					<input type=hidden id=recipenum>
						<!-- (num 히든) -->
					<div class=rep_pic>
						<img src="" style="overflow:hidden; width:50%; height:50%;">				
				</div>
				<div class=r_intro>
					${recipe.recipeDTO.r_intro }
				</div>
				<div class=cart_preview>
					<!-- 쇼핑몰쪽 DB에서 재료를 비교(hidden에 있는 curIng를 받아서 사용) -->
				</div>
				<div class=hashtags>
					<c:forEach items="${hashtags }" var="tags">
						<a class="btn btn-warning tags" style="margin: 0 1% 1% 0; display: inline;" href="/recipe.recipeDTO/search?find=${tags }">${tags }</a>
					</c:forEach>
				</div>

				<div class=steps>
					<table>
					<c:forEach items="${steps }" var="steps">
						<tr>
							<td>${steps.step }</td>
							<td>${steps.explain }</td>
							<td><img src="../resources/upload/${steps.fname }"></td>
						</tr>
					</c:forEach>
					</table>
				</div>
				<hr>
				<div class=reply-review-btns>
				<ul class="nav nav-tabs">
  					<li class="active"><a href="#">Home</a></li>
 					<li><a href="#">Menu 1</a></li>
				</ul>
				</div>
				
				</div>
				<div class="view right" style="background-color: black; height: 100%; width: 30%; float:right; padding-top:2%;"> <!-- width: 30%; float: right; background-color: black;  -->
					<div class="profile_section">
						<!-- 		세션의 profile writer 회원 url(블로그 등)-->
					</div>
					<div class="title_section">
						<span class=titles>${recipe.recipeDTO.title }</span>
						<span class=foodname>${recipe.recipeDTO.foodname }</span>
					</div>
					<div class="elapsedtime-scrap">
						<span class=elapsedtime></span>
						<span class=scrap></span>				
					</div>
					<div class=scrapbtn>
						<!-- button width: 145px; height: 35px; border: none;font-size: 14px;
    border-radius: 35px;    cursor: pointer;    vertical-align: middle;text-indent: 25px;
    					input type hidden 2개, value=세션닉네임 과 이 글 넘버.-->
					</div>
					<div class=rating-hit-claim>
						<span class=rating><img src="../resources/images/kdk/fridge.png" style="display:inline">&nbsp;&nbsp;${recipe.recipeDTO.rating }&nbsp;&nbsp;/&nbsp;&nbsp;5.00</span>
						<br>
						<span class=hit></span>
						<span class=claim>신고하기</span>
					</div>

					<div class=ingre style="position:fixed; display:inline-block;">
						<strong>재료리스트</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${recipe.recipeDTO.amount }인 기준</span>
						<table>
							<c:forEach items="${ingredients }" var="ings">
								<tr>
									<td>${ings.kind }</td>
									<td>${ings.name }</td>
									<td>${ings.amount }</td>
								</tr>
							</c:forEach>
						</table>
					</div>

reply, review
list.: num, writer, contents, time, ref, step, depth
list.: num, writer, contents, rating

				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
				<span style='background-image: url("../resources/images/kdk/btn_top-62b456f2a56a031d3b40e64137fe8aa9.png")' id=topbtn>&nbsp;&nbsp;</span>
			</div>
		</div>
	</div>
	
<div id="modal-box" class="show"><div id="modal-content" class="show"><div class="ly_recipe">
		<div class="view_recipe">
      <link rel="stylesheet" type="text/css" href="http://d1hk7gw6lgygff.cloudfront.net/assets/_css/recipe-d33ff6c337d50265a6f5504ccd5e8adf.css?1501648841">
      <link rel="stylesheet" type="text/css" href="http://d1hk7gw6lgygff.cloudfront.net/assets/_css/flexslider-20914758f3f6c44b8fd981f2e354334a.css?1501648841">

			<!-- [D] 닫기, 맨위로 버튼 : 추가 150324 -->
			<button type="button" class="btn_ly_close" title="닫기">창닫기</button>
			<button type="button" class="btn_top" title="맨위로">Top</button>
			<!-- //닫기, 맨위로 버튼 추가 -->

			<!-- [D] 우측 정보 영역 -->
			<section class="sec_info" style="height: 8569px;">
				<div class="aside">
					<div class="top">
						<div class="user">
								<div class="img-cover">
									<a href="/profile/36">
										<img class="img_user" alt="" src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/user/image_file/36/thumb_DSC01242.jpg&amp;convert=jpgmin&amp;rt=600">
</a>								</div>
								<strong class="best"><a href="/profile/36">파피용</a></strong>
								<a target="_blank" href="http://ensia10.blog.me">http://ensia10.blog.me</a>
						</div>

						<h1>
							초간단 요리 몽골리안 비프 만들기
							<strong>몽골리안 비프</strong>
						</h1>
						<dl class="info_basic">
							<dt class="time">조리시간</dt>
							<dd>30분</dd>
							<dt class="scrap">스크랩</dt>
							<dd id="scrap-cnt">146</dd>
							<!-- [D] 스크랩이 된 경우 :
							<dt class="scrap on"><a href="#">스크랩</a></dt><dd>1,230</dd>
							-->
							<dt class="cal">칼로리</dt><dd>513.0 kcal</dd>
						</dl>

						<!-- [D] 버튼영역 추가 150314 -->
						<div class="btn_area">
								<form action="/bookmarks" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="onOKHMTIDPVWN/w2ZDcNNDip9ntE5DThCXb/Gt9F1O73Z11BHlPHbkWPE99QjOoHAvi1FHmzIeOvHPaB4FCG2w==">
                  <input type="hidden" name="linked_model_type" value="Recipe">
                  <input type="hidden" name="linked_model_id" value="616">
									<button type="submit" class="btn_scrap">스크랩</button>
</form>						</div>
						<!-- //버튼영역 추가 -->
					</div>
					<div class="mid">
						<div class="share_area">
							<ul>
								<li><a href="javascript:;" class="fb-share" title="페이스북" data-url="http://haemukja.com/recipes/616"><img src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_facebook-2bf6e9a49d06a00b0ac8c3611e78e5a0.png" alt="Ico facebook"></a></li>
								<li><a href="javascript:;" class="kakao-share" title="카카오스토리" data-url="http://haemukja.com/recipes/616" data-title="초간단 요리 몽골리안 비프 만들기" data-desc="새댁의 끊임없는 고민 오늘 뭐 먹지? 저는 각종 요리책과 블로그 구독, 플친 까똑으로 고민을 덜고 있어요 ㅎㅎㅎ 지난주에 까똑으로 온 수퍼레시피의 몽골리안 비프! 한 번도 접하지 않은 음식을 보면 궁금증 병이 발동하여 레시피가 간단하다면 바로 해서 시식! 주말 점심 특별한 이색 요리해준다고 큰소리치며 오늘은 중화 요리야~~~ 그리하여 시작한 초간단 몽골리안 비프~" data-img="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7192/big_thumb_DSC03077.JPG"><img src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_kakao-e617ac85a8a5cd536ef7e28f70cbdaff.png" alt="Ico kakao"></a></li>
								<li><a href="javascript:;" class="twt-share" title="트위터" data-text="초간단 요리 몽골리안 비프 만들기" data-url="http://haemukja.com/recipes/616"><img src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_twitter-e1a071139f41750e93a43ccff77d9688.png" alt="Ico twitter"></a></li>
								<li><a href="javascript:;" class="url-share" title="URL복사" data-url="http://haemukja.com/recipes/616"><img src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_link-2aba6c484fbf4b0da4a7f86822ab4c0d.png" alt="Ico link"></a></li>
							</ul>
						</div>
						<a href="mailto:help@vitalhint.com" class="btn_report">신고하기</a>

						<!-- [D] 신고하기 레이어
						<div class="ly_report">
							<a href="javascript:;" class="btn_close">닫기</a>
							<dl>
								<dt>신고하기</dt>
								<dd>
									<input type="text" placeholder="제목을 입력하세요">
									<input type="email" placeholder="이메일을 입력하세요">
									<textarea></textarea>
								</dd>
							</dl>
							<div class="btn_area">
								<button type="button">취소</button>
								<button type="button" class="btn_done">확인</button>
							</div>
						</div>
						<!-- //신고하기 레이어 -->

					</div>

					<div class="btm">
						<h2>재료리스트</h2>
						<div class="dropdown">
							2인 기준
						</div>

						<ul class="lst_ingrd">
								<li><span>소안심</span><em>200g</em></li>
								<li><span>청경채</span><em>4포기</em></li>
								<li><span>양파</span><em>1/2 개(소)</em></li>
								<li><span>숙주나물</span><em>2 줌 (200g)</em></li>
								<li><span>굴소스</span><em>1 숟가락</em></li>
								<li><span>식용유</span><em>1 숟가락</em></li>
								<li><span>페페론치노</span><em>6 쪽</em></li>
								<li><span>&lt;고기밑간&gt;</span><em></em></li>
								<li><span>다진 마늘</span><em>1/2 숟가락</em></li>
								<li><span>청주</span><em>1 숟가락</em></li>
								<li><span>진간장</span><em>1 숟가락</em></li>
								<li><span>굴소스</span><em>1/2 숟가락</em></li>
								<li><span>백설탕</span><em>1/2 숟가락</em></li>
						</ul>
					</div>
				</div>
			</section>
			<!-- //우측 정보 영역 -->



			<!-- [D] 좌측 상세 영역 -->
			<section class="sec_detail">
				
					<!-- [D] 상단 이미지슬라이더 -->
					<div class="slider_recipe">
						<div id="slider" class="flexslider main">
							<span></span>
							
						<div class="flex-viewport" style="overflow: hidden; position: relative;"><ul class="slides main" style="width: 2600%; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
									<li style="height: 600px; width: 600px; float: left; display: block;" class="flex-active-slide">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7192/pad_thumb_DSC03077.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03077" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7193/pad_thumb_DSC03067.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03067" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7194/pad_thumb_DSC03068.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03068" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7195/pad_thumb_DSC03069.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03069" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7196/pad_thumb_DSC03070.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03070" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7197/pad_thumb_DSC03071.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03071" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7198/pad_thumb_DSC03072.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03072" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7199/pad_thumb_DSC03073.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03073" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7200/pad_thumb_DSC03074.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03074" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7201/pad_thumb_DSC03075.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03075" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7202/pad_thumb_DSC03078.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03078" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7203/pad_thumb_DSC03082.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03082" draggable="false">
									</li>
									<li style="height: 600px; width: 600px; float: left; display: block;">
										<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7204/pad_thumb_DSC03083.JPG&amp;convert=jpgmin&amp;rt=600" alt="Pad thumb dsc03083" draggable="false">
									</li>
							</ul></div><ul class="flex-direction-nav"><li class="flex-nav-prev"><a class="flex-prev flex-disabled" href="#" tabindex="-1">Previous</a></li><li class="flex-nav-next"><a class="flex-next" href="#">Next</a></li></ul></div>
						<div id="carousel" class="flexslider">
							
						<div class="flex-viewport" style="overflow: hidden; position: relative;"><ul class="slides" style="width: 2600%; transition-duration: 0s;">
									<li class="flex-active-slide" style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7192/small_thumb_DSC03077.JPG" alt="Small thumb dsc03077" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7193/small_thumb_DSC03067.JPG" alt="Small thumb dsc03067" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7194/small_thumb_DSC03068.JPG" alt="Small thumb dsc03068" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7195/small_thumb_DSC03069.JPG" alt="Small thumb dsc03069" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7196/small_thumb_DSC03070.JPG" alt="Small thumb dsc03070" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7197/small_thumb_DSC03071.JPG" alt="Small thumb dsc03071" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7198/small_thumb_DSC03072.JPG" alt="Small thumb dsc03072" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7199/small_thumb_DSC03073.JPG" alt="Small thumb dsc03073" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7200/small_thumb_DSC03074.JPG" alt="Small thumb dsc03074" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7201/small_thumb_DSC03075.JPG" alt="Small thumb dsc03075" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7202/small_thumb_DSC03078.JPG" alt="Small thumb dsc03078" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7203/small_thumb_DSC03082.JPG" alt="Small thumb dsc03082" draggable="false">
									</li>
									<li style="width: 102px; float: left; display: block;">
										<img src="http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7204/small_thumb_DSC03083.JPG" alt="Small thumb dsc03083" draggable="false">
									</li>
							</ul></div><ul class="flex-direction-nav"><li class="flex-nav-prev"><a class="flex-prev" href="#">Previous</a></li><li class="flex-nav-next"><a class="flex-next" href="#">Next</a></li></ul></div>
					</div>

					<!-- [D] 문구추가 150404 -->
					<h2>영양정보<span>(하루 적정섭취량, 1인분 기준)</span></h2>
					<!-- //문구추가 150404 -->
					<div class="nutrition">
						<ul>
								<li class="circle_c01 circliful" data-dimension="125" data-text="256.5<span>kcal</span>" data-info="칼로리" data-width="8" data-fontsize="30" data-percent="25" data-fgcolor="#839705" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">칼로리 256.5kcal (25.7%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">256.5<span>kcal</span></span><span class="circle-info-half" style="line-height: 156.25px;">칼로리</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c02 circliful" data-dimension="125" data-text="4.6<span>%</span>" data-info="탄수화물" data-width="8" data-fontsize="30" data-percent="4" data-fgcolor="#e36113" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">탄수화물 15.0g (4.6%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">4.6<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">탄수화물</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c03 circliful" data-dimension="125" data-text="48.4<span>%</span>" data-info="단백질" data-width="8" data-fontsize="30" data-percent="48" data-fgcolor="#2f97bd" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">단백질 26.6g (48.4%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">48.4<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">단백질</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c04 circliful" data-dimension="125" data-text="20.5<span>%</span>" data-info="지질" data-width="8" data-fontsize="30" data-percent="20" data-fgcolor="#c43f68" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">지질 10.4g (20.5%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">20.5<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">지질</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c05 circliful" data-dimension="125" data-text="61.8<span>%</span>" data-info="나트륨" data-width="8" data-fontsize="30" data-percent="61" data-fgcolor="#37baa9" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">나트륨 1235.8mg (61.8%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">61.8<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">나트륨</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c06 circliful" data-dimension="125" data-text="16.4<span>%</span>" data-info="콜레스테롤" data-width="8" data-fontsize="30" data-percent="16" data-fgcolor="#905bcb" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">콜레스테롤 49.3mg (16.4%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">16.4<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">콜레스테롤</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c07 circliful" data-dimension="125" data-text="28.5<span>%</span>" data-info="식이섬유" data-width="8" data-fontsize="30" data-percent="28" data-fgcolor="#2bbfd1" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">식이섬유 7.1g (28.5%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">28.5<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">식이섬유</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c08 circliful" data-dimension="125" data-text="26.1<span>%</span>" data-info="칼슘" data-width="8" data-fontsize="30" data-percent="26" data-fgcolor="#af9128" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">칼슘 182.6mg (26.1%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">26.1<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">칼슘</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
								<li class="circle_c09 circliful" data-dimension="125" data-text="87.2<span>%</span>" data-info="비타민c" data-width="8" data-fontsize="30" data-percent="87" data-fgcolor="#5667bc" data-dgcolor="#c5c5c5" data-bgcolor="#c5c5c5" style="width: 125px;">
									<p style="display:none;">비타민c 87.2mg (87.2%)</p>
								<span class="circle-text" style="line-height: 125px; font-size: 30px;">87.2<span>%</span></span><span class="circle-info-half" style="line-height: 156.25px;">비타민c</span><canvas width="125" height="125" style="width: 125px; height: 125px;"></canvas></li>
						</ul>
					</div>

				<h2>태그 정보</h2>
				<div class="box_tag">
						<a href="/recipes?category_group3%5B%5D=97">쇠고기</a>
						<a href="/recipes?category_group3%5B%5D=176">볶음요리</a>
						<a href="/recipes?category_group1%5B%5D=213">간식/야식</a>
						<a href="/recipes?category_group1%5B%5D=214">술안주</a>
						<a href="/recipes?category_group1%5B%5D=219">실생활 요리</a>
						<a href="/recipes?category_group2%5B%5D=228">한식 요리</a>
						<a href="/recipes?category_group2%5B%5D=229">중식 요리</a>
						<a href="/recipes?category_group3%5B%5D=236">채소류 요리</a>
				</div>

				<section class="sec_rcp_step">
					<h2>레시피</h2>
					<div class="mode_view">
						<ul>
							<li class="blog-mode on"><a href="javascript:;" class="big" onclick="switch_recipe_layout('blog')">크게 보기</a></li>
							<li class="grid-mode"><a href="javascript:;" class="grid" onclick="switch_recipe_layout('grid')">작게 보기</a></li>
							<li><a href="javascript:;" class="full" onclick="open_full_layout(616)">전체화면</a></li>
						</ul>
					</div>

					<ol class="lst_step">

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7192/org_resized_DSC03077.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03077">
								</div>
								<p>새댁의 끊임없는 고민 오늘 뭐 먹지? 저는 각종 요리책과 블로그 구독, 플친 까똑으로 고민을 덜고 있어요 ㅎㅎㅎ 지난주에 까똑으로 온 수퍼레시피의 몽골리안 비프! 한 번도 접하지 않은 음식을 보면 궁금증 병이 발동하여 레시피가 간단하다면 바로 해서 시식! 주말 점심 특별한 이색 요리해준다고 큰소리치며 오늘은 중화 요리야~~~ 그리하여 시작한 초간단 몽골리안 비프~</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7193/org_resized_DSC03067.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03067">
								</div>
								<p>소고기는 안심으로 준비했어요~~</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7194/org_resized_DSC03068.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03068">
								</div>
								<p>저는 도톰하고 길게 손질한 후 키친타월에 잠시 핏물을 빼주었어요.</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7195/org_resized_DSC03069.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03069">
								</div>
								<p>&lt;고기밑간&gt;분량의 재료를 넣고 미리 밑간을 해주세요~</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7196/org_resized_DSC03070.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03070">
								</div>
								<p>고기 밑간을 하는 동안 사용될 채소들을 손질했어요. 청경채는 뿌리 부분을 자르고 입을 다 분리해주시고~양파도 얇게 채 썰어주세요.</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7197/org_resized_DSC03071.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03071">
								</div>
								<p>숙주도 찬물에 깨끗하게 씻어주세요. 저는 원래 레시피보다 숙주를 좋아해서 넉넉하게 준비했어요.</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7198/org_resized_DSC03072.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03072">
								</div>
								<p>달궈진 팬에 기름을 두르고 소고기를 센 불에서 빠르게 2분 정도 볶아주세요.</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7199/org_resized_DSC03073.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03073">
								</div>
								<p>바로 청경채, 양파, 숙주와 굴 소스 1T를 넣고 계속 볶아줍니다.</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7200/org_resized_DSC03074.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03074">
								</div>
								<p>저는 이때 매콤한 맛이 나면 좋을 것 같아서 페페론치노를 6개 부숴서 넣어주었어요.<br>원래 레시피는 없는 재료니 생략해주셔도 괜찮아요~</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7201/org_resized_DSC03075.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03075">
								</div>
								<p>1분 30초~2분 정도 빠르게 볶아준 후 접시에 담으면 완성!</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7202/org_resized_DSC03078.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03078">
								</div>
								<p></p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7203/org_resized_DSC03082.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03082">
								</div>
								<p>이색적이고 맛깔스러운 비주얼~~</p>
							</li>

							<li>
								<div class="img-cover">
									<img src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/7204/org_resized_DSC03083.JPG&amp;convert=jpgmin&amp;rt=600" alt="Org resized dsc03083">
								</div>
								<p>굴 소스 덕에 달콤 짭짤해서~ 메인 밥반찬으로도 손색이 없었어요! 채소와 고기를 듬뿍 집어서 먹으니  깔끔하면서도 채소 덕에 식감도 너무너무 좋았답니다~ 채소가 아삭아삭 넘 맛있어서 계속 집어먹으니나중에 고기만 몽창 남는 불상사가...-_- 메인 요리로도 괜찮지만 손님 초대요리로도 손색없을 것 같아요! 비교적 재료도 하는 법도 간단하니이색 요리가 먹고 싶을 때 추천드려요~</p>
							</li>
					</ol>
				</section>

				<!-- [D] 나도해봤어요 : 사용자리뷰 영역 -->
				<section class="sec_review" style="display: none;">
					<h2>나도 해봤어요</h2>
					<div class="star_rate">
						사용자 총 평점
						<span class="star">별점<strong class="s4">4점</strong></span>
					</div>
					<p class="count_review"><em>230</em>개의 리뷰가 있습니다.</p>

					<ul class="lst_review">
						<!-- [D] 등록된 리뷰가 없는 경우 -->
						<li class="no_review">현재 남겨진 리뷰가 없습니다.<br>첫 리뷰를 남겨주세요.</li>

						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s3">3점</strong></span>
							<img src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s1">1점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s3">3점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s1">1점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s3">3점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s1">1점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						
						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s3">3점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
						<li>
							<strong><a href="#">사용자명1</a></strong>
							<p>뼈가 없는 닭다리살을 준비해주세요. 칼끝으로 칼집을 내주세요. 저는 닭껍질을 안좋아해서 다 떼어냈어요.</p>
							<span class="star">별점<strong class="s1">1점</strong></span>
							<img class="img_thmb" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/@sample/img_sample_review-bd33f3e5652a738e34412289252d911b.jpg" alt="Img sample review">
						</li>
					</ul>

					<div class="paging">
						<a href="#" class="prev">이전</a>
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#" class="current">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#" class="next">다음</a>
					</div>

					<div class="btn_area">
						<button type="button" class="btn_orange btn_add_review">해봤어요 등록하기</button>
					</div>

					<!-- [D] 해봤어요 레이어 -->
					<div class="ly_view">
						<a href="#" class="btn_close">닫기</a>
						<dl>
							<dt>나도해봤어요 작성하기</dt>
							<dd>
								<div class="judge_review">
									<label>
										<input type="radio" name="star_rate"><span class="star">별점<strong class="s5">5점</strong></span>
									</label>
									<label>
										<input type="radio" name="star_rate"><span class="star">별점<strong class="s4">4점</strong></span>
									</label>
									<label>
										<input type="radio" name="star_rate"><span class="star">별점<strong class="s3">3점</strong></span>
									</label>
									<label>
										<input type="radio" name="star_rate"><span class="star">별점<strong class="s2">2점</strong></span>
									</label>
									<label>
										<input type="radio" name="star_rate"><span class="star">별점<strong class="s1">1점</strong></span>
									</label>
								</div>
								<input type="text"><button type="button" class="btn_pic">등록하기</button>
								<textarea placeholder="리뷰를 남겨주세요."></textarea>
							</dd>
						</dl>
						<div class="btn_area">
							<button type="button">취소</button>
							<button type="button" class="btn_done">등록완료</button>
						</div>
					</div>
					<!-- //신고하기 레이어 -->

				</section>
				<!-- //나도해봤어요 : 사용자리뷰 영역 -->

				<!-- [D] 한줄댓글 : 코멘트 영역 -->
				<section class="sec_comment">
					<h2>한줄댓글</h2>
	<form class="box_write" id="new_comment" action="/recipes/616/comments" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="2WJzlIf0SSNfZXJxdZsYaMXWX2BNEYDgjdlyrwiMnguMdqTJXW+CuEzdnZhBIP9b/4ccD3BGleIrs3s0N5nMPg==">
		<textarea placeholder="한 줄 댓글을 남겨주세요." name="comment[comment]" id="comment_comment"></textarea>
		<button name="button" type="submit">댓글남기기</button>
</form><ul class="lst_comment">
			<li class="">
			<div class="img-cover">
					<img class="img_user" src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/user/image_file/918551/thumb_photo.jpg&amp;convert=jpgmin&amp;rt=600" alt="Thumb photo">
			</div>
			<strong>C</strong><time>2016-11-13</time>
			<p>잎을.</p>
		</li>

</ul>




				</section>
				<!-- //한줄댓글 : 코멘트 영역 -->

			</section>
			<!-- [D] 좌측 상세 영역 -->
		</div>
		<!-- //레시피 상세보기 레이어 -->

		<div class="bg"></div>
	</div></div></div>
<script>
	$('#topbtn').click(function(){
		$('#recipeView').scrollTop(0);
	});
</script>
</div>
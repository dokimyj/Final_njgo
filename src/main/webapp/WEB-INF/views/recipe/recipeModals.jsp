<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="ingredientsSearch" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">냉장고 재료로 추천받기</h4>
					</div>
					<div class="modal-body">
						<article class="fridge">
							<h3>냉장고를 부탁해! 냉장고에 숨어 있는 재료로 맛있는 요리를 만들어보세요.</h3>
							<h1>내가 가진 재료로 레시피 추천받기</h1>
							<br>
							<div class=selections>
								<input type=text list="ings" autocomplete="on"
									placeholder="재료명을 쓰고 Enter를 누르면 쉽게 찾을 수 있어요!"
									onkeydown="ingsearch(this)" class="ingkeyword">
								<datalist id="ings" class="ings">
								</datalist>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary ing_btn" value="추가">
							</div>
							<div class=ing_search></div>
							<input type="button" class="btn btn-primary isearch_btn" value="이 재료로 추천받기" data-dismiss="modal">
						</article>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
	</div>
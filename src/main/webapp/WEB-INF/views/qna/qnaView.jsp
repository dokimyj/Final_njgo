<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="../resources/css/common/basic.css">
<title>Insert title here</title>
<style type="text/css">
.view-wrap {
	width: 808px;
	float: left;
	padding: 0 0 20px 0;
	margin-top: 20;
}
/****************************************  */
div {
	list-style: none;
	margin: 0;
	padding: 0;
	font-family: '돋움', dotum, Helvetica, sans-serif;
	font-size: 12px;
}

.list-btn-nor2 {
	clear: both;
	height: 31px;
	margin-top: 12;
}

.fr {
	float: right;
	display: inline;
	margin-top: 5px !important;
	margin: 10px 10px 0 0;
}

.fl {
	float: left;
	margin-top: 5px !important;
	display: inline;
	margin: 10px 0 0 5px;
}

.btn2 {
	display: inline;
	float: left;
	height: 20px;
	margin-left: 4px;
	cursor: pointer;
}

.btn2 span {
	background-image:
		url(http://cafeimgs.naver.net/style/s01_03/btn-bg2.gif);
	float: left;
	width: 7px;
	height: 20px;
	margin: 0;
	background-position: 0 0;
	background-repeat: no-repeat;
}

.btn2 p {
	background-image:
		url(http://cafeimgs.naver.net/style/s01_03/btn-bg2.gif);
	display: inline;
	float: left;
	height: 20px;
	padding-right: 8px;
	background-position: top right;
	background-repeat: no-repeat;
	margin-top: 0;
}

.m-tcol-c {
	color: #666666;
	word-wrap: break-word;
}

.btn2 p a {
	float: left;
	margin-top: 5px;
	letter-spacing: -1px;
	font-size: 12px;
}

a:visited, a:link {
	text-decoration: none;
}

.list-btn-nor2 .fl img {
	margin-right: 2px;
}

.btn2 p img {
	margin-bottom: 2px;
	vertical-align: middle;
}

img {
	border: none;
}
/**********************이전글, 다음글, 목록**********************************************  */
/**************************main-list start**************************************************/
.main-list {
	border-color: #e5e5e5;
	clear: both;
	width: 808px;
	margin: 0;
	border-style: solid;
	border-width: 1px;
}

.inbox {
	width: 743px;
	margin: 14px;
}

.main-list .tit-box {
	clear: both;
	width: 743px;
	overflow: hidden;
}

.fl {
	float: left
}

.tit-box .fl {
	width: 497px;
	margin-top: 4px;
}

.tit-box .fl td {
	word-break: break-all;
	padding-right: 5px;
	line-height: 1.5;
}

td {
	font-family: '돋움', dotum, Helvetica, sans-serif;
	font-size: 12px;
}

.m-tcol-p {
	color: #ff3c00;
}

.b {
	font-weight: bold;
}

.fr {
	float: right;
}

.tit-box .fr {
	margin-top: 6px;
}

.tit-box .recomm {
	margin-right: 3px;
	margin-bottom: 4px;
}

.tit-box img {
	vertical-align: middle;
}

.tit-box .date {
	white-space: nowrap;
	font-size: 11px;
	opacity: 0.5;
}

.tit-box td {
	padding-right: 5px;
	line-height: 1.5;
}
/***********main 최상단***************/
.board-box-line-dashed {
	border-color: #2e2e2e;
	border-bottom-style: dashed;
	border-bottom-width: 1px;
	opacity: 0.3;
	height: 3px;
	font-size: 0;
}
/********************************/
.etc-box {
	clear: both;
	width: 743px;
	overflow: hidden;
	margin-top: 3px;
	text-align: right;
}

.etc-box .fl {
	margin-top: 8px;
}

.etc-box .fl td {
	padding-right: 5px;
}

a:visited, a:link {
	text-decoration: none;
}

.etc-box .step {
	padding-top: 0;
	font-size: 11px;
	letter-spacing: -1px;
}

.etc-box .step span {
	float: left;
}

.etc-box .fl span {
	padding-right: 5px;
}

.etc-box .step img {
	margin: 0 0 2px 0;
}

.etc-box img {
	vertical-align: middle;
}

.etc-box .fr {
	margin-top: 8px !important;
	text-align: right;
	overflow: hidden;
}

.etc-box .url {
	position: relative;
	height: 23px;
}

.etc-box .url span {
	position: relative;
	top: -2px;
	display: inline-block;
	vertical-align: top;
	padding-left: 5px;
	line-height: 1.5;
}

.etc-box .url .url-txt {
	display: inline-block;
	margin: 3px 0 0 0;
	font-family: 돋움;
	font-size: 11px;
}

.etc-box .copy {
	vertical-align: top;
	margin-top: 2px;
}
/******************************/
.h-10 {
	clear: both;
	height: 10px;
	margin: 0;
	font-size: 0;
	overflow: hidden;
}
/******************************/
#tbody {
	width: 100%;
	position: relative;
	overflow-y: hidden;
	overflow-x: auto !important;
	z-index: 0;
}

.tbody {
	clear: both;
	margin-top: 20px;
	line-height: 1.4;
	min-height: 80px;
}
/*******************************/
.tag_list_area {
	width: 100%;
	table-layout: fixed;
	border: 0;
}

.tag_n_id {
	width: 100%;
	table-layout: fixed;
	border: 0;
	padding-top: 40px;
}

.tag_n_id td.tagarea {
	vertical-align: top;
	padding-right: 10px;
	margin-bottom: -20px;
}

.tag_list_area+.tag_n_id {
	padding-top: 29px;
}

.tag_n_id td.idarea {
	width: 255px;
	text-align: right;
	vertical-align: top;
}

.other_view {
	float: right;
	margin-bottom: 1px;
}

.other_view .more {
	display: inline-block;
	float: left;
	margin-top: 4px;
}

.other_view a {
	white-space: nowrap;
	text-decoration: none;
}

.tag_n_id td.idarea table {
	width: 143px;
	border: 0;
	border-collapse: collapse;
	table-layout: fixed;
}

.tag_n_id td.idarea table td {
	vertical-align: top;
	padding-bottom: 9px;
	text-align: right;
}

.inbox .board-box-line {
	height: 1px;
}

.board-box-line {
	background-color: #666666;
}

.board-box-line {
	padding: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	opacity: 0.2;
}
/********************************/
.h-35 {
	clear: both;
	height: 35px;
	margin: 0;
	font-size: 0;
	overflow: hidden;
}
/********************************/
.reply-box {
	clear: both;
	width: 100%;
	line-height: 18px;
	height: 25px;
}

.reply-box .fl {
	margin-top: 2px;
}

.reply-box .fl .reply {
	position: relative;
	top: 0px;
}

.reply-box .fl .filter-30 {
	padding: 0 4px 0 1px;
	zoom: 1;
	opacity: 0.3;
}

.reply_sort table td {
	vertical-align: middle;
}

.reply-box td {
	padding-right: 3px;
	vertical-align: top;
}

.m-tcol-p {
	color: #ff3c00;
}

.reply_sort table td a {
	position: relative;
}

.reply_sort table td {
	position: relative;
	vertical-align: middle;
	top: 0;
}

.reply_sort #cafe-menu {
	vertical-align: middle;
}

#cafe-menu {
	width: 171px;
	margin: 0 0 5px 0;
	overflow: hidden;
}

.cafe-menu-tit {
	clear: both;
	/* margin-right: auto;
    margin-left: auto; */
	overflow: hidden;
}

#cafe-menu .cafe-menu-tit .down-btn {
	background-image:
		url(http://cafeimgs.naver.net/design/menubox/menubox-263-1/btn-down-menu.gif);
}

.perid-layer2 {
	position: absolute;
	border: 1px solid #CFCFCF;
	padding: 1px;
	background-color: #FFF;
	overflow: hidden;
	width: 55px;
	top: 18px;
	left: 0;
	z-index: 110;
}

.perid-layer2 li {
	width: 100%;
	height: 18px;
	margin: 0;
	padding: 0;
	vertical-align: top;
}

.perid-layer2 li a {
	float: left;
	width: 100%;
	height: 18px;
	color: #666;
}

.perid-layer2 li span {
	padding: 0 0 2px 2px;
}

.reply-box img {
	position: relative;
	vertical-align: 0 !important;
}

.reply-box .u_likeit_list_module {
	display: inline-block;
	margin: -2px 0 0 3px;
	vertical-align: top;
}

.reply-box .u_likeit_list_module .u_likeit_list_btn {
	height: 17px;
	padding: 0 7px 0 5px;
	border: 1px solid #ddd;
	border-radius: 1px;
	background-color: #fff;
}

.u_likeit_list_module .u_likeit_list_btn {
	display: inline-block;
	overflow: hidden;
	vertical-align: top;
}

.u_likeit_list_module span {
	float: none;
	position: static;
	margin: 0;
	/*  padding: 0;
    border: 0; */
	background: transparent;
	letter-spacing: 0;
	line-height: normal;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	/* vertical-align: baseline; */
	white-space: normal;
	list-style: none;
	font-style: normal;
	word-spacing: 0;
	font-family: normal;
}

.reply-box .u_likeit_list_module .u_likeit_list_btn .u_ico {
	width: 14px;
	height: 9px;
	margin-top: 4px;
	background-position: -14px -26px;
}

.u_likeit_list_module .u_likeit_list_btn .u_ico {
	background-image:
		url(http://static.naver.net/common/likeit/cafe/sp_likeit.png);
}

.u_likeit_list_module .u_likeit_list_btn .u_ico {
	display: inline-block;
	overflow: hidden;
	vertical-align: top;
}

.reply-box .u_likeit_list_module .u_likeit_list_btn .u_cnt {
	margin-top: 2px;
	color: #666;
	font-weight: bold;
	font-size: 12px;
	font-family: '돋움', dotum, Helvetica, sans-serif;
}

.u_likeit_list_module .u_likeit_list_btn .u_cnt {
	display: inline-block;
	vertical-align: top;
	/*  font-weight: bold; */
}

.u_likeit_list_module em {
	float: none;
	position: static;
	margin: 0;
	padding: 0;
	border: 0;
	background: transparent;
	letter-spacing: 0;
	line-height: normal;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	/* vertical-align: baseline; */
	white-space: normal;
	list-style: none;
	font-style: normal;
	word-spacing: 0;
	/*  font-family: normal; */
}
/************************************************/
.cafe_spi {
	margin-top: 0px;
	margin-right: -2px;
}

.reply-box .fr .m-tcol-c {
	display: inline-block;
	padding-top: 1px;
}
/************************************************/
.bg-color {
	background-color: #f9f9f9;
}

.box-reply2 {
	zoom: 1;
	margin: 0;
	padding: 11px 26px 16px 24px;
}

.u_cbox {
	font-size: 12px;
	line-height: 1.25em;
}
/**************************main-list end**************************************************/

/* section-bottem start */
/**********************답글, 목록 시작***********************************************/
.list-btn-nor {
	clear: both;
	height: 30px;
	margin-top: 12;
}

.btn_view {
	display: inline;
	float: left;
	height: 23px;
	margin-left: 5px;
	overflow: hidden;
	cursor: pointer;
}

.btn_view span {
	background-image: url(http://cafeimgs.naver.net/style/s01_03/btn-bg.gif);
	float: left;
	width: 10px;
	height: 23px;
	margin: 0;
	background-position: 0 0;
	background-repeat: no-repeat;
}

.btn_view p {
	background-image: url(http://cafeimgs.naver.net/style/s01_03/btn-bg.gif);
	display: inline;
	float: left;
	height: 23px;
	padding-right: 10px;
	background-position: top right;
	background-repeat: no-repeat;
	margin-top: 0;
}

.btn_view p a, .btn_view p .txt_join {
	float: left;
	margin-top: 6px;
	letter-spacing: -1px;
}

.btn p img {
	margin-right: 4px;
	margin-bottom: 2px;
	vertical-align: middle;
}
/**********************답글, 목록 끝***********************************************/
.h-20 {
	clear: both;
	height: 20px;
	margin: 0;
	font-size: 0;
	overflow: hidden;
}
/****************************공백***********************************************/
/****************************top***********************************************/
.btn-top {
	margin: 18px 9px 0 0;
	font-size: 11px;
	font-family: '돋움', dotum, Helvetica, sans-serif;
	text-align: right;
}

.m-tcol-c_ {
	color: #636363;
	word-wrap: break-word;
}

.filter-50 {
	zoom: 1;
	opacity: 0.5;
}

.display-inblock {
	display: inline-block;
}

.btn-top span {
	font-size: 8px;
}
/****************************top***********************************************/
.h-35 {
	clear: both;
	height: 35px;
	margin: 0;
	font-size: 0;
	overflow: hidden;
}
/****************************공백***********************************************/
/****************************table 시작***********************************************/
.article-board {
	position: relative;
	clear: both;
	margin: 0 0 0 0;
}

.board-line {
	background-color: #e5e5e5;
	height: 1px;
	padding: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
}

.article_prenet .prev_btn {
	padding: 0 !important;
	text-align: left;
	height: 29px;
}

td {
	font-family: '돋움', dotum, Helvetica, sans-serif;
	font-size: 12px;
}

.article_prenet .prev_btn {
	padding: 0 !important;
	text-align: left;
	height: 29px;
}

.article_prenet .prev_btn a {
	display: block;
	width: 45px;
	margin-left: 15px;
	padding: 7px 0 3px 0;
	text-align: left;
	font-size: 11px;
	letter-spacing: -1px;
	line-height: 16px;
}

.article_prenet .prev_btn a img {
	vertical-align: middle;
	margin: 0 4px 2px 0;
}

.article_prenet .board-list {
	padding-top: 2px;
}

.article-board .board-list span {
	/* float: left; */
	word-wrap: break-word;
	word-break: break-all;
}

.article-board .aaa {
	float: none !important;
	padding-right: 5px;
}

.board-list input {
	border: 0 !important;
	background-color: transparent;
}

.list-i-img {
	width: 13px;
	height: 12px;
	background: url(http://cafeimgs.naver.net/cafe4/ico-img.gif) 0 0
		no-repeat;
}

.article-board input {
	vertical-align: middle;
	/* width: 13px;
    height: 13px; */
	margin: 0;
}

input {
	color: #333;
}

.m-tcol-p {
	color: #5269a3;
}

.article-board .num {
	float: none !important;
	padding: 0 !important;
	font-size: 10px;
	font-family: verdana;
	font-weight: normal;
}

.list-i-new {
	width: 10px;
	height: 10px;
	background: url(http://cafeimgs.naver.net/cafe4/ico-new.gif) 0 1px
		no-repeat;
}

.pers_nick_area {
	padding: 0 0 2px !important;
	text-align: left;
	width: 100%;
}

.wordbreak {
	display: inline-block;
	word-break: break-all;
	word-wrap: break-word;
	vertical-align: middle;
}

.article_prenet .view-count {
	font-size: 11px;
	padding-top: 2px;
}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
	<section class="main_section">
		<div class="view-wrap">
			<!-- 이전글,다음글,목록 -->
			<div class="list-btn-nor2">
				<div class="fl">
					<div class="btn2">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c"><img
								src="http://cafeimgs.naver.net/cafe4/ico-btn-pre_.gif" width="6"
								height="5">이전글</a>
						</p>
					</div>
					<div class="btn2">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c"><img
								src="http://cafeimgs.naver.net/cafe4/ico-btn-net_.gif" width="6"
								height="5">다음글</a>
						</p>
					</div>
				</div>
				<div class="fr">
					<div class="btn2">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c"><img src="">목록</a>
						</p>
					</div>
				</div>
			</div>

			<!-- main -->
			<div class="main-list">
				<div class="inbox">
					<div class="tit-box">
						<div class="fl">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr valign="top">
										<td nowrap="nowrap"><span class="head m-tcol-p">[진행중]</span></td>
										<!-- [진행중],[진행완료] -->
										<td><span class="b m-tcol-p">우리나라 최고의 강사 김지석 프로</span></td>
										<!-- title -->
									</tr>
								</tbody>
							</table>
						</div>
						<div class="fr">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td><img
											src="http://cafeimgs.naver.net/cafe4/btn-permission-all.gif"
											width="42" height="15" alt="전체공개" class="recomm"></td>
										<td class="m-tcol-c date">2017.06.23. 11:49</td>
										<!-- 등록 시간 -->
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="board-box-line-dashed"></div>
					<div class="etc-box">
						<div class="fl">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="m-tcol-c b nick"><a href="#"
											class="m-tcol-c b">착한쌤 우동하(href****)</a></td>
										<!-- 이름, (닉네임) -->
										<td class="m-tcol-c step"><span class="filter-50">강사</span>
											<span><img class="levelico"
												src="http://cafeimgs.naver.net/cafe4/ico-new.gif" border="0"></span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="fr">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td valign="top" class="url" align="right"><span
											class="filter-50"><a href="#" id="linkUrl"
												target="_top" class="m-tcol-c url-txt">http://cafe.naver.com/tlsxh/382012</a></span>
											<span> <a href="#" class="_copyUrl url-btn"
												data-clipboard-action="copy"
												data-clipboard-target="#linkUrl"> <img
													src="http://cafeimgs.naver.net/cafe4/btn-copy-add.gif"
													width="41" height="15" alt="주소복사" class="copy">
											</a>
										</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="h-10"></div>

					<div class="tbody m-tcol-c" id="tbody"></div>


					<table cellspacing="0" class="tag_n_id tag_list_area">
						<tbody>
							<tr>
								<tb class="tagarea"> </tb>
							</tr>
						</tbody>
					</table>
					<table cellspacing="0" class="tag_n_id">
						<tbody>
							<tr>
								<td>&nbsp;</td>
								<td class="idarea">
									<div class="other_view m-tcol-c">
										<a href="#" class="more m-tcol-c _rosRestrict">이 작성자의 게시글
											더보기</a>
									</div>
									<table cellspacing="0" cellpadding="0" align="right">
										<colgroup>
											<col>
											<col width="55">
										</colgroup>
										<tbody>
											<tr>
												<td height="1" valign="top" colspan="2">
													<div class="per-info board-box-line"></div>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="h-35"></div>


					<!----------- 버튼 모음 --------------->
					<div class="reply-box" id="cmtMenu">
						<div class="fl reply_sort">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr style="vertical-align: top">
										<td class="reply"><a href="#"
											class="reply_btn b m-tcol-c m-tcol-p _totalCnt" id="comment">
												댓글0 <c:if test="true">
													<img src="http://cafeimgs.naver.net/cafe4/ico-new.gif"
														width="10" height="9" alt="new">
												</c:if>
										</a></td>
										<td class="m-tcol-c filter-30">|</td>
										<td class="_sortList" style="padding: 0;">
											<div style="position: relative; _top: 3px;">
												<a href="#" class="b m-tcol-c"> <span>등록순</span> <span
													style="display: none">최신순</span> <span id="cafe-menu">
														<span class="cafe-menu-tit"
														style="background: none; width: 13px; height: 13px; margin: 0;">
															<span class="down-btn"
															style="background-position: 0 0; background-repeat: no-repeat; vertical-align: top">
																<img height="13" width="13"
																src="http://cafeimgs.naver.net/cafe4/hidden.gif">
														</span>
													</span>
												</span>
												</a>
												<div class="perid-layer2" style="display: none;">
													<ul>
														<li class="asc"><a href="#"><span>등록순</span></a></li>
														<li class="desc"><a href="#"><span>최신순</span></a></li>
													</ul>
												</div>
											</div>
										</td>
										<td class="m-tcol-c filter-30">|</td>
										<td><span class="b m-tcol-c reply ">조회수</span> <span
											class="b m-tcol-c reply _rosReadcount">40</span></td>
										<td class="m-tcol-c filter-30">|</td>
										<td><a href="#"
											class="b m-tcol-c like like_lst_btn _click(LikeItMember|LikeItMember|28838585|3814) _stopDefault"
											id="likeItMemberBtn"> 좋아요 <span id="cafe-menu"> <span
													class="cafe-menu-tit"
													style="background: none; width: 13px; height: 13px; margin: 0;">
														<span id="likeItArrow" class="down-btn"
														style="background-position: 0 0; *background-position: 0 0; background-repeat: no-repeat; vertical-align: top">
															<img height="13" width="13"
															src="http://cafeimgs.naver.net/cafe4/hidden.gif">
													</span>
												</span>
											</span>
										</a> <a href="#">
												<div class="u_likeit_list_module _reactionModule"
													data-sid="CAFE" data-cid="28838585_soosannara_3814"
													data-did="CAFE" data-catgid="28838585" data-loaded="1"
													data-facetype="0" style="visibility: visible;">
													<span href="#" class="u_likeit_list_btn _button off"
														data-type="like" data-log="art.like|art.unlike"
														aria-pressed="false"> <span class="u_ico _icon"></span>
														<em class="u_cnt _count">0</em>
													</span>
												</div>
										</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="fr cafe_spi">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="m-tcol-c filter-30">|</td>
										<td><a href="#" class="m-tcol-c">인쇄</a></td>
										<td class="m-tcol-c filter-30">|</td>
										<td><span
											style="cursor: pointer; cursor: hand; margin-left: 2px"
											class="m-tcol-c">신고</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!------------ 댓글 -------------->
					<div class="box-reply2 bg-color u_cbox" id="EkusF"
						style="display: block;">
						<!-- 댓글 리스트  -->
						<ul class="cmlist" id="cmt_list">
							<li class="">
								<div class="comm_cont">
									<div class="h">
										<div class="pers_nick_area">
											<table cellspacing="0" summary="퍼스나콘/아이디 영역">
												<tbody>
													<tr>
														<td class="pc2w"><a target="itemshop" href="#"> <img
																width="19" height="19"
																src="http://itemimgs.naver.net/personacon/96/66/1416696.gif">
														</a></td>
														<td class="p-nick"><a href="#"
															class="m-tcol-c _rosRestrict _nickUI" style="">목포수산협동조합C373</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<span class="date m-tcol-c filter-50">2017.06.23. 13:46</span>
										<p class="btn_edit m-tcol-c"></p>
									</div>
									<p class="comm m-tcol-c" style="">
										<span class="comm_body"> 주문은 꼭 문자로 보내주세요<br>1.별명(닉네임)<br>2.주문상품<br>3.입금자성함/수령인성함<br>4.주소
											<br>5.연락처<br>6.현금영수증번호<br>7.기타<br>감사합니다*^^*
										</span>
									</p>
									<div>
										<input type="hidden" name="cmtid" value="32019731"> <input
											type="hidden" name="writerid" value="sw993255"> <input
											type="hidden" name="refcmtid" value="32019731"> <input
											type="hidden" name="replytonick" value=""> <input
											type="hidden" name="replytomemberid" value=""> <input
											type="hidden" name="stickerId" value=""> <input
											type="hidden" name="stickerOriginUrl" value=""> <input
											type="hidden" name="imagePath" value=""> <input
											type="hidden" name="imageFileName" value=""> <input
											type="hidden" name="imageWidth" value=""> <input
											type="hidden" name="imageHeight" value=""> <input
											type="hidden" name="articleId" value="3814">
									</div>
								</div>
							</li>
							<li class="filter-30 board-box-line-dashed"></li>
						</ul>
						<div style="clear: both; height: 0pt; font: 0pt/0pt arial;"></div>
						<div style="display: none;" class="cc_paginate cmt"
							id="cmt_paginate"></div>

						<div class="m-tcol-c reply_error" style="display: none;">
							<strong>죄송합니다. 댓글 시스템 오류로 댓글을 읽거나 쓸 수 없습니다.</strong> 문제가 지속될 경우 <a
								href="http://help.naver.com/" target="_blank" class="m-tcol-c">고객센터</a>
							에 알려주시면 친절하게 안내해 드리겠습니다.
						</div>
					</div>
				</div>
			</div>




			<!-- 답글,목록 -->
			<div class="list-btn-nor">
				<div class="fr">
					<div id="replyFormBtn" class="btn_view _rosRestrict">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c"><img
								src="http://cafeimgs.naver.net/cafe4/ico-btn-check.gif"
								width="9" height="8">답글</a>
						</p>
					</div>
					<div class="btn_view">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c"><img src="">목록</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 공간여백 -->
			<div class="h-20"></div>

			<!-- top -->
			<div class="btn-top">
				<a href="#" class="m-tcol-c_ filter-50 display-inblock"><span>▲</span>top</a>
			</div>

			<!-- 공간여백 -->
			<div class="h-35"></div>

			<!-- tabel 감싸는 div -->
			<div class="article-board article_prenet">
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<colgroup>
						<col width="81">
						<col width="*">
						<col width="120">
						<col width="92">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>
						<tr align="center">
							<td class="prev_btn"><a href="#" class="m-tcol-c"><img
									src="http://cafeimgs.naver.net/cafe4/ico-btn-pre2_.gif">이전글</a></td>
							<td align="left" class="board-list"><span class="aaa">
									<a href="#" class="m-tcol-c">두백감자 홍감자 자색감자</a>
								<!-- 이전글 title --> <input type="text" class="list-i-img"
									readonly="readonly" title="사진">
								<!-- 사진이 있으면 표시 --> <span class="m-tcol-p num">[<strong>18</strong>]
								</span>
								<!-- 답글수 --> <input type="text" class="list-i-new"
									readonly="readonly" title="new">
								<!-- -새로운글N표시 -->
							</span></td>

							<td align="left">
								<div class="pers_nick_area">
									<span class="wordbreak" id="refarticle_prevSiblingContent">토종청양
										A2209</span>
								</div>
							</td>
							<td class="view-count m-tcol-c">12:10</td>
						</tr>




						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>


						<tr align="center">
							<td class="prev_btn"><a href="#" class="m-tcol-c"><img
									src="http://cafeimgs.naver.net/cafe4/ico-btn-net2_.gif">다음글</a></td>
							<td align="left" class="board-list"><span class="aaa">
									<a href="#" class="m-tcol-c">자연산 골뱅이 1KG 싸게 팝니다</a>
								<!-- 이전글 title --> <input type="text" class="list-i-img"
									readonly="readonly" title="사진">
								<!-- 사진이 있으면 표시 --> <span class="m-tcol-p num">[<strong>9</strong>]
								</span>
								<!-- 답글수 --> <input type="text" class="list-i-new"
									readonly="readonly" title="new">
								<!-- -새로운글N표시 -->
							</span></td>

							<td align="left">
								<div class="pers_nick_area">
									<span class="wordbreak" id="refarticle_prevSiblingContent">농부청년</span>
								</div>
							</td>
							<td class="view-count m-tcol-c">10:00</td>
						</tr>


						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<c:import url="../tmp/footer.jsp" />
</body>
</html>
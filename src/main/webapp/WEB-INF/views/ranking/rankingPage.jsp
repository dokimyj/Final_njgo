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
 .main_wrap {
	width: 788px;
	margin-left: 16%;
	margin-right: 24%;
	border: 1px solid #e5e5e5;
} 
.rank_st2 {
    border-bottom: 1px solid #dbdbdb;
}

</style>
</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
	<section class="main_section">
		<div class="main_wrap">
			<table width="778" height="470" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td align="center" valign="top"><table width="778" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td style="border-top: 1px solid #dbdbdb" height="45"><span class="rank_tt1">${board}</span><span class="rank_tt2">
										월간 ${board} 순위를 나타냅니다.</span></td>
									</tr>
								</tbody>
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 15px">
								<tbody>
									<tr>
										<td class="rank_st1"><table width="590" border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td width="120" height="30" align="center" class="rank_tab_off"><a href="rankingPage">조회수 랭킹</a></td>
														<td width="120" height="30" align="center" class="rank_tab_off"><a href="rankingPage2">스크랩수 랭킹</a></td>
														<td width="120" height="30" align="center" class="rank_tab_on"><a href="rankingPage3">셰프 랭킹</a></td>
														<td width="230" height="30" align="right" valign="top"></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td align="center"><table width="540" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 10px; margin-top:20px">
												<tbody>
													<tr>
														<td height="30" colspan="6" align="center"></td>
													</tr>
													<tr>
														<th width="40" valign="top"><img src="http://img.tygem.com/images/06/ranking/icon_rank1_1.gif"></th>
														<td width="140" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>
																		<!-- 사진1 -->
																		<td align="left"><span class="rank_pic" style="height: 111px; border-radius: 100px;">
																				<span style="cursor: hand;"> <img src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg"
																					border="0" width="107" height="86" style="height: 111px; border-radius: 100px;">
																			</span>
																		</span></td>
																	</tr>
																	<tr>
																		<td height="25" align="left" class="rank_id"><span style="cursor: hand">오븐에 빠진닭</span></td>
																	</tr>
																	<tr>
																		<td height="25" align="left" class="rank_r"><img src="http://img.tygem.com/images/06/ranking/icon_rank1_2.gif"
																			align="absmiddle" style="margin-right: 6px">1,320</td>
																	</tr>
																</tbody>
															</table></td>
														<th width="40" valign="top"><img src="http://img.tygem.com/images/06/ranking/icon_rank2_1.gif"></th>
														<td width="140" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>
																		<!-- 사진2 -->
																		<td align="left"><span class="rank_pic"
																			style="height: 111px; border-radius: 100px;">
																				<span style="cursor: hand;"> <img
																					src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg"
																					border="0" width="107" height="86"
																					style="height: 111px; border-radius: 100px;">
																			</span>
																		</span></td>
																	</tr>
																	<tr>
																		<td height="25" align="left" class="rank_id"><span
																			style="cursor: hand">오븐에 빠진닭</span></td>
																	</tr>
																	<tr>
																		<td height="25" align="left" class="rank_r"><img
																			src="http://img.tygem.com/images/06/ranking/icon_rank2_2.gif"
																			align="absmiddle" style="margin-right: 6px">1,320</td>
																	</tr>
																</tbody>
															</table></td>
														<th width="40" valign="top"><img
															src="http://img.tygem.com/images/06/ranking/icon_rank3_1.gif"></th>
														<td width="140" valign="top"><table width="100%"
																border="0" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>
																		<!-- 사진3 -->
																		<td align="left"><span class="rank_pic"
																			style="height: 111px; border-radius: 100px;">
																				<span style="cursor: hand;"> <img
																					src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg"
																					border="0" width="107" height="86"
																					style="height: 111px; border-radius: 100px;">
																			</span>
																		</span></td>
																	</tr>
																	<tr>
																		<td height="25" align="left" class="rank_id"><span
																			style="cursor: hand">오븐에 빠진닭</span></td>
																	</tr>
																	<tr>
																		<td height="25" align="left" class="rank_r"><img
																			src="http://img.tygem.com/images/06/ranking/icon_rank3_2.gif"
																			align="absmiddle" style="margin-right: 6px">1,320</td>
																	</tr>


																</tbody>
															</table></td>

													</tr>
												</tbody>
											</table></td>
									</tr>
								</tbody>
							</table>

							<div id="view_txt">





								<link rel="stylesheet" type="text/css"
									href="http://img.tygem.com/images/06/css/ranking.css">

								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<form name="fo" method="post"
										action="/guinness/main_rank2017.html"></form>
									<tbody>
										<tr>
											<td width="49%"><span class="rank_tt3">랭킹</span><select
												id="select1" name="before_date"
												onchange="javascript:f_beforeDATE('all');">
													<option value="2017-01">2017년 01월</option>
													<option value="2017-02">2017년 02월</option>
													<option value="2017-03">2017년 03월</option>
													<option value="2017-04">2017년 04월</option>
													<option value="2017-05">2017년 05월</option>
													<option value="2017-06">2017년 06월</option>
													<option value="2017-07" selected="">2017년 07월</option>
											</select><input type="text" id="fullname" value="" class="rank_in"><img
												src="http://img.tygem.com/images/06/ranking/btn_search.gif"
												align="absmiddle"
												onclick="javascript:search_list(0,'2017-07','all')"
												style="cursor: pointer;"></td>
											<td width="51%" align="right" valign="bottom"><span
												class="rank_tt2">* 최종 업데이트: 2017-07-19 02:10</span></td>
										</tr>

									</tbody>
								</table>
								<br>
								<table class="t_type1" width="778">
									<tbody>
										<tr>
											<th width="90">랭킹</th>
											<th colspan="2" width="170">요리명</th>
											<th width="80">조회수</th>
											<th width="130">누적조회수</th>
											<th width="130">닉네임</th>
										</tr>

										<tr>
											<td width="90">1</td>
											<td colspan="2" width="170"><span
												onclick="javascript:openMini('DeepZen(B)')"
												style="cursor: pointer">요리명</span></td>
											<td width="80">조회수</td>
											<td width="130">누적조회수</td>
											<td width="130">닉네임</td>
										</tr>

									</tbody>
								</table>
								<p style="margin-top: 10px">
								<table border="0" cellspacing="3" cellpadding="0">
									<tbody>
										<tr>

											<td width="20" align="center"><img
												src="http://img.tygem.com/images/06/board/btn_pre1.gif"
												border="0" align="absmiddle"></td>
											<td width="20"><img
												src="http://img.tygem.com/images/06/board/btn_pre2.gif"
												border="0" align="absmiddle"></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center" class="bo_nom"><span
												style="font-size: 14px;">1</span></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(10,'2017-07','all')">2&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(20,'2017-07','all')">3&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(30,'2017-07','all')">4&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(40,'2017-07','all')">5&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(50,'2017-07','all')">6&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(60,'2017-07','all')">7&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(70,'2017-07','all')">8&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(80,'2017-07','all')">9&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="center"><a
												href="javascript:view_list(90,'2017-07','all')">10&nbsp;</a></td>
											<td bgcolor="CACACA" width="1"></td>
											<td width="20" align="right"><a
												href="javascript:view_list(10,'2017-07','all')"><img
													src="http://img.tygem.com/images/06/board/btn_next2.gif"
													border="0" align="absmiddle"></a></td>
											<td width="20" align="right"><a
												href="javascript:view_list(100,'2017-07','all')"><img
													src="http://img.tygem.com/images/06/board/btn_next1.gif"
													border="0" align="absmiddle"></a></td>

										</tr>
									</tbody>
								</table>
								</p>
							</div></td>
					</tr>
				</tbody>
			</table>

		</div>
	</section>
	<c:import url="../tmp/footer.jsp" />
</body>
</html>
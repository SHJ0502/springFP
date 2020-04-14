<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>보관함</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<%@ include file="../common/topnav.jsp"%>
<%@ include file="../common/sidenav.jsp"%>
<body style="background-color: rgb(249, 249, 249);">

<div class="container-fluid" style="margin-left: 270px;" id="page">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<div class="col-sm-12">
						<!-- 최근 본 동영상 -->						
						<div class="row" style="margin-top: 10px; border-bottom: solid silver 1px; ">
							<c:choose>
								<c:when test="${not empty recentList }">
									<a href="new.hta" style="text-decoration: none; font-size: 18px; color: black;"><span class="glyphicon glyphicon-time" style="margin-right: 25px; margin-bottom: 20px;"></span>기록</a><br>
									<c:forEach var="recent" items="${recentList }" varStatus="loop">
										<c:choose>
											<c:when test="${loop.count le 8 }">
												<div class="col-sm-3" style="color: black; height: 280px;">
													<a href="../detail.hta?videono=${recent.videoNo }" style="margin-bottom: 10px; text-decoration: none;"> <img
														src="/resources/images/thumbnail/${recent.videoImage }"
														style="width: 210px; height: 117px;" />
														<p style="color: black;">${recent.videoTitle }</p>
														<p style="color: black;"><a href="../mychannel/mychannel_main.hta?channelno=${recent.channelNo }" style="color: black;text-decoration: none;">${recent.channelTitle }</a></p>
														<p style="color: black;">조회수 ${recent.videoViews } ・ ${recent.beforeTime }</p>
													</a>									
												</div>
											</c:when>
										</c:choose>								
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a href="#" style="text-decoration: none; font-size: 18px; color: black;"><span class="glyphicon glyphicon-time" style="margin-right: 25px; margin-bottom: 20px;"></span>기록</a><br>
									<h4>최근에 본 동영상이 없습니다.</h4>
								</c:otherwise>
							</c:choose>							
						</div>
						<!-- 나중에 볼 동영상 -->
						<div class="row" style="margin-top: 10px; border-bottom: solid silver 1px;">
							<c:choose>
								<c:when test="${not empty afters }">
									<a href="after.hta" style="text-decoration: none; font-size: 18px; color: black;"><span class="glyphicon glyphicon-tags" style="margin-right: 25px; margin-bottom: 20px; color: black;"></span>나중에 볼 동영상 ${countAfter }</a><br>
									<c:forEach var="after" items="${afters }" varStatus="loop">
										<c:choose>
											<c:when test="${loop.count le 8 }">
												<div class="col-sm-3" style="color: black;">
													<a href="../detail.hta?videono=${after.videoNo }" style="margin-bottom: 10px; text-decoration: none; color: black;"> <img
														src="/resources/images/thumbnail/${after.videoImage }"
														style="width: 210px; height: 117px;" />
														<p>${after.videoTitle }</p>
														<p><a href="../mychannel/mychannel_main.hta?channelno=${after.channelNo }" style="text-decoration: none;color: black;">${after.channelTitle }</a></p>
														<p>조회수 ${after.videoviews } ・ ${after.beforeTime }</p>
													</a>									
												</div>
											</c:when>
										</c:choose>								
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a href="#" style="text-decoration: none; font-size: 18px; color: black;"><span class="glyphicon glyphicon-tags" style="margin-right: 25px; margin-bottom: 20px; color: black;"></span>나중에 볼 동영상 ${countAfter }</a><br>
									<h4>나중에 볼 동영상이 없습니다.</h4>
								</c:otherwise>
							</c:choose>							
						</div>						
						<!-- 좋아요 -->
						<div class="row" style="margin-top: 10px; border-bottom: solid silver 1px;">
							<c:choose>
								<c:when test="${not empty goodList }">
									<a href="good.hta" style="text-decoration: none; font-size: 18px; color: black;"><span class="glyphicon glyphicon-thumbs-up" style="margin-right: 25px; margin-bottom: 20px; font-size: 18px; "></span>좋아요 표시한 동영상 ${countgood }</a><br>
									<c:forEach var="good" items="${goodList }" varStatus="loop">
										<c:choose>
											<c:when test="${loop.count le 8 }">
												<div class="col-sm-3" style="color: black;">
													<a href="../detail.hta?videono=${good.videoNo }" style="margin-bottom: 10px; text-decoration: none; color: black;"> <img
														src="/resources/images/thumbnail/${good.videoImage }"
														style="width: 210px; height: 117px;" />
														<p>${good.videoTitle }</p>
														<p><a href="../mychannel/mychannel_main.hta?channelno=${good.channelNo }" style="color: black;text-decoration: none;">${good.channelTitle }	</a></p>
														<p>조회수 ${good.videoviews } ・ ${good.beforeTime }</p>
													</a>									
												</div>
											</c:when>											
										</c:choose>	
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a href="good.hta" style="text-decoration: none; font-size: 18px; color: black;"><span class="glyphicon glyphicon-thumbs-up" style="margin-right: 25px; margin-bottom: 20px; font-size: 18px;"></span>좋아요 표시한 동영상 ${countgood }</a><br>
									<h4>좋아요 표시한 동영상이 없습니다.</h4>
								</c:otherwise>
							</c:choose>
						</div>
					</div>				
			</div>
			<div class="col-sm-1">
				<div class="row" style="text-align: center; margin-top: 150px;">
					<img src="/resources/images/photo/${loginedUser.userImagePath != null ? loginedUser.userImagePath : 'userbase.jpg' }" style="width: 90px;height: 90px;border-radius: 90px;">
				</div>
				<div class="row" style="text-align: center;margin-top: 20px;border-bottom: solid silver 1px;">
					<p>${loginedUser.name }</p>
					<p><fmt:formatDate value="${loginedUser.createDate }" pattern="yyyy" />년  가입</p>
				</div>
				<div class="row" style="border-bottom: solid silver 1px; padding-top: 15px;">
					<p>구독 ${countsubscribe }</p>					
				</div>
				<div class="row" style="border-bottom: solid silver 1px; padding-top: 15px;">
					<p>업로드 ${countupload }</p>
				</div>
				<div class="row" style="border-bottom: solid silver 1px; padding-top: 15px;">
					<p>좋아요 ${countgood }</p>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>		
</div>

</body>
</html>
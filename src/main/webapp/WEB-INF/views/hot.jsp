<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="resources/lib/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
</head>
<%@ include file="common/topnav.jsp"%>
<%@ include file="common/sidenav.jsp"%>
<body style="background-color: rgb(249, 249, 249);">
	<div class="container-fluid" style="margin-left: 270px;margin-right: 500px;" id="page">
		<div class="row">
			<div class="col-sm-12">
				<div style="border-bottom: solid silver 1px;">
					<div
						style="padding-bottom: 15px; padding-right: 150px; display: inline-block;">
						<a href="hot.hta?cateno=1" ><img src="/resources/images/logo/music.png" style="width: 100px; height: 100px; border-radius: 100px;" /></a>
					</div>
					<div
						style="padding-bottom: 5px; padding-right: 150px; display: inline-block;">
						<a href="hot.hta?cateno=4"><img src="/resources/images/logo/movie.png" style="width: 100px; height: 100px; border-radius: 100px;" /></a>
					</div>
					<div
						style="padding-bottom: 5px; padding-right: 150px; display: inline-block;">
						<a href="hot.hta?cateno=3"><img src="/resources/images/logo/game.png" style="width: 100px; height: 100px; border-radius: 100px;" /></a>
					</div>
				</div>
				<div class="row" style="margin-left: 30px; margin-top: 50px;">
					<div class="col-sm-12">
						<div class="col-sm-9">							
							<div class="row">
								<a href="#" style="text-decoration:none; color: black;">
								<c:forEach var="hot" items="${hotlist }">
									<div class="col-sm-12" style="padding-bottom: 20px;">						
										<div class="col-sm-5">
											<a href="detail.hta?videono=${hot.videoNo }"><img src="resources/images/thumbnail/${hot.image }" style="width: 246px; height: 138px;" /></a>
										</div>
										<div class="col-sm-6">
											<div class="row">
												<p style="color: black;">${hot.title }</p>									
											</div>
											<div class="row">
													<p><a href="/mychannel/mychannel_main.hta?channelno=${hot.channelNo }" style="color: black;text-decoration: none;">${hot.channelTitle }</a> ・ 조회수 ${hot.views } ・ ${hot.beforeTime }</p>
											</div>
											<div class="row">
												<p>${hot.content }</p>
											</div>
										</div>
										<div class="col-sm-1">
											<div class="row">
												<a><span class=""></span></a>
												<p></p>
											</div>
										</div>						
									</div>
								</c:forEach>
								</a>				
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
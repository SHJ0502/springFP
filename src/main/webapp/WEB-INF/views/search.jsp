<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="resources/lib/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
</head>
<body>
<%@ include file="common/topnav.jsp" %>
<%@ include file="common/sidenav.jsp" %>
<div class="container-fluid" style="margin-left: 270px;" id="page">
	<div class="row">
		<div class="col-sm-12" style="margin-left: 150px; margin-right: 500px;">
			<div class="row" >
				<div style="margin-right: 500px; border-bottom: solid silver 1px; margin-bottom: 50px;">
					<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo" style="margin-bottom: 20px;"><span class="glyphicon glyphicon-filter"></span>필터</button>
					<div class="row collapse" id="demo">
						<div class="col-sm-2">													
							<h5 style="border-bottom: solid silver 1px; padding-bottom: 10px;">업로드날짜</h5>
							<a></a>
						</div>
						<div clas="col-sm-1">
						</div>
						<div class="col-sm-2">							
							<h5 style="border-bottom: solid silver 1px; padding-bottom: 10px;">구분</h5>
							<div class="row">
							</div>
						</div>
						<div clas="col-sm-1">
						</div>
						<div class="col-sm-2">													
							<h5 style="border-bottom: solid silver 1px; padding-bottom: 10px;">길이</h5>													
						</div>
						<div clas="col-sm-1">
						</div>
						<div class="col-sm-2">														
							<h5 style="border-bottom: solid silver 1px; padding-bottom: 10px;">정렬 기준</h5>							
							<div class="row">
							</div>						
						</div>
					</div>
				</div>
			</div>
			
				<div class="row">
					<c:forEach var="channel" items="${channels }" >
						<a href="../mychannel/mychannel_main.hta?channelno=${channel.channelNo }">
						<div class="col-sm-12" style="margin-right: 500px;">
							<div class="col-sm-2">
								<img style="width: 136px; height: 136px; border-radius: 136px; margin-left: 50px;" src="/resources/images/photo/${channel.imagePath != null ? channel.imagePath : 'userbase.jpg' }" />
							</div>
							<div class="col-sm-4">								
								<h3 style="color: black;">${channel.title }</h3>
								<div class="row">
									
								</div>
								<div class="row">
									<p style="color: black;">${channel.content }</p>
								</div>
							</div>							
						</div>
						</a>
					</c:forEach>
				</div>
			
			
			<div class="row">
					<c:forEach var="video" items="${videos }">
				<a href="../detail.hta?videono=${video.videoNo }">
						<div class="col-sm-12" style="padding-bottom: 20px;">						
							<div class="col-sm-2">
								<img src="resources/images/thumbnail/${video.image }" style="width: 246px; height: 138px;" />
							</div>
							<div class="col-sm-6">
								<div class="row">
									<h3 style="color: black;">${video.title }</h3>									
								</div>
								<div class="row">
										<p><a href="/mychannel/mychannel_main.hta?channelno=${video.channelNo }" style="color: black;">${video.channelTitle }</a> ・ 조회수 ${video.views } ・ ${video.beforeTime }</p>
								</div>
								<div class="row">
									<p>${video.content }</p>
								</div>
							</div>
							<div class="col-sm-1">
								<div class="row">
									<a><span class=""></span></a>
									<p></p>
								</div>
							</div>						
						</div>
				</a>				
					</c:forEach>
			</div>
		</div>
	</div>
</div>

</body>
</html>
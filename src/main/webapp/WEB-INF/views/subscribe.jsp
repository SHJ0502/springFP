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
<body style="background-color: rgb(249, 249, 249);">
<%@ include file="common/topnav.jsp" %>
<%@ include file="common/sidenav.jsp" %>
<div class="container-fluid" style="margin-left: 270px;margin-right: 250px;" id="page">	
		<div class="row">
		<div class="col-sm-12" style="border-bottom: solid silver 1px; margin-top: 10px; margin-bottom: 10px;">
			<p style="margin-left: 15px;">오늘</p>	
			<c:forEach var="today" items="${today }">
				<div class="col-sm-2">				
					<a href="#" style="text-decoration:none; color: black;">
						<img src="/resources/images/thumbnail/${today.videoThumbnail }" style="width: 200px; height: 117px;" />						
						<p>${today.videoTitle }</p>
						<p>${today.channelTitle }</p>
						<p>조회수 ${today.videoView } ・ ${today.beforeTime  } </p>							
					</a>
				</div>
			</c:forEach>		
		</div>
		</div>	
		<div class="row">
		<div class="col-sm-12" style="border-bottom: solid silver 1px; margin-top: 10px;">
			<p style="margin-left: 15px;">어제</p>	
			<c:forEach var="yesterday" items="${yesterday }">
				<div class="col-sm-2">				
					<a href="#" style="text-decoration:none; color: black; width: 225.5; height: 227px;">
						<img src="/resources/images/thumbnail/${yesterday.videoThumbnail }" style="width: 200px; height: 117px;" />						
						<p>${yesterday.videoTitle }</p>
						<p>${yesterday.channelTitle }</p>
						<p>조회수 ${yesterday.videoView } ・ ${yesterday.beforeTime  } </p>							
					</a>
				</div>
			</c:forEach>		
		</div>
	</div>	
		<div class="row">
		<div class="col-sm-12" style="border-bottom: solid silver 1px; margin-top: 10px; margin-bottom: 10px;">
			<p style="margin-left: 15px;">이번 주</p>	
			<c:forEach var="week" items="${week }">
				<div class="col-sm-2">				
					<a href="#" style="text-decoration:none; color: black;">
						<img src="/resources/images/thumbnail/${week.videoThumbnail }" style="width: 200px; height: 117px;" />						
						<p>${week.videoTitle }</p>
						<p>${week.channelTitle }</p>
						<p>조회수 ${week.videoView } ・ ${week.beforeTime  } </p>							
					</a>
				</div>
			</c:forEach>		
		</div>
	</div>
		<div class="row">
		<div class="col-sm-12" style="border-bottom: solid silver 1px; margin-top: 10px; margin-bottom: 10px;">
			<p style="margin-left: 15px;">이번 달</p>	
			<c:forEach var="month" items="${month }">
				<div class="col-sm-2">				
					<a href="#" style="text-decoration:none; color: black;">
						<img src="/resources/images/thumbnail/${month.videoThumbnail }" style="width: 200px; height: 117px;" />						
						<p>${month.videoTitle }</p>
						<p>${month.channelTitle }</p>
						<p>조회수 ${month.videoView } ・ ${month.beforeTime  } </p>							
					</a>
				</div>
			</c:forEach>		
		</div>	
	</div>
</div>

</body>
</html>
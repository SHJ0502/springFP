<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>내 채널</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

.remove {
	display: block;
	z-index: 1;
}
.on {
	font-size: 21px; outline: none; color: red; display: inline;
}
.off {
	font-size: 21px; outline: none; color: black; display: inline;
}

@keyframes sheen {
  0% {
    transform: skewY(-45deg) translateX(0);
  }
  100% {
    transform: skewY(-45deg) translateX(12.5em);
  }
}

@keyframes movement {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 1000px 0;
  }
}

@keyframes rotate {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.dropdown > pull-right {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
[id^=cmnt-modify-del] {
  text-align: center;
  text-decoration: none;
  color: rgb(216, 216, 216);
  border: 2px solid rgb(216, 216, 216);
  font-size: 24px;
  display: inline-block;
  border-radius: 20px;
  transition: all 0.2s ease-in-out;
  position: relative;
  overflow: hidden;
  &:before {
    content: "";
    background-color: rgb(216, 216, 216);
    height: 5px;
    width: 5px;
    display: block;
    position: absolute;
    top: 0;
    left: -4.5em;
    transform: skewX(-45deg) translateX(0);
    transition: none;
  }
  &:hover {
    background-color: rgb(216, 216, 216);
    color: rgb(216, 216, 216);
    border-bottom: 4px solid darken($color, 10%);
    &:before {
      transform: skewX(-45deg) translateX(13.5em);
     transition: all 0.5s ease-in-out;
    }
  }
}

/*토스트메시지 */
#toast {
    position: fixed;
    bottom: 30px;
    left: 10%;
    padding: 15px 20px;
    transform: translate(-50%, 10px);
    border-radius: 10px;
    overflow: hidden;
    font-size: 16px;
    opacity: 0;
    visibility: hidden;
    transition: opacity .5s, visibility .5s, transform .5s;
    background: rgba(0, 0, 0, .70);
    color: #fff;
    z-index: 10000;
	}

#toast.reveal {
    opacity: 1;
    visibility: visible;
    transform: translate(-50%, 0)
}


a:hover {
	color: lime;
}	

/* 댓글 버튼 CSS 디자인  */
.commentBoxBtn {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-38%, -92%);
  width: 96px;
  height: 36px;
  background: rgb(241, 241, 241);
  border-radius: 4px;
  text-align: center;
  color: black;
  font-family: verdana;
  font-size: 20px;
  box-shadow: 0 3px 3px rgba(0, 0, 0, 0.65);
  cursor: pointer;
  transition: all .25s
}

.commentBoxBtn:active {
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
}

[id^=comment-box]:hover:after,
[id^=comment-box]:hover:before {
  content: '';
  position: absolute;
  width: 100%;
  height: 50%;
  left: 0;
  top: 0;
  background: repeating-linear-gradient( 45deg, rgba(255, 255, 255, 0.2) 0, rgba(255, 255, 255, 0.2) 20%, rgba(0, 0, 0, 0.2) 20%, rgba(0, 0, 0, 0.2) 40%);
  background-position: 0;
  animation: movement 10s linear infinite;
}

[id^=comment-box]:hover:after {
  top: 50%;
  background: repeating-linear-gradient( -45deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 20%, rgba(0, 0, 0, 0.2) 20%, rgba(0, 0, 0, 0.2) 40%)
}

/* 채널설명 변경 디자인 */
#channel-content-update{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#channel-content-update:hover{
  background:#fff;
  color:#1AAB8A;
}
#channel-content-update:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
#channel-content-update:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#channel-content-update:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>
</head>
<%@ include file="../common/topnav.jsp" %>
<%@ include file="../common/sidenav.jsp" %>	
<body style="background-color: rgb(241, 241, 241);">
<div id="toast"></div>
<div class="container-fluid" style="margin-left: 247px;" >
	<div class="col-sm-12" style="margin: 0px; padding: 0px;">
		<c:choose>
			<c:when test="${empty LU }">
				<div class="row">
					<a data-toggle="modal" data-target="#myModal-channelArt">
						<img alt="상단배너사진" src="../resources/images/channelImage/${channelUserInfo.artPath != null ? channelUserInfo.artPath : '채널상단기본이미지2.jpg' }" style="width:100%; height: 270px; margin-top: -20px;">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${channelNo != loginUserChannelNo }">
						<div class="row">
							<a data-toggle="modal" data-target="#myModal-channelArt">
								<img alt="상단배너사진" src="../resources/images/channelImage/${channelUserInfo.artPath != null ? channelUserInfo.artPath : '채널상단기본이미지2.jpg' }" style="width:100%; height: 270px; margin-top: -20px;">
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row" style="padding-top: 0px;">
							<a data-toggle="modal" data-target="#myModal-channelArt">
								<img alt="상단배너사진" src="../resources/images/channelImage/${channelUserInfo.artPath != null ? channelUserInfo.artPath : '채널상단기본이미지2.jpg' }" style="width:100%; height: 270px; cursor: pointer; margin-top: -20px;">
							</a>
						</div>
						
						<div id="myModal-channelArt" class="modal fade" role="dialog">
							<div class="modal-dialog">
						
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">채널아트 등록/수정</h4>
									</div>
									<div class="modal-body">
										<form id="artPath-modify-form" enctype="multipart/form-data" method="POST" action="artPathModify.hta">
											<input id="artPath-modify-channelno" type="hidden" value="${channelUserInfo.channelNo }">
											<div class="form-group">
												<div class="row" align="center">
													<label for="artPath-img-file" style="width: 100%; display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid black; color: black; border-bottom-color: black; border-radius: .25em">등록/변경 하실 사진파일 click해서 올려주세요.</label>
													<input type="file" id="artPath-img-file" name="artPath-img-file" style="overflow: hidden; position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; clip: rect(0,0,0,0); border: 0;">
												</div>
											</div>
											<div class="form-group">
												<div class="row" align="center">
													<img alt="미리보기이미지" src="#" id="artPath-img-preview" style="width: 100%; height: 300px;">
												</div>
											</div>
										<div class="row" style="padding-left: 15px; padding-right: 15px;">
											<button type="button" class="btn btn-danger pull-left" id="artPath-delete">삭제</button>
											<button type="button" class="btn btn-primary pull-right" id="artPath-submit">등록/수정</button>
										</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									</div>
								</div>
						
							</div>
						</div>
						</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<div class="row" style="padding-top: 16px; background-color: rgb(249, 249, 249);">
			<div class="container" id="mychannel-header" style="align-items: center; padding-left: 0px;">
				<c:choose>
					<c:when test="${empty LU }">
						<div id="user-iamge" class="col-sm-1" style="padding-left: 0px;">
							<img alt="유저프로필사진" src="../resources/images/photo/${channelUserInfo.imagePath != null ? channelUserInfo.imagePath : 'userbase.jpg' }" class="thumbnail img-circle" style="width: 100%; height: 80px; border-radius: 70px;">
						</div>
						<div class="col-sm-8" style="padding-top: 17px;">
							<div class="row">
								<span id="channel-name-info">${channelUserInfo.name }</span>
							</div>
							<div class="row">
								<span>${subscribeCount != 0 ? subscribeCount : '구독자 없음'} ${subscribeCount != 0 ? '명': ''}</span>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${channelNo != loginUserChannelNo }">
								<div id="user-iamge" class="col-sm-1" style="padding-left: 0px;">
									<img alt="유저프로필사진" src="../resources/images/photo/${channelUserInfo.imagePath != null ? channelUserInfo.imagePath : 'userbase.jpg' }" class="thumbnail img-circle" style="width: 100%; height: 80px; border-radius: 70px;">
								</div>
								<div class="col-sm-8" style="padding-top: 17px;">
									<div class="row">
										<span id="channel-name-info">${channelUserInfo.name }</span>
									</div>
									<div class="row">
										<span>${subscribeCount != 0 ? subscribeCount : '구독자 없음'} ${subscribeCount != 0 ? '명': ''}</span>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div id="user-iamge" class="col-sm-1" style="padding-left: 0px;">
									<a data-toggle="modal" data-target="#myModal-user-img">
										<img alt="유저프로필사진" src="../resources/images/photo/${channelUserInfo.imagePath != null ? channelUserInfo.imagePath : 'userbase.jpg' }" class="thumbnail img-circle" style="width: 100%; height: 80px; border-radius: 70px;">
									</a>
								</div>
								<div id="myModal-user-img" class="modal fade" role="dialog">
									<div class="modal-dialog">
								
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">프로필사진 수정</h4>
											</div>
											<div class="modal-body">
												<form id="user-modify-form" enctype="multipart/form-data" method="POST">
													<input id="user-modify-userno" type="hidden" value="${channelUserInfo.userNo }">
													<div class="form-group">
														<div class="row" align="center">
															<label for="user-img-file" style="width: 100%; display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid black; color: black; border-bottom-color: black; border-radius: .25em">등록/변경 하실 사진파일 click해서 올려주세요.</label>
															<input type="file" id="user-img-file" name="user-img-file" style="overflow: hidden; position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; clip: rect(0,0,0,0); border: 0;">
														</div>
													</div>
													<div class="form-group">
														<div class="row" align="center">
															<img alt="미리보기이미지" src="#" id="user-img-preview" style="width: 100%; height: 300px;">
														</div>
													</div>
												<div class="row" style="padding-left: 15px; padding-right: 15px;">
													<button type="button" class="btn btn-danger pull-left" id="user-delete">삭제</button>
													<button type="button" class="btn btn-primary pull-right" id="user-submit">등록/수정</button>
												</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
										</div>
								
									</div>
								</div>
								
								
								<div class="col-sm-8" style="padding-top: 17px;">
									<div class="row">
										<span id="channel-name-info">${channelUserInfo.name }</span>
									</div>
									<div class="row">
										<span>${subscribeCount != 0 ? subscribeCount: '구독자 없음'} ${subscribeCount != 0 ? '명': ''}</span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				<div class="col-sm-2" style="margin-top: 16px;">
				<c:choose>
					<c:when test="${empty LU}">
						<div class="row">
							<form action="/user/login.hta">
								<button type="submit" class="btn btn-danger btn-lg pull-right" id="subscribe-login">구독</button>											
							</form>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${channelNo != loginUserChannelNo }">
								<c:choose>
									<c:when test="${not empty subscribeInfo }">
										<button type="button" class="btn btn-default btn-lg pull-right" id="subscribe-off" style="display: block;" data-channel-no="${channelNo }">구독 중</button>											
										<button type="button" class="btn btn-danger btn-lg pull-right" id="subscribe-on" style="display: none;" data-channel-no="${channelNo }">구독</button>											
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-danger btn-lg pull-right" id="subscribe-on" style="display: block;" data-channel-no="${channelNo }">구독</button>											
										<button type="button" class="btn btn-default btn-lg pull-right" id="subscribe-off" style="display: none;" data-channel-no="${channelNo }">구독 중</button>											
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<div class="col-sm-6">
									<a href="../mychannel/mychannel_upload.hta?channelno=${loginUserChannelNo }"><button id="mychannel-setting" class="btn btn-primary" style="margin-right: 60px">업로드</button></a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
		<div class="row" style="padding-left: 100px; background-color: rgb(241, 241, 241);">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">홈</a></li>
			<li><a data-toggle="tab" href="#menu1">동영상</a></li>
			<li><a data-toggle="tab" href="#menu2">재생목록</a></li>
			<li><a data-toggle="tab" href="#menu3">채널</a></li>
			<li><a data-toggle="tab" href="#menu4">커뮤니티</a></li>
			<li><a data-toggle="tab" href="#menu5">정보</a></li>
			<li><a data-toggle="tab" href="#menu6"><span class="glyphicon glyphicon-search" id="search-btn"></span><input class="blind" type="text" id="keyword" style="margin-left: 10px; background-color:transparent;border:0px solid black; border-bottom-width: 1px; cursor: pointer;"/></a></li>
		</ul>
		
		<div class="tab-content">
		<!-- 홈탭  -->
			<div id="home" class="tab-pane fade in active">
				<c:choose>
					<c:when test="${empty LU }">
						<br>
						<div class="row" >
							<div class="col-sm-5">
								<div id="player">
									<video tabindex="-1" class="video-stream html5-main-video" style="width: 100%; max-width: 424px; height: 238px;" src="../resources/videos/${bestViewVideo.path }" controlslist="nodownload" controls autoplay muted></video>
								</div>
							</div>
							<div class="col-sm-7">
								<a href="/detail.hta?videono=${bestViewVideo.videoNo }">
									<div class="row">
										<span>${bestViewVideo.title }</span>
									</div><br>
									<div class="row">
										<div class="col-sm-2">
											<span>${bestViewVideo.views }</span>회
										</div>
										<div class="col-sm-3" style="margin-left: -90px;">
											<span>${bestViewVideo.beforeTime }</span>
										</div>
									</div><br>
									<div class="row">
										<span>${bestViewVideo.channelTag }</span>
									</div><br>
									<div class="row" id="channel-content-explain" style="width: 455px; margin-top: 40px;">
										<span>${bestViewVideo.content }</span>
									</div>
								</a>
							</div>
						</div><hr>
						<div class="row" style="width: 100%; height: 100%; overflow: hidden;">
							<div class="row">
								<div class="col-sm-2">
									<span style="width: 116px; height: 20px; font-weight: bold;">업로드한 동영상</span>
								</div>
								
							</div>
							<c:forEach var="mychannelTap" items="${videoThumbnails }">
								<div class="col-sm-2">
									<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
					   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
					   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
					   			 		 	<div class="wrapper">
					   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
					   			 		 	</div>
					   			 			<div class="row">
					   			 				<div class="col-sm-12">
							   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
					   			 				</div>
					   			 			</div>
					   			 			<div class="row">
					   			 				<div class="col-sm-12">
							   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
					   			 				</div>
					   			 			</div>
					   			 		</div>
					   			 		</a>
					   			 	</div>
								</div>
							</c:forEach>
						</div>
						<hr>
						<div class="row" style="width: 100%; height: 100%; overflow: hidden;">
							<div class="row">
								<div class="col-sm-2">
									<span style="width: 116px; height: 20px; font-weight: bold;">인기 동영상</span>
								</div>
								
							</div>
							<c:forEach var="mychannelTap" items="${videoThumbnailsLike }">
								<div class="col-sm-2">
									<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
					   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
					   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
					   			 		 	<div class="wrapper">
					   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
					   			 		 	</div>
					   			 			<div class="row">
					   			 				<div class="col-sm-12">
							   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
					   			 				</div>
					   			 			</div>
					   			 			<div class="row">
					   			 				<div class="col-sm-12">
							   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
					   			 				</div>
					   			 			</div>
					   			 		</div>
					   			 		</a>
					   			 	</div>
								</div>
							</c:forEach>
							<div class="row pull-right">
								<a id="" style="text-decoration: none;">더보기</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${channelNo != loginUserChannelNo }">
								<br>
								<div class="row">
									<div class="col-sm-5">
										<div id="player">
											<video tabindex="-1" class="video-stream html5-main-video" style="width: 100%; max-width: 424px; height: 238px;" src="../resources/videos/${bestViewVideo.path }" controlslist="nodownload" controls autoplay muted></video>
										</div>
									</div>
									<div class="col-sm-7">
										<div class="row">
											<span>${bestViewVideo.title }</span>
										</div><br>
										<div class="row">
											<div class="col-sm-2">
												<span>${bestViewVideo.views }</span>회
											</div>
											<div class="col-sm-3">
												<span>${bestViewVideo.beforeTime }</span>
											</div>
										</div><br>
										<div class="row">
											<span>${bestViewVideo.channelTag }</span>
										</div><br>
										<div class="row" id="channel-content-explain">
											<span>${bestViewVideo.content }</span>
										</div>
									</div>
								</div><hr>
								<div class="row" style="width:100%; height:280px; overflow:hidden;">
									<div class="row">
										<div class="col-sm-2">
											<span style="width: 116px; height: 20px; font-weight: bold;">업로드한 동영상</span>
										</div>
										
									</div>
									<c:forEach var="mychannelTap" items="${videoThumbnails }">
										<div class="col-sm-2">
											<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
							   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
							   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
							   			 		 	<div class="wrapper">
							   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
							   			 		 	</div>
							   			 			<div class="row">
							   			 				<div class="col-sm-12">
									   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
							   			 				</div>
							   			 			</div>
							   			 			<div class="row">
							   			 				<div class="col-sm-12">
									   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
							   			 				</div>
							   			 			</div>
							   			 		</div>
							   			 		</a>
							   			 	</div>
										</div>
									</c:forEach>
								</div>
								<hr>
								<div class="row" style="width:100%; height:280px; overflow:hidden;">
									<div class="row">
										<div class="col-sm-2">
											<span style="width: 116px; height: 20px; font-weight: bold;">인기 동영상</span>
										</div>
										
									</div>
									<c:forEach var="mychannelTap" items="${videoThumbnailsLike }">
										<div class="col-sm-2">
											<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
							   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
							   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
							   			 		 	<div class="wrapper">
							   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
							   			 		 	</div>
							   			 			<div class="row">
							   			 				<div class="col-sm-12">
									   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
							   			 				</div>
							   			 			</div>
							   			 			<div class="row">
							   			 				<div class="col-sm-12">
									   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
							   			 				</div>
							   			 			</div>
							   			 		</div>
							   			 		</a>
							   			 	</div>
										</div>
									</c:forEach>
								</div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty videoThumbnails }">
										<br>
									<div class="row">
										<div class="col-sm-5">
											<div id="player">
												<video tabindex="-1" class="video-stream html5-main-video" style="width: 100%; max-width: 424px; height: 238px;" src="../resources/videos/${bestViewVideo.path }" controlslist="nodownload" controls autoplay muted></video>
											</div>
										</div>
										<div class="col-sm-7">
											<div class="row">
												<span>${bestViewVideo.title }</span>
											</div><br>
											<div class="row">
												<div class="col-sm-2">
													<span>${bestViewVideo.views }</span>회
												</div>
												<div class="col-sm-3">
													<span>${bestViewVideo.beforeTime }</span>
												</div>
											</div><br>
											<div class="row">
												<span>${bestViewVideo.channelTag }</span>
											</div><br>
											<div class="row" id="channel-content-explain">
												<span>${bestViewVideo.content }</span>
											</div>
										</div>
									</div><hr>
									<div class="row" style="width: 100%; height: 280px; overflow: hidden;">
										<div class="row">
											<div class="col-sm-2">
												<span style="width: 116px; height: 20px; font-weight: bold;">업로드한 동영상</span>
											</div>
											
										</div>
										<c:forEach var="mychannelTap" items="${videoThumbnails }">
											<div class="col-sm-2">
												<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
								   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
								   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
								   			 		 	<div class="wrapper">
								   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
								   			 		 	</div>
								   			 			<div class="row">
								   			 				<div class="col-sm-12">
										   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
								   			 				</div>
								   			 			</div>
								   			 			<div class="row">
								   			 				<div class="col-sm-12">
										   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
								   			 				</div>
								   			 			</div>
								   			 		</div>
								   			 		</a>
								   			 	</div>
											</div>
										</c:forEach>
									</div>
									<hr>
									<div class="row" style=" width:100%; height:280px; overflow:hidden;">
										<div class="row">
											<div class="col-sm-2">
												<span style="width: 116px; height: 20px; font-weight: bold;">인기 동영상</span>
											</div>
											
										</div>
										<c:forEach var="mychannelTap" items="${videoThumbnailsLike }">
											<div class="col-sm-2">
												<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
								   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
								   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
								   			 		 	<div class="wrapper">
								   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
								   			 		 	</div>
								   			 			<div class="row">
								   			 				<div class="col-sm-12">
										   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
								   			 				</div>
								   			 			</div>
								   			 			<div class="row">
								   			 				<div class="col-sm-12">
										   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
								   			 				</div>
								   			 			</div>
								   			 		</div>
								   			 		</a>
								   			 	</div>
											</div>
										</c:forEach>
									</div>
									</c:when>
									<c:otherwise>
										<div style="align-items: center; text-align: center; width: 100%;">
											<img alt="start-img" src="../resources/images/logo/startImg.gif" style="width: "><br><br><br>
											<p><span style="align-content: center; font-weight: bold; font-size: 40px; ">동영상을 업로드하여 시작하기</span></p><br>
											<p><span>스토리를 공유하고 시청자와 소통해 보세요. 업로드한 동영상이 여기에 표시됩니다.</span></p><br>
											<a href="../mychannel/mychannel_upload.hta?channelno=${loginUserChannelNo }"><button class="btn btn-primary">동영상 업로드</button></a>
										</div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!-- 동영상 탭 -->
			<div id="menu1" class="tab-pane fade">
			<c:choose>
				<c:when test="${not empty videoThumbnails }">
					<br>
					<div class="row">
						<div class="col-sm-2">
							
						</div>
					</div>
					<br>
					
					<!-- 업로드한 동영상 -->
					<div class="row">
						<c:forEach var="mychannelTap" items="${videoThumbnails }">
							<div class="col-sm-2">
								<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; ">
				   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
				   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
				   			 		 	<div class="wrapper">
				   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px; height: 140px;">	
				   			 		 	</div>
				   			 			<div class="row">
				   			 				<div class="col-sm-12">
						   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
				   			 				</div>
				   			 			</div>
				   			 			<div class="row">
				   			 				<div class="col-sm-12">
						   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
				   			 				</div>
				   			 			</div>
				   			 		</div>
				   			 		</a>
				   			 	</div>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row" style="margin-top: 20px;">
						<div style="text-align: center;">동영상이 존재하지 않습니다.</div>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
			
			<!-- 재생목록 탭 -->
			<div id="menu2" class="tab-pane fade">
				<br>
				<div class="row">
				<div style="text-align: center;">재생목록이 존재하지 않습니다.</div>
				</div>
			</div>
			
			<!-- 채널 구독 탭 -->
			<div id="menu3" class="tab-pane fade">
				<br>
				<div class="row">
					<span>구독 정보</span>
				</div>
				<br><br>
				<c:choose>
					<c:when test="${not empty subscribeUsers }">
						<c:forEach var="subscribeUserBychannelNo" items="${subscribeUsers }">
							<div class="col-sm-2" style="text-align: center;">
								<div class="row" align="center">
									<img alt="구독자사진" src="../resources/images/photo/${subscribeUserBychannelNo.imagePath != null ? subscribeUserBychannelNo.imagePath : 'userbase.jpg' }" class="thumbnail img-circle" style="width: 100px; height: 100px; padding-left: 0px; border-radius: 70px; margin-bottom: 20px;" >
									<span style="text-align: center;">${subscribeUserBychannelNo.channelTitle }</span><br>
									<span>구독자 17 명</span><br>
									<button class="btn btn-info" type="submit" style="margin-top: 5px;">구독</button>
								</div>
							</div>
						</c:forEach>
					
					</c:when>
					<c:otherwise>
						<p style="text-align: center;">구독 정보가 존재하지 않습니다.</p>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!-- 커뮤니티 게시글 댓글 탭 -->
			<div id="menu4" class="tab-pane fade">
				<c:choose>
					<c:when test="${empty LU }">
						<div class="row" id="cmnt-data-view">
							 <c:forEach var="cmntUser" items="${cmntusers }">
								 <div class="row" id="cmnt-row-${cmntUser.channelCmntNo }">
									<div class="col-sm-7" style="width: 1200px; border: 1px solid; border-color: rgb(216, 216, 216); margin-bottom: 30px;">
										<div class="row">
										<div class="col-sm-12">
												<div class="col-sm-2">
													<img alt="유저프로필사진" src="../resources/images/photo/${cmntUser.userImagePath != null ? cmntUser.userImagePath : 'userbase.jpg' }" class="img-circle" style="width: 119px; height: 119px; padding-left: 0px; border-radius: 70px; margin-top: 15px;">
												</div>
												<div class="col-sm-10" >
													<div class="row" style="margin-top: 5px; padding-left: 15px;">
														<span>${cmntUser.userName } ・ ${cmntUser.beforeTime }</span>
													</div>
													<div class="row" id="cmnt-content-${cmntUser.channelCmntNo }" style="width:100%; height:20px; overflow:hidden; margin-top: 10px;">
														<div class="row" style="padding-left: 30px;">
															<p style="margin-bottom: 15px;">${cmntUser.cmntTitle }</p>
															<p>${cmntUser.cmntContent }</p>
															<c:if test="${cmntUser.cmntFilePath != null }">
																<img alt="게시글사진" src="../resources/images/cmntimage/${cmntUser.cmntFilePath }" style="width: 420px; height: 420px;">
															</c:if>
														</div>
														<div class="row" style="padding-left: 30px; padding-top: 20px;">
															<a style="text-decoration: none;" onclick="summary_btn(${cmntUser.channelCmntNo })">간략히 보기</a> 
														</div>
													</div>
													
												</div>
												<div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-right: 100px; padding-top: 100px;">
													<a style="text-decoration: none;" onclick="detail_btn(${cmntUser.channelCmntNo })">자세히 보기</a>
												</div>
										</div>
											<div class="row" style="margin-left: 200px; margin-top: 70px;">
												<div class="col-sm-12" style="display: inline-block;">
														<a class="btn" style="font-size: 21px; outline: none; color: black;" href="/user/login.hta"><span class="glyphicon glyphicon-thumbs-up" style="margin-right: 10px;" data-cmnt-no="${cmntUser.channelCmntNo }"></span><strong>${cmntUser.likeCnt }</strong></a>
														<a class="btn" style="font-size: 21px; outline: none; color: black;" href="/user/login.hta"><span class="glyphicon glyphicon-thumbs-down" style="margin-right: 10px;" data-cmnt-no="${cmntUser.channelCmntNo }"></span><strong>${cmntUser.hateCnt }</strong></a>					
													<button id="comment-box${cmntUser.channelCmntNo }" name="comment-box" onclick="open_comment_form(${cmntUser.channelCmntNo })" class="commentBoxBtn">댓글</button>
												</div>
											</div>
										<hr>
										<div class="row">
											<div class="col-sm-12" style="padding-left: 25px; padding-bottom: 10px;">
												<form id="commentForm${cmntUser.channelCmntNo}" name="commentForm" method="post">
													<input type="hidden" id="cmnt-commentNo${cmntUser.channelCmntNo}" name="cmnt-commentNo" value="${cmntUser.channelCmntNo }">
													<textarea rows="2" cols="30" id="comment-content${cmntUser.channelCmntNo}" style="width: 900px; margin-left: 200px;" name="comment-content" placeholder="댓글 입력..."></textarea>
													<a href="#" id="comment-add" class="btn pull-right btn-success" style="margin-right: 20px; margin-top: 7px;" onclick="cmnt_comment_add(${cmntUser.channelCmntNo})">등록</a>
												</form>
											</div>
										</div>
										</div>
										<div class="row" style="padding-top: 5px; padding-bottom: 10px; padding-left: 10px;">
											<a id="all-comment-view${cmntUser.channelCmntNo}" style="text-decoration: none;" onclick="open_box(${cmntUser.channelCmntNo})">댓글 모두 보기 ▼</a>
											<div id="all-comment-view-box${cmntUser.channelCmntNo}">
												<div id="cmnt-comment-box${cmntUser.channelCmntNo }" class="cmnt-comment-view"></div>
											</div>
										</div>
									</div>
								 </div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
					
						<c:if test="${channelNo == loginUserChannelNo }">
							<div class="row" align="right" style="margin-right: 20px;">
								<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">글 등록</button>
								<div id="myModal" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title pull-left">욕설.비방 금지!</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" id="cmnt-form" name="addCmnt-form" method="post" enctype="multipart/form-data" action="cmntUpload.hta">
													<input type="hidden" id="addCmnt-channelNo" value="${channelNo }">
													<div class="form-group">
														<label class="control-label col-sm-2" for="addCmnt-title">제목</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="addCmnt-title" placeholder="제목을 입력하세요" name="title">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="addCmnt-content">내용</label>
														<div class="col-sm-10">
															<textarea rows="10" cols="10" class="form-control" id="addCmnt-content" placeholder="내용을 입력하세요" name="content"></textarea>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-6" style="padding-left: 100px;">
																<img alt="미리보기이미지" src="#" id="cmnt-img-preview" style="width: 150px; height: 75px;">
															</div>
															<div class="col-sm-6">
																<label for="addCmnt-img" style="display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid black; color: black; border-bottom-color: black; border-radius: .25em">사진파일</label>
																<input type="file" id="addCmnt-img" name="addCmnt-img" style="overflow: hidden; position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; clip: rect(0,0,0,0); border: 0;">
															</div>
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button class="btn btn-danger pull-left" id="addCmnt-submit">글 등록</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						
						<div class="row" id="cmnt-data-view">
							 <c:forEach var="cmntUser" items="${cmntusers }">
								 <div class="row" id="cmnt-row-${cmntUser.channelCmntNo }">
									<div class="col-sm-7" style="width: 1200px; border: 1px solid; border-color: rgb(216, 216, 216); margin-bottom: 30px;">
										<div class="row">
										<div class="col-sm-12">
												<div class="col-sm-2">
													<img alt="유저프로필사진" src="../resources/images/photo/${cmntUser.userImagePath != null ? cmntUser.userImagePath : 'normal.png' }" class="img-circle" style="width: 119px; height: 119px; padding-left: 0px; border-radius: 70px; margin-top: 15px;">
												</div>
												<div class="col-sm-10" >
													<div class="row" style="margin-top: 5px; padding-left: 15px;">
														<span>${cmntUser.userName } ・ ${cmntUser.beforeTime }</span>
														<div class="dropdown pull-right">
															<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-modify-del" >
																<span class="glyphicon glyphicon-option-vertical"></span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="#" id="cmnt-modify-${cmntUser.channelCmntNo }" data-cmnt-no=${cmntUser.channelCmntNo }>수정</a></li>
																<li><a href="#" id="cmnt-delete-${cmntUser.channelCmntNo }" data-cmnt-no=${cmntUser.channelCmntNo }>삭제</a></li>
															</ul>
														</div>
													</div>
													<button id="comment-box${cmntUser.channelCmntNo }" name="comment-box" onclick="open_comment_form(${cmntUser.channelCmntNo })" class="commentBoxBtn">댓글</button>
													<div class="row" id="cmnt-content-${cmntUser.channelCmntNo }" style="width:100%; height:20px; overflow:hidden; margin-top: 10px;">
														<div class="row" style="padding-left: 30px;">
															<p style="margin-bottom: 15px;">${cmntUser.cmntTitle }</p>
															<p>${cmntUser.cmntContent }</p>
															
															<c:if test="${cmntUser.cmntFilePath != null }">
																<img alt="게시글사진" src="../resources/images/cmntimage/${cmntUser.cmntFilePath }" style="width: 420px; height: 420px;">
															</c:if>
														</div>
														<div class="row" style="padding-left: 30px; padding-top: 20px;">
															<a style="text-decoration: none;" onclick="summary_btn(${cmntUser.channelCmntNo })">간략히 보기</a> 
														</div>
													</div>
													
												</div>
												<div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-right: 100px; padding-top: 100px;">
													<a style="text-decoration: none;" onclick="detail_btn(${cmntUser.channelCmntNo })">자세히 보기</a>
												</div>
										</div>
											<div class="row like-hate" style="margin-left: 200px; margin-top: 70px;">
													<c:set var="emotionCheck" value="${cmntUser.emotionCheck}" />
													<a class="btn ${not empty cmntUser.emotionCheck and cmntUser.emotionCheck eq 1 ? 'on' : 'off'} ${emotionCheck eq 1 ? 'DELETE' : 'ADD'}"  
														data-cmnt-no="${cmntUser.channelCmntNo }" 
														
														data-emotion="1">
														<span class="glyphicon glyphicon-thumbs-up" style="margin-right: 10px;" ></span>
														<strong id="cmnt-like-cnt-view-${cmntUser.channelCmntNo }">${cmntUser.likeCnt }</strong>
													</a>
													<a class="btn ${not empty cmntUser.emotionCheck and cmntUser.emotionCheck eq 2 ? 'on' : 'off'} ${emotionCheck eq 2 ? 'DELETE' : 'ADD'}" 
														id="cmnt-like-off${cmntUser.channelCmntNo }" 
														data-cmnt-no="${cmntUser.channelCmntNo }" 
														
														data-emotion="2">
														<span class="glyphicon glyphicon-thumbs-down" style="margin-right: 10px;" ></span>
														<strong id="cmnt-hate-cnt-view-${cmntUser.channelCmntNo }">${cmntUser.hateCnt }</strong>
													</a>
											</div>
										<hr>
										<div class="row">
											<div class="col-sm-12" style="padding-left: 25px; padding-bottom: 10px;">
												<form id="commentForm${cmntUser.channelCmntNo}" name="commentForm" method="post">
													<input type="hidden" id="cmnt-commentNo${cmntUser.channelCmntNo}" name="cmnt-commentNo" value="${cmntUser.channelCmntNo }">
													<textarea rows="2" cols="30" id="comment-content${cmntUser.channelCmntNo}" style="width: 900px; margin-left: 200px;" name="comment-content" placeholder="댓글 입력..."></textarea>
													<a href="#" id="comment-add" class="btn pull-right btn-success" style="margin-right: 20px; margin-top: 7px;" onclick="cmnt_comment_add(${cmntUser.channelCmntNo})">등록</a>
												</form>
											</div>
										</div>
										</div>
										<div class="row" style="padding-top: 5px; padding-bottom: 10px; padding-left: 10px;">
											<a id="all-comment-view${cmntUser.channelCmntNo}" style="text-decoration: none;" onclick="open_box(${cmntUser.channelCmntNo})">댓글 모두 보기 ▼</a>
											<div id="all-comment-view-box${cmntUser.channelCmntNo}">
												<div id="cmnt-comment-box${cmntUser.channelCmntNo }" class="cmnt-comment-view"></div>
											</div>
										</div>
									</div>
								 </div>
							</c:forEach>
						</div>
					
					</c:otherwise>
				</c:choose>
				<br>
				
				<!-- 게시글 수정하는 수정폼 ..  -->
				<div class="row" id="cmnt-modify-form">
					<div id="myModal-cmnt-modify" class="modal fade" role="dialog">
						<div class="modal-dialog">`
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">게시글 수정</h4>
								</div>
								<div class="modal-body">
									<input type="hidden" id="cmnt-no" name="cmntNo" value=""/>
									<input type="text" id="cmnt-modify-title" style="width: 550px; margin-top: 20px;"/>
									<textarea rows="6" cols="30" id="cmnt-modify-content"  style="width: 550px; margin-top: 20px;"></textarea>
									<div class="row" style="padding-left: 13px;">
										<label for="cmnt-modify-img" style="display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid black; color: black; border-bottom-color: black; border-radius: .25em">사진파일</label>
										<input type="file" id="cmnt-modify-img" style="overflow: hidden; position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; clip: rect(0, 0, 0, 0); border: 0;">
									</div>
								</div>
								<div class="modal-footer">
									<button class="btn btn-primary pull-left" type="button"  id="btn-cmnt-modify-form">변경</button>
									<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
			</div>
				
			<!-- 채널 정보 탭 -->
			<div id="menu5" class="tab-pane fade">
				<div class="col-sm-8">
					<br><br>
					<span>설명</span><br>
					<div id="channel-content-explain2" ><br>
						<p>${bestViewVideo.content }</p>
					</div>
					
				</div>
				<div class="col-sm-4">
					<br><br>
					<span>통계</span><hr>
					<div class="row">가입일<span>:<fmt:formatDate value="${channelUserInfo.createDate }"/></span></div><hr>
					<button id="channel-content-update" data-toggle="modal" data-target="#content-modify">채널설명 등록/변경</button>
				</div>
			</div>
			
			<!-- 채널설명Modal -->
			<div id="content-modify" class="modal fade" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">채널설명 등록/변경</h4>
						</div>
						<div class="modal-body">
							<form id="channel-modify-form">
								<div class="form-group">
									<input type="hidden" id="channel-modify-no" value="${bestViewVideo.channelNo }">
									<label for="channel-content-modify" style="font-size: 18px;">채널 설명</label><br>
									<textarea rows="10" cols="30" id="channel-modify-content" placeholder="채널설명을 입력해주세요.." style="width: 860px;"></textarea>
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-default" style="transform: translate(911%, 27%);" id="channel-modify-submit">등록/변경</button>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>

				</div>
			</div>


					<!-- 검색 탭 -->
			<div id="menu6" class="tab-pane fade">
				<h3>검색</h3>
				<div id="input-keyword">
					<div class="row">
						<c:forEach var="mychannelTap" items="${videoThumbnails }">
							<div class="col-sm-2" id="video-searh-result-${mychannelTap.videoNo }">
								<div class="row videodiv" style="margin-top: 20px; width: 210px; display: inline-block; margin-right: 10px; margin-left: 10px; " >
				   			 		<a href="/detail.hta?videono=${mychannelTap.videoNo }" id="video-thumbnail">
				   			 		<div class="row" style="width: 210px; margin-right: 10px; margin-left: 10px; position: relative;">
				   			 		 	<div class="wrapper">
				   			 				<img class="thumbnail" alt="썸네일" src="../resources/images/thumbnail/${mychannelTap.image }" style="width: 210px; margin-bottom: 5px;">	
				   			 		 	</div>
				   			 			<div class="row">
				   			 				<div class="col-sm-12" id="video-search-title">
						   			 			<span style="overflow: auto; font-size: 14px;"><strong>${mychannelTap.title }</strong></span>
				   			 				</div>
				   			 			</div>
				   			 			<div class="row">
				   			 				<div class="col-sm-12">
						   			 			<span>조회수 ${mychannelTap.views }회・${mychannelTap.beforeTime }</span>
				   			 				</div>
				   			 			</div>
				   			 		</div>
				   			 		</a>
				   			 	</div>
							</div>					
						</c:forEach>
					</div>					
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	
	/* 자세히 보기,더보기 버튼 기능 */
	function detail_btn(no) {
		$("#cmnt-content-" + no).css("overflow", "auto").css("height","");
		
	};
	
	function summary_btn(no) {
		$("#cmnt-content-" + no).css("overflow", "hidden").css("height","20px");
	}
	
	
	
	// 각 게시글에 댓글ajax로 등록
	function cmnt_comment_add(no) {
		
		$.ajax({
			url : "/mychannel/cmntComment.hta",
			data : {cmntNo: $('#cmnt-commentNo' + no).val(), cmntComment:$('#comment-content' + no).val()},
			type : 'post',
			dataType: 'json',
			success : function(result) {
				
					var row = "";
					
				$.each(result.cmntCommentList, function(index, item) {
					
					var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
					
					row += '<div class="row" id="comment-row-'+item.cmntCommentNo+'">';
					row += '<div class="col-sm-1">';
					row += '<img alt="사진" src="../resources/images/photo/'+imageName+'" style="width: 50px; height: 50px; border-radius:50px; margin-top:5px;">';
					row += '</div>';
					row += '<div class="col-sm-11">';
					row += '<table class="table">';
					row += '<h6><strong>'+item.userName+'</strong>・'+item.beforeTime+'</h6>';
					row += '<div class="dropdown pull-right">';
					row += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-comment-modify-del" >';
					row += '<span class="glyphicon glyphicon-option-vertical"></span>';
					row += '</button>';
					row += '<ul class="dropdown-menu">';
					row += '<li><a href="#" id="comment-modify-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">수정</a></li>';
					row += '<li><a href="#" id="comment-delete-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">삭제</a></li>';
					row += '</ul>';
					row += '</div>';
					row += '<div></div>';
					row += item.cmntCommentContent+'<tr><td></td></tr>';
					row += '</table>';
					row += '<div id="comment-modify-form'+item.cmntCommentNo+'"></div>';
					row += '</div>';
					row += '</div>';
					
					row += '<div id="input-group-'+item.cmntCommentNo+'" style="display:none;">';
					row += '<textarea class="form-control" id="comment-modify-content-'+item.cmntCommentNo+'"></textarea>';
					row += '<button class="btn btn-danger pull-right" type="button" data-comment-no="'+item.cmntCommentNo+'" id="btn-comment-cancel-form-'+item.cmntCommentNo+'">취소</button>';
					row += '<button class="btn btn-primary pull-right" type="button" data-comment-no="'+item.cmntCommentNo+'" id="btn-comment-modify-form-'+item.cmntCommentNo+'">변경</button>';
					row += '</div>';
					
					
				});
				
				console.log(row);
				
				$("#cmnt-comment-box" + no).empty();
				$("#cmnt-comment-box" + no).append(row);
				
				if(result.result == 'success') {
					toast("댓글이 등록되었습니다.");
					
					 
				 } else {
					 alert("로그인 해주세요..");
				 }
			},
			error : function() {
				alert("오류발생: 댓글 오류");
			}
			
		});
		 
	};
	
	 
	// 게시글 등록하기
	 $("#addCmnt-submit").click(function() {
		
		 var formData = new FormData();
		 formData.append('cmntTitle', $('#addCmnt-title').val());
		 formData.append('cmntContent', $('#addCmnt-content').val());
		 formData.append('channelNo', $('#addCmnt-channelNo').val());
		 if ($('#addCmnt-img').val() !=  "") {
		 	formData.append('cmntFilePath', $('#addCmnt-img')[0].files[0]);
		 }
		 $.ajax({
			 url : "/mychannel/addCmnt.hta",
			 data : formData,
			 type : 'POST',
			 enctype : 'multipart/form-data',
			 processData : false,
			 contentType : false,
			 dataType : 'json',
			 cache : false,
			 success : function(result) {
				
				var item = result.cmntusers;
				var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
				
			 	var rows = '';
			 	
			 	rows += '<div class="row" id="cmnt-row-'+item.channelCmntNo+'">';
				rows += '<div class="col-sm-7" style="width: 1200px; border: 1px solid; border-color: rgb(216, 216, 216); margin-bottom: 30px;">';
				rows += '<div class="row">';
				rows += '<div class="col-sm-12">';
				rows += '<div class="col-sm-2">';
				rows += '<img alt="유저프로필사진" src="../resources/images/photo/'+imageName+'" class="img-circle" style="width: 119px; height: 119px; padding-left: 0px; border-radius: 70px; margin-top: 15px;">';
				rows += '</div>';
				rows += '<div class="col-sm-10" >';
				rows += '<div class="row" style="margin-top: 5px; padding-left: 15px;">';
				rows += '<span>'+item.userName+' ・ '+item.beforeTime+'</span>';
				rows += '<div class="dropdown pull-right">';
				rows += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-modify-del'+item.channelCmntNo+'" >';
				rows += '<span class="glyphicon glyphicon-option-vertical"></span>';
				rows += '</button>';
				rows += '<ul class="dropdown-menu">';
				rows += '<li><a href="#" id="cmnt-modify-'+item.channelCmntNo+'" data-cmnt-no="'+item.channelCmntNo+'">수정</a></li>';
				rows += '<li><a href="#" id="cmnt-delete-'+item.channelCmntNo+'" data-cmnt-no="'+item.channelCmntNo+'">삭제</a></li>';
				rows += '</ul>';
				rows += '</div>';
				rows += '</div>';
				rows += '<button id="comment-box'+item.channelCmntNo+'" name="comment-box" onclick="open_comment_form('+item.channelCmntNo+')" class="commentBoxBtn">댓글</button>';
				rows += '<div class="row" id="cmnt-content-'+item.channelCmntNo+'" style="width:100%; height:20px; overflow:hidden; margin-top: 10px;">';
				rows += '<div class="row" style="padding-left: 30px;">';
				rows += '<p style="margin-bottom: 15px;">'+item.cmntTitle+'</p>';
				rows += '<p>'+item.cmntContent+'</p>';
				
				if(item.cmntFilePath != null) {						 
					rows += '<img alt="게시글사진" src="../resources/images/cmntimage/'+item.cmntFilePath+'" style="width: 420px; height: 420px;">';
				}
				
				rows += '</div>';
				rows += '<div class="row" style="padding-left: 30px; padding-top: 20px;">';
				rows += '<a style="text-decoration: none;" onclick="summary_btn('+item.channelCmntNo+')">간략히 보기</a> ';
				rows += '</div>';
				rows += '</div>';
				rows += '</div>';
				rows += '<div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-right: 100px; padding-top: 100px;">';
				rows += '<a style="text-decoration: none;" onclick="detail_btn('+item.channelCmntNo+')">자세히 보기</a> ';
				rows += '</div>';
				rows += '</div>';
				rows += '<div class="row" style="margin-left: 200px; margin-top: 70px;">';
				
				rows += '<a class="btn off ADD" data-cmnt-no="'+item.channelCmntNo+'" data-emotion="1">';
				rows += '<span class="glyphicon glyphicon-thumbs-up" style="margin-right: 10px;" ></span>';
				rows += '<strong id="cmnt-like-cnt-view-'+item.channelCmntNo+'">'+item.likeCnt+'</strong>';
				rows += '</a>';
				rows += '<a class="btn off ADD" data-cmnt-no="'+item.channelCmntNo+'" data-emotion="2">';
				rows += '<span class="glyphicon glyphicon-thumbs-down" style="margin-right: 10px;" ></span>';
				rows += '<strong id="cmnt-hate-cnt-view-'+item.channelCmntNo+'">'+item.hateCnt+'</strong>';
				rows += '</a>';
				
				
				rows += '</div>';
				rows += '</div>';
				rows += '<hr>';
				rows += '<div class="row">';
				rows += '<div class="col-sm-12" style="padding-left: 25px; padding-bottom: 10px;">';
				rows += '<form id="commentForm'+item.channelCmntNo+'" name="commentForm" method="post">';
				rows += '<input type="hidden" id="cmnt-commentNo'+item.channelCmntNo+'" name="cmnt-commentNo" value="'+item.channelCmntNo+'">';
				rows += '<textarea rows="2" cols="30" id="comment-content'+item.channelCmntNo+'" style="width: 900px; margin-left: 200px;" name="comment-content" placeholder="댓글 입력..."></textarea>';
				rows += '<a href="#" id="comment-add" class="btn pull-right btn-success" style="margin-right: 20px; margin-top: 7px;" onclick="cmnt_comment_add('+item.channelCmntNo+')">등록</a>';
				rows += '</form>';
				rows += '</div>';
				rows += '</div>';
				rows += '</div>';
				rows += '<div class="row" style="padding-top: 5px; padding-bottom: 10px; padding-left: 10px;">';
				rows += '<a id="all-comment-view'+item.channelCmntNo+'" style="text-decoration: none;" onclick="open_box('+item.channelCmntNo+')">댓글 모두 보기 ▼</a>';
				rows += '<div id="all-comment-view-box'+item.channelCmntNo+'">';
				rows += '<div id="cmnt-comment-box'+item.channelCmntNo+'" class="cmnt-comment-view"></div>';
				rows += '</div>';
				rows += '</div>';
				rows += '</div>';
				rows += '</div>';
				 
				
				$("#cmnt-data-view").prepend(rows);
				
				
				toast("게시글이 등록되었습니다.");
					 
				$("#myModal").modal('hide');
					
				$("[id^=commentForm").hide();
					
					
				// 각 게시글에 해당하는 댓글 삭제
				$(".cmnt-comment-view").on('click', '[id^=comment-delete]', function(event) {
					event.preventDefault();
					var commentNo = $(this).data("comment-no");
					var commentContent = $("#comment-contents")
					
					$.ajax({
						url : '/mychannel/commentDelete.hta',
						type : 'get',
						data : {cmntCommentNo : commentNo},
						success : function(result) {
							toast("삭제가 완료되었습니다.");
							
							$("#comment-row-" + commentNo).remove();
						}
						
					});
				});
				
				//댓글 폼 닫기
				$(".cmnt-comment-view").on('click', '[id^=btn-comment-cancel-form]', function(e) {
					e.preventDefault();
					var commentNo = $(this).data("comment-no");
					$("#input-group-" + commentNo).hide();
				});
				
				// 댓글 수정 폼 ajax로 호출
				$(".cmnt-comment-view").on('click', '[id^=comment-modify]', function(e) {
					e.preventDefault();
					var commentNo = $(this).data("comment-no");
					$("#input-group-" + commentNo).show();
				});
				
				// 게시글 수정 버튼 클릭시 게시글번호에 해당하는 정보 가져오기
				$("#cmnt-data-view").on('click', "a[id^='cmnt-modify']", function() {
					var cmntNo = $(this).data("cmnt-no");
					$.ajax({
						url : '/mychannel/getCmntByCmntNo.hta',
						type : 'get',
						data:{cmntNo:cmntNo},
						success:function(item) {
							$("#cmnt-no").val(item.channelCmntNo);
							$("#cmnt-modify-content").val(item.cmntContent);
							$("#cmnt-modify-img").val(item.cmntFilePath);
							$("#cmnt-modify-title").val(item.cmntTitle);
							
							
							$("#myModal-cmnt-modify").modal('show');
						}
					});
				});
				
				// 댓글 수정 기능
				$(".cmnt-comment-view").on('click', '[id^=btn-comment-modify-form]', function(e) {
					e.preventDefault();
					var commentNo = $(this).data("comment-no");
					var commentContent = $("#comment-modify-content-" + commentNo).val();
					
					$.ajax({
						url : '/mychannel/commentModify.hta',
						type : 'get',
						data : {cmntCommentNo : commentNo, cmntCommentContent : commentContent},
						success : function(item) {
							console.log(item);
							var row = '';
						
								var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
								
								row += '<div class="row" id="comment-row-'+item.cmntCommentNo+'" style="padding-left: 15px; padding-right: 15px;">';
								row += '<div class="col-sm-1">';
								row += '<img alt="사진" src="../resources/images/photo/'+imageName+'" style="width: 50px; height: 50px; border-radius:50px; margin-top:5px;">';
								row += '</div>';
								row += '<div class="col-sm-11">';
								row += '<table class="table">';
								row += '<h6><strong>'+item.userName+'</strong>・'+item.beforeTime+'</h6>';
								row += '<div class="dropdown pull-right">';
								row += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-comment-modify-del" >';
								row += '<span class="glyphicon glyphicon-option-vertical"></span>';
								row += '</button>';
								row += '<ul class="dropdown-menu">';
								row += '<li><a href="#" id="comment-modify-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">수정</a></li>';
								row += '<li><a href="#" id="comment-delete-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">삭제</a></li>';
								row += '</ul>';
								row += '</div>';
								row += '<div></div>';
								row += item.cmntCommentContent+'<tr><td></td></tr>';
								row += '</table>';
								row += '<div id="comment-modify-form'+item.cmntCommentNo+'"></div>';
								row += '</div>';
								row += '</div>';
								
								
							toast("변경 되었습니다.");
							
							$("#comment-row-" + commentNo).empty();
							$("#comment-row-" + commentNo).append(row);
							
							$("#input-group-" + commentNo).hide();
						
							
						},
						
							error : function() {
								alert("수정오류");
							}
						});
					});
						
						
						 
					
				},
				error : function(result) {
					
					alert("ajax오류.");
					
				}
				
			 });
		});
		 
		// 미리보기구현
		
		$("#artPath-img-preview").hide();
		$("#cmnt-img-preview").hide();
		$("#user-img-preview").hide();
		
		function readURL(input, previewId) {
		    if (input.files && input.files[0]) {
		          var reader = new FileReader();
		          reader.onload = function (e) { 
		              $(previewId).attr('src', e.target.result);
		          }                    
		          reader.readAsDataURL(input.files[0]);
		      }
		    
		    $(previewId).show();
		  }
		
		  $("#addCmnt-img").change(function(){
		      readURL(this, "#cmnt-img-preview");
		  });
		  
		  $("#artPath-img-file").change(function(){
		      readURL(this,'#artPath-img-preview' );
		  });
		  
		  $("#user-img-file").change(function(){
		      readURL(this,'#user-img-preview' );
		  });
		  
          
          
          
          
   
 
        // 댓글폼 감추기
		$("[id^=commentForm").hide();
		
		$("[id^=all-comment-view-box").hide();
  		
		
	 	function open_comment_form(no) {
			
	 		$("#commentForm" + no).slideToggle();
	 		
		};
		
		
		// 댓글폼 열기
		function open_box(cmntNo) {
			 
			$("#all-comment-view-box" + cmntNo).slideToggle();
			
			$.ajax ({
				url : "/mychannel/exportCmntNo.hta",
				data : {cmntno:cmntNo},
				type : 'post',
				dataType: 'json',
				success : function(result) {
					
					

					var row ="";
					
					
					$.each(result, function(index, item) {
						var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
						
						console.log(item);
						row += '<div class="row" id="comment-row-'+item.cmntCommentNo+'">';
						row += '<div class="col-sm-1">';
						row += '<img alt="사진" src="../resources/images/photo/'+imageName+'" style="width: 50px; height: 50px; border-radius:50px; margin-top:5px;">';
						row += '</div>';
						row += '<div class="col-sm-11">';
						row += '<table class="table">';
						row += '<h6><strong>'+item.userName+'</strong>・'+item.beforeTime+'</h6>';
						row += '<div class="dropdown pull-right">';
						row += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-comment-modify-del" >';
						row += '<span class="glyphicon glyphicon-option-vertical"></span>';
						row += '</button>';
						row += '<ul class="dropdown-menu">';
						row += '<li><a href="#" id="comment-modify-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">수정</a></li>';
						row += '<li><a href="#" id="comment-delete-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">삭제</a></li>';
						row += '</ul>';
						row += '</div>';
						row += '<div></div>';
						row += item.cmntCommentContent+'<tr><td></td></tr>';
						row += '</table>';
						row += '<div id="comment-modify-form'+item.cmntCommentNo+'"></div>';
						row += '</div>';
						row += '</div>';
						
						row += '<div id="input-group-'+item.cmntCommentNo+'" style="display:none;">';
						row += '<textarea class="form-control" id="comment-modify-content-'+item.cmntCommentNo+'"></textarea>';
						row += '<button class="btn btn-danger pull-right" type="button" data-comment-no="'+item.cmntCommentNo+'" id="btn-comment-cancel-form-'+item.cmntCommentNo+'">취소</button>';
						row += '<button class="btn btn-primary pull-right" type="button" data-comment-no="'+item.cmntCommentNo+'" id="btn-comment-modify-form-'+item.cmntCommentNo+'">변경</button>';
						row += '</div>';
					});
					
					$("#cmnt-comment-box" + cmntNo).empty();
					$("#cmnt-comment-box" + cmntNo).append(row);
					
				}
				
			});
				
		};
		
		
		$("[id^='video-searh-result'] > div").hide();
		
		$("#keyword").keyup(function() {
			$("[id^='video-searh-result'] > div").hide();
			 var key = $(this).val();
			 if(key==""){
				 $("[id^='video-searh-result'] > div").hide();
				 return;
			 }
			 $("[id^='video-searh-result'] div:contains('"+key+"')").show();
			
		});

		
		$('.blind').hide();
		
		//서치 버튼 좌우로 슬라이드
		$('#search-btn').click(function(){
   			$('.blind').animate({width:"toggle"},400);
		});
		
		
		// 채널아트등록수정 ajax
		$('#artPath-submit').click(function() {
			
			var formData = new FormData();
			
			formData.append('artPath', $('#artPath-img-file')[0].files[0]);
			formData.append('no', $('#artPath-modify-channelno').val());
			
			$.ajax({
				url : "/mychannel/artPathModify.hta",
				data : formData,
				type : 'POST',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : 'text',
				cache : false,
				success : function(result) {
					
					if('success' == result) {
						
						toast("변경 되었습니다.");
						
						$("#myModal-channelArt").modal('hide');
						
						location.reload();
						
					} else {
						alert("Controller오류입니다.");	
					}
					
				},
				
				error : function(result) {
					alert('파일을 등록해주세요.');
				}
			});
		});
		
		//채널 아트 삭제
		$('#artPath-delete').click(function() {
			
			$.ajax({
				url : "/mychannel/artPathDelete.hta",
				data : {no: $('#artPath-modify-channelno').val()},
				type : "POST",
				dataType : "text",
				success : function(result) {
					
					if('success' == result) {
						
						toast("변경 되었습니다.");
						
						$("#myModal-channelArt").modal('hide');
						
						location.reload();
						
					} else {
						alert("Controller오류입니다.");	
					}
					
				},
				
				error : function(result) {
					alert('ajax오류.');
				}
			});
		});
		
		// 유저 사진 변경 및 삭제
		$('#user-submit').click(function() {
			
			var formData = new FormData();
			
			formData.append('userImagePath', $('#user-img-file')[0].files[0]);
			
			$.ajax({
				url : "/mychannel/userImgModify.hta",
				data : formData,
				type : 'POST',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : 'text',
				cache : false,
				success : function(result) {
					
					if('success' == result) {
						
						toast("변경 되었습니다.");
						
						$("#myModal-user-img").modal('hide');
						
						location.reload();
						
					} else {
						alert("Controller오류입니다.");	
					}
					
				},
				
				error : function(result) {
					alert('ajax오류');
				}
			});
		});
		
		$('#user-delete').click(function() {
			
			$.ajax({
				url : "/mychannel/userImgDel.hta",
				type : "POST",
				dataType : "text",
				success : function(result) {
					
					if('success' == result) {
						
						toast("삭제가 완료되었습니다.");
						
						$("#myModal-user-img").modal('hide');
						
						location.reload();
						
					} else {
						alert("Controller오류입니다.");	
					}
					
				},
				
				error : function(result) {
					alert('ajax오류.');
				}
			});
		});
		
		
		// 각 게시글에 해당하는 댓글 삭제
		$(".cmnt-comment-view").on('click', '[id^=comment-delete]', function(event) {
			event.preventDefault();
			var commentNo = $(this).data("comment-no");
			
			$.ajax({
				url : '/mychannel/commentDelete.hta',
				type : 'get',
				data : {cmntCommentNo : commentNo},
				success : function(result) {
					toast("삭제가 완료되었습니다.");
					
					$("#comment-row-" + commentNo).remove();
				}
				
			});
		});
		
		 // 게시글 삭제
		$("#cmnt-data-view").on('click', '[id^=cmnt-delete]', function(event) {
			event.preventDefault();
			var cmntno = $(this).data("cmnt-no");
			
			$.ajax({
				url : '/mychannel/cmntDelete.hta',
				type : 'get',
				data : {cmntNo : cmntno},
				success : function(result) {
					toast("삭제가 완료되었습니다.");
					
					$("#cmnt-row-" + cmntno).remove();
				}
				
			});
		}); 
		 
		
		// 게시글 수정 버튼 클릭시 게시글번호에 해당하는 정보 가져오기
		$("#cmnt-data-view").on('click', "a[id^='cmnt-modify']", function() {
			var cmntNo = $(this).data("cmnt-no");
			$.ajax({
				url : '/mychannel/getCmntByCmntNo.hta',
				type : 'get',
				data:{cmntNo:cmntNo},
				success:function(item) {
					$("#cmnt-no").val(item.channelCmntNo);
					$("#cmnt-modify-content").val(item.cmntContent);
					$("#cmnt-modify-img").val(item.cmntFilePath);
					$("#cmnt-modify-title").val(item.cmntTitle);
					
					
					$("#myModal-cmnt-modify").modal('show');
				}
			});
		});
		 
		 
		//게시글 수정하기
		$("#myModal-cmnt-modify").on('click', '[id^=btn-cmnt-modify-form]', function(e) {
			e.preventDefault();
			
			var formData = new FormData();
				formData.append('cmntNo', $("#cmnt-no").val());
				formData.append('cmntTitle', $("#cmnt-modify-title").val());
				formData.append('cmntContent', $("#cmnt-modify-content").val());
				if ($('#cmnt-modify-img').val() !=  "") {
				 	formData.append('cmntFilePath', $('#cmnt-modify-img')[0].files[0]);
				 }
			
			$.ajax({
				url : '/mychannel/cmntModify.hta',
				type : 'POST',
				data : formData,
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : 'json',
				cache : false,
				success : function(result) {
					
					var item = result.cmntusers;
					var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
					 
				 	var rows = '';
				 	
				 	rows += '<div class="row" id="cmnt-row-'+item.channelCmntNo+'" style="margin-left: 1px;">';
					rows += '<div class="col-sm-7" style="width: 1200px; border: 1px solid; border-color: rgb(216, 216, 216); margin-bottom: 30px;">';
					rows += '<div class="row">';
					rows += '<div class="col-sm-12">';
					rows += '<div class="col-sm-2">';
					rows += '<img alt="유저프로필사진" src="../resources/images/photo/'+imageName+'" class="img-circle" style="width: 119px; height: 119px; padding-left: 0px; border-radius: 70px; margin-top: 15px;">';
					rows += '</div>';
					rows += '<div class="col-sm-10" >';
					rows += '<div class="row" style="margin-top: 5px; padding-left: 15px;">';
					rows += '<span>'+item.userName+' ・ '+item.beforeTime+'</span>';
					rows += '<div class="dropdown pull-right">';
					rows += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-modify-del'+item.channelCmntNo+'" >';
					rows += '<span class="glyphicon glyphicon-option-vertical"></span>';
					rows += '</button>';
					rows += '<ul class="dropdown-menu">';
					rows += '<li><a href="#" id="cmnt-modify-'+item.channelCmntNo+'" data-cmnt-no="'+item.channelCmntNo+'">수정</a></li>';
					rows += '<li><a href="#" id="cmnt-delete-'+item.channelCmntNo+'" data-cmnt-no="'+item.channelCmntNo+'">삭제</a></li>';
					rows += '</ul>';
					rows += '</div>';
					rows += '</div>';
					rows += '<div class="row" id="cmnt-content-'+item.channelCmntNo+'" style="width:100%; height:20px; overflow:hidden; margin-top: 10px;">';
					rows += '<div class="row" style="padding-left: 30px;">';
					rows += '<p style="margin-bottom: 15px;">'+item.cmntTitle+'</p>';
					rows += '<p>'+item.cmntContent+'</p>';
					
					if(item.cmntFilePath != null) {						 
						rows += '<img alt="게시글사진" src="../resources/images/cmntimage/'+item.cmntFilePath+'" style="width: 420px; height: 420px;">';
					}
					
					rows += '</div>';
					rows += '<div class="row" style="padding-left: 30px; padding-top: 20px;">';
					rows += '<a style="text-decoration: none;" onclick="summary_btn('+item.channelCmntNo+')">간략히 보기</a> ';
					rows += '</div>';
					rows += '</div>';
					rows += '</div>';
					rows += '<div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-right: 100px; padding-top: 100px;">';
					rows += '<a style="text-decoration: none;" onclick="detail_btn('+item.channelCmntNo+')">자세히 보기</a> ';
					rows += '</div>';
					rows += '</div>';
					rows += '<div class="row" style="margin-left: 200px; margin-top: 70px;">';
					
					rows += '<a class="btn off ADD" data-cmnt-no="'+item.channelCmntNo+'" data-emotion="1">';
					rows += '<span class="glyphicon glyphicon-thumbs-up" style="margin-right: 10px;" ></span>';
					rows += '<strong id="cmnt-like-cnt-view-'+item.channelCmntNo+'">'+item.likeCnt+'</strong>';
					rows += '</a>';
					rows += '<a class="btn off ADD" data-cmnt-no="'+item.channelCmntNo+'" data-emotion="2">';
					rows += '<span class="glyphicon glyphicon-thumbs-down" style="margin-right: 10px;" ></span>';
					rows += '<strong id="cmnt-hate-cnt-view-'+item.channelCmntNo+'">'+item.hateCnt+'</strong>';
					rows += '</a>';
					
					rows += '<button id="comment-box'+item.channelCmntNo+'" name="comment-box" onclick="open_comment_form('+item.channelCmntNo+')" class="commentBoxBtn">댓글</button>';
					rows += '</div>';
					rows += '</div>';
					rows += '<hr>';
					rows += '<div class="row">';
					rows += '<div class="col-sm-12" style="padding-left: 25px; padding-bottom: 10px;">';
					rows += '<form id="commentForm'+item.channelCmntNo+'" name="commentForm" method="post">';
					rows += '<input type="hidden" id="cmnt-commentNo'+item.channelCmntNo+'" name="cmnt-commentNo" value="'+item.channelCmntNo+'">';
					rows += '<textarea rows="2" cols="30" id="comment-content'+item.channelCmntNo+'" style="width: 900px; margin-left: 200px;" name="comment-content" placeholder="댓글 입력..."></textarea>';
					rows += '<a href="#" id="comment-add" class="btn pull-right btn-success" style="margin-right: 20px; margin-top: 7px;" onclick="cmnt_comment_add('+item.channelCmntNo+')">등록</a>';
					rows += '</form>';
					rows += '</div>';
					rows += '</div>';
					rows += '</div>';
					rows += '<div class="row" style="padding-top: 5px; padding-bottom: 10px; padding-left: 10px;">';
					rows += '<a id="all-comment-view'+item.channelCmntNo+'" style="text-decoration: none;" onclick="open_box('+item.channelCmntNo+')">댓글 모두 보기 ▼</a>';
					rows += '<div id="all-comment-view-box'+item.channelCmntNo+'">';
					rows += '<div id="cmnt-comment-box'+item.channelCmntNo+'" class="cmnt-comment-view"></div>';
					rows += '</div>';
					rows += '</div>';
					rows += '</div>';
					rows += '</div>';
					
					$("#cmnt-row-" +item.channelCmntNo).empty();
					$("#cmnt-row-" +item.channelCmntNo).append(rows);
					
					if('success' == result.result) {
						toast("변경이 완료되었습니다.");
						 
						$("#myModal-cmnt-modify").modal('hide');
						
						
						
						$("[id^=commentForm").hide();
						
						
						// 각 게시글에 해당하는 댓글 삭제
						$(".cmnt-comment-view").on('click', '[id^=comment-delete]', function(event) {
							event.preventDefault();
							var commentNo = $(this).data("comment-no");
							var commentContent = $("#comment-contents")
							
							$.ajax({
								url : '/mychannel/commentDelete.hta',
								type : 'get',
								data : {cmntCommentNo : commentNo},
								success : function(result) {
									toast("삭제가 완료되었습니다.");
									
									$("#comment-row-" + commentNo).remove();
								}
								
							});
						});
						
						//댓글 폼 닫기
						$(".cmnt-comment-view").on('click', '[id^=btn-comment-cancel-form]', function(e) {
							e.preventDefault();
							var commentNo = $(this).data("comment-no");
							$("#input-group-" + commentNo).hide();
						});
						
						// 댓글 수정 폼 ajax로 호출
						$(".cmnt-comment-view").on('click', '[id^=comment-modify]', function(e) {
							e.preventDefault();
							var commentNo = $(this).data("comment-no");
							$("#input-group-" + commentNo).show();
						});
						
						// 댓글 수정 기능
						$(".cmnt-comment-view").on('click', '[id^=btn-comment-modify-form]', function(e) {
							e.preventDefault();
							var commentNo = $(this).data("comment-no");
							var commentContent = $("#comment-modify-content-" + commentNo).val();
							
							$.ajax({
								url : '/mychannel/commentModify.hta',
								type : 'get',
								data : {cmntCommentNo : commentNo, cmntCommentContent : commentContent},
								success : function(item) {
									console.log(item);
									var row = '';
								
										var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
										
										row += '<div class="row" id="comment-row-'+item.cmntCommentNo+'" style="padding-left: 15px; padding-right: 15px;">';
										row += '<div class="col-sm-1">';
										row += '<img alt="사진" src="../resources/images/photo/'+imageName+'" style="width: 50px; height: 50px; border-radius:50px; margin-top:5px;">';
										row += '</div>';
										row += '<div class="col-sm-11">';
										row += '<table class="table">';
										row += '<h6><strong>'+item.userName+'</strong>・'+item.beforeTime+'</h6>';
										row += '<div class="dropdown pull-right">';
										row += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-comment-modify-del" >';
										row += '<span class="glyphicon glyphicon-option-vertical"></span>';
										row += '</button>';
										row += '<ul class="dropdown-menu">';
										row += '<li><a href="#" id="comment-modify-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">수정</a></li>';
										row += '<li><a href="#" id="comment-delete-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">삭제</a></li>';
										row += '</ul>';
										row += '</div>';
										row += '<div></div>';
										row += item.cmntCommentContent+'<tr><td></td></tr>';
										row += '</table>';
										row += '<div id="comment-modify-form'+item.cmntCommentNo+'"></div>';
										row += '</div>';
										row += '</div>';
										
										
									toast("변경 되었습니다.");
									
									$("#comment-row-" + commentNo).empty();
									$("#comment-row-" + commentNo).append(row);
									
									$("#input-group-" + commentNo).hide();
								
									
								},
								
								error : function() {
									alert("수정오류");
								}
							});
						});
						
						
						 
					} else {
						alert("컨트롤러 오류났으니까 빨리 확인해라");
					}
				
					
				},
				
				error : function() {
					alert("javis: ajax오류났으니까 빨리 확인해라");
				}
			});
		});
		
		
		//토스트메시지
		function toast(string) {
		    const toast = document.getElementById("toast");
		
		    toast.classList.contains("reveal") ?
		        (clearTimeout(removeToast), removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)) :
		        removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)
		    toast.classList.add("reveal"),
		        toast.innerText = string
		};
			
		// 댓글 수정 폼 ajax로 호출
		$(".cmnt-comment-view").on('click', '[id^=comment-modify]', function(e) {
			e.preventDefault();
			var commentNo = $(this).data("comment-no");
			$("#input-group-" + commentNo).show();
		});
		
		//댓글 폼 닫기
		$(".cmnt-comment-view").on('click', '[id^=btn-comment-cancel-form]', function(e) {
			e.preventDefault();
			var commentNo = $(this).data("comment-no");
			$("#input-group-" + commentNo).hide();
		});
		
		// 댓글 수정 기능
		$(".cmnt-comment-view").on('click', '[id^=btn-comment-modify-form]', function(e) {
			e.preventDefault();
			
			var commentNo = $(this).data("comment-no");
			var commentContent = $("#comment-modify-content-" + commentNo).val();
			
			$.ajax({
				url : '/mychannel/commentModify.hta',
				type : 'get',
				data : {cmntCommentNo : commentNo, cmntCommentContent : commentContent},
				success : function(item) {
					console.log(item);
					var row = '';
				
						var imageName = item.userImagePath != null ? item.userImagePath : 'normal.png';
						
						row += '<div class="row" id="comment-row-'+item.cmntCommentNo+'" style="padding-left: 15px; padding-right: 15px;">';
						row += '<div class="col-sm-1">';
						row += '<img alt="사진" src="../resources/images/photo/'+imageName+'" style="width: 50px; height: 50px; border-radius:50px; margin-top:5px;">';
						row += '</div>';
						row += '<div class="col-sm-11">';
						row += '<table class="table">';
						row += '<h6><strong>'+item.userName+'</strong>・'+item.beforeTime+'</h6>';
						row += '<div class="dropdown pull-right">';
						row += '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="cmnt-comment-modify-del" >';
						row += '<span class="glyphicon glyphicon-option-vertical"></span>';
						row += '</button>';
						row += '<ul class="dropdown-menu">';
						row += '<li><a href="#" id="comment-modify-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">수정</a></li>';
						row += '<li><a href="#" id="comment-delete-'+item.cmntCommentNo+'" data-comment-no="'+item.cmntCommentNo+'">삭제</a></li>';
						row += '</ul>';
						row += '</div>';
						row += '<div></div>';
						row += item.cmntCommentContent+'<tr><td></td></tr>';
						row += '</table>';
						row += '<div id="comment-modify-form'+item.cmntCommentNo+'"></div>';
						row += '</div>';
						row += '</div>';
						
						
					toast("변경 되었습니다.");
					
					$("#comment-row-" + commentNo).empty();
					$("#comment-row-" + commentNo).append(row);
					
					$("#input-group-" + commentNo).hide();
				
					
				},
				
				error : function() {
					alert("수정오류");
				}
			});
		});
		
		
	//구독등록
	$("#subscribe-on").click(function() {
		
		var channelNo = $(this).data("channel-no");
		
		$.ajax({
			type:"POST",
			url:"/mychannel/addSubscribe.hta",
			data : {channelNo : channelNo},
			success: function(data) {
				$("#subscribe-on").css("display", 'none');
				$("#subscribe-off").css("display", 'block');
				
				
				location.reload();
				toast("구독이 추가되었습니다.");
			},
			error: function() {
				alert("오류발생");
			}
		});
	});
	
	//구독 삭제
	$("#subscribe-off").click(function() {
		
		var channelName = $("#channel-name-info").text();
		var confirmVal = confirm(channelName +" 을(를) 구독 취소할까요?");
		var channelNo = $(this).data("channel-no");
		
		$.ajax({
			type:"POST",
			url:"/mychannel/cancelSubscribe.hta",
			data : {channelNo : channelNo},
			success: function(data) {
				$("#subscribe-off").css("display", 'none');
				$("#subscribe-on").css("display", 'block');
				
				
				location.reload();
				toast("구독정보가 삭제되었습니다.");
			},
			error: function() {
				alert("오류발생");
			}
		});
	});
	
	$(".like-hate a").click(function(event) {
		event.preventDefault();
		
		var $el = $(this);
		var work;
		if ($el.hasClass("ADD")) {
			work = "ADD";
		}
		if ($el.hasClass("DELETE")) {
			work = "DELETE";
		}
		var cmntNo = $(this).data("cmnt-no");
		var emotion = $(this).data("emotion");

		console.log(cmntNo, emotion, work);
		$.ajax({
			type:"POST",
			url:"/mychannel/changeEmotion.hta",
			data : {cmntNo : cmntNo, emotion:emotion, work:work},
			dataType : 'json',
			success: function(data) {
				
				if (emotion === 1) {
					if (work == "ADD") {
						toast("좋아요 가 반영되었습니다.");
						$el.removeClass("off").addClass("on")
							.next().removeClass("on").addClass("off");
						$el.addClass("DELETE").removeClass("ADD").next().removeClass("DELETE").addClass("ADD");
						
					} else if (work == "DELETE") {
						toast("좋아요 가 삭제되었습니다.");
						$el.removeClass("on").addClass("off");
						$el.addClass("ADD").removeClass("DELETE")
					}
				} else if (emotion === 2) {
					if (work == "ADD") {
						toast("싫어요 가 반영되었습니다.");
						$el.removeClass("off").addClass("on")
							.prev().removeClass("on").addClass("off");
						$el.addClass("DELETE").removeClass("ADD").prev().removeClass("DELETE").addClass("ADD");
						
					} else if (work == "DELETE") {
						toast("싫어요가 가 삭제되었습니다.");
						$el.removeClass("on").addClass("off");
						$el.addClass("ADD").removeClass("DELETE");
					}
				}
				console.log('게시글번호값',cmntNo);
				console.log('좋아요 갯수값',data);
				$("#cmnt-like-cnt-view-" + cmntNo).text(data.LIKECNT);
				$("#cmnt-hate-cnt-view-" + cmntNo).text(data.HATECNT);
			},
			error: function() {
				alert("ajax 전송오류발생");
			}
		});
	});
	
	$('#channel-modify-submit').click(function() {
		
		var channelNo = $("#channel-modify-no").val();
		var channelContent = $("#channel-modify-content").val();
		
		$.ajax({
			url : "/mychannel/channelModify.hta",
			data : {no : channelNo, channelContent : channelContent},
			type : 'get',
			dataType : 'json',
			success : function(result) {
				
				
				$("#channel-content-explain").text(result.channelUpdate.channelContent);
				$("#channel-content-explain2").text(result.channelUpdate.channelContent);
				
				
				if('success' == result.success) {
					
					toast("설명이 반영 되었습니다.");
					
					$("#content-modify").modal('hide');
					
					
				} else {
					alert("Controller오류입니다.");	
				}
				
			},
			
			error : function(result) {
				alert('다시 입력해주세요..');
			}
		});
	});
</script>
</html>
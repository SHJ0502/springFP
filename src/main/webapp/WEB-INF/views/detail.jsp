<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>비디오 정보</title>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<style type="text/css">
  	.container {
  	}
  	.switch {
		position: relative;
		display: inline-block;
		width: 45px;
		height: 17px;
	}
		
	.switch input {
		opacity:0;
		width: 0;
		height: 0;
	}
		
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: white;
		-webkit-transition: .4s;
		transition: .4s;
	}
		
	.slider:before {
		position: absolute;
		content: "";
		height: 20px;
		width: 15px;
		left: 0;
		bottom: -2px;
		background-color: gray;
		-webkit-transition: .4s;
		transition: .4s;
	}
	
	input:checked + .slider {
		background-color: #2196F3;
	}
	
	input:focus + .slider {
		box-shadow: 0 0 1px blue;
	}
	
	input:checked + .slider:before {
		-webkit-transform: translateX(26px);
		-ms-transform: translateX(26px);
		transform: translateX(26px)
	}
	
	.slider.round {
		border-radius: 20px;
	}
	
	.slider.round:before {
		border-radius: 50%;
	}
  	
  	</style>
</head>
<body>
<%@ include file="common/topnav.jsp" %>

<div class="container-fluid" style="margin-left: 80px; margin-right: 60px;">
	<div class="col-sm-8">
		<div class="row">
			<div class="col-sm-12">
				<div id="player">
					<video tabindex="-1" class="video-stream html5-main-video" id="videoplayer" 
						style="width: 100%; max-width:100%; height: 450px; "
						src="../resources/videos/${videoPath.path }" controlslist="nodownload"
						controls autoplay muted>
					</video>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<h4>${video.title }</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12"  id="view" data-view-no='${video.views }' data-video-no='${video.no }'>
				<span >조회수 : ${video.views }회 • <fmt:formatDate value="${video.createDate }"/></span>
				
				<div class="pull-right" id="LikeAmount">
					<button type="button" class="btn btn-default" >
						<span class="glyphicon glyphicon-thumbs-up"  aria-hidden="true" onclick="videolike(${video.no})"> ${video.likeAmount }</span>
					</button>
					<button type="button" class="btn btn-default" >
						<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true" onclick="videodislike(${video.no})"> </span>
					</button>
				</div>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-1">
						<img src="../resources/images/photo/${not empty channelUser.userImagePath ? channelUser.userImagePath : 'userbase.jpg'}" width="48px;" >
					</div>
					<div class="col-sm-3" >
						<strong>${channel.title }</strong> 
						<p id="subscribe">구독자 ${count } 명</p>
					</div>
					<div class="col-sm-3 col-sm-offset-4 pull-right">
						<c:choose>
							<c:when test="${not empty LU }">
								<c:choose>
									<c:when test="${not empty subscribeInfo }">
										<button type="button" class="btn btn-default btn-lg pull-right" id="subscribe-off" style="display: block;" >구독 중</button>											
										<button type="button" class="btn btn-danger btn-lg pull-right" id="subscribe-on" style="display: none;">구독</button>											
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-danger btn-lg pull-right" id="subscribe-on" style="display: block;" >구독</button>											
										<button type="button" class="btn btn-default btn-lg pull-right" id="subscribe-off" style="display: none;" >구독 중</button>											
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<form action="/user/login.hta">
									<button type="submit" class="btn btn-danger btn-lg pull-right" id="subscribe-login" >구독</button>											
								</form>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			<br>
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-9">
					<p>${video.contents }
					</p>
				</div>
			</div>
			</div>
		</div>
		
		<hr>
		<div class="row">
			<div class="col-sm-2">
				 <h4>댓글 ${size }개</h4> <span id="cCnt"></span>
			</div>
		</div>
		<br>
		<c:if test="${not empty LU }">
			<form name="commentInsertForm">
				<div class="row" id="input-group">
					<div class="col-sm-1">
						<img src="../resources/images/photo/${not empty LU.userImagePath ? LU.userImagePath : 'userbase.jpg'}" width="40px;" height="40px;" >
					</div>
					<div class="col-sm-11" >
						<textarea class="form-control" style=" width:1030px;" rows="3" cols="30" id="contentInsert" name="content" placeholder="댓글을 입력하세요"></textarea>
						<button type="button" class="btn btn-default pull-right" name="commentCancelBtn">취소</button>
						<span class="input-group-btn">
	                    	<button class="btn btn-default pull-right"  type="button" name="commentInsertBtn">등록</button>
	             	 	</span>
					</div>
				</div>
			</form>
		</c:if>
		<br>
		<div id="comment-box"> 
		<c:forEach var="comment" items="${comments }">
		<div class="row" >
			<div id="commentList-${comment.no }">
				<div class="col-sm-1">
					<img src="../resources/images/photo/${not empty comment.imagePath ? comment.imagePath : 'userbase.jpg' }" width="40px;" height="40px;" >
				</div>
				<div class="col-sm-11">
					<div class="row">
						<div class="col-sm-4 text-left">
							<p>${comment.userName } - <fmt:formatDate value="${comment.createDate }"/> </p> 
						</div>
						<c:if test="${not empty LU }">
							<c:if test="${comment.userNo == LU.no }">
								<div class="btn-group pull-right" >
								  <button type="button" class="btn btn-default glyphicon glyphicon-option-vertical dropdown-toggle " data-toggle="dropdown" aria-expanded="false">
								  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a href=""  class="glyphicon glyphicon-pencil"  id="pencil" data-comment-no="${comment.no }" > 수정</a></li>
								    <li><a href=""  class="glyphicon glyphicon-trash"  id="trash" data-comment-no="${comment.no }"> 삭제</a></li>
								  </ul>
								</div>
							</c:if>
							<c:if test="${comment.userNo != LU.no }">
								<div class="btn-group pull-right" >
								  <button type="button" class="btn btn-default glyphicon glyphicon-option-vertical dropdown-toggle " data-toggle="dropdown" aria-expanded="false">
								  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a href="#" class="glyphicon glyphicon-flag"> 신고</a></li>
								  </ul>
								</div>
							</c:if>
						</c:if>
					</div>
					<div class="row">
						<div class="col-sm-12" id="comment-content-${comment.no }">
							<p>${comment.content }</p>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="subComment">
								<button type="button" class="btn btn-default" >
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" onclick="like(${comment.no})"> ${comment.likeAmount }</span>
								</button>
								<button type="button" class="btn btn-default" >
									<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true" onclick="dislike(${comment.no})"></span>
								</button>
								<c:if test="${not empty LU }">
									<button type="button" class="btn btn-primary cmt cmt-subcomment" data-comment-no="${comment.no }" style="margin-left: 10px"> 답글 </button>
								</c:if>
								<div id="subComment-insert-${comment.no }"></div>
							</div>
						</div>
						<div class="col-sm-12" style="margin-top: 10px;" id="sub-comment-box">
							<c:if test="${comment.cnt != 0 }">
								<a style="cursor: pointer;" onclick="subcomment_load(${comment.no})">답글 ${comment.cnt }개</a>
							</c:if>
							<div id="sub-comment-${comment.no }" style="margin-top: 10px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr/>
		</c:forEach>
		</div>
	</div>
	<div class="col-sm-4" style="padding-left: 50px;">
		<div class="row">
			<div class="col-sm-5">
				<h4>다음동영상</h4>
			</div>
			<div class="col-sm-7  text-right"  style="padding-top: 10px;"> 
				<span>자동재생</span>
				<label class="switch">
					<input type="checkbox" value="1" onclick="toggle(this)" checked="checked" />
					<span class="slider round"></span>
				</label>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5" style="cursor: pointer" id="nextVideo" data-video-no="${nextVideo.videoNo }"  onclick="location.href='/detail.hta?videono=${nextVideo.videoNo}'">
				<img class="video-stream html5-main-video" style="width: 150px; height: 90px;" src="../resources/images/thumbnail/${nextVideo.videoThumbnail }" ></img >
			</div>
			<div class="col-sm-7" style="cursor: pointer"  onclick="location.href='/detail.hta?videono=${nextVideo.videoNo}'">
				<div class="row">
					<div class="col-sm-12">
						<strong>${nextVideo.videoTitle }</strong>
					</div>
				</div> 
				<div class="row">
					<div class="col-sm-12">
						<p>${nextVideo.videoContents }</p>
					</div>
				</div>
			</div>
		</div>
		<hr/>
		<div id="insertVideo">
		
		</div>
	</div>
</div>
<script type="text/javascript">


	$(function(){
		$("html, body").animate({ scrollTop: 0 }, "slow"); 
	});

	var videono = "${param.videono}";
	var isEnd = false;
	var count = 1;
	
	var videos = [];
	
	// 무한스크롤
	$(function(){
		$(window).scroll(function() {
			var $window = $(this);
			var scrollTop = $window.scrollTop();
			var windowHeight = $window.height();
			var documentHeight = $(document).height();
			
			 if(!isEnd && scrollTop + windowHeight + 30 > documentHeight  ){
				 setNextVideoList(); 
			 }
		});
	});
	
	$.getJSON("/videoList.hta", {videono : videono}, function(result) {
		videos = result;
		setNextVideoList();
	});
	
	function setNextVideoList() {
		var begin = (count - 1) * 8;
		var end = count * 8;		
		
		var nextVideos = videos.slice(begin, end);
		if (nextVideos.length < 8) {
			isEnd = true;
		}
		appendVideos(nextVideos);
		count++;
	}
	
	function appendVideos(nextVideos) {
		var a = "";
		$.each(nextVideos, function(index, item){
        	console.log(item)
        	a +='<div class="row" style="margin-top: 10px";>';
        	a +='	<div class="col-sm-5" style="cursor:pointer" onclick="location.href=\'/detail.hta?videono='+item.videoNo+'\'">';
        	a +='		<img  style="width: 150px; height: 90px;" src="../resources/images/thumbnail/'+item.videoThumbnail+'" />';
        	a +='	</div>';
        	a +='	<div class="col-sm-7" style="cursor: pointer"  onclick="location.href=\'/detail.hta?videono='+item.videoNo+'\'">';
        	a +='		<div class="row">';
        	a +='			<div class="col-sm-12">';
        	a +='				<strong>'+item.videoTitle+'</strong>';
        	a +='			</div>';
        	a +='		</div>';		
        	a +='		<div class="row">';
        	a +='			<div class="col-sm-12">';
        	a +='				<p>'+item.channelTitle+'</p>';
        	a +='			</div>';
        	a +='		</div>';
        	a +='	</div>';
        	a +='</div>';
        	
        });
       	$('#insertVideo').append(a);
		
	}
	
	
	// 동영상 조회수
	window.onload = function () {
		var view = $("#view").data('view-no');
		var videono = $("#view").data('video-no');
		view ++;
		
		$.ajax({
			url : '/videoView.hta',
			type : 'get',
			data : {view : view, videono : videono},
			success : function() {
			},
			error : function() {
			}
		});
	};


	function toggle(checkbox) {
		if (checkbox.checked == false){
		}
		
		document.getElementById('videoplayer').addEventListener('ended', function(){
		    setTimeout(function() {
		    	var videoNo = $("#nextVideo").data('video-no');
		    	
		    	location.href='/detail.hta?videono='+ videoNo +'';
		    	
		    }, 3000);
		});
		
	}
	
	// 비디오 싫어요
	function videodislike(videoNo) {
		
		$.ajax({
			url : '/videoDislike.hta',
			type : 'get',
			data : {videoNo : videoNo},
			success : function(data) {
				load();
			},
			error : function() {
				alert("로그인이 필요합니다.");
			}
		});
	}
	
	// 비디오 좋아요
	function videolike(videoNo) {
		console.log(videoNo);
		
		$.ajax({
			url : '/videoLike.hta',
			type : 'get',
			data : {videoNo : videoNo},
			success : function(data) {
				load();
			},
			error : function() {
				alert("로그인이 필요합니다.");
			}
		});
	}
	
	// 댓글 좋아요
	function like(commentNo) {
		console.log(commentNo);
		
		$.ajax({
			url : '/commentLike.hta',
			type : 'get',
			data : {commentNo : commentNo},
			success : function(data) {
				reload();
			},
			error : function() {
				alert("로그인이 필요합니다.");
			}
		});
	}
	
	// 댓글 싫어요
	function dislike(commentNo) {
		console.log(commentNo);
		$.ajax({
			url : '/commentDislike.hta',
			type : 'get',
			data : {commentNo : commentNo},
			success : function(data) {
				reload();
			},
			error : function() {
				alert("로그인이 필요합니다.");
			}
		});
	}
	
	// 서브댓글 좋아요
	function subLike(subcommentNo) {
		console.log(subcommentNo);
		
		$.ajax({
			url : '/subcommentLike.hta',
			type : 'get',
			data : {subcommentNo : subcommentNo},
			success : function(data) {
				console.log(data);
				$("#sublike-result"+subcommentNo).html(data.likeAmount);
				
			},
			error : function() {
				alert("로그인이 필요합니다.");
			}
		});
	}
	
	// 서브댓글 싫어요
	function subDisLike(subcommentNo) {
		console.log(subcommentNo);
		
		$.ajax({
			url : '/subcommentDislike.hta',
			type : 'get',
			data : {subcommentNo : subcommentNo},
			success : function(data) {
				console.log(data);
				$("#sublike-result").html(data.likeAmount);
				
			},
			error : function() {
				alert("로그인이 필요합니다.");
			}
		});
	}
	
	function reload() {
		$("[id^=comment-box]").load(location.href + " [id^=comment-box]");
	}
	
	function load() {
		$("[id^=LikeAmount]").load(location.href + " [id^=LikeAmount]");
	}
	
	function subscribe() {
		$("#subscribe").load(location.href + " #subscribe");
	}
	
	
	
	
	
	//구독등록
	$("#subscribe-on").click(function() {
		$.ajax({
			type:"POST",
			url:"/insertSubscribe.hta",
			data : {videono : videono},
			success: function(data) {
				//alert("구독이 추가되었습니다.");
				$("#subscribe-on").css("display", 'none');
				$("#subscribe-off").css("display", 'block');
				subscribe();
			},
			error: function() {
				alert("오류발생");
			}
		});
	});
	
	//구독 삭제
	$("#subscribe-off").click(function() {
		$.ajax({
			type:"POST",
			url:"/deleteSubscribe.hta",
			data : {videono : videono},
			success: function(data) {
				//alert("구독정보가 삭제되었습니다.");
				$("#subscribe-off").css("display", 'none');
				$("#subscribe-on").css("display", 'block');
				subscribe();

			},
			error: function() {
				alert("오류발생");
			}
		});
	});
	
	// 댓글 등록
	$('[name=commentInsertBtn]').click(function(event){ //댓글 등록 버튼 클릭시 
		event.preventDefault();
		console.log(videono);
			$.ajax({
	        url : '/insert.hta',
	        type : 'post',
	        data : {videono : videono, content:$('#contentInsert').val()},
	        success : function(data){
	        	alert("댓글 등록이 완료되었습니다.")
	        	reload();
	        	$('[name=content]').val('');
	        },
	        error: function() {
	        	alert("오류발생");
	        }
	 	  });
	
	});
	
	// 댓글 취소
	$('[name=commentCancelBtn]').click(function(event) {
		event.preventDefault();
		$('#contentInsert').val('');
	});
	
	// 서브댓글 등록
	function subCommentInsert(commentNo) {
		var content = $('#subContent').val();
		console.log(content);
		
		$.ajax({
			url : '/subComment.hta',
			type : 'post',
			data : {commentNo : commentNo, content : content},
			success : function(data) {
				reload();
			},
			error : function() {
				alert("오류 발생");
			}
		});
	}	
	
	// 서브댓글 불러오기
	function subcomment_load(commentNo) {
		var a = '';
		
		$.ajax({
			url : '/subShow.hta',
			type : 'get',
			data : {commentNo : commentNo},
			dataType : 'json',
			success : function(result) {
					if ($('#sub-comment-'+commentNo).children('.row').length == 0) {
						
							a += '<div class="row" id="subcomment-box" >';
							$.each(result, function(idx, val) {
							a += '<div id="subcommentList-'+val.no+'">';
							if (val.imagePath == null) {
								a += '<div class="col-sm-1"><img src="../resources/images/photo/userbase.jpg" width="40px;" height="40px;" > </div>';
							} else {
								a += '<div class="col-sm-1"><img src="../resources/images/photo/'+val.imagePath+'" width="40px;" height="40px;" > </div>';
							}
							a += '<div class="col-sm-11">';
							a += '<div class="row"> <div class="col-sm-1">'+ val.userName +' </div> <div class="col-sm-4"> '+val.beforeTime+' </div>';
								if ( val.modify == true) {
							a += '<div class="btn-group pull-right" >';
							a += '<button type="button" class="btn btn-default glyphicon glyphicon-option-vertical dropdown-toggle " data-toggle="dropdown" aria-expanded="false">';
							a += '</button>';
							a += '<ul class="dropdown-menu" role="menu">';
							a += '<li><a href="" class="glyphicon glyphicon-pencil" id="sub-pencil-'+val.no+'" data-subComment-no="'+ val.no +'" > 수정</a></li>';
							a += '<li><a href="" class="glyphicon glyphicon-trash" 	id="sub-trash-'+val.no+'" data-subComment-no="'+ val.no +'"> 삭제</a></li>';
							a += '</ul>';
							a += '</div>';
									}
							if ( val.report == true) {
							a += '<div class="btn-group pull-right" >';
							a += '<button type="button" class="btn btn-default glyphicon glyphicon-option-vertical dropdown-toggle " data-toggle="dropdown" aria-expanded="false">';
							a += '</button>';
							a += '<ul class="dropdown-menu" role="menu">';
							a += '<li><a href="#" class="glyphicon glyphicon-flag"> 신고</a></li>';
							a += '</ul>';
							a += '</div>';
									} 
							a += '</div>';
							a += '<div class="row">';
							a += '<div class="col-sm-12" id="subcomment-content-'+ val.no +'"> <p>'+ val.content +'</p></div>';
							a += '<button type="button" class="btn btn-default">';
							a += '<span class="glyphicon glyphicon-thumbs-up" id="sublike-result'+val.no+'" aria-hidden="true" onclick="subLike('+val.no+')">'+ val.likeAmount +'</span></button>';
							a += '<button type="button" class="btn btn-default" >';
							a += '<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true" onclick="subDisLike('+val.no+')"></span></button>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							}); 
							a += '</div>';
						
							$("#sub-comment-"+commentNo).append(a);
					} else {
						$("#sub-comment-"+commentNo).empty();
					}
				 
			},
			error : function() {
				alert("오류 발생");
			}
		});
	}
	
	
	
	
	// 서브댓글 폼
	$(".subComment").on('click', 'button.cmt-subcomment', function() {
		var commentNo = $(this).data('comment-no');
		
		if ($(this).next().find('.subcomment-group').length == 0) {
			var a ='';
			a += '<div class="subcomment-group" style="margin-top: 15px;">';
			a += '<textarea class="form-control" id="subContent"> </textarea>';
			a += '<span class="input-group-btn"><button class="btn btn-default pull-right" style="margin-top: 10px;" type="button" onclick="subCommentInsert('+commentNo+');">완료</button> </span>';
			a += '</div>';
			
			$("#subComment-insert-"+ commentNo).append(a);
			
		} else {
			$(this).next().empty();
		}
		
	});
	
	// 댓글 수정 폼
	$("[id^=commentList]").on('click', 'a[id^=pencil]',function(event) {
		event.preventDefault();
		var commentNo = $(this).data('comment-no');
		
		var commentContent = $("#comment-content-" + commentNo).find("p").text();
		var a='';
		
		a += '<div id="input-group">';
		a += '<textarea class="form-control" id="modify-content">'+commentContent+'</textarea>';
		a += '<span class="input-group-btn"><button class="btn btn-default pull-right" type="button" onclick="commentUpdateProc('+commentNo+');">수정</button> </span>';
		a += '</div>';
		
		$("#comment-content-" + commentNo).html(a);
		
	});
	
	// 댓글 수정
	function commentUpdateProc(commentNo){
	   var commentContent = $('#modify-content').val();
	   console.log(commentContent);

	    $.ajax({
	        url : '/update.hta',
	        type : 'post',
	        data : {content : commentContent, commentNo : commentNo},
	        success : function(data){
	        	console.log("재시작------------")
	        	reload();
	        }
	    });
	}
	
	// 서브댓글 수정
	$(document).on('click', '[id^=sub-pencil]',function(event) {
		event.preventDefault();
		var subcommentNo = $(this).data('subcomment-no');
		
		var commentContent = $("#subcomment-content-" + subcommentNo).find("p").text();
		var a = '';
		
		a += '<div id="input-groupsub">';
		a += '<textarea class="form-control" id="submodify-content">'+commentContent+'</textarea>';
		a += '<span class="input-group-btn"><button class="btn btn-default pull-right" type="button" onclick="subcommentUpdateProc('+subcommentNo+');">수정</button> </span>';
		a += '</div>';
		
		$("#subcomment-content-" + subcommentNo).html(a);
		
	
	});
	
	// 서브 댓글 수정
	function subcommentUpdateProc(subcommentNo){
	   var commentContent = $('#submodify-content').val();
	   console.log(commentContent);

	    $.ajax({
	        url : '/subupdate.hta',
	        type : 'post',
	        data : {content : commentContent, subcommentNo : subcommentNo},
	        success : function(data){
	        	console.log("재시작------------")
	        	reload();
	        }
	    });
	}
		
	// 댓글 삭제
	$("[id^=commentList]").on('click', '[id^=trash]',function(event) {
		event.preventDefault();
		var commentNo = $(this).data('comment-no');
		
		$.ajax({
			url : '/delete.hta',
			type : 'post',
			data : {commentNo : commentNo},
			success : function(data) {
				console.log("삭제 완료")
				reload();
			}
		});
		
	})
	
	// 서브댓글 삭제
	$(document).on('click', '[id^="sub-trash"]', function(event) {
		event.preventDefault();
		
		var subcommentNo = $(this).data('subcomment-no');
		console.log(subcommentNo);
		
		alert("서브답글이 삭제됨.");
		
			$.ajax({
				url : '/deleteSub.hta',
				type : 'post',
				data : {subcommentNo : subcommentNo},
				success : function(data) {
					console.log("서브댓글삭제 완료")
					reload();
				}
			});
	})
	
	
	
</script>

</body>
</html>
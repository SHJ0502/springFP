<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>최근 본 동영상</title>
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
<style type="text/css">
#toast {
    position: fixed;
    bottom: 30px;
    left: 10%;
    padding: 15px 20px;
    transform: translate(-50%, 10px);
    border-radius: 10px;
    overflow: hidden;
    font-size: .8rem;
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
</style>
</head>
<%@ include file="../common/topnav.jsp"%>
<%@ include file="../common/sidenav.jsp"%>
<body style="background-color: rgb(249, 249, 249);">
<div id="toast"></div>
	<div class="container-fluid" style="margin-left: 270px;" id="page">
		<c:choose>
			<c:when test="${not empty recentlist }">
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<div class="row" style="padding-top: 20px;">
								<h4>시청 기록</h4>
							</div>
							<div class="row" style="padding-top: 10px;">
								<h4>오늘</h4>
								<div class='row' id='recent-today'>																	
								</div>
								<h4>어제</h4>
								<div class="row" id="recent-yesterday">
								</div>
								<h4>1주일 전</h4>
								<div class="row" id="recent-week">
								</div>
								<h4>1달 전</h4>								
								<div class="row" id="recent-month">
								</div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-2"></div>
						<div class="col-sm-8" style="top: 300px; text-align: center;">
							<h1>최근 본 동영상이 존재하지 않습니다.</h3>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>	
		<!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog modal-sm">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">저장하기</h4>
		        </div>
		        <div class="modal-body" id="modal-list">		          
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" id="new-play-list" style="display: block;">+ 새 재생목록 만들기</button>
		          <div id="create-play-list" style="display: none;">
		          	<div>
						<label>재생목록 이름</label>
						<input type="textbox" id="text-box" value="" /><br>
					</div>
					<div>
						<button type="button" class="btn btn-info" id="create-Play">만들기</button>
					</div>		
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>	
	</div>
<script type="text/javascript">
let removeToast; 
	function toast(string) {
	    const toast = document.getElementById("toast");
	
	    toast.classList.contains("reveal") ?
	        (clearTimeout(removeToast), removeToast = setTimeout(function () {
	            document.getElementById("toast").classList.remove("reveal")
	        }, 2000)) :
	        removeToast = setTimeout(function () {
	            document.getElementById("toast").classList.remove("reveal")
	        }, 2000)
	    toast.classList.add("reveal"),
	        toast.innerText = string
	} 
		
	//재생목록
	function modalList() {
		var videoNo = $("#myModal").val();
		$.ajax({
			type:"get",
			url: "/allplaylist.hta",
			data: {videono : videoNo},
			dataType: "json",
			success: function(result) {
				var row = "";
				console.log(result);
				var playList = result.playlist;
				var playListNo = result.playlistno;				
				$.each(playList, function(index, item) {
					row += "<div>";
					row += "<input type='checkbox' value='"+item.no+"' /> &nbsp&nbsp"+item.title+"";
					row += "</div>";
				});
				$("#modal-list").empty();
				$("#modal-list").append(row);
				$.each(playListNo, function(index, item) {					
					$(":checkbox[value="+item+"]").prop("checked", true);
				});
				 
			},
			error: function() {
				toast("에러 발생");
			}
		});
	} 
	
	//+새 재생목록 만들기 클릭
	$("#new-play-list").click(function() {
		$(this).css("display", "none");
		$("#create-play-list").css("display", "block");
	})
	
	//만들기 클릭
	$("#create-Play").click(function() {
		var title = $("#text-box").val();
		if(title != null) {
			$.ajax({
				type: "get",
				url: "/addplaylist.hta",
				data: {title : title},
				dataType: "json",
				success: function(result) {
					$("#modal-list").empty();
					modalList()
					toast("재생목록을 생성하였습니다.");
				},
				error: function() {
					alert("에러 발생");
				}
			});
			$("#create-play-list").css("display", "none");
			$("#new-play-list").css("display", "block");
			
		} else {
			alert("생성할 재생목록의 제목을 적어주세요");
		}
		
	})
	
	//모달창에 체크박스 여부
$("#modal-list").on("change", ':checkbox', function() {	
	var videoNo = $("#myModal").val();
	var playListVideoNo = $(this).val();
	
	$.ajax({
		type: "GET",
		url: "/adddelplaylistvideo.hta",
		data: {videono : videoNo, playlistvideono : playListVideoNo},
		dataType: "json",
		success: function(data) {
			if(data.work == "save") {
				toast("해당 동영상이 재생목록에 추가되었습니다.");
			} else if(data.work == "del") {
				toast("해당 동영상이 재생목록에서 삭제되었습니다.");
			}
		},
		error: function() {
			toast("에러 발생");	
		}		
	});	
})
	
	//오늘 최근 본 동영상 리스트
	function todayList() {
		$.ajax({
			type: "get",
			url: "/box/newlist.hta",
			dataType: "json",
			success: function(result) {								
				var row = "";
				
				$.each(result.todays, function(index, item) {
					row += "<div class='col-sm-12'>";	
					row += "<div class='col-sm-4'>"	;
					row += "<a href='/detail.hta?videono="+item.videoNo+"' style='color: black; text-decoration: none;'>";
					row += "<img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"' style='width: 246px; height: 138px;' />";		
					row += "</a>";
					row += "</div>";
					row += "<div class='col-sm-6'>";
					row += "<p style='font-size: 20px;'>"+item.videoTitle+"</p>";
					row += "<p><a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo+"' style='color: black; text-decoration: none;''>"+item.channelTitle+"</a> ・ 조회수 "+item.videoViews+"</p>";
					row += "<p>"+item.videoContents+"</p>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='#' id='del-recent-today' data-delrecent-videono-today='"+item.videoNo+"'><span class='glyphicon glyphicon-remove' style='color: black;'></span></a>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='#' type='button' id='play-list-add-today' data-toggle='modal' data-target='#myModal' data-playlistadd-videono-today='"+item.videoNo+"'><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";
					row += "</div>";								
					row += "</div>";
				});
				$("#recent-today").empty();
				$("#recent-today").append(row);
			},
			error: function() {
				
			}
		});
	}
	todayList();
	
	//오늘재생목록클릭시 모달창 뜨기
	$("#recent-today").on("click", "a[id^=play-list-add-today]", function() {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("playlistadd-videono-today");
		$("#myModal").val(videoNo);
		modalList();
		$("#myModal").modal("show");
	})

	
	//오늘 최근 본 동영상에서 삭제
	$("#recent-today").on("click", "a[id^=del-recent-today]", function(event) {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("delrecent-videono-today");
		console.log(videoNo);
		console.log(videoNo);
		$.ajax({
			type: "get",
			url: "/box/delrecent.hta",
			data: {videono : videoNo},
			dataType: "text",
			success: function(result) {
				console.log(result);
				if(result == "delrecent") {
					todayList();
					toast("최근 본 동영상에서 삭제되었습니다.");
				}
			},
			error: function() {
				toast("에러발생");
			}
		});
	})
	
	//어제 최근 본동영상 리스트
	function yesterList() {
		$.ajax({
			type: "get",
			url: "/box/newlist.hta",
			dataType: "json",
			success: function(result) {								
				var row = "";
				
				$.each(result.yesterdays, function(index, item) {
					row += "<div class='col-sm-12'>";	
					row += "<div class='col-sm-4'>"	;
					row += "<a href='/detail.hta?videono="+item.videoNo+"' style='color: black; text-decoration: none;'>";
					row += "<img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"' style='width: 246px; height: 138px;' />";		
					row += "</a>";
					row += "</div>";
					row += "<div class='col-sm-6'>";
					row += "<p style='font-size: 20px;'>"+item.videoTitle+"</p>";
					row += "<p><a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo+"' style='color: black; text-decoration: none;''>"+item.channelTitle+"</a> ・ 조회수 "+item.videoViews+"</p>";
					row += "<p>"+item.videoContents+"</p>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='' id='del-recent-yesterday' data-delrecent-videono-yesterday='"+item.videoNo+"'><span class='glyphicon glyphicon-remove' style='color: black;'></span></a>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='' id='play-list-add-yesterday' data-playlistadd-videono-yesterday='"+item.videoNo+"'><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";
					row += "</div>";								
					row += "</div>";
				});
				$("#recent-yesterday").empty();
				$("#recent-yesterday").append(row);
			},
			error: function() {
				
			}
		});
	}
	yesterList();
	
	//어제 최근에 본 동영상 삭제
	$("#recent-yesterday").on("click", "a[id^=del-recent-yesterday]", function(event) {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("delrecent-videono-yesterday");
		console.log(videoNo);
		$.ajax({
			type: "get",
			url: "/box/delrecent.hta",
			data: {videono : videoNo},
			dataType: "text",
			success: function(result) {
				console.log(result);
				if(result == "delrecent") {
					yesterdayList();
					toast("최근 본 동영상에서 삭제되었습니다.");
				}
			},
			error: function() {
				toast("에러발생");
			}
		});
	})
	
	//어제재생목록클릭시 모달창 뜨기
	$("#recent-yesterday").on("click", "a[id^=play-list-add-yesterday]", function() {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("playlistadd-videono-yesterday");
		$("#myModal").val(videoNo);
		modalList();
		$("#myModal").modal("show");
	})
	
	//이번주 최근 본 동영상 리스트
	function weekList() {
		$.ajax({
			type: "get",
			url: "/box/newlist.hta",
			dataType: "json",
			success: function(result) {								
				var row = "";
				
				$.each(result.weeks, function(index, item) {
					row += "<div class='col-sm-12'>";	
					row += "<div class='col-sm-4'>"	;
					row += "<a href='/detail.hta?videono="+item.videoNo+"' style='color: black; text-decoration: none;'>";
					row += "<img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"' style='width: 246px; height: 138px;' />";		
					row += "</a>";
					row += "</div>";
					row += "<div class='col-sm-6'>";
					row += "<p style='font-size: 20px;'>"+item.videoTitle+"</p>";
					row += "<p><a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo+"' style='color: black; text-decoration: none;''>"+item.channelTitle+"</a> ・ 조회수 "+item.videoViews+"</p>";
					row += "<p>"+item.videoContents+"</p>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='' id='del-recent-week' data-delrecent-videono-week='"+item.videoNo+"'><span class='glyphicon glyphicon-remove' style='color: black;'></span></a>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='' id='play-list-add-week' data-playlistadd-videono-week='"+item.videoNo+"'><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";
					row += "</div>";								
					row += "</div>";
				});
				$("#recent-week").empty();
				$("#recent-week").append(row);
			},
			error: function() {
				
			}
		});
	}
	weekList();
	
	//이번주 최근에 본 동영상 삭제
	$("#recent-week").on("click", "a[id^=del-recent-week]", function(event) {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("delrecent-videono-week");
		console.log(videoNo);
		$.ajax({
			type: "get",
			url: "/box/delrecent.hta",
			data: {videono : videoNo},
			dataType: "text",
			success: function(result) {
				console.log(result);
				if(result == "delrecent") {
					weekList();
					toast("최근 본 동영상에서 삭제되었습니다.");
				}
			},
			error: function() {
				toast("에러발생");
			}
		});
	})
	
	//이번 주재생목록클릭시 모달창 뜨기
	$("#recent-week").on("click", "a[id^=play-list-add-week]", function() {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("playlistadd-videono-week");
		$("#myModal").val(videoNo);
		modalList();
		$("#myModal").modal("show");
	})
	
	//이번달 최근 본 동영상 리스트
	function monthList() {
		$.ajax({
			type: "get",
			url: "/box/newlist.hta",
			dataType: "json",
			success: function(result) {								
				var row = "";
				
				$.each(result.months, function(index, item) {
					row += "<div class='col-sm-12'>";	
					row += "<div class='col-sm-4'>"	;
					row += "<a href='/detail.hta?videono="+item.videoNo+"' style='color: black; text-decoration: none;'>";
					row += "<img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"' style='width: 246px; height: 138px;' />";		
					row += "</a>";
					row += "</div>";
					row += "<div class='col-sm-6'>";
					row += "<p style='font-size: 20px;'>"+item.videoTitle+"</p>";
					row += "<p><a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo+"' style='color: black; text-decoration: none;''>"+item.channelTitle+"</a> ・ 조회수 "+item.videoViews+"</p>";
					row += "<p>"+item.videoContents+"</p>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='' id='del-recent-month' data-delrecent-videono-month='"+item.videoNo+"'><span class='glyphicon glyphicon-remove' style='color: black;'></span></a>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<a href='' id='play-list-add-month' data-playlistadd-videono-month='"+item.videoNo+"'><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";
					row += "</div>";								
					row += "</div>";
				});
				$("#recent-month").empty();
				$("#recent-month").append(row);
			},
			error: function() {
				
			}
		});
	}
	monthList();
	
	//이번달 최근에 본 동영상 삭제
	$("#recent-month").on("click", "a[id^=del-recent-month]", function(event) {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("delrecent-videono-month");
		console.log(videoNo);
		$.ajax({
			type: "get",
			url: "/box/delrecent.hta",
			data: {videono : videoNo},
			dataType: "text",
			success: function(result) {
				console.log(result);
				if(result == "delrecent") {
					monthList();
					toast("최근 본 동영상에서 삭제되었습니다.");
				}
			},
			error: function() {
				toast("에러발생");
			}
		});
	})
	
	//이번달재생목록클릭시 모달창 뜨기
	$("#recent-month").on("click", "a[id^=play-list-add-month]", function() {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("playlistadd-videono-month");
		$("#myModal").val(videoNo);
		modalList();
		$("#myModal").modal("show");
	})
</script>
</body>
</html>
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
<body style=" background-color: rgb(249, 249, 249);">
	<%@ include file="../common/sidenav.jsp"%>
<div id="toast"></div>
<div class="container-fluid" style="margin-left: 270px;" id="page">
		<c:choose>
		<c:when test="${not empty plv }">
			<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-3" style="position: fixed;">
						<div class="row">
							<img alt="" src="">
						</div>
						<div class="row">
							<a href="" id="first-img-link"><img class="thumbnail" src="" id="first-image" style="width: 450px; height: 280px;" /></a>							
						</div>
						<div class="row">
							<div class="col-sm-12" style="padding-left: 0px;">
								<div class="col-sm-10" id="list-title" style="padding-left: 0px;">
									
								</div>
								<div class="col-sm-2" id="update-title-tool">
									<a href="" style="color: black;" id="update-title"><span class="glyphicon glyphicon-pencil"></span></a>
								</div>
							</div>
							<div class="col-sm-12" id="update-form" style="display:none;">
								<input type="text" id="update-text" style="width: 420px;margin-bottom: 10px;" />
								<br>
								<div class="col-sm-7"></div>
								<div class="col-sm-3">
									<a href="" id="update-cancel" style="color: black;text-decoration: none;">취소</a>
								</div>
								<div class="col-sm-2">
									<a href="" id="update-submit" style="color: blue;text-decoration: none;">저장</a>
								</div>
							</div>					
						</div>
						<div class="row" style="margin-bottom: 5px; margin-right: 20px;">
							<div id="count-plv">
								
							</div>
						</div>
						<div class="row" style="border-bottom: solid silver 1px; padding-bottom: 3px; color: black;">
							<a href="" class="dropdown-toggle" data-toggle='dropdown'><span class="glyphicon glyphicon-option-horizontal" style="color: black;"></span></a>
							<ul class='dropdown-menu'>										
								<li><a href="/delplaylist.hta?playlistno=${playListNo }">재생목록 삭제</a></li>
							</ul>										
						</div>
					</div>					
					<div class="col-sm-9" style="left: 500px;">
						<div class="row" style="background-color: rgb(230, 230, 230); height: 100%;">
							<div class="row">
								<div class="col-sm-12" style="margin-left: 10px; margin-top: 20px;">
									<div class="col-sm-5">
										<form action="/playlistvideolist.hta" method="post" class="well">
											<select id="sort-combo" class="form-control" >
												<option value="videocreateresent" selected="selected">추가된 날짜(최신순)</option>
												<option value="videocreateold">추가된 날짜(오래된 순)</option>
												<option value="view">조회수순</option>
												<option value="latecreateresent">게시된 날짜(최신순)</option>
												<option value="latecreateold">게시된 날짜(오래된순)</option>
											</select>
										</form>
									</div>							
								</div>
							</div>
							<div id="div-list" data-playlist-no="${playListNo }">
									
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-2"></div>
					<div class="col-sm-8" style="top: 300px; text-align: center;">
						<h1>재생목록에 동영상이 존재하지 않습니다.</h3>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
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
	//재생목록 처음비디오 리스트
		var playlistNo = $("#div-list").data("playlist-no");
	function list() {
		$.getJSON("/startplvlist.hta", {playlistno : playlistNo}, function(result) {
			var row = "";
			
			if (result.length == 0) {
				
			} else {
				
				var firstItem = result[0];		
				$("#first-image").attr("src", "/resources/images/thumbnail/"+firstItem.videoImage+"");
				$("#first-img-link").attr("href", "/detail.hta?videono="+firstItem.videoNo+"")
				
				$.each(result, function(index, item) {
					row += "<div class='col-sm-12' style='padding-top: 10px; border-bottom: solid silver 1px;'>";
					row += "<a href='' style='text-decoration: none; color: black; width: 150px;'>";
					row += "<div class='col-sm-1' style='width:50px; top: 25px;'>";	
					row += "<p>"+(index+1)+"</p>";
					row += "</div>";
					row += "<div class='col-sm-2'>";
					row += "<a href='/detail.hta?videono="+item.videoNo +"'><img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"'";	
					row += "style='width: 120px; height: 68px;' /></a>";		
					row += "</div>";
					row += "<div class='col-sm-7'>";
					row += "<div class='row'>";
					row += "<p>"+item.videoTitle +"</p>";	
					row += "</div>";
					row += "<div class='row'>";
					row += "<a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo +"' style='color: black;text-decoration: none;'>"+item.channelTitle +"</a>";	
					row += "</div>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<div id='after-list-"+item.videoNo +"'>";
					row += "<a type='button' class='btn btn-right dropdown-toggle' data-toggle='dropdown' href=''><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";				
					row += "<ul class='dropdown-menu dropdown-menu-right' style='width: 200px;' >";											
					row += "<li><a href='' id='del-plv-"+item.videoNo+"' data-del-plv-video-no='"+item.videoNo+"'>재생목록에서 삭제</a></li>";						
					row += "</ul>";			
					row += "</div>";		
					row += "</div>";	
					row += "</a>";	
					row += "</div>";	
				})
				$("#div-list").empty();
				$("#div-list").append(row);			
			}		
		});
	}
	list();
	 	 	
	 	
	//재생목록 안에 특정 비디오 파일만 삭제
	$("#div-list").on("click", "[id^='del-plv']", function(event) {
		
		event.preventDefault();
		var videoNo = $(this).data("del-plv-video-no");
		$.ajax({
			url: "/delPlaylistVideo.hta",
			type: "get",
			data: {videono : videoNo, playlistno : playlistNo},
			dataType:"text",
			success: function(result) {
				if(result == "delsuccess") {
					list();
					toast("재생목록에서 해당 동영상이 삭제되었습니다.");
				}
			},
			error: function() {
				toast("에러 발생");
			}
		})
	})
	 	
	//플레이리스트 제목출력
	function playlistTitle() {
	
		$.ajax({
			url: "/playlisttitle.hta",
			type: "get",
			data: {playlistno : playlistNo},
			dataType: "text",
			success: function(result) {
				
				row = "<h3 style='margin-top: 0px;'>"+result+"</h3>";
				$("#list-title").empty();
				$("#list-title").append(row);
			},
			error: function() {
				
			}
		})
	}	
	playlistTitle();
	
	//제목 변경
	$("#update-title").click(function(event) {
		event.preventDefault();
		$(this).css("display", "none");
		$("#update-form").css("display", "block");
	})
	
	//제목 변경 저장
	$("#update-submit").click(function() {
		event.preventDefault();
		$("#update-form").css("display", "none");
		$("#update-title").css("display", "block");
		
		$.ajax({
			type: "get",
			url: "/updatePlaylist.hta",
			data: {playlistno : playlistNo, title : $("#update-text").val()},
			dataType: "text",
			success: function(result) {
			
				if(result == "updatecomplete") {
					playlistTitle();
					toast("재생목록의 제목이 변경되었습니다.");
					
				}
			},
			error: function() {
				toast("변경 중 에러발생");
			}
		})
	})	
	
	//제목 변경 취소
	$("#update-cancel").click(function() {
		event.preventDefault();
		$("#update-form").css("display", "none");
		$("#update-title").css("display", "block");
	})
	
	$("#sort-combo").change(function() {
		
		$.ajax({
			type: "post",
			url: "/playlistvideolistsort.hta",
			data: {playlistno : playlistNo, sort : $(this).val()},
			dataType: "json",
			success: function(result) {
				
				var row = "";
				
				var firstItem = result.plvlist[0];		
				$("#first-image").attr("src", "/resources/images/thumbnail/"+firstItem.videoImage+"");
				$("#first-img-link").attr("href", "/detail.hta?videono="+firstItem.videoNo+"");
				
				$.each(result.plvlist, function(index, item) {
					row += "<div class='col-sm-12' style='padding-top: 10px; border-bottom: solid silver 1px;'>";
					row += "<a href='' style='text-decoration: none; color: black; width: 150px;'>";
					row += "<div class='col-sm-1' style='width:50px; top: 25px;'>";	
					row += "<p>"+(index+1)+"</p>";
					row += "</div>";
					row += "<div class='col-sm-2'>";
					row += "<a href='/detail.hta?videono="+item.videoNo +"'><img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"'";	
					row += "style='width: 120px; height: 68px;' /></a>";		
					row += "</div>";
					row += "<div class='col-sm-7'>";
					row += "<div class='row'>";
					row += "<p>"+item.videoTitle +"</p>";	
					row += "</div>";
					row += "<div class='row'>";
					row += "<a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo +"' style='color: black;text-decoration: none;'>"+item.channelTitle +"</a>";	
					row += "</div>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "</div>";
					row += "<div class='col-sm-1'>";
					row += "<div id='after-list-"+item.videoNo +"'>";
					row += "<a type='button' class='btn btn-right dropdown-toggle' data-toggle='dropdown' href='' style='color: black;'><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";				
					row += "<ul class='dropdown-menu dropdown-menu-right' style='width: 200px;' >";			
					row += "<li><a href='' id='save-play-list' data-play-video-no='"+item.videoNo+"'>재생목록에 저장</a></li>";				
					row += "<li><a href='' id='del-after' data-del-after-video-no='"+item.videoNo+"'>나중에볼동영상에서 삭제</a></li>";				
					row += "<li><a href=''>맨 위로 이동</a></li>";				
					row += "<li><a href=''>맨 아래로 이동</a></li>";			
					row += "</ul>";			
					row += "</div>";		
					row += "</div>";	
					row += "</a>";	
					row += "</div>";	
				})
				$("#div-list").empty();
				$("#div-list").append(row); 
			},
			error: function() {
				
			}
		});
	})	
	
	function countplv() {
		$.ajax({
			type:"get",
			url:"/countplv.hta",
			data: {playlistno : playlistNo},
			dataType:"text",
			success: function(result) {				
				var row = "";
				row += "<p>동영상 "+result+"개</p>";
				$("#count-plv").append(row);
			},
			error: function() {
				
			}
		});	
	}
	countplv()
</script>
</body>
</html>
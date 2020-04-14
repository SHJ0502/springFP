<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
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
	<%@ include file="common/topnav.jsp"%>
<body style=" background-color: rgb(249, 249, 249);">
	<%@ include file="common/sidenav.jsp"%>
<div id="toast"></div>
	<div class="container-fluid" style="margin-left: 270px;" id="page">
		<div class="row">
			<div style="padding-left: 25px;">
				<h4>맞춤동영상</h4>
			</div>
			<div class="col-sm-12" id="home-videoes">
				
			</div>
		</div>
	</div>
<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">저장하기</h4>
	        </div>
	        <div class="modal-body" id="div-modal">	        	
	        </div>
	        <div class="modal-footer">
				<div class="create-box" style="display: none;">										
						<div>
							<label>재생목록 이름</label>
							<input type="textbox" id="text-box" value="" /><br>
						</div>
						<div>
							<button type="button" class="btn btn-info" id="create-Play">만들기</button>
						</div>									
				</div>
				<div class="create-btn" style="display: block;">
					<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 새 재생목록 만들기</button>
				</div>
	        </div>
	      </div>
	    </div>
	  </div>
</body>
<script type="text/javascript">
let removeToast; 

var n = 1;

$(window).scroll(function() {
	var documentHeight = $(document).height();
	var windowHeight = $(window).height();
	var scrollTop = $(window).scrollTop();
	
	if (documentHeight < windowHeight + scrollTop + 100) {
		n++;
		homeList();
	}
}); 


function homeList() {	
	
	var isLogined = '${not empty LU ? "Y" : "N"}';
	var Begin = (16*n)-15;	
	var End = 16*n;
	$.ajax({
		type: "get",
		url: "/homelist.hta",
		data: {begin : Begin, end : End},
		dataType: "json",
		success: function(result) {
			var row = "";
			$.each(result, function(index, item) {
				row += "<div class='col-sm-3' style='height:385px;'>";					                                    												
				row += "<a href='/detail.hta?videono="+item.videoNo+"'";	
				row += "id='video-thumbnail-"+item.videoNo+"'><img class='thumbnail'";
				row += "src='/resources/images/thumbnail/"+item.image+"' style='width: 368px; height: 210px; margin-top: 20px;'>";			
				row += "<button id='after-add-"+item.videoNo+"' type='button' data-video-no='"+item.videoNo+"' data-login-required='"+isLogined+"' style='position: absolute; z-index: 1; left: 335px; bottom: 325px; color: black; display: none;'><span class='glyphicon glyphicon-time'></span></button>";           							
				row += "<button id='playlist-add-"+item.videoNo+"' type='button' data-toggle='modal' data-target='#myModal' data-play-video-no='"+item.videoNo+"' data-play-login-required='"+isLogined+"' style='position: absolute; z-index: 1; left: 335px; bottom: 295px; color: black; display: none;'><span class='glyphicon glyphicon-align-justify'></span></button>";       							
				row += "</a>";       
				row += "<div class='row'>";		
				row += "<div class='col-sm-12'>";			
				row += "<div class='col-sm-2'>";			
				row += "<div class='row'>";				
				row += "<a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo+"'><img style='width: 40px; height: 40px; border-radius: 35px;' src='/resources/images/photo/"+ (item.userImagePath != null ? item.userImagePath : 'userbase.jpg') +"' /></a>";					
				row += "</div>";				
				row += "<div class='row'>";				
				row += "</div>";										
				row += "</div>";		
				row += "<div class='col-sm-8'>";		
				row += "<div class='row'>";			
				row += "<p>"+item.title+"</p>";				
				row += "</div>";			
				row += "<div class='row'>";		
				row += "<a href='/mychannel/mychannel_main.hta?channelno="+item.channelNo+"' style='color: black;text-decoration: none;'>"+item.channelTitle+"</a><br>";				
				row += "</div>";		
				row += "<div class='row'>";		
				row += "<p>조회수 "+item.views+"・"+item.beforeTime+"</p>";			
				row += "</div>";		
				row += "</div>";	
				row += "<div class='col-sm-1'>";		
				row += "</div>";	
				row += "<div class='col-sm-1'>";	
				row += "<div class='row'>";								
				row += "<a href='' class='dropdown-toggle' data-toggle='dropdown'><span class='glyphicon glyphicon-option-vertical' style='color: black;'></span></a>";																					
				row += "<ul class='dropdown-menu'>";					
				row += "<li><a href='#' id='after-"+item.videoNo+"' data-after-login-require='"+isLogined+"' data-after-videonos='"+item.videoNo+"'>나중에 볼 동영상 저장</a></li>";			
				row += "<li class='divider'></li>";			
				row += "<li><a href='#' id='playlist-"+item.videoNo+"' data-play-login-require='"+isLogined+"' data-play-videonos='"+item.videoNo+"'>재생목록에 저장</a></li>	";													 										
				row += "</ul>";		
				row += "</div>";	
				row += "</div>";	
				row += "<div class='row'>";											
				row += "</div>";	
				row += "</div>";	
				row += "</div>";							
				row += "</div>";	

			});
			
			$("#home-videoes").append(row);			
		},
		error: function() {
			toast("홈에러발생");	
		}
	});
}
homeList();

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

$("#home-videoes").on("click", "a[id^=after-]", function() {
	var videoNo = $(this).data("after-videonos");
	var logined = $(this).data("after-login-require");
	console.log("나중비디오번호 " + videoNo);
	console.log("나중로그인 여부 " + logined);
	if(logined == "Y") {
		saveAfter(videoNo);		
	} else if(logined == "N") {
		alert("로그인이 필요합니다.");
	}
	
})

$("#home-videoes").on("click", "a[id^=playlist-]", function() {
	var videoNo = $(this).data("play-videonos");
	var logined = $(this).data("play-login-require");
	console.log("재생목록비디오번호 " + videoNo);
	console.log("재생목록로그인 여부 " + logined);
	
	if(logined == "Y") {
		saveplay(videoNo);
	} else if(logined == "N") {
		alert("로그인이 필요합니다.");
	}
})

//나중에 볼 동영상으로 저장
 function saveAfter(videoNo) {	
	$.ajax({
		type:"GET",
		url:"/box/addafter.hta",
		data : {videono : videoNo},
		success: function(data) {
			toast("나중에 볼 동영상으로 저장되었습니다.");
		},
		error: function() {
			toast("에러발생");
		}
	});
}	 

//재생목록 저장 버튼 누를 시
function saveplay(videoNo) {	
	event.stopPropagation();
	event.preventDefault();
	$("#myModal").val(videoNo);
	allPlayList();
}

//썸네일 위 나중에볼동영상버튼 클릭 시
$("#home-videoes").on("click", "button[id^=after-add]", function() {
	event.stopPropagation();
	event.preventDefault();
	console.log($(this).data("video-no"));
	var videoNo = $(this).data("video-no");
	var loginedRequired = $(this).data("login-required");
	
	if (loginedRequired == 'N') {
		alert("로그인이 필요합니다.");
	} else if (loginedRequired == 'Y') {
		
		$.ajax({
			type:"GET",
			url:"/box/addafter.hta",
			data : {videono : videoNo},
			dataType : "text",
			success: function(result) {				
				if (result == "save") {
					toast("나중에볼동영상으로 저장되었습니다.");					
				} else if(result == "dup") {
					toast("나중에볼동영상에서 삭제되었습니다.");										
				}
			},
			error: function() {
				toast("생성에러발생");
			}
		});
	}
})

//썸네일에서 마우스가 나갈 때
$("#home-videoes").on("mouseleave", "a[id^='video-thumbnail-']", function() {
	$(this).find("button[id^=after-add]").css("display", "none");
	$(this).find("button[id^=playlist-add]").css("display", "none");
	
})

//썸네일에 마우스가 들어올 때
$("#home-videoes").on("mouseenter", "a[id^='video-thumbnail-']", function() {
	$(this).find("button[id^=after-add]").css("display", "block");
	$(this).find("button[id^=playlist-add]").css("display", "block");
	
})

//재생목록 만들 때
$("#create-Play").click(function() {
	var title = $("#text-box").val();
	
	$.ajax({
		type : "GET",
		url: "/addplaylist.hta",
		data: {title : title},
		dataType: "json",
		success: function(data) {
			$("#div-modal").empty();
			allPlayList();						
			toast("재생목록을 생성하였습니다.");
		},
		error:function() {
			toast("동일한 이름의 재생목록은 추가할 수 없습니다.");
		}
	});
	$(".create-box").css('display', 'none');
	$(".create-btn").css('display', 'block');
});


//썸네일 위 재생목록 모달띄우기 버튼 클릭 시
$("#home-videoes").on("click", "button[id^=playlist-add]", function() {
	event.stopPropagation();
	event.preventDefault();
	var logined = $(this).data("play-login-required");
	var VideoNo = $(this).data("play-video-no");
	if(logined == 'N') {
		alert("로그인이 필요합니다.");		
	} else if(logined == 'Y') {
		$("#myModal").val(VideoNo);
		allPlayList();
	}
});

//모달 재생목록리스트뿌려줌
function allPlayList() {		
	var videoNo = $("#myModal").val();
	$.getJSON("/allplaylist.hta", {videono : videoNo}, function(result) {			
		var row = "";
		var myPlayList = result.playlist;
		var playListNo = result.playlistno;
		
		$.each(myPlayList, function(index, item) {				
			row += "<div>";
			row += "<input type='checkbox' value='"+item.no+"' /> &nbsp&nbsp"+item.title+"";
			row += "</div>";
		})
		$("#div-modal").empty().append(row);
		$.each(playListNo, function(index, item) {
			$(":checkbox[value="+item+"]").prop("checked", true);
		})			
		$("#myModal").modal('show');
	})
}

//모달창에 체크박스 여부
$("#div-modal").on("change", ':checkbox', function() {	
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
	
//모달 새 재생목록 만들기 버튼 클릭
$(".create-btn").click(function() {
	$(this).css('display', 'none');
	$(".create-box").css('display', 'block');
});
	
</script>
</html>
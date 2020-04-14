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
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
  <style type="text/css">
  	#PLmade{
  		display:none;
  	}
  	#titleinput{
  		display: none;
  	}
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
<body>
<%@ include file="common/topnav.jsp" %>
<%@ include file="common/sidenav.jsp" %>
<div id="toast"></div>
<div class="container-fluid" id="test2">
	<div class="row">
		<div class="col-lg-12" style="width: 87%; margin-left: 13%;">
			<a href=""><img class="" alt="썸네일" src="/resources/img/youtubebanner.jpg" style="width: 100%; max-height: 269px;"></a>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12" style="width: 87%; max-height: 200px; margin-left: 13%; padding-right: 13%;">
			<div class="row" style="padding-top: 20px; padding-bottom: 20px;">
				<div class="col-lg-1">
				</div>
				<div class="col-lg-11">
					<div class="row">
						<div class="col-lg-1" style="width: 8%;">
							<img class="img-circle" src="/resources/img/channels4_profile.jpg" style="width: 80px;  min-height: 80px; ">
						</div>
						<div class="col-lg-2">
							<h3>음악</h3>
						</div>
						<div class="col-lg-6">
						</div>
						<div class="col-lg-3" align="right">
							<c:choose>
								<c:when test="${not empty LU }">
									<c:choose>
										<c:when test="${empty existsubscribe }">
											<button class="btn btn-danger" style="margin-top: 10%;display: block;" id="add-subscribe-btn" data-channel-no="${channel.no }">구독</button>
											<button class="btn btn-default" style="margin-top: 10%;display: none;" id="del-subscribe-btn" data-channel-no="${channel.no }">구독 중</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-danger" style="margin-top: 10%;display: none;" id="add-subscribe-btn" data-channel-no="${channel.no }">구독</button>
											<button class="btn btn-default" style="margin-top: 10%;display: block;" id="del-subscribe-btn" data-channel-no="${channel.no }">구독 중</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<button class="btn btn-danger" style="margin-top: 10%;display: block;" id="no-logined-subscribe-btn">구독</button>																	
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12" style="width: 87%; margin-left: 13%;">
		<div class="w3-row" style="margin-left: 133px">
    		<a href="javascript:void(0)" onclick="openCity(event, 'London');">
    		  <div class="w3-third tablink w3-bottombar w3-border-grey w3-padding" style="width: 104px; display:inline-block;" align="center" >
			  홈
			  </div>
    		</a>
    		<a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
    		  <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"  style="width: 104px; display:inline-block;" align="center">
    		  커뮤니티
    		  </div>
   			</a>
    		<a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
     		 <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"  style="width: 104px; display:inline-block;" align="center">
     		 정보
     		 </div>
   			</a>
   			 <div id="London" class="w3-container list" style="display:block">
   			 	<div class="row">
   			 		<div class="col-lg-12" style="margin-top: 20px;">
				  	  <span>오늘의 핫리스트</span>
   			 		</div>
   			 	</div>
   			 	<!-- 영상 시작  -->
	   			 	<div class="row" v-for="(video, index) in videoListM"  @mouseenter="showByIndex = index" @mouseleave="showByIndex = index" style="margin-top: 20px; width: 210px; height:207px; max-width: 210px; max-height:207px; display: inline-block; margin-right: 10px; margin-left: 10px;">
	   			 		<a v-bind:href="'/detail.hta?videono='+video.videoNo" id="video-thumbnail" >
	   			 		<div class="row" style="width: 210px; height:207px; max-width: 210px; max-height:207px; margin-right: 10px; margin-left: 10px; position: relative;">
	   			 		 	<div class="wrapper">
	   			 				<img class="thumbnail" alt="썸네일" :src="'/resources/images/thumbnail/'+video.videoThumbnail" style="width: 210px; height:117.5px; margin-bottom: 5px; ">	
	   			 				<div class="bwrapper" style="display: none;" v-show="showByIndex === index">
		   			 				<button class="fa fa-clock-o" style="transform:translate(-50%,-50%);top:12%; left:85%; position: absolute; z-index: 1; background-color: rgba(0, 0, 0, 0.8); border: 0px; color: white; font-size: 20px;" @click="clikthumnailButton(video.no)"></button>
	   				 				<button class="fa fa-indent" id="mybtn" style="transform:translate(-50%,-50%);top:25%; left:85%; position: absolute; z-index: 1; background-color: rgba(0, 0, 0, 0.8); border: 0px; color: white; font-size: 20px;" @click="check(video.no)" ></button>
	   			 				</div>
	   			 		 	</div>
	   			 			<div class="row">
	   			 				<div class="col-sm-12">
			   			 			<span style="overflow: auto; font-size: 14px; "><strong>{{video.videoTitle}}</strong></span>
	   			 				</div>
	   			 			</div>
	   			 			<div class="row">
	   			 				<div class="col-sm-12">
			   			 			<span style="overflow: auto; font-size: 13px;">{{video.channelTitle}}</span>
	   			 				</div>
	   			 			</div>
	   			 			<div class="row">
	   			 				<div class="col-sm-12">
			   			 			<span style="font-size: 13px;">조회수 : {{video.videoViews}}</span>
	   			 				</div>
	   			 			</div>
	   			 		</div>
	   			 		</a>
	   			 	</div>
   			 	<!-- 영상 div 끝 -->
   			 	
			 </div>
		
		  <div id="Paris" class="w3-container list" style="display:none">
		    <h2>커뮤니티</h2>
		    <p>아직 채널에서 아무 것도 게시하지 않았습니다.</p> 
		  </div>
		
		  <div id="Tokyo" class="w3-container list" style="display:none">
		    <h2>정보</h2>
		    <p>YouTube Music 채널을 방문하여 오늘의 인기 스타, 추천 아티스트, 재생목록을 찾아보세요. 구독하면 음악계의 최신 소식을 확인할 수 있습니다.
YouTube 동영상 검색 시스템에 의해 자동으로 생성된 채널입니다.</p>
		  </div>
		</div>
 		 </div>
		</div>
	</div>
		<div class="modal fade"  data-refresh="true" id="myModal" role="dialog" >
		    <div class="modal-dialog modal-sm">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">×</button>
		          <h4 class="modal-title">저장하기</h4>
		        </div>
		        <div class="modal-body">
		        	<div id="test">
		        		<div id="inserthtml" v-for="(title, index) in modaltitle">
		        			<label style="cursor:pointer;" v-bind:for="title.no"><input class="PLtitle" v-model="title.istrue"  type="checkbox" v-bind:value="title.no" v-bind:id="title.no" @click="insertPL(title.no)">{{title.title}}</label>
		        		</div>
		        	</div>
		        	<div id="inputDIV" style="display: none;">
		        		<hr style="margin:0px;">
		        		<p>제목입력</p>
			        			<input type="text" style="border: none" id="inputPL">
			        	<hr style="margin:0px;">
		        	</div>
		        </div>
		        <div class="modal-footer">
		        	<div  id="newPL">
			        	 <button type="button" class="btn btn-default" id="addPlaylist" onclick="clickaddPlayListButton();" >+ 새 재생목록 만들기</button>
		        	</div>
		        	 <a style='cursor: pointer;' id='PLmade'>만들기</a>
		        </div>
		      </div>
		    </div>
		  </div>
</body>
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

//비로그인 시 구독버튼 클릭시
$("#no-logined-subscribe-btn").click(function() {
	alert("로그인 후 사용가능합니다.");
})

//구독
$("#add-subscribe-btn").click(function() {	
	var channelNo = $(this).data("channel-no");
	
	$.ajax({
		type: "get",
		url: "/mychannel/addSubscribe.hta",
		data: {channelNo : channelNo},
		success: function() {
			$("#add-subscribe-btn").css("display", "none");
			$("#del-subscribe-btn").css("display", "block");
		},
		error: function() {
			toast("에러발생")
		}
	})
	
})

//구독 취소
$("#del-subscribe-btn").click(function() {
	var channelNo = $(this).data("channel-no");
	
	$.ajax({
		type: "get",
		url: "/mychannel/cancelSubscribe.hta",
		data: {channelNo : channelNo},
		success: function() {
			$("#del-subscribe-btn").css("display", "none");
			$("#add-subscribe-btn").css("display", "block");
		},
		error: function() {
			toast("에러발생")
		}
	})
})

var videoList = new Vue ({
		el:"#London",
		data:{
			userNo:0,
			videoListM:[],
			titles:[],
			showByIndex:null,
		},
		methods:{
			clikthumnailButton :function(no) {
				event.stopPropagation();
				event.preventDefault();
					 $.ajax({
						type:"GET",			// 요청방식
						url: "../mychannel/addWatchLate.hta",	// 요청URL
						data: {no:no},		// 서버로 전달되는 요청파라미터
						dataType: "text",		// 예상되는 서버의 응답데이터 타입,
						success: function(result) {
							
							if(result == -1){
								alert("로그인을 해주세요");
							}else if(result == 1){
								toast("저장 되었습니다.");
								//onchange addclass 로 변경
							}else if(result == 2){
								toast("삭제 되었습니다.");
							}
						},
						error: function() {
							// 요청이 실패했을 실행할 코드
							console.log("실패");
						}
					}); 
			},
			check: function(no) {
				event.stopPropagation();
				event.preventDefault();
				videoNo = no;
				
				$.getJSON("/getPlayList.hta", {videoNo: no}).done(function(result) {
					$("#myModal").modal('show');
						modaltitleList.modaltitle = result.playList;
						modaltitleList.selectedPlayListNo = result.playListNo;
					}).fail(function() {
						alert("로그인 해주세요.");
					});
				}
		}
	})

	var videoNo;
	var modaltitleList = new Vue({
		el:"#myModal",
		data:{
			selectedPlayListNo:[],
			modaltitle:[]
		},
		methods:{
			insertPL: function(no) {
				if($("#"+no).prop("checked")){
					$.getJSON("/addPlayListVideo.hta",{plNo:no, videono:videoNo}, function(result) {
						toast("저장되었습니다.");
						console.log("성공");
					})
				}else if($("#"+no).prop("checked") != true){
					$.getJSON("/removePlayListVideo.hta",{plNo:no, videono:videoNo}, function(result) {
						toast("삭제되었습니다.");
						console.log("성공");
					})
				}
			},
		}
	});
	
$(document).ready(function() {
		$('#myModal').on('hidden.bs.modal', function () {
			$("#addPlaylist").show();
			$("#PLmade").hide();
			$("#inputDIV").hide();
		});
		
		$("#PLmade").click(function() {
			var text = $("#inputPL").val();
			
			if(text == ""){
				alert("재생목록의 제목을 입력해주세요");
				return;
			}
			
			$.getJSON("/addPlayList.hta", {text:text}, function(result) {
				modaltitleList.modaltitle.push(result);
			}); 
		});
	});

	function clickaddPlayList(no) {
		event.stopPropagation();
		event.preventDefault();
		console.log(no);
		
		$("#myModal").modal('show');
		
	}
function clickaddPlayListButton() {
	$("#addPlaylist").hide();
	$("#PLmade").show();
	$("#inputDIV").show();
}

$('#myModal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    $("#inputPL").val("");
});


function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("list");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace("w3-border-grey", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-grey";
}

$.getJSON("/mychannel/getAllVideoList1.hta", function(result) {
	videoList.videoListM = result;
});
</script>
</html>
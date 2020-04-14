<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>업로드페이지</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

/* Variables */


/* Radio Button */
label {
	cursor: pointer;
	font-weight: 400;
}

.btn-check {
	width: 30px;
	height: 30px;
	position: absolute;
	border-radius: 50%;
	transition: transform .6s cubic-bezier(0.68, -0.55, 0.27, 1.55);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

/* Reset */
input#one ~ .btn-check {
	transform: translate(-50px, -25px);
	background-color: #white;
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35)
}

input#two ~ .btn-check {
	transform: translate(-50px, -101px);
	background-color: #2196F3;
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

/* Reset2 */
input#one2 ~ .btn-check {
	transform: translate(-50px, 33px);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35)
}

input#two2 ~ .btn-check {
	transform: translate(-50px, -101px);
	background-color: #2196F3;
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

input#three2 ~ .btn-check {
	transform: translate(-50px, -30px);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

input#fo2 ~ .btn-check {
	transform: translate(-50px, -230px);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

/* Radio Input #1 */
input#one:checked ~ .btn-check {
	transform: translate(-50px, 33px);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}	

input#two:checked ~ .btn-check {
	transform: translate(-50px, -25px);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

/* Radio Input #2  */

/* 드래그앤드롭 파일버튼 CSS */
#file-upload-form .form-control {
	height: 257px;
	outline: 1px dashed #ccc;
	outline-offset: -15px;
	background-color: #eee;
}

#file-upload-form .form-control:before {
	content: "\f093";
	font: normal normal normal 14px/1 FontAwesome;
	font-size: 3em;
	left: 0;
	right: 0;
	display: block;
	margin: 20px auto;
	text-align: center;
}

#file-upload-form .form-control:after {
	content: attr(data-message);
	left: 0;
	right: 0;
	bottom: 0;
	text-align: center;
	display: block;
}

#file-upload-form .form-control input[type="file"] {
	cursor: pointer;
	opacity: 0;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
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

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 500;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	border: 1px solid #23a3a7;
	background: #23a3a7;
	color: #fff;
}

.video-delete:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: red;
	transform: translateY(-7px);
}
</style>
</head>
<%@ include file="../common/topnav.jsp" %>
<%@ include file="../common/sidenav.jsp" %>
<body>
<div id="toast"></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<div class="col-sm-3">
					<h2>채널 동영상</h2>
				</div>
				<div class="col-sm-4" style="margin-top: 13px; margin-left: -100px;">
					<div class="wrap" style="height: 100%; display: flex; align-items: center; justify-content: center;">
						<button id="video-del-btn" class="video-delete" style="width: 140px; height: 45px; font-family: 'Roboto', sans-serif; 
							font-size: 16px; text-transform: uppercase; letter-spacing: 2.5px; font-weight: 500; color: red; background-color: whitesmoke;
								border: none; border-radius: 45px; box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1); cursor: pointer; outline: none; transition: all 0.3s ease 0s;">선택삭제</button>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-danger btn-lg pull-right" data-toggle="modal" data-target="#myModal2">동영상 추가하기</button>

				<!-- Modal -->
				<div id="myModal2" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">
						<input type="hidden" name="video-no" id="video-no" value="">
						<!-- Modal content-->
						<form id="uploadForm" enctype="multipart/form-data" method="POST" action="videoUpload.hta">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">동영상 업로드</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-sm-7">
											<div class="form-group">
												<label for="video-title">영상제목</label> <input type="text" class="form-control" id="video-title" placeholder="영상 제목을 입력하세요." name="video-title">
											</div>
											<div class="form-group">
												<label for="video-content">영상 설명</label>
												<textarea rows="10" cols="10" class="form-control" id="video-content" placeholder="영상 설명을 입력하세요" name="video-content"></textarea>
											</div>
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<label for="video-private">영상공개여부</label>
														<div class="row">
															<ul
																style="list-style-type: none; padding-left: 50px; margin: 0">
																<li style="display: block; position: relative; padding: 20px; 0px;">
																	<input type="radio" name="video-private" id="one" value="Y" checked style="visibility: hidden;" /> 
																	<label for="one">공개</label>
																	<div class="btn-check"></div>
																</li>
																<li style="display: block; position: relative; padding: 20px; 0px;">
																	<input type="radio" name="video-private" value="N" id="two" style="visibility: hidden;" /> 
																	<label for="two">비공개</label>
																	<div class="btn-check"></div>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="video-grade">영상등급</label>
														<div class="row" id="video-grade">
															<ul style="list-style-type: none; padding-left: 50px; margin: 0; position: relative;">
																<li style="display: block; padding: 20px; 0px;">
																	<input type="radio" name="video-grade" id="one2" value="N" checked="checked" style="visibility: hidden; position: absolute;" /> 
																	<label for="one2" id="first">일반</label>
																	<div class="btn-check first"></div>
																</li>
																<li style="display: block; padding: 20px; 0px;">
																	<input type="radio" name="video-grade" value="K" id="two2" style="visibility: hidden; position: absolute;" />
																	<label for="two2" id="second">키즈</label>
																	<div class="btn-check second"></div>
																</li>
																<li style="display: block; padding: 20px; 0px;">
																	<input type="radio" name="video-grade" value="A" id="three2" style="visibility: hidden; position: absolute;" />
																	<label for="three2" id="third">성인</label>
																	<div class="btn-check third"></div>
																	<div class="btn-check"></div>
																</li>
																<li style="display: block; padding: 20px; 0px;">
																	<input type="radio" name="" value="" id="fo2" style="visibility: hidden;" />
																	<div class="btn-check fo"></div>
																	<div class="btn-check"></div>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="video-category">카테고리</label> 
												<select id="video-category">
													<option selected="selected">--- 카테고리를 선택해주세요 ---</option>
													<option value="1">음악</option>
													<option value="2">스포츠</option>
													<option value="3">게임</option>
													<option value="4">영화</option>
												</select>

											</div>
											<div class="form-group">
												<label for="video-thumbnail">Thumbnail 사진</label> <input type="file" class="form-control" id="video-thumbnail" name="video-thumbnail">
											</div>
											<div class="form-group">
												<label for="video-tag">영상해시태그</label> <input type="text" class="form-control" id="video-tag" placeholder="태그를 입력하세요." name="video-tag">
											</div>
											<button type="button" class="btn btn-primary pull-right" id="video-submit">등록</button>
										</div>
										<div class="col-sm-5">
											<div class="form-group file-upload" style="margin: 30px; align-items: center; text-align: center;" id="file-upload-form">
												<label class="cols-sm-2 control-label" for="document_file">이곳에 영상을 올려주세요</label><br>
												<div class="cols-sm-10">
													<div class="row">
														<div class="input-group">
															<span class="input-group-addon"><i class="fa fa-file" aria-hidden="true"></i></span>
															<div class="form-control" data-message="드래그 앤 드롭을 하거나, 클릭해주세요.">
																<input required="required" title="Click to select file or drag n drop it here" type="file" id="document_file">
															</div>
														</div>
													</div>
													<div class="row" style="margin-top: 70px;">
														<div id="player">
															<video tabindex="-1" class="video-stream html5-main-video" style="width: 100%; max-width: 100%; height: 300px;" src="#" controlslist="nodownload" controls autoplay muted id="player-preview"></video>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="video_checkAll" onclick="checkAll();" /></th>
					<th style="width: 600px;">동영상</th>
					<th>조회수</th>
					<th>영상등급</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody id="video-upload-view" >
				<c:forEach var="videoVideoPath" items="${videoVideoPathInfo }">
						<tr id="tr-row-video-${videoVideoPath.videoNo }">
							<td class="center"><input type="checkbox" name="checkRow" id="checked-video-no-${videoVideoPath.videoNo }" value="${videoVideoPath.videoNo }" data-video-no="${videoVideoPath.videoNo }"/></td>
							<td>
								<div class="col-sm-2">
									<a id="video-detail" data-video-no="${videoVideoPath.videoNo }">
										<img class="tunmbnail" src="../resources/images/thumbnail/${videoVideoPath.videoThumbnail }" style="width: 120px; height: 68px;" id="video_img" data-video-no="${videoVideoPath.videoNo }" >
									</a>
								</div>
								<div class="col-sm-4" id="video_set_btn" style="margin-left: 100px;">
									<div class="row">
										<span style="font-weight: bold;">${videoVideoPath.videoTitle }</span>
									</div>
									<div class="row" style="height: 38px; overflow: hidden;">
										<span>${videoVideoPath.videoContents }</span>
									</div>
								</div>
							</td>
							<td>${videoVideoPath.videoViews }</td>
							<c:choose>
								<c:when test="${videoVideoPath.videoGrade eq 'N' }">
									<td>일반</td>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${videoVideoPath.videoGrade eq 'A' }">
											<td>성인</td>
										</c:when>
										<c:otherwise>
											<td>키즈</td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatDate value="${videoVideoPath.videoCreateDate }"/> ・(${videoVideoPath.beforeTime })</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	
	<!-- 동영상 수정폼 -->
	<div id="myModal-video-modify" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">동영상 수정</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-7">
							<h2>세부정보</h2>
							<form action="/action_page.php">
								<input type="hidden" id="video-modify-no" value="" />
								<div class="form-group">
									<label for="video-modify-title">제목</label> <input type="text" class="form-control" id="video-modify-title" placeholder="${videoVideoPath.videoTitle }" >
								</div>
								<div class="form-group">
									<label for="video-modify-contents">영상 설명</label>
									<textarea rows="10" cols="10" class="form-control" id="video-modify-contents" placeholder="${videoVideoPath.videoContents }"></textarea>
								</div>
							</form>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="box-radio-input">
											<input type="radio" name="video-modify-public" value="Y" checked="checked"><span>공개</span>
										</label>
										<label class="box-radio-input">
											<input type="radio" name="video-modify-public" value="N"><span>비공개</span>
										</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="box-radio-input">
											<input type="radio" name="video-modify-grade" value="N" checked="checked"><span>일반</span>
										</label>
										<label class="box-radio-input">
											<input type="radio" name="video-modify-grade" value="K"><span>키즈</span>
										</label>
										<label class="box-radio-input">
											<input type="radio" name="video-modify-grade" value="A" ><span>성인</span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-5">
							<div id="player">
								<video tabindex="-1" class="video-stream html5-main-video" style="width: 100%; max-width: 100%; height: 450px;" src="../resources/videos/${videoVideoPath.videoPath }" controlslist="nodownload" controls autoplay muted id="video-modify-path"></video>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary pull-left" id="video-modify-submit">변경</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">

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


	/* 체크박스 전체선택, 전체해제 */
	function checkAll() {
		if ($("#video_checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}


	var no;
	$(document).ready(function() {

		$("#myModal2").on('shown.bs.modal',function() {
				$("#first").click(function() {
					$("#one2").attr("checked",true);
					$("#two2").attr("checked",false);
					$("#three2").attr("checked",false);
					
					temp = [parseInt($("input#two2 ~ .btn-check").css("transform").split(',')[4]),
						parseInt($("input#two2 ~ .btn-check").css("transform").split(',')[5]) ];
							console.log(temp);
							no = 1;
							check(no);
							
				})
					
					$("#second").click(function() {
							$("#two2").attr("checked",true);
							$("#one2").attr("checked",false);
							$("#three2").attr("checked",false);
							
							temp = [parseInt($("input#two2 ~ .btn-check").css("transform").split(',')[4]),
							
								parseInt($("input#two2 ~ .btn-check").css("transform").split(',')[5]) ];
								console.log(temp);
								no = 2;
								check(no);
								
					})
					
							$("#third").click(function() {$("#three2").attr("checked",true);
							$("#one2").attr("checked",false);
							$("#two2").attr("checked",false);
									
							
							temp = [parseInt($("input#two2 ~ .btn-check").css("transform").split(',')[4]),
							
								parseInt($("input#two2 ~ .btn-check").css("transform").split(',')[5]) ];
								console.log(temp);
								no = 3;
								check(no, temp);
								
							})
							
		})

		
		$('#myModal2').modal('show')
		
	});

	function check(no, temp) {

		if (no == 1) {
			
			$("input#two2 ~ .btn-check").css("transform", 'translate(-50px,-101px)');
			var temp1 = [ "-50px", "-101px" ];
			return temp1;

		} else if (no == 2) {
			
			$("input#two2 ~ .btn-check").css("transform",'translate(-50px, -33px)');

			var temp2 = [ "-50px", "-33px" ];
			return temp2;
			
		} else if (no == 3) {
			$("input#two2 ~ .btn-check").css("transform",'translate(-50px, 37px)');

			var temp2 = [ "-50px", "37px" ];
			return temp2;
		}

	};

	//드래그앤드롭 input동시 파일업로드 스크립트

	$('input[type="file"]').on('change', function(e) {
		var fileName = e.target.files[0].name;
		if (fileName) {
			$(e.target).parent().attr('data-message', fileName);
		}
	});

	$(document).on('drag dragstart dragend dragover dragenter dragleave drop',
			function(e) {
				if ($('input[type="file"]').length) {
					if ([ 'dragover', 'dragenter' ].indexOf(e.type) > -1) {
						if (window.dragTimeout)
							clearTimeout(window.dragTimeout);
						$('body').addClass('dragged');
					} else if ([ 'dragleave', 'drop' ].indexOf(e.type) > -1) {
						window.dragTimeout = setTimeout(function() {
							$('body').removeClass('dragged');
						}, 100);
					}
				}
			});

	$('#video-submit').click(
			function() {
				if (confirm("등록 하시겠습니까?")) {
					// 등록할 파일 리스트를 formData로 데이터 입력

					var formData = new FormData();

					formData.append('videoTitle', $('#video-title').val());
					formData.append('videoContent', $('#video-content').val());
					formData.append('videoStatus',$(":radio[name=video-private]:checked").val());
					formData.append('videoGrade', $(":radio[name=video-grade]:checked").val());
					formData.append('videoCategory', $('#video-category').val());
					formData.append('videoThumbnail',$('#video-thumbnail')[0].files[0]);
					formData.append('videoTag', $('#video-tag').val());
					formData.append('videoFile',$('#document_file')[0].files[0]);

					$.ajax({
						url : "/mychannel/videoUpload.hta",
						data : formData,
						type : 'POST',
						enctype : 'multipart/form-data',
						processData : false,
						contentType : false,
						dataType : 'json',
						cache : false,
						success : function(result) {
							
							var item = result.videoVideoPathInfo;
							
							
							 var row = '';
							
							 row += '<tr>';
							 row += '<td class="center"><input type="checkbox" name="checkRow" id="checked-video-no-'+item.videoNo+'" value="'+item.videoNo+'" data-video-no="'+item.videoNo+'" /></td>';
							 row += '<td>';
							 row += '<div class="col-sm-2">';
							 row += '<a id="video-detail-'+item.videoNo+'" data-video-no='+item.videoNo+'>';
							 row += '<img class="tunmbnail" src="../resources/images/thumbnail/'+item.videoThumbnail+'" style="width: 120px; height: 68px;" id="video_img">';
							 row += '</a>';
							 row += '</div>';
							 row += '<div class="col-sm-4" id="video_set_btn" style="margin-left: 100px;">';
							 row += '<div class="row">';
							 row += '<span style="font-weight: bold;">'+item.videoTitle+'</span>';
							 row += '</div>';
							 row += '<div class="row" style="height: 38px; overflow: hidden;">';
							 row += '<span>'+item.videoContents+'</span>';
							 row += '</div>';
							 row += '</div>';
							 row += '</td>';
							 row += '<td>'+item.videoViews+'</td>';
							 
							 if (item.videoGrade == 'N') {
								 row += '<td>일반</td>';
							 } else if (item.videoGrade == 'A'){
								 row += '<td>성인</td>';
							 } else {
								 row += '<td>키즈</td>';
							 }
							 row += '<td>'+item.formatDate+' ・('+item.beforeTime+')</td>';
							 row += '</tr>';
							
							 $("#video-upload-view").prepend(row);
							
							$("#myModal2").modal('hide');

							 toast("동영상 등록완료");



						},
						error : function(result) {
							alert("다시 작성해주세요.");
						}
					});
				}

			});

	$(document).ready(function() {
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#player-preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#document_file").change(function() {
			readURL(this);
		});
	});
	
	
	/* 동영상 수정 */
	
	// 동영상 수정 폼 호출
	$("[id^=video-upload-view]").on('click', "a[id^='video-detail']", function() {
			var videoNo = $(this).data("video-no");
			console.log(videoNo);
			$.ajax({
				url : '/mychannel/getVideoInfoByVideoNo.hta',
				type : 'get',
				data:{videoNo:videoNo},
				success:function(item) {
					console.log(item);
					$("#video-modify-no").val(item.videoNo);
					$("#video-modify-title").val(item.videoTitle);
					$("#video-modify-contents").val(item.videoContents);
					$("#video-modify-path").attr("src", "../resources/videos/"+item.videoPath+"");
					$(":radio[name='video-modify-grade'][value='"+item.videoGrade+"']").prop('checked', true);
					$(":radio[name='video-modify-public'][value='"+item.videoPublic+"']").prop('checked', true);
					
					$("#myModal-video-modify").modal('show');
				}
			});
		});
	
	// 동영상 수정하기 기능
	$("#myModal-video-modify").on('click', '[id^=video-modify-submit]', function(e) {
		e.preventDefault();
		var videoNo			= $("#video-modify-no").val();
		var videoTitle		= $("#video-modify-title").val();
		var videoContents	= $("#video-modify-contents").val();
		var videoGrade		= $(":radio[name=video-modify-grade]:checked").val();
		var videoPublic		= $(":radio[name=video-modify-public]:checked").val();
		
		$.ajax({
			url : '/mychannel/videoUploadModify.hta',
			type : 'get',
			data : {videoNo : videoNo, 
					videoTitle : videoTitle,
					videoContent : videoContents, 
					videoGrade : videoGrade, 
					videoStatus : videoPublic},
			success : function(result) {
				
				var item = result.videoVideoPathInfo;
				
				var row = '';
				
				 row += '<td class="center"><input type="checkbox" name="checkRow" id="checked-video-no-'+item.videoNo+'" value="'+item.videoNo+'" data-video-no="'+item.videoNo+'"/></td>';
				 row += '<td>';
				 row += '<div class="col-sm-2">';
				 row += '<a id="video-detail-'+item.videoNo+'" data-video-no='+item.videoNo+'>';
				 row += '<img class="tunmbnail" src="../resources/images/thumbnail/'+item.videoThumbnail+'" style="width: 120px; height: 68px;" id="video_img">';
				 row += '</a>';
				 row += '</div>';
				 row += '<div class="col-sm-4" id="video_set_btn" style="margin-left: 100px;">';
				 row += '<div class="row">';
				 row += '<span style="font-weight: bold;">'+item.videoTitle+'</span>';
				 row += '</div>';
				 row += '<div class="row" style="height: 38px; overflow: hidden;">';
				 row += '<span>'+item.videoContents+'</span>';
				 row += '</div>';
				 row += '</div>';
				 row += '</td>';
				 row += '<td>'+item.videoViews+'</td>';
				 
				 if (item.videoGrade == 'N') {
					 row += '<td>일반</td>';
				 } else if (item.videoGrade == 'A'){
					 row += '<td>성인</td>';
				 } else {
					 row += '<td>키즈</td>';
				 }
				 row += '<td>'+item.formatDate+' ・('+item.beforeTime+')</td>';
				 
				
				 $("#tr-row-video-" +item.videoNo).empty();
				 $("#tr-row-video-" +item.videoNo).html(row);
				 
				toast("동영상 수정완료.");

				$("#myModal-video-modify").modal('hide');

						
			},
			error : function() {
				alert("다시 작성해주세요(ajax-error)");
			}
			
		});
	});
	
	
	// 전체,선택삭제.
	$("#video-del-btn").on('click', function(e) {
		e.preventDefault();
		
		var confirmVal = confirm("정말 삭제합니까?");
		
		if(confirmVal) {
			var videoNoList = new Array();
			
			$(":checkbox[id^='checked-video-no']:checked").each(function() {
				videoNoList.push($(this).attr("data-video-no"));	
			});
			
			$.ajax({
				
				url :'/mychannel/videoDel.hta',
				type : 'post',
				data : {videoNoCheck : videoNoList},
				success : function(result) {
					if(result == 1) {
						for (var i = 0; i<videoNoList.length; i++) {
							 location.reload();
						}
						
						toast("삭제완료");
					} else {
						toast("삭제실패");
					}
						
				},
				error : function() {
					alert("삭제할 파일이 없습니다.");
				}
				
			});
			
		}
		
	});
</script>
</html>
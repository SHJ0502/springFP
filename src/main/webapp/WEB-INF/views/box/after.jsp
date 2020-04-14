<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>나중에 볼 동영상</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	 <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
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
<body style=" background-color: rgb(249, 249, 249);">
<div id="toast"></div>
<div class="container-fluid" style="margin-left: 270px;" id="page">
	<c:choose>
		<c:when test="${not empty al }">
			<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-3" style="position: fixed;">
						<div class="row">
							<img alt="" src="">
						</div>
						<div class="row">
							<a href="" id="first-img-link"><img class="thumbnail" src="" id="first-image" style="width: 450px; height: 280px;" /></a>
							<h3>나중에 볼 동영상</h3>
						</div>
						<div class="row" style="margin-bottom: 5px; margin-right: 20px;">
							<div id="count-after">
								
							</div>
						</div>
						<div class="row"
							style="border-bottom: solid silver 1px; padding-bottom: 3px;">
							<a href=""><span
								class="glyphicon glyphicon-option-horizontal" style="color: black;"></span></a>
						</div>
					</div>					
					<div class="col-sm-9" style="left: 500px;">
						<div class="row" style="background-color: rgb(230, 230, 230); height: 100%;">
							<div class="row">
								<div class="col-sm-12" style="margin-left: 10px; margin-top: 20px;">
									<div class="col-sm-5">
										<form action="/box/aftersort.hta" method="post" class="well">
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
							<div id="div-list">																
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
						<h1>나중에 볼 동영상이 존재하지 않습니다.</h3>
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

//재생목록에 추가
$("#div-list").on("click", "#save-play-list", function() {
	var videoNo = $(this).data("play-video-no");
	
})


//나중에 볼 동영상에서 삭제
$("#div-list").on("click", "#del-after", function() {
	
	event.preventDefault();
	var videoNo = $(this).data("del-after-video-no");
	
	$.ajax({
		type: "get",
		url: "/box/delAfter.hta",
		data : {videono : videoNo},
		dataType : "text",
		success: function(result) {
			if(result == "success") {
				list();
				toast("나중에볼 동영상이 삭제되었습니다.");
			} 
		},
		error: function() {
			toast("에러 발생");
		}
	});
})


//목록 추가
function list() {
	$.getJSON("/box/listafter.hta", function(result) {
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
				row += "<li><a href='' id='del-after' data-del-after-video-no='"+item.videoNo+"'>나중에볼동영상에서 삭제</a></li>";											
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

//나중에볼 동영상 총 개수
function countAfter() {
	
	$.ajax({
		type:"get",
		url:"/box/countafter.hta",
		dataType:"text",
		success: function(result) {
			
			var row = "";
			row += "<p>동영상 "+result+"개</p>";
			$("#count-after").append(row);
		},
		error: function() {
			
		}
	});	
}
countAfter();

//정렬
$("#sort-combo").change(function() {
	
	$.ajax({
		type:"post",
		url:"/box/aftersort.hta",
		data: {sort : $(this).val() },
		dataType:"json",
		success: function(result) {
			
			var row = "";
			
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
				row += "<li><a href='' id='del-after' data-del-after-video-no='"+item.videoNo+"'>나중에볼동영상에서 삭제</a></li>";							
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
			alert("에러");
		}
		
	});
}) 
</script>
</body>
</html>
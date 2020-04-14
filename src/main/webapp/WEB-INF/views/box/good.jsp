<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>좋아요 표시한 동영상</title>
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
   			<c:when test="${not empty gl }">
   				<div class="row">
			         <div class="col-sm-12">
			            <div class="row">
			               <div class="col-sm-3" style="position: fixed;">
			                  <div class="row">
			                     <img alt="" src="">
			                  </div>
			                  <div class="row">
			                     <a href="" id="first-link"><img class="thumbnail" id="first-image" src="" style="width: 460px; height: 250px;"></a>
			                     <h3>좋아요 표시한 동영상</h3>
			                  </div>
			                  <div class="row" style="margin-bottom: 5px;">
			                     <div id="count-good">
			                     
			                     </div>
			                  </div>
			                  <div class="row"
			                     style="border-bottom: solid silver 1px; padding-bottom: 3px;">
			                     <a href=""><span
			                        class="glyphicon glyphicon-option-horizontal"></span></a>
			                  </div>
			               </div>
			               <div class="col-sm-9" style="left: 500px; background-color: rgb(230, 230, 230);">
			                  <div class="row" id="good-list">                                                           
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
							<h1>좋아요 표시한 동영상이 존재하지 않습니다.</h3>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
   			</c:otherwise>
   		</c:choose>
      
   </div>
<script type="text/javascript">
let removeToast; 

	function listGood() {
		$.getJSON("/box/goodlist.hta", function(result) {
			var row = "";
			var firstItem = result[0];
			$("#first-image").attr("src", "/resources/images/thumbnail/"+firstItem.videoImage+"");
			$("#first-link").attr("href", "/detail.hta?videono="+firstItem.videoNo+"")
			
			if(result.length == 0) {
				
			} else {
			
				$.each(result, function(index, item) {
					row += "<div class='col-sm-12' id='list-id-"+item.videoNo+"' style='border-bottom: solid silver 1px; padding-top: 10px;'>"
					row += "<div class='col-sm-1' style='top: 25px; left: 20px;'>"	
					row += "<p>"+(index+1)+"</p>"    
					row += "</div>"
					row += "<a href='/detail.hta?videono="+item.videoNo+"' style='color: black; text-decoration: none;'>"
					row += "<div class='col-sm-2'>"
					row += "<img class='thumbnail' src='/resources/images/thumbnail/"+item.videoImage+"' style='width: 120px; height: 68px;' />"		
					row += "</div>"    
					row += "<div class='col-sm-7'>"
					row += "<div class='row'>"
					row += "<p>"+item.videoTitle+"</p>"
					row += "</div>"
					row += "<div class='row'>"
					row += "<p>"+item.channelTitle+"</p>"
					row += "</div>"
					row += "<div class='row'>"
					row += "<p>"+item.videoviews+"</p>"
					row += "</div>"
					row += "</div>"
					row += "<div class='col-sm-2'>"
					row += "<div>"
					row += "<a type='button' id='del-good-"+item.videoNo+"' class='btn btn-right' data-video-no='"+item.videoNo+"' href='/box/updategood.hta?videono="+item.videoNo+"'><span class='glyphicon glyphicon-trash'></span></a>"
					row += "</div>"
					row += "</div>"
					row += "</a>"
					row += "</div>"
				});
				$("#good-list").append(row);
			}
			
		});
	}
	listGood();

	$("#good-list").on("click", "a[id^=del-good]", function(event) {
		event.stopPropagation();
		event.preventDefault();
		var videoNo = $(this).data("video-no");
			
		
		  $.ajax({
			type: "GET",
			url: "/box/updategood.hta",
			data: {videono : videoNo},
			dataType: "text",
			success: function(result) {				
					$("#good-list").empty();
					listGood();					
					$("#count-good").empty();
					countGood();
					toast("좋아요 표시한 동영상에서 삭제되었습니다.");					
				
			},
			error: function() {
				toast("에러발생");
			}
		});  
	})
	
	function countGood() {
		
		$.ajax({
			type: "get",
			url: "/box/countgood.hta",
			dataType: "text",
			success: function(result) {
				var row = "";
				row += "<p>동영상 "+result+"개</p>";
				$("#count-good").append(row);
			},
			error: function() {
				
			}
		})	
		
	}
	countGood();
	
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
</script>
</body>
</html>
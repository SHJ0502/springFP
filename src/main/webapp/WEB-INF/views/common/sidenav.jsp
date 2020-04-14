<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="layerpop" >
	  <div class="modal-dialog modal-sm" >
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">의견 보내기</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <div class="row">
	            	<div class="col-sm-12">
	            		제목 : <input type="text" style="width: 100%;" id="QNAtitle">
	            	</div>
	            </div>
	            <div class="row"  style="margin-top: 20px;">
	            	<div class="col-sm-12">
	            		<textarea rows="10" cols="27" id="QNAText"></textarea>
	            	</div>
	            </div>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="sendQNA()">보내기</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
    </div>
  </div>
</div>

 <div style="width: 13%; height: 100%; position: fixed; z-index: 1; overflow: auto;background-color: white; top: 50px;" id="basic-side">

	  <ul class="nav nav-pills nav-stacked" style="border-bottom: solid silver 1px; padding-bottom: 15px; margin-left: 13px;">
	    <li><a href="/home.hta" style="color: black;"><span class="glyphicon glyphicon-home" style="margin-right: 25px;"></span>홈</a></li>
	    <li><a href="/hot.hta?cateno=0" style="color: black;"><span class="glyphicon glyphicon-fire" style="margin-right: 25px;"></span>인기</a></li>
	    <c:choose>
	    	<c:when test="${empty LU }">
			    <li><a href="../user/login.hta" style="color: black;"><span class="glyphicon glyphicon-collapse-up" style="margin-right: 25px;"></span>구독</a></li>    
	    	</c:when>
	    	<c:otherwise>
			    <li><a href="/subscribe.hta" style="color: black;"><span class="glyphicon glyphicon-collapse-up" style="margin-right: 25px;"></span>구독</a></li>
			        
	    	</c:otherwise>
	    </c:choose>
	  </ul>
	  <ul class="nav nav-pills nav-stacked" style="border-bottom: solid silver 1px; padding-bottom: 15px; padding-top: 15px; margin-left: 13px;">
   		<c:if test="${empty LU }">
   			<li><a href="../user/login.hta" style="color: black;"><span class="glyphicon glyphicon-hdd" style="margin-right: 25px;"></span>보관함</a></li>
	    	<li><a href="../user/login.hta" style="color: black;"><span class="glyphicon glyphicon-time" style="margin-right: 25px;"></span>최근 본 동영상</a></li>
   		</c:if>
   		<c:if test="${not empty LU }">
		    <li><a href="../box/boxmain.hta" style="color: black;"><span class="glyphicon glyphicon-hdd" style="margin-right: 25px;"></span>보관함</a></li>
		    <li><a href="../box/new.hta" style="color: black;"><span class="glyphicon glyphicon-time" style="margin-right: 25px;"></span>최근 본 동영상</a></li>    
		    <li><a href="../box/after.hta" style="color: black;"><span class="glyphicon glyphicon-tags" style="margin-right: 25px;;"></span>나중에 볼 동영상</a></li>    
		    <li><a href="../box/good.hta" style="color: black;"><span class="glyphicon glyphicon-thumbs-up" style="margin-right: 25px;"></span>좋아요 표시한 동영상</a></li>    
		    <li><a href="#" id="open-play" style="color: black; display: block;"><span class="glyphicon glyphicon-menu-hamburger" style="margin-right: 25px;"></span>재생목록 <span class="glyphicon glyphicon-chevron-down"></</span></a></li>
		    <li><a href="#" id="close-play" style="color: black; display: none;"><span class="glyphicon glyphicon-menu-hamburger" style="margin-right: 25px;"></span>재생목록 <span class="glyphicon glyphicon-chevron-up"></</span></a></li>
		    <c:forEach var="play" items="${sideplay }" varStatus="loop">		    	
				<li class="play-list" style="display: none;"><a href="../box/playlist.hta?playlistno=${play.no }" style="color: black;"><span class="glyphicon glyphicon-expand"></span>${play.title }</a></li>		    	
		    </c:forEach>   
   		</c:if> 
		  </ul>	
		 <c:if test="${not empty LU }">
		  <ul class="nav nav-pills nav-stacked" style="border-bottom: solid silver 1px; padding-bottom: 15px; padding-top: 15px; margin-left: 13px;">
		    <li style="padding-left: 10px;">구독</li>
		    <c:forEach var="sub" items="${homesubscribe }" varStatus="loop">
		    	<c:choose>
		    		<c:when test="${loop.count le 5 }">
					    <li class="sub-item"><a href="../mychannel/mychannel_main.hta?channelno=${sub.channelNo }" style="color: black;"><img src="/resources/images/photo/${sub.imagePath != null ? sub.imagePath : 'userbase.jpg' }" style="width: 25px; height: 25px; border-radius: 25px;" }" /> &nbsp;&nbsp;&nbsp;&nbsp;${sub.channelTitle }</a></li>	
		    		</c:when>
		    		<c:otherwise>
					    <li class="sub-item" style="display: none;">
					    	<a href="../mychannel/mychannel_main.hta?channelno=${sub.channelNo }" style="color: black;">
					    		<img src="/resources/images/photo/${sub.imagePath != null ? sub.imagePath : 'userbase.jpg' }" style="width: 25px; height: 25px; border-radius: 25px;" /> &nbsp;&nbsp;&nbsp;&nbsp;${sub.channelTitle }	
					    	</a>
					    </li>	
		    		</c:otherwise>
				</c:choose>
		    </c:forEach>
		    <c:if test="${subsize > 5  }">
			    <li id="more-see"><a href="" style="color: black;"><span class="glyphicon glyphicon-menu-down"></span> ${subsize - 5 }개 더보기</a></li>
			    <li id="less-see"><a href="" style="color: black;"><span class="glyphicon glyphicon-menu-up" ></span> 간략히 보기</a></li>
		    </c:if>
		  </ul>  	
	  </c:if> 
	   		<c:if test="${empty LU }">
			  <ul class="nav nav-pills nav-stacked" style="border-bottom: solid silver 1px; padding-bottom: 15px; padding-top: 15px; margin-left: 13px;">	   
			    <li><p style="padding-left: 15px; padding-right: 15px;">로그인하면 동영상에 좋아요를 표시하고 댓글을 달거나 구독할 수 있습니다.</p></li>	    	    	    
			    <li><a href="../user/login.hta" style="color: black;"><span class="glyphicon glyphicon-user" style="margin-right: 2px;"></span>로그인</a></li>	    
			  </ul>  	
	   		</c:if>
			  <ul class="nav nav-pills nav-stacked" style="border-bottom: solid silver 1px; padding-bottom: 15px; padding-top: 15px; margin-left: 13px;">	   
			    <li><a href="/music_cate.hta" style="color: black;"><span class="fa fa-headphones" style="margin-right: 25px;"></span>음악</a></li>	    
			    <li><a href="/sport_cate.hta" style="color: black;"><span class="fa fa-dribbble" style="margin-right: 25px;"></span>스포츠</a></li>	    
			    <li><a href="/game_cate.hta" style="color: black;"><span class="fa fa-gamepad" style="margin-right: 25px;"></span>게임</a></li>	    
			    <li><a href="/movie_cate.hta" style="color: black;"><span class="glyphicon glyphicon-info-sign" style="margin-right: 25px;"></span>영화</a></li>	        
		 	 </ul>  	 	  
	  <ul class="nav nav-pills nav-stacked" style="border-bottom: solid silver 1px; padding-bottom: 15px; padding-top: 15px; margin-left: 13px;">	   	    
	    <li><a href="#" style="color: black;"  onclick="showModal()"><span class="glyphicon glyphicon-info-sign" style="margin-right: 25px;"></span>의견보내기</a></li>	    
	  </ul>  	
  </div>
  
  <div style="width: 4%; height: 100%; position: fixed; z-index: 1;" class="hide" id="hide-side">
  	<ul class="nav nav-pills nav-stacked">
    	<li>
    		<a href="/home.hta" style="text-align: center; color: black;"><span class="glyphicon glyphicon-home"></span>
    			<p>홈</p>
    		</a>    		
    	</li>    	
    	<li>
    		<a href="/hot.hta" style="text-align: center; color: black;"><span class="glyphicon glyphicon-fire"></span>
    			<p>인기</p>
    		</a>    		
    	  <c:if test="${not empty LU }">
	    	</li>
		    	<li>
		    		<a href="/subscribe.hta" style="text-align: center; color: black;"><span class="glyphicon glyphicon-collapse-up"></span>
		    			<p>구독</p>
		    		</a>    		
		    	</li>    	  	
	    	<li>
	    		<a href="../box/boxmain.hta" style="text-align: center; color: black;"><span class="glyphicon glyphicon-hdd"></span>
	    			<p>보관함</p>
	    		</a>
	    	</li>
    	  </c:if>  	
	    	</li>
		    	<li>
		    		<a href="../user/login.hta" style="text-align: center; color: black;"><span class="glyphicon glyphicon-collapse-up"></span>
		    			<p>구독</p>
		    		</a>    		
		    	</li>    	  	
	    	<li>
	    		<a href="../user/login.hta" style="text-align: center; color: black;"><span class="glyphicon glyphicon-hdd"></span>
	    			<p>보관함</p>
	    		</a>
	    	</li>
  	</ul>
  
<script type="text/javascript">
	$(document).ready(function(event) {
		$('#less-see').hide();
	})
	
	$("#open-play").click(function(event) {
		event.preventDefault();
		$(this).css("display", "none");
		$("#close-play").css("display", "block");
		$(".play-list:not(:visible)").show();
	})
	$("#close-play").click(function(event) {
		event.preventDefault();
		$(this).css("display", "none");
		$("#open-play").css("display", "block");
		$(".play-list").hide();
	})

	$("#more-see").click(function(event) {
		event.preventDefault();
		$(".sub-item:not(:visible)").show();
		$(this).hide()
		$("#less-see").show()
	});
	$("#less-see").click(function(event) {
		event.preventDefault();
		$(".sub-item:gt(4)").hide();		
		$(this).hide()
		$("#more-see").show()
	});
	function showModal() {
		$("#layerpop").modal('show');
	}
	function sendQNA() {
		var title = $("#QNAtitle").val();
		var text = $("#QNAText").val();
		$.getJSON("/insertQNA.hta", {title:title, textarea:text}, function(result) {
			if(result == -1){
				alert("로그인을 해주세요.")
			}
			
			if(result == 1){
				alert("문의를 보냈습니다. 문의하신 내용에 대한 답변은 입력하신 이메일로 보내드립니다.")
			}
			
			$("#QNAtitle").val("");
			$("#QNAText").val("");
		})
		
	}
</script>
  </div>
  
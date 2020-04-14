<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="adminmain.hta" class="logo"><b>YOU<span>TUNA</span></b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu" >
          <!-- settings start -->
          <!-- settings end -->
          <!-- inbox dropdown start-->
          <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" id="qnaToggle" class="dropdown-toggle" href="#" aria-haspopup="true" aria-expanded="false"  onclick="ffff()">
              <i class="fa fa-envelope-o"></i>
              <span class="badge bg-theme">{{dontCK}}</span>
              </a>
            <ul class="dropdown-menu extended inbox" aria-labelledby="header_inbox_bar">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">You have new messages</p>
              </li>
              <li v-for="(info, index) in mailinfo">
                <a :href="'mail_view.hta?mailNo='+info.no">
                  <span class="photo" v-if="info.image != null"><img alt="avatar" :src="'resources/images/photo/'+info.image"></span>
                  <span class="photo" v-else><img alt="avatar" src="resources/images/photo/userbase.jpg"></span>
                  <span class="subject">
                  <span class="from">{{info.userId}}</span>
                  </span>
                  <span class="message" style="overflow: hidden;">
                  {{info.title}}
                  </span>
                  </a>
              </li>
              <li>
                <a href="inbox.hta">See all messages</a>
              </li>
            </ul>
          </li>
          <!-- inbox dropdown end -->
          <!-- notification dropdown start-->
          <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" id="toggl" class="dropdown-toggle" href="#" aria-haspopup="true" aria-expanded="false" onclick="ddddd()">
              <i class="fa fa-bell-o"></i>
              <span class="badge bg-warning" id="BGCheck" style="display: none;">NEW</span>
              </a>
            <ul class="dropdown-menu extended notification"  aria-labelledby="header_notification_bar">
              <div class="notify-arrow notify-arrow-yellow"></div>
              <li>
                <p class="yellow">You have new notifications</p>
              </li>
              <li v-for="(item, index) in recentData">
                <div v-if="item.type === 'video'">
                <a href="#">
                  <span class="label label-warning" ><i class="fa fa-bell"></i></span>
                  {{item.userId}}님이 {{item.type}}을 업로드 했습니다.
                  </a>
                </div>
                <div v-else>
                <a href="#">
                  <span class="label label-warning" ><i class="fa fa-bell"></i></span>
                  {{item.userId}}님이 {{item.type}}을 입력했습니다.
                  </a>
                </div>
              </li>
              <li>
                <a href="recentactivity.hta">See all notifications</a>
              </li>
            </ul>
          </li>
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
      
      <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
      <script type="text/javascript">
      
   
      
      function ddddd() {
    		$("#toggl").dropdown();
    		$.getJSON("/getRecentFiveData.hta", {}, function(result) {
				recentCount.recentData = result;
				$("#BGCheck").hide();
			})
    	}
      
      var recentCount = new Vue({
    	  el:"#header_notification_bar",
    	  data:{
    		  recentData:[]
    	  }
      })
      
      function ffff() {
    	  $.getJSON("/getFourQna.hta", {}, function(result) {
			mailCount.mailinfo = result;
				
    		  console.log(result);
		})
		 $("#qnaToggle").dropdown();
	}
      
      var mailCount = new Vue({
    	  el:"#header_inbox_bar",
    	  data:{
    		  mailcount:[],
    		  mailinfo:[],
    		  dontCK:0
    	  },
    	  mounted(){
    		  $.getJSON("/getAllMail.hta", {}, function(result) {
    					
    				var j =0;
    				for(var i=0; i < result.length; i++){
    					if(result[i].isanswered == 'N'){
    						j++;
    					}
    				}
    					mailCount.dontCK = j;
    	    		  console.log(result);
    			})
    	  }
      });
      
      $(function() {
    		// 신청자 본인인지 확인하기 위한 변수
    		// isApplicant가 true이면 신청자 본인이다.
    		var isApplicant = false;

    		// 지정된 url에 해당하는 웹소켓 서버와 연결된 웹소켓객체 생성
    		var webSocket = new WebSocket("ws://www.youtuna.com/notice.hta");
    		
    		// 웹소켓객체의 onmessage이벤트는 웹소켓서버로부터 메세지를 수신했을 때 실행할 함수를 등록한다.
    		webSocket.onmessage = function(event) {
    			// event.data에 웹소켓에서 전달한 메세지가 들었다.
    			// event.data ---> 과목코드:신청자수
    			console.log(event);
    			var cate = event.data.split(':');
    			
    			if (cate[0] == 'QNA') {
    				mailCount.dontCK += 1;
    				console.log(mailCount.mailcount);
    			}else if(cate[0] == 'RECENT'){
    				console.log("dd");
    				$("#BGCheck").show();
    			}
    			
   			isApplicant = false;
    		}
      });
      </script>
    </header>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>관리자페이지</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link href="resources/css/style-responsive.css" rel="stylesheet">
  <script src="resources/lib/chart-master/Chart.js"></script>
   <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <style type="text/css">
  </style>
</head>
<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <!--header end-->
   <%@ include file="admin_header.jsp" %>
   <%@ include file="admin_sideBar.jsp" %>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content" >
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart" >
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>Total Views</h3>
		        <ul class="nav pull-right top-menu">
		          <li><button onclick="poi()">Poi</button></li>
		        </ul>
            </div>
		           <div style="width:auto">
		  			  <canvas id="myChart"></canvas>
					</div>
            <!--custom chart end-->
            <!-- /row -->
            <!-- /row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="main-chart">
						<h4>
							<i class="fa fa-angle-right"></i> UpLoad Count
						</h4>
					<div class="panel-body">
					<div style="width:auto">
		  			  <canvas id="myLineChart"></canvas>
					</div>
			</div>
		</div>
		</div>
							<!-- /col-md-4 -->
							<!--  PROFILE 02 PANEL -->
							<!-- /col-md-4 -->
						</div>
						<!-- /row -->
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <div class="col-lg-3 ds" id="recentAc">
            <!--new earning end-->
            <!-- RECENT ACTIVITIES SECTION -->
            <h4 class="centered mt">최근 활동</h4>
            <div align="right">
            <a href="recentactivity.hta" style="color: black;">>더보기</a>
            </div>
            <!-- First Activity -->
            <div class="desc" v-for="(data, index) in recentDataList">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details">
                <p>
                  Just Now
                  <br/>
                  <div v-if="data.type === 'video'">
                  <a href="#" >{{data.userId}}</a>님이 {{data.type}}를 업로드 하였습니다.<br/>
                  </div>
                  <div v-else>
                  <a href="#" >{{data.userId}}</a>님이 {{data.type}} 를 입력하였습니다.<br/>
                  </div>
                </p>
              </div>
            </div>
            <!-- USERS ONLINE SECTION -->
            <!-- CALENDAR-->
            <div id="calendar" class="mb">
              <div class="panel green-panel no-margin">
                <div class="panel-body">
                  <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                    <div class="arrow"></div>
                    <h3 class="popover-title" style="disadding: none;"></h3>
                    <div id="date-popover-content" class="popover-content"></div>
                  </div>
                  <div id="my-calendar"></div>
                </div>
              </div>
            </div>
            <!-- / calendar -->
          </div>
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!--main content end-->
 <%@ include file="admin_footer.jsp" %>
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/lib/jquery/jquery.min.js"></script>
  <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.sparkline.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="resources/lib/raphael/raphael.min.js"></script>
  <script src="resources/lib/morris/morris.min.js"></script>
  <script src="resources/lib/common-scripts.js"></script>
  <!--common script for all pages-->
  <script src="resources/lib/common-scripts.js"></script>
  <script type="text/javascript" src="resources/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="resources/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="resources/lib/zabuto_calendar.js"></script>
  
   
<!-- 
  <script type="text/javascript">
    $(document).ready(function() {
      var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Welcome to Dashio!',
        // (string | mandatory) the text inside the notification
        text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo.',
        // (string | optional) the image to display on the left
        image: 'resources/img/ui-sam.jpg',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 8000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });

      return false;
    });
  </script>
 -->

<script type="application/javascript">
function poi() {
	var dd = bargraph.views;
	$.getJSON("/poi.hta", {}, function(result) {
		console.log("dddd");
	})
}
$(function() {
	// 신청자 본인인지 확인하기 위한 변수
	// isApplicant가 true이면 신청자 본인이다.
	// 지정된 url에 해당하는 웹소켓 서버와 연결된 웹소켓객체 생성
	var webSocket1 = new WebSocket("ws://www.youtuna.com/notice.hta");
	
	// 웹소켓객체의 onmessage이벤트는 웹소켓서버로부터 메세지를 수신했을 때 실행할 함수를 등록한다.
	webSocket1.onmessage = function(event) {
		// event.data에 웹소켓에서 전달한 메세지가 들었다.
		// event.data ---> 과목코드:신청자수
		var cate = event.data.split(':');
		
		if(cate[0] == 'RECENT'){
			
		$.getJSON("/getRecentOneData.hta", {}, function(result) {
			recentData.recentDataList.unshift(result);
			recentData.recentDataList.pop();
			console.log(recentData.recentDataList);
		})
		}
	}
});


var myChart;
function createChart() {
var ctx = document.getElementById("myChart").getContext('2d');
   
   myChart = new Chart(ctx, {
       type: 'bar',
       data: {
           labels: [bargraph.views[0].viewsCreateDate, bargraph.views[1].viewsCreateDate, bargraph.views[2].viewsCreateDate, bargraph.views[3].viewsCreateDate, bargraph.views[4].viewsCreateDate, bargraph.views[5].viewsCreateDate , bargraph.views[6].viewsCreateDate],
           datasets: [{
               label: '#Views',
               data: [bargraph.views[0].count, bargraph.views[1].count,bargraph.views[2].count, bargraph.views[3].count, bargraph.views[4].count, bargraph.views[5].count, bargraph.views[6].count],
               backgroundColor: [
                   'rgba(255, 99, 132, 0.4)',
                   'rgba(54, 162, 235, 0.4)',
                   'rgba(255, 206, 86, 0.4)',
                   'rgba(75, 192, 192, 0.4)',
                   'rgba(153, 102, 255, 0.4)',
                   'rgba(255, 159, 64, 0.4)',
                   'rgba(10, 186, 181, 0.4)'
               ],
               borderColor: [
                   'rgba(255,99,132,1)',
                   'rgba(54, 162, 235, 1)',
                   'rgba(255, 206, 86, 1)',
                   'rgba(75, 192, 192, 1)',
                   'rgba(153, 102, 255, 1)',
                   'rgba(255, 159, 64, 1)',
                   'rgba(10, 186, 181, 1)'
               ],
               borderWidth: 1
           }]
       },
       options: {
           maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
           scales: {
               yAxes: [{
                   ticks: {
                       beginAtZero:true
                   }
               }]
           }
       }
   });
};



var bargraph = new Vue({
	el:"#myChart",
	data:{
		views:[]
	},
	mounted(){
		$.getJSON("/getToDayDate.hta", {}, function(result) {
		}).done(function(result){
			bargraph.views = result;
			createChart();
		});
	}
});

var linegraph = new Vue({
	el:"#myLineChart",
	data:{
		uploads:[]
	},
	mounted(){
		$.getJSON("/getToDayUpload.hta", {}, function(result) {
		}).done(function(result) {
			console.log(result);
			linegraph.uploads = result;
			createLineChart();
		})
	}
});

    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });
      
      $("#my-calendar").zabuto_calendar({
        action: function() {
          var date = myFunction(this.id,false);
          $.getJSON("/getDateToViews.hta",{date:date}, function(result) {
        	 
        	  bargraph.views = result;
        	  myChart.destroy();
        	  createChart();
			})
		   $.getJSON("/getDateToUpload.hta",{date:date}, function(result) {
			   linegraph.uploads = result;
			   LineChart.destroy();
			   createLineChart();
		})
        },
        action_nav: function() {
        	return myNavFunction(this.id);
        }
      });
    });

    function myNavFunction(id) {
    	var dd = this.id;
    	$("#dddd" + dd)
    	console.log(id);
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    };
    
    function myFunction(id) {
    	console.log(id);
    	
    	var to = $("#" + id).data("date"); 
    	
    	var thisid = id;
    	  
    	  return to;
    	  
    };
  
    var LineChart;
    function createLineChart() {
    	LineChart =  new Chart(document.getElementById("myLineChart"), {
            type: 'line',
            data: {
                labels: [linegraph.uploads[0].viewsCreateDate, linegraph.uploads[1].viewsCreateDate, linegraph.uploads[2].viewsCreateDate, linegraph.uploads[3].viewsCreateDate, linegraph.uploads[4].viewsCreateDate, linegraph.uploads[5].viewsCreateDate, linegraph.uploads[6].viewsCreateDate],
                datasets: [{
                    label: '날짜별 영상 업로드 수',
                    data: [linegraph.uploads[0].count,linegraph.uploads[1].count,linegraph.uploads[2].count,linegraph.uploads[3].count,linegraph.uploads[4].count,linegraph.uploads[5].count,linegraph.uploads[6].count],
                    borderColor: "rgba(255, 201, 14, 1)",
                    backgroundColor: "rgba(255, 201, 14, 0.5)",
                    fill: false,
                    lineTension: 0.1
                }]
            },
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: '날짜별 영상 업로드 현황'
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                        	beginAtZero:true
                        },
                        scaleLabel: {
                            display: true,
                        }
                    }]
                }
            }
        });
    };
    
    var recentData = new Vue({
    	el:"#recentAc",
    	data:{
    		recentDataList:[]
    	},
    	mounted(){
    		$.getJSON("/getRecentFiveData.hta", {}, function(result) {
    			console.log(result);
    			recentData.recentDataList = result;
			})
    	}
    });
    
  </script>
</body>
</html>
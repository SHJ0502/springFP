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
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
</head>
<body>

<section id="container">
   <%@ include file="admin_sideBar.jsp" %>
   <%@ include file="admin_header.jsp" %>
  <section id="main-content">
  	 <section class="wrapper">
  	 <div class="row">
  	 	<div class="col-md-12 mt">
                <h4><i class="fa fa-angle-right"></i> 영상 관리 </h4>
                <div class="row"  id="searchData">
			          <div class="col-md-10"></div>
			          <div class="col-md-1"><h5 align="right">Search :</h5></div>
			          <div class="col-md-1">
						 <input type="text" class="form-control" v-model="searchText" style="padding-left: 0px;">
					  </div>
      			</div>
                <hr>
        </div>
          <div class="col-md-12 mt">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Video_No</th>
                    <th>User_No</th>
                    <th>Video_Title</th>
                    <th>views</th>
                    <th>grade</th>
                    <th>Create_Date</th>
                  </tr>
                </thead>
                <tbody  id="videoList">
                  <tr v-for="(video, index) in videoDataList" @click="showUserDetailData(video.no)" style="cursor: pointer;">
                    <td>{{index+1}}</td>
                    <td>{{video.no}}</td>
                    <td>{{video.userNo}}</td>
                    <td>{{video.title}}</td>
                    <td>{{video.views}}</td>
                    <td>{{video.grade}}</td>
                    <td>{{video.createDate | currency}}</td>
                  </tr>
                </tbody>
              </table>
          </div>
          </div>
	  	 </section>
       </section>
       <div align="center">
       <paginate id="paginate" v-model="page" :page-count="totalPage" :page-range="3" :margin-pages="2" :click-handler="clickCallback" :prev-text="'Prev'" :next-text="'Next'" :container-class="'pagination'" :page-class="'page-item'"> </paginate>
  	 </div>
  	 <div class="modal fade"  data-refresh="true" id="myModal" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">×</button>
		          <h4 class="modal-title">영상 정보</h4>
		        </div>
		        <div class="modal-body">
		        	<!-- 모달 바디 -->
		   <div class="row content-panel">
              <div class="col-md-6 profile-text mt mb centered">
                <div class="right-divider hidden-sm hidden-xs">
               		<div id="player">
						<video tabindex="-1" class="video-stream html5-main-video" id="videoplayer" 
							style="width: 100%; max-width:100%; height: 450px; "
							:src="'../../resources/videos/'+VideoData.videoPath" controlslist="nodownload"
							controls autoplay muted>
						</video>
					</div>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-3 profile-text">
                <h3>{{VideoData.videoTitle}}</h3>
                <h6>{{VideoData.userNo}}</h6>
                <p>조회수 : {{VideoData.videoViews}}</p>
                <p>업드로 일 : {{VideoData.videoCreateDate | currency}}</p>
                <br>
              </div>
              <!-- /col-md-4 -->
              <!-- /col-md-4 -->
            </div>
              <div class="modal-footer">
		           <button type="button" class="btn btn-danger" @click="deleteVideo(VideoData.videoNo)">삭제</button>
              </div>
		        </div>
		    </div>
		  </div>
		  </div>
		  <%@ include file="admin_footer.jsp" %>
  </section>
	<script src="resources/lib/jquery/jquery.min.js"></script>
  <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="resources/lib/raphael/raphael.min.js"></script>
  <script src="resources/lib/morris/morris.min.js"></script>
  <!--common script for all pages-->
  <script src="resources/lib/common-scripts.js"></script>
  <script type="text/javascript" src="resources/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="resources/lib/gritter-conf.js"></script>
<script type="application/javascript">
	
var SearchText = new Vue ({
	  el:"#searchData",
	  data:{
		  searchText:'',
	  },
	  watch:{
		  searchText: function(newVal, oldVal) {
			$.getJSON("/getVideoListBySubject.hta", {text:this.searchText}, function(result) {
				
				pageNation.totalPage = Math.floor((result.length - 1)/ pageNation.pageSize) +1;
				const start = (pageNation.page -1) * pageNation.pageSize,
				   end = start + pageNation.pageSize;
					
				videoList.videoDataList = result.slice(start,end);
			})
		}
	  }
})
	
	var videoInfo = new Vue({
		el:"#myModal",
		data:{
			VideoData:0
		},
		filters: {
            currency: function(value) {
            	return new Date(value).toLocaleString("short");
            }
        },
        methods:{
        	deleteVideo: function(videoNo) {
				$.getJSON("/deleteVideo.hta", {videoNo:videoNo}, function() {
					
				})
				alert("삭제되었습니다.");
				$("#myModal").modal('hide');
				location.reload();
			}
        }
	})
	
	
	var videoList = new Vue ({
		el:"#videoList",
		data:{
			videoDataList:[],
			VideoAllList:[],
			
		},
		mounted(){
			$.getJSON("/getVideoDataList.hta",{}, function(result) {
				
				pageNation.userTotalList = result;
				pageNation.totalPage = Math.floor((result.length - 1)/ pageNation.pageSize) +1;
				const start = (pageNation.page -1) * pageNation.pageSize,
				end = start + pageNation.pageSize;
					
				videoList.videoDataList = result.slice(start,end);
				
			})
		},
		filters: {
            currency: function(value) {
            	return new Date(value).toLocaleString("short");
            }
        },
        methods:{
        	showUserDetailData: function(videoNo) {
        		console.log(videoNo);
        		$.getJSON("/getVideoByNoadmin.hta", {videoNo:videoNo}, function(result) {
        			videoInfo.VideoData = result;
				})
        		
        		$("#myModal").modal('show');
        	}
        }
	})
	
	Vue.component('paginate', VuejsPaginate)

	  var pageNation = new Vue ({
		  el:"#paginate",
		  data:{
			   page: 1,
			   totalPage: 1,
			   pageSize: 15,
			   records:1,
			   userTotalList:[],
			   userSearchData:[]
			  },
		   methods: {
			   clickCallback: function(pageNum) {
				   page = pageNum;
				   
				   const start = (pageNation.page -1) * pageNation.pageSize,
				   end = start + pageNation.pageSize;
					
				   videoList.videoDataList = this.userTotalList.slice(start,end);
			   }
			  }
	  })
	
	
</script>
</body>
</html>
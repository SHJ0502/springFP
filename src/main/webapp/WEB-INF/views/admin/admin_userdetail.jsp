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
  <script src='https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js'></script>
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
                <h4><i class="fa fa-angle-right"></i> 유저 정보 조회 </h4>
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
                    <th>User_No</th>
                    <th>User_Id</th>
                    <th>User_Name</th>
                    <th>User_Email</th>
                    <th>User_BirthDay</th>
                    <th>Create_Date</th>
                  </tr>
                </thead>
                <tbody  id="userList">
                  <tr v-for="(user, index) in userDataList" @click="showUserDetailData(user.no)" style="cursor: pointer;">
                    <td>{{index+1}}</td>
                    <td>{{user.no}}</td>
                    <td>{{user.id}}</td>
                    <td>{{user.name}}</td>
                    <td>{{user.email}}</td>
                    <td>{{user.birthDay | currency}}</td>
                    <td>{{user.createDate | currency}}</td>
                  </tr>
                </tbody>
              </table>
          </div>
          </div>
	  	 </section>
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
		          <h4 class="modal-title">유저 상세 정보</h4>
		        </div>
		        <div class="modal-body">
		        	<!-- 모달 바디 -->
		   <div class="row content-panel">
              <div class="col-md-4 profile-text mt mb centered">
                <div class="right-divider hidden-sm hidden-xs">
                  <h4>{{userSubscribe}}</h4>
                  <h6>내 채널 구독자 수</h6>
                  <h4>{{userTotalViews}}</h4>
                  <h6>총 조회수</h6>
                  <h4>{{userTotalViews * 2}}원</h4>
                  <h6>총 수익</h6>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text">
                <h3>{{userInfoData.name}}</h3>
                <h6>{{userInfoData.email}}</h6>
                <p>유저 번호 : {{userInfoData.no}}</p>
                <p>유저 생년월일 : {{userInfoData.birthDay | currency}}</p>
                <p>가입일 : {{userInfoData.createDate | currency}}</p>
                <br>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 centered">
                <div class="profile-pic">
                  <p v-if="userInfoData.userImagePath == null"><img src="/resources/images/photo/normal.png" class="img-circle"></p>
                  <p v-else><img :src="'/resources/images/photo/'+userInfoData.userImagePath" class="img-circle"></p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
		        </div>
		        <div class="modal-footer">
		        	<!-- 모달 footer -->
		        	<div class="col-lg-12 mt">
            <div class="row content-panel">
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#overview">유저 활동</a>
                  </li>
                </ul>
              </div>
              <!-- /panel-heading -->
              <div class="panel-body">
                <div class="tab-content">
                  <div id="overview" class="tab-pane active">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="detailed mt">
                          <h4>최근 활동</h4>
                          <div class="recent-activity"  v-for="(item,index) in userRecnetData">
                            <div class="activity-icon bg-theme"><i class="fa fa-check"></i></div>
                            <div class="activity-panel" v-if="item.type == 'video'">
                              <p>{{item.type}}을 업로드 했습니다.</p>
                              <p>{{item.createDate}}</p>
                            </div>
                            <div class="activity-panel" v-else>
                              <p>{{item.type}}을 게시했습니다.</p>
                              <p>{{item.createDate}}</p>
                            </div>
                          </div>
                          <!-- /recent-activity -->
                        </div>
                        <!-- /detailed -->
                      </div>
                      <!-- /col-md-6 -->
                      <div class="col-md-6 detailed">
                        <h4>유저 활동</h4>
                        <div class="row centered mt mb">
                          <div class="col-sm-4">
                            <h1><i class="fa fa-money"></i></h1>
                            <h3>{{userTotalViews * 2}}원</h3>
                            <h6>총 수익</h6>
                          </div>
                          <div class="col-sm-4">
                            <h1><i class="fa fa-trophy"></i></h1>
                            <h3>{{userSubscribe}}</h3>
                            <h6>내 구독자 수</h6>
                          </div>
                          <div class="col-sm-4">
                            <h1><i class="fa fa-video-camera"></i></h1>
                            <h3>{{userTotalVideoCount}}</h3>
                            <h6>업로드한 영상</h6>
                          </div>
                        </div>
                        <!-- /row -->
                        <h4>내가 구독한 채널</h4>
                        <div class="row centered mb">
                          <ul class="my-friends">
                            <li v-for="(channel, index) in userMySubscribe">
                              <div class="friends-pic"><img class="img-circle" width="35" height="35" :src="'/resources/images/photo/'+channel.imagePath">
                              <p>{{channel.channelTitle}}</p>
                              </div>
                            </li>
                          </ul>
                        </div>
                          <div class="row mt" v-if="userMySubscribe[0] != null">
                            <div class="col-md-4 col-md-offset-4">
                            </div>
                          </div>
                          <div class="row mt" v-else>
                            <div class="col-md-5 col-md-offset-4">
                              <h6>구독한 채널이 없습니다.</h6>
                            </div>
                          </div>
                        <!-- /row -->
                        <h4 style="margin-top: 80px;">내 채널</h4>
                        <div class="row centered mb">
                          <ul class="my-friends">
                            <li>
                             <div class="friends-pic" v-if="userInfoData.userImagePath == null"><img class="img-circle" width="35" height="35" src="/resources/images/photo/normal.png">
                             <p>{{userMyChannel.title}}</p>
                             </div>
                             <div v-else class="friends-pic"><img class="img-circle" width="35" height="35" :src="'/resources/images/photo/'+userInfoData.userImagePath">
                              <p>{{userMyChannel.title}}</p>
                              </div>
                            </li>
                          </ul>
                        </div>
                        <!-- /row -->
                      </div>
                      <!-- /col-md-6 -->
                    </div>
                    <!-- /OVERVIEW -->
                  </div>
                  <!-- /tab-pane -->
                  <!-- /tab-pane -->
                  <!-- /tab-pane -->
                </div>
                <!-- /tab-content -->
              </div>
              <!-- /panel-body -->
            </div>
            <!-- /col-lg-12 -->
          </div>
		        </div>
		      </div>
		    </div>
		  </div>
       <%@ include file="admin_footer.jsp" %>
</body>

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
			$.getJSON("/user/getUserListbyText.hta", {text:this.searchText}, function(result) {
				
				pageNation.totalPage = Math.floor((result.length - 1)/ pageNation.pageSize) +1;
				const start = (pageNation.page -1) * pageNation.pageSize,
				   end = start + pageNation.pageSize;
					
					userList.userDataList = result.slice(start,end);
			})
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
				
				userList.userDataList = this.userTotalList.slice(start,end);
		   }
		  }
  })
  
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });
    });
    
    
    var userInfo = new Vue({
    	el:"#myModal",
    	data:{
    		userInfoData:[],
    		userVideoUploadInfo:[],
    		userTotalVideoCount:0,
    		userSubscribe:0,
    		userTotalViews:0,
    		userMySubscribe:[],
    		userMyChannel:[],
    		userRecnetData:[]
    	},
    	filters: {
            currency: function(value) {
            	return new Date(value).toLocaleString("short");
            }
        }
    	
    })
 
    var userList = new Vue({
    	el:"#userList",
    	data:{
    		userDataList:[]
    	},
    	methods:{
    		showUserDetailData: function(userNo) {
				
				$.getJSON("/mychannel/getVideoByUserNo.hta", {userNo:userNo}, function(result) {
					userInfo.userVideoUploadInfo = result;
					userInfo.userTotalVideoCount = result.length;
				});
				
				$.getJSON("/getMySubscribeCount.hta",{userNo:userNo}, function(result) {
					userInfo.userSubscribe = result;
				});
				
				$.getJSON("/user/getUserByNo.hta", {userNo:userNo}, function(result) {
					userInfo.userInfoData = result;
				});
				
				$.getJSON("/getTotalViewsCount.hta" , {userNo:userNo}, function(result) {
					console.log(result);
					userInfo.userTotalViews = result;
				});
				
				$.getJSON("/getMySubscribe.hta", {userNo:userNo} , function(result) {
					userInfo.userMySubscribe = result;
				});
				$.getJSON("/getMyChannel.hta", {userNo:userNo}, function(result) {
					userInfo.userMyChannel = result;
				})
				$.getJSON("/getRecentActivityByUserNo.hta", {userNo:userNo}, function(result) {
					userInfo.userRecnetData = result;
				})
				
				
					$("#myModal").modal('show');
			}
    	},
    	mounted(){
				$.getJSON("/user/getUserList.hta",{} , function(result) {
					
					pageNation.userTotalList = result;
					pageNation.totalPage = Math.floor((result.length - 1)/ pageNation.pageSize) +1;
					const start = (pageNation.page -1) * pageNation.pageSize,
					   end = start + pageNation.pageSize;
						
						userList.userDataList = result.slice(start,end);
						
				})
    	},
    	filters: {
            currency: function(value) {
            	return new Date(value).toLocaleString();
            }
        }
    })
</script>
</html>
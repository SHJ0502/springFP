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
                <h4><i class="fa fa-angle-right"></i> 최근 활동 조회 </h4>
                <hr>
        </div>
          <div class="col-md-12 mt">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>User_ID</th>
                    <th>Type</th>
                    <th>Title</th>
                    <th>Create_date</th>
                  </tr>
                </thead>
                <tbody  id="recentList" >
                  <tr style="cursor: pointer;" v-for="(data, index) in recentdataList" @click="detail(data.type,data.dataNo)">
                    <td>{{index +1}}</td>
                    <td>{{data.userId}}</td>
                    <td>{{data.type}}</td>
                    <td>{{data.title}}</td>
                    <td>{{data.createdate}}</td>
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
  				
  			 recentData.recentdataList = recentData.recentdataListkai.slice(start,end);
  		   }
  		  }
    })
    
    var recentData = new Vue({
    	el:"#recentList",
    	data:{
    		recentdataList:[],
    		recentdataListkai:[]
    	},
    	mounted(){
    		$.getJSON("/getRecentDataList.hta",{}, function(result) {
    			pageNation.totalPage = Math.floor((result.length - 1)/ pageNation.pageSize) +1;
    			
    			 const start = (pageNation.page -1) * pageNation.pageSize,
    			   end = start + pageNation.pageSize;
    			 
    				recentData.recentdataListkai = result;
    				recentData.recentdataList = result.slice(start,end);
			})
    	},
    	methods:{
    		detail: function(type,dataNo) {
    			console.log(type);
				console.log(dataNo);
			}
    	}
    	
    })

</script>
</html>
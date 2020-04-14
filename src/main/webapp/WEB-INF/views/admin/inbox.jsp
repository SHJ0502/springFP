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
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>

	<!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link href="resources/css/style-responsive.css" rel="stylesheet">

</head>
<body>

<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
       <%@ include file="admin_header.jsp" %>
   <%@ include file="admin_sideBar.jsp" %>
    <section id="main-content">
      <section class="wrapper">
        <!-- page start-->
          <div class="col-sm-12">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    Inbox
                  </h4>
              </header>
              <div class="panel-body minimal">
                <div class="mail-option">
                  <div class="btn-group">
                    <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips" onclick="refresh()">
                      <i class=" fa fa-refresh"></i>
                      </a>
                  </div>
                </div>
                <div class="table-inbox-wrap " id="mailList">
                  <table class="table table-inbox table-hover">
                  	<thead>
                  		<tr class="unread">
	                  		<th class="inbox-small-cells">
	                          <input type="checkbox" class="mail-checkbox">
	                        </th>
                  			<th class="view-message">유저 번호</th>
                  			<th class="view-message">제목</th>
                  			<th class="view-message ">시간</th>
                  		</tr>
                  	</thead>
                    <tbody>
                      <tr class="unread" v-for="(mail,index) in AllMailList">
                        <td class="inbox-small-cells">
                          <input type="checkbox" class="mail-checkbox">
                        </td>
                     	 
	                        <td class="view-message  dont-show"><a :href="'mail_view.hta?mailNo='+mail.no">{{mail.userNo}} </a></td>
	                        <td class="view-message "><a :href="'mail_view.hta?mailNo='+mail.no">{{mail.title}}</a></td>
	                        <td class="view-message ">{{mail.createDate | currency}}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </section>
          </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <!--footer end-->
  <%@ include file="admin_footer.jsp" %>
  </section>
  
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/lib/jquery/jquery.min.js"></script>
  <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="resources/lib/common-scripts.js"></script>
  <!--script for this page-->
  
  <script type="text/javascript">
  	
  var mailList = new Vue({
	  el:"#mailList",
	  data:{
		  AllMailList:[]
	  },
	  mounted(){
		  $.getJSON("/getAllMail.hta", {}, function(result) {
			  mailList.AllMailList = result;
		})
	  },
	  filters: {
          currency: function(value) {
          	return new Date(value).toLocaleString("short");
          }
      }
  });
  
  function refresh() {
	    location.reload();
	}
  </script>

</body>
</html>
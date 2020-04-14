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
  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link href="resources/css/style-responsive.css" rel="stylesheet">
</head>
<body>
<%@ include file="admin_header.jsp" %>
   <%@ include file="admin_sideBar.jsp" %>
 <section id="main-content">
      <section class="wrapper">
        <!-- page start-->
        <div class="row mt">
          <div class="col-sm-9">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    Compose Mail
                  </h4>
              </header>
              <div class="panel-body">
                <div class="compose-btn pull-right">
                  <a href="inbox.hta" class="btn btn-sm btn-theme"><i class="fa fa-arrow-circle-o-left"></i> 목록으로</a>
                </div>
                <div class="compose-mail">
                  <form role="form-horizontal" class="gform" id="gform" method="post" data-email="mjoypark92@gmail.com" action="https://script.google.com/macros/s/AKfycbwxheaXcq0JExWOfboqdQi805HLcV4noDHnE_2pGYwR6y_Sssc/exec">
                    <div class="form-group">
                      <label for="to" class="">To:</label>
                      <input type="text" name="email" tabindex="1" id="email" class="form-control" value="${email }" disabled="disabled">
                    </div>
                    <div class="form-group">
                      <label for="subject" class="">Subject:</label>
                      <input type="text" name="name" tabindex="1" id="name" class="form-control">
                    </div>
                    <div class="compose-editor">
                      <textarea class="wysihtml5 form-control" rows="9" name="message" id="message"></textarea>
                    </div>
                    <div class="compose-btn">
                      <button class="btn btn-theme btn-sm" ><i class="fa fa-check"></i> Send</button>
                    </div>
                   <div style="display:none;" class="thankyou_message">
				      <h2><em>전송완료!!!!</em></h2>
				    </div>
                  </form>
                </div>
              </div>
            </section>
          </div>
        </div>
      </section>
      <!-- /wrapper -->
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
  <script type="text/javascript" src="resources/lib/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
  <script type="text/javascript" src="resources/lib/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
  <script data-cfasync="false" src="resources/lib/form-submission-handler.js"></script>
</body>
</html>
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
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    View Message
                  </h4>
              </header>
              <div class="panel-body ">
                <div class="mail-header row">
                  <div class="col-md-8">
                    <h4 class="pull-left"> ${qna.title } </h4>
                  </div>
                  <div class="col-md-4">
                    <div class="compose-btn pull-right">
                      <a href="inbox.hta" class="btn btn-sm btn-theme"><i class="fa fa-arrow-circle-o-left"></i> 목록으로</a>
                    </div>
                  </div>
                </div>
                <div class="mail-sender">
                  <div class="row">
                    <div class="col-md-8">
                      <img src="img/ui-zac.jpg" alt="">
                      <strong>${username}</strong>
                      <span>${email }</span>
                    </div>
                    <div class="col-md-4">
                      <p class="date"> ${qna.createDate }</p>
                    </div>
                  </div>
                </div>
                <div class="view-mail">
                <strong>문의 내용</strong>
                <p style="margin-top: 30px;">${qna.text}</p>
                </div>
                <div class="compose-btn pull-left">
                  <a href="mail_compose.hta?mailNo=${qna.no }" class="btn btn-sm btn-theme"><i class="fa fa-reply"></i> 답변하기</a>
                </div>
              </div>
            </section>
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
<script type="text/javascript">
	var no = "${param.mailNo}";
	$.getJSON("/updateReadMail.hta", {no:no}, function(result) {
		console.log(no);
	})
</script>
</body>
</html>
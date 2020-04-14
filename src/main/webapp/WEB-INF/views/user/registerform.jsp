<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/topnav.jsp"%>
	<%@ include file="../common/sidenav.jsp"%>
	<div class="container" style="margin-left: 270px;" id="page">
		<div class="page-header">
			<h3>회원가입</h3>
		</div>
		<c:if test="${param.error eq 'fail'} }">
			<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-danger">
						<strong>회원가입 실패</strong> 동일한 아이디가 있습니다.
					</div>
				</div>
			</div>
		</c:if>
		<div class="row">
			<div class="col-sm-12">
				<form class="well" method="post" action="register.hta"
					id="register-form" enctype="multipart/form-data">
					<div class="form-group">
						<div>
							<label>아이디</label> <input type="text" class="form-control"
								name="id" />
						</div>
						<div>
							<label>비밀번호</label> <input type="password" class="form-control"
								name="password" />
						</div>
						<div>
							<label>이름</label> <input type="text" class="form-control"
								name="name" />
						</div>
						<div>
							<label>e-mail</label> <input type="text" class="form-control"
								name="email" />
						</div>
						<div>
							<label>생년월일</label> <input type="date" class="form-control"
								name="birthDay" />
						</div>
						<div>
							<label>사진</label> <input type="file" class="form-control"
								name="userImagePath" />
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-primary">가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
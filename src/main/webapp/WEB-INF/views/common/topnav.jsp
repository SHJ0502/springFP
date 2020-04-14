<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<nav class="navbar">
	  <div class="container-fluid" style="position: fixed; width: 100%; z-index: 2; top: 0px;background-color: white;">
	  	<div class="row">
	  		<div class="col-sm-12" style="background-color: white;">
				<div class="navbar-header col-sm-4">
					<a class="navbar-brand" href="#" id="side-converter" style="color: black;"><span
						class="glyphicon glyphicon-th-list"></span></a> <a
						class="navbar-brand" href="../home.hta"><img
						src="/resources/images/logo/logo3.png" alt="로고"
						style="margin-bottom: 50px; width: 185px; height: 51px; margin-top: -15px;" /></a>
				</div>
				<div class="col-sm-5">
					<form class="navbar-form" action="../search.hta" method="get">
						<div style="margin-top: 7px;">
							<input type="text" name="keyword"
								style="width: 450px; height: 30px; border: solid silver 1px;" />
							<button type="submit"
								style="height: 31px; width: 70px; background-color: silver;">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</form>
				</div>
				<div class="col-sm-3">
					<ul class="nav navbar-nav pull-right">
						
						<c:if test="${empty LU }">
							<li><a href="../user/register.hta" style="color: black;"><span
									class="glyphicon glyphicon-user" style="margin-right: 2px;"></span>회원가입</a></li>
							<li><a href="../user/login.hta" style="color: black;"><span
									class="glyphicon glyphicon-user" style="margin-right: 2px;"></span>로그인</a></li>
						</c:if>
						<c:if test="${not empty LU }">
							<li><a href="../mychannel/mychannel_upload.hta?channelno=${loginUserChannelNo }" style="color: black;"><span class="glyphicon glyphicon-facetime-video"></span></a></li>							
							<li class="dropdown" style="position: relative;height: 50px;"><a href=""
								class="dropdown-toggle" data-toggle="dropdown" href="#" > <img
									style="width: 20px; height: 20px; border-radius: 10px;"
									src="/resources/images/photo/${LU.userImagePath !=null ? LU.userImagePath : 'userbase.jpg'}" />
							</a>
								<ul class="dropdown-menu dropdown-menu-right" style="width: 300px;">
									<li class="dropdown-header"></li>
									<li style="border-bottom: solid silver 1px; margin-bottom: 10px;">
										<div class="row">
											<div class="col-sm-12">
												<div class="col-sm-3">													
														<img src="/resources/images/photo/${LU.userImagePath !=null ? LU.userImagePath : 'userbase.jpg'}" style="width: 50px; height: 50px; border-radius: 50px;" />													
												</div>
												<div class="col-sm-9">
													<p>${LU.name }</p>
													<p>${LU.email }</p>
													<a href="" style="text-decoration: none; margin-bottom: 5px;">Google 계정관리</a>
												</div>
											</div>
										</div>
									</li>
									<li class="dropdown-header"></li>
									<li><a href="../mychannel/mychannel_main.hta?channelno=${loginUserChannelNo }" style="color: black; height: 30px;">내 채널</a></li>
									<li><a href="../user/logout.hta" style="color: black;">로그아웃</a></li>
									<li><a href="#" style="color: black;">고객센터</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
	  	</div>
	  </div>
	  <script type="text/javascript">
	  	$('#side-converter').click(function() {
	  		
	  		if($('#hide-side').css('display') == 'none') {
	  			$('#basic-side').hide();
	  			$('#hide-side').attr('class', '');
	  			$('#page').css('margin-left', "76.11px")  			
	  		} else {
	  			$('#hide-side').attr('class', 'hide');	  			
	  			$('#basic-side').show();
	  			$('#page').css('margin-left', "249.59px");
	  		}
	  	});
	  </script>
	</nav>

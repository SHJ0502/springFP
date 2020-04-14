<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
       <aside>
      <div id="sidebar" class="nav-collapse" style="z-index: 1;">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">Sam Soffes</h5>
          <li class="mt">
            <a class="active" href="adminmain.hta">
              <i class="fa fa-dashboard"></i>
              <span>메인 화면</span>
              </a>
          </li>
          <li class="sub-menu">
         	 <a href="videomanage.hta">
            	  <i class="fa fa-desktop"></i>
            	  <span>영상 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>유저 관리</span>
              </a>
            <ul class="sub">
              <li><a href="userdetail.hta">유저 정보 조회</a></li>
            </ul>
          </li>

          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>데이터 관리</span>
              </a>
            <ul class="sub">
              <li><a href="recentactivity.hta">최근 활동</a></li>
            </ul>
          </li>
          <li>
            <a href="inbox.hta">
              <i class="fa fa-envelope"></i>
              <span>유저 문의 </span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    


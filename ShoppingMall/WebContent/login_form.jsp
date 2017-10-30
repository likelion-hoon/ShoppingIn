<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="js/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"> </script>
	<!-- Latest compiled JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"
					aria-controls="navbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp"> Shopping-In</a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collase-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp"> 메인화면 </a></li>
					<li><a href="#"> 페이지 소개 </a></li>
					<li class="dropdwon">
						<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 게시판 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="board.jsp"> 자유게시판 </a></li>
							<li><a href="#"> Q&A게시판 </a></li>
						</ul>
					</li>
					<li><a href="#"> 채팅방 </a></li>
					<li><a href="#" class="nav navbar-nav pull-right"> 찾아오시는길 </a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"> 
						<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 메뉴 <span class="caret"> </span></a>
					<ul class="dropdown-menu">
						<!--  로그인 했을때 이부분이 로그아웃으로 변하게 만든다. -->
						<li class="active"><a href="login_form.jsp"> 로그인 </a></li>
						<li><a href="registration_form.jsp"> 회원가입 </a></li>
						<li><a href="#">나의 프로필</a></li>
						<li><a href="#">장바구니</a></li>
					</ul>
					</li>
				</ul>
			</div>
	</nav>  <!--  nav 맨 위줄 구현 --> <!-- 모든 페이지에 공통 되게 들어간다. -->


    <!--  로그인 화면 구현 시 -->
	<div class="container">
		<div class="col-lg-4"></div> <!-- 4grid 만큼 빼준다. -->
			<div class="col-lg-4">
				<div class="jumbotron" style="margin-top:10%;padding-top:20px;"> 
					<form class="form-inline" action="login.jsp" method="POST">
		
						<h3 style="text-align:center;"> 로그인 화면 </h3>
		
						<div class="form-group">
							<input type="text" class="form-control"  placeholder="아이디" name="memId">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"  placeholder="비밀번호" name="memPassword">
						</div>
						
						<input type="submit" class="btn btn-success btn-block form-control" 
						style="margin-bottom:10px;" value="로그인">
						
						
						<input type="checkbox" class="form-check-input" style="margin-top:10-px;margin-bottom:10px"> 로그인 상태 유지<br>
		
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"> 아이디 찾기 </a></li>
							<li class="breadcrumb-itme"><a href="#"> 비밀번호 찾기 </a></li>
							<li class="breadcrumb-item"><a href="registration_form.jsp"> 회원가입 </a></li>
						</ol>
					</form>
				</div>
			</div>
	</div>
</body>

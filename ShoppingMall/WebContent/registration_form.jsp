<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> <!--  한글 깨지지 않게 하기 위한 코드  -->
	<title> 회원가입 창 </title>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" href="css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="js/jquery.min.js"></script>

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

	<div class="container"> 
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron"  style="margin-top:10%;"> 
					<h3> 회원가입 페이지 </h3>
					<form class="form-inline" action="registration.jsp" method="POST">
						
						<div class="form-group">
							<input type="email" class="form-control" id="id" placeholder="아이디(이메일)" name="memId" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password" placeholder="비밀번호" name="memPassword" maxlength="20">
						</div>
					
						<div class="form-group">
							<input type="text" class="form-control" id="memName" placeholder="이름" name="memName" maxlength="20">
						</div>
						
						<div class="form-group" style="text-align:center;">
							<div class="btn-group" data-toggle="buttons"> 
								<label class="btn btn-success active">
									<input type="radio" name="memGender" autocomplete="off" value="남자" checked> 남자
								</label>
								<label class="btn btn-success">
									<input type="radio" name="memGender" autocomplete="off" value="여자"> 여자
								</label>
							</div>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="memBirth" placeholder="생년월일" name="memBirth" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="memPhone" placeholder="휴대폰번호" name="memPhone" maxlength="20">
						</div>
									
						<button type="submit" class="btn btn-success btn-lg btn-block" >가입하기</button>
					</form>
			</div>
		</div>
	</div>
</body>

</html>
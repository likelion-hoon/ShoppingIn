<%@ page language="java"  pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title> 쇼핑의 모든 것! Shopping-In </title>
		
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script src="js/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</head>
<body>
	<%
		String memId = null; 
		if(session.getAttribute("memId") != null) {
			memId = (String) session.getAttribute("memId"); 
		}
		
	%>
		<nav class="navbar navbar-default">
		<div class="container-fluid"> 
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"
					aria-controls="navbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">	 로고자리 </a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp"> 메인화면 <span class="glyphicon glyphicon-home"></span></a></li>
					<li><a href="board.jsp"> Q&A게시판 <span class="glyphicon glyphicon-list"></span></a></li>
					<!-- <li class="dropdown" >
						<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 게시판 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="board.jsp"> 자유게시판 </a></li>
							<li><a href="#"> Q&A게시판 </a></li>
						</ul>
					</li> -->
					<li><a href="#"> 채팅방 <span class="glyphicon glyphicon-off"></span></a></li>
					<li><a href="findmart.jsp">	 마트찾기 <span class="glyphicon glyphicon-screenshot"></span></a>
					<li><a href="#"> 쇼핑일기 <span class="glyphicon glyphicon-pencil"></span></a></li>
					<li><a href="#"> 회사 오시는길 <span class="glyphicon glyphicon-road"></span></a></li>
				</ul>
			
				<%
					if(memId == null) {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"> 
						<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> <span class="glyphicon glyphicon-align-justify"></span> <span class="caret"> </span></a>
					<ul class="dropdown-menu">
						<!--  로그인 했을때 이부분이 로그아웃으로 변하게 만든다. -->
						<li class="active"><a href="login_form.jsp"> 로그인 <span class="glyphicon glyphicon-check"></span></a></li>
						<li><a href="registration_form.jsp"> 회원가입 <span class="glyphicon glyphicon-plus"></span></a></li>
					</ul>
					</li>
				</ul>
				
				<%
					} else {
				%>
				
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"> 
						<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> <%= session.getAttribute("memId") %> <span class="caret"> </span></a>
					<ul class="dropdown-menu">
						<!--  로그인 했을때 이부분이 로그아웃으로 변하게 만든다. -->
						<li class="active"><a href="logout.jsp"> 로그아웃 <span class="glyphicon glyphicon-off"></span></a></li>
						<li><a href="#">나의 프로필 <span class="glyphicon glyphicon-user"></span></a></li>
						<li><a href="#">장바구니 <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
					</ul>
					</li>
				</ul>
				
				<%
					}
				%>
			</div>
		</div>
	</nav>  <!--  nav 맨 위줄 구현 --> <!-- 모든 페이지에 공통 되게 들어간다. -->
</body>
</html>
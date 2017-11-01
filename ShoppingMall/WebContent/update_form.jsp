<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="com.hoon.board.BoardDAO" %>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>게시 페이지 입니다.</title>
		
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/main.css" rel="stylesheet">
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="js/bootstrap.min.js"></script>
	</head>
<body>
	
	<%
		String memId = null;
		PrintWriter script = response.getWriter(); 
		if(session.getAttribute("memId") != null) {
			memId = (String) session.getAttribute("memId"); 
		}
		
		if(memId == null) {
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login_form.jsp'");
			script.println("</script>");
		}
		
		int boardId = 0; 
		if(request.getParameter("boardId") != null) {
			boardId = Integer.parseInt(request.getParameter("boardId")); 
		}
		
		if(boardId==0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		
		Board board = new BoardDAO().getBoard(boardId);
		
		if(!memId.equals(board.getMemberId())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}

	%>





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
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp"> 메인화면 </a></li>
					<li><a href="#"> 페이지 소개 </a></li>
					<li class="dropdwon active" >
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
    		<div class="row">
    			<form method="POST" action="update.jsp?boardId=<%= boardId %>">
	    			<table class="table table-striped" style="text-align:center;border: 1px solid #dddddd">
	    				<thead>
	    					<tr>
	    						<th colspan="2" style="background-color: #eeeeee; text-align:center;"> 게시판 글 수정 양식 </th>
	    					</tr>
	    				</thead>
	    				<tbody>
	    					<tr>
	    						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle()%>"></td>
	    					</tr>
	    					<tr>
	    						<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height:350px"><%= board.getBoardContent() %></textarea></td>
	    					</tr>
	    				</tbody>
	    			</table>
	    			<input type="submit" class="btn btn-success pull-right" value="글 수정"> 
    			</form>
    		</div>
    </div>
	
</body>
</html>
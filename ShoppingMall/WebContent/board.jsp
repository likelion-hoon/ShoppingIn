<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.hoon.board.BoardDAO" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		if(session.getAttribute("memId") != null) {
			memId = (String) session.getAttribute("memId"); 
		}
		
		int pageNumber = 1; 
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
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
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collase-1">
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
    			<table class="table table-striped" style="text-align:center;border: 1px solid #dddddd">
    				<thead>
    					<tr>
    						<th style="background-color: #eeeeee; text-align: center;"> 번호 </th>
    						<th style="background-color: #eeeeee; text-align: center;"> 제목 </th>
    						<th style="background-color: #eeeeee; text-align: center;"> 작성자 </th>
    						<th style="background-color: #eeeeee; text-align: center;"> 작성일 </th>
    					</tr>
    				</thead>
    				<tbody>
    					<%
    						BoardDAO boardDAO = new BoardDAO(); 
    						ArrayList<Board> list = boardDAO.getList(pageNumber);
    						for(int i=0; i<list.size(); i++) {
    					%>
    					<tr>
    						<td><%= list.get(i).getBoardId() %></td>
    						<td><a href="view.jsp?boardId=<%= list.get(i).getBoardId() %>"> <%=  list.get(i).getBoardTitle() %> </a></td>
    						<td><%= list.get(i).getMemberId() %></td>
    						<td><%= list.get(i).getBoardDate() %></td>
    					</tr>
    					<%
    						}
    					%>
    				</tbody>
    			</table>
    			<%
    				if(pageNumber != 1) {
    			%>
    				<a href="board.jsp?pageNumber=<%= pageNumber -1 %>" class="btn btn-success btn-arraw-left"> 이전 </a>
    			<%
    				} if(boardDAO.nextPage(pageNumber + 1)) {
    			%>	
    			<a href="board.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-right"> 다음 </a>
    			
    			<a href="write_form.jsp" class="btn btn-success pull-right"> 글쓰기 </a>
    		</div>
    </div>
</body>
</html>
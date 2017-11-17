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
	<%@ include file="nav.jsp" %>
	<%
		PrintWriter script = response.getWriter(); 
		
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
		
		BoardDAO boardDAO = new BoardDAO();
		Board board = boardDAO.getBoard(boardId);
		String fileRealName = boardDAO.getFileRealName(boardId);
		
		if(!memId.equals(board.getMemberId())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
	%>
	
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
	    					<tr>
	    					  	<td><input type="file" name="file"></td>
	    					</tr>
	    				</tbody>
	    			</table>
	    			<input type="submit" class="btn btn-success pull-right" value="글 수정"> 
    			</form>
    		</div>
    </div>
	
</body>
</html>
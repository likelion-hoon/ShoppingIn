<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hoon.board.BoardDAO" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>

<html>
	<head>
		<meta charset="utf-8"> <!--  한글 깨지지 않게 하기 위한 코드  -->
		<title> 글쓰기 처리 페이지  </title>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link rel="stylesheet" href="css/bootstrap.min.css">
	
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
	
		<!-- Latest compiled JavaScript -->
		<script src="js/bootstrap.min.js"></script>
	</head>
	
<body>
	<%
		PrintWriter script = response.getWriter();
		
		String memId = null; 
		if(session.getAttribute("memId") != null) {
			memId = (String) session.getAttribute("memId"); 
		}
		
		if(memId == null) { // 로그인이 안된 경우 
			script.println("<script>"); 
			script.println("alert('로그인을 하세요.')"); 
			script.println("location.href = login_form.jsp'"); 
			script.println("</script>"); 
		} 
	
		int boardId = 0; 
		if(request.getParameter("boardId") != null) {
			boardId = Integer.parseInt(request.getParameter("boardId")); 
		}
		
		if(boardId == 0) {
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
		} else { // 로그인이 된 경우 
			if(request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null
				|| request.getParameter("boardTitle").equals("") || request.getParameter("boardContent").equals("")) {
				script.println("<script>"); 
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()"); 
				script.println("</script>" ); 
			} else {		
				BoardDAO boardDAO = new BoardDAO(); 
				int result = boardDAO.update(boardId, request.getParameter("boardTitle"), request.getParameter("boardContent")); 
				
				if(result == -1) { // 글	수정 오류 발생 
					script.println("<script>"); 
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()"); 
					script.println("</script>"); 
				} else { // 글쓰기 정상 완료!
					script.println("<script>"); 
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>




	




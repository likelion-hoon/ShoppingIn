<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hoon.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>
<jsp:useBean id="board" class="com.hoon.board.Board" scope="page" /> 
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />

<html>
	<head>
		<meta charset="utf-8"> <!--  한글 깨지지 않게 하기 위한 코드  -->
		<title> 글쓰기 처리 페이지  </title>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link rel="stylesheet" href="css/bootstrap.min.css">
	
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String memId = null; 
		if(session.getAttribute("memId") != null) {  // 세션의 memId값을 가져온후 
			memId = (String) session.getAttribute("memId"); 
		}
		if(memId == null) { // memId의 값이 null이면 
			script.println("<script>"); 
			script.println("alert('로그인을 하세요.')"); 
			script.println("location.href = login_form.jsp'"); 
			script.println("</script>"); 
		} else { // 로그인이 된 경우 
			if(board.getBoardTitle() == null || board.getBoardContent() == null) {
				script.println("<script>"); 
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()"); 
				script.println("</script>" ); 
			} else {		
				BoardDAO boardDAO = new BoardDAO(); 
				int result = boardDAO.write(board.getBoardTitle(), memId, board.getBoardContent()); 
				
				System.out.println(result); 
				if(result == -2) { // 글쓰기 오류 발생
					script.println("<script>"); 
					script.println("alert('글쓰기에 실패했습니다.')");
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




	




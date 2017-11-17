<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hoon.board.BoardDAO" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); // 세션을 종료시킨다.
	    new BoardDAO().close(); // DB 연결을 종료시킨다. 
	%>
	
	<script>
		location.href="main.jsp"; 
	</script>
</body>
</html>
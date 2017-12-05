<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hoon.member.MemberDAO,java.io.PrintWriter"%>
	
<jsp:useBean id="member" class="com.hoon.member.Member" scope="page" /> 
<jsp:setProperty name="member" property="memId" />
<jsp:setProperty name="member" property="memPassword" />
	
<html>
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
	<%
		String checkbox = request.getParameter("checkbox"); 
	
		request.setCharacterEncoding("UTF-8");
	    
		MemberDAO memberDAO = new MemberDAO(); 
		int result = memberDAO.login(member.getMemId(),member.getMemPassword());
		
		// 자바스크립트 문장을 작성할 때 필요
		
		
		String memId = null; 
		if(session.getAttribute("memId") != null) {
			memId = (String) session.getAttribute("memId"); 
		}
		
	
		if(result==1) { // 로그인에 성공하였을 때만 세션을 부여한다.
				PrintWriter script = response.getWriter();
			 	session.setAttribute("memId", member.getMemId());
			 	if(checkbox != null) {
			 		System.out.println("실행완료");
					session.setMaxInactiveInterval(60*60*24); 
				}
				script.println("<script>"); 
				script.println("location.href='main.jsp'"); 
				script.println("</script>"); 
		} else if(result==0) {
				PrintWriter script = response.getWriter();
				script.println("<script>"); 
				script.println("alert('비밀번호가 틀립니다.')"); 
				script.println("history.back()"); 
				script.println("</script>"); 
		} else if(result==-1) {
				PrintWriter script = response.getWriter();
				script.println("<script>"); 
				script.println("alert('존재하지 않는 아이디입니다.')");
				script.println("history.back()"); 
				script.println("</script>"); 
		} else if(result==-2) {
				PrintWriter script = response.getWriter();
				script.println("<script>"); 
				script.println("alert(데이터베이스 오류가 발생했습니다.')");
				script.println("history.back()"); 
				script.println("</script>"); 
		}
	%>
</body>
</html>




	




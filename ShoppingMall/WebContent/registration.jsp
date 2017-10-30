<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hoon.member.MemberDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>

<jsp:useBean id="member" class="com.hoon.member.Member" scope="page"/> 

<jsp:setProperty name="member" property="memId" />
<jsp:setProperty name="member" property="memPassword" />
<jsp:setProperty name="member" property="memName" />
<jsp:setProperty name="member" property="memGender" />
<jsp:setProperty name="member" property="memBirth" />
<jsp:setProperty name="member" property="memPhone" />

<html>
	<head>
		<meta charset="utf-8"> <!--  한글 깨지지 않게 하기 위한 코드  -->
		<title> JSP 게시판 웹 사이트 </title>
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
		
		if(member.getMemId() == null || member.getMemPassword() == null || member.getMemName() == null || 
		member.getMemGender() == null || member.getMemBirth() == null || member.getMemPhone() == null) {
			script.println("<script>"); 
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); 
			script.println("</script>"); 
		} else {
			MemberDAO memberDAO = new MemberDAO(); 
			int result = memberDAO.insert(member);		
		
			if(result == -1) { // 오류 발생
				script.println("<script>"); 
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()"); 
				script.println("</script>"); 
			} else { // 정상일때 로그인 창으로 이동, 로그인 시킨다. 
				script.println("<script>"); 
				script.println("location.href = 'login_form.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>




	




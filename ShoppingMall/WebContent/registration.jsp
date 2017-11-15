<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hoon.member.MemberDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>

<jsp:useBean id="member" class="com.hoon.member.Member" scope="page"/> 
<jsp:setProperty name="member" property="*" />

<%
	PrintWriter script = response.getWriter();

	// 비밀번호와 비밀번호 재확인이 틀릴 때
	if(member.getMemPassword() != member.getRe_Password()) {
 		script.println("<script>"); 
		script.println("alert('비밀번호 값이 일치하지 않습니다.')");
		script.println("history.go(-1)"); 
		script.println("</script>");
		return; 
 	} 
	
	// 입력창에 값이 하나라도 입력되지 않으면 에러 발생
	if(member.getMemId() == null || member.getMemPassword() == null || member.getMemName() == null || 
	member.getMemGender() == null || member.getMemBirth() == null || member.getMemPhone() == null) {
		script.println("<script>"); 
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()"); 
		script.println("</script>"); 
		script.close();  // PrintWriter() 종료 
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
		script.close();	// PrintWriter() 종료 
	}
%>

<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog vertical-align-center">
		<div id="checkType" class="modal-content panel-info">
			<div class="modal-header panel-heading">
				<h4 class="modal-title">
					확인 메시지 
				</h4>  
			</div>
			<div id="checkMessage" class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"> 확인 </button>
			</div>
		</div>
	</div> <!-- modal-dialog 마지막  -->
</div>





	




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<html>
<body>
	<%@ include file="nav.jsp" %>
	<%
		PrintWriter script = response.getWriter(); 
	
		if(memId==null) {  // 세션을 가져왔는데도 null값인 경우에는 로그인을 하라고 돌려보낸다. 
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login_form.jsp'");
			script.println("</script>");
		}
	
	%>
    <div class="container"> 
    		<div class="row">
    			<form action="write.jsp" method="POST" >
	    			<table class="table table-striped" style="text-align:center;border: 1px solid #dddddd">
	    				<thead>
	    					<tr>
	    						<th colspan="2" style="background-color: #eeeeee; text-align:center;"> 게시판 글쓰기 양식 </th>
	    					</tr>
	    				</thead>
	    				<tbody>
	    					<tr>
	    						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"></td>
	    					</tr>
	    					<tr>
	    						<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height:350px"></textarea></td>
	    					</tr>
	    				</tbody>
	    			</table>
	    			<a href="board.jsp" class="btn btn-success"> 목록 </a>
	    			<input type="submit" class="btn btn-success pull-right" value="글쓰기"> 
    			</form>
    		</div>
    </div>
</body>
</html>
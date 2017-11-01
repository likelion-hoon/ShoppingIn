<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="com.hoon.board.BoardDAO" %>

<!DOCTYPE html> 
<html>
	<body>
		<%@ include file="nav.jsp" %>
		<%
			PrintWriter script = response.getWriter(); 
			
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
		%>
	
	    <div class="container"> 
	    		<div class="row">
		    			<table class="table table-striped" style="text-align:center;border: 1px solid #dddddd">
		    				<thead>
		    					<tr>
		    						<th colspan="3" style="background-color: #eeeeee; text-align:center;"> 게시판 글 보기 양식 </th>
		    					</tr>
		    				</thead>
		    				<tbody>
		    					<tr>
		    						<td style="width:20%;">글 제목</td>
		    						<td colspan="2"><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
		    					</tr>
		    					<tr>
		    						<td> 작성자 </td>
		    						<td colspan="2"><%= board.getMemberId() %></td>
		    					</tr>
		    					<tr>
		    						<td> 작성일자 </td>
		    						<td colspan="2"><%= board.getBoardDate() %></td>
		    					</tr>
		    					<tr>
		    						<td> 작성내용 </td>
		    						<td colspan="2"  style="height:350px"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
		    					</tr>
		    				</tbody>
		    			</table>
		    			
		    			<a href="board.jsp" class="btn btn-success"> 목록 </a>
		    			<%
		    			 	if(memId != null && memId.equals(board.getMemberId())){ 		
		    			%>
		    				<a href="update_form.jsp?boardId=<%= board.getBoardId() %>" class="btn btn-success"> 수정 </a>
		    				<a href="delete.jsp?boardId=<%= board.getBoardId() %>" class="btn btn-success"> 삭제 </a>
		    			<%
		    			 	}
		    			%>
	    		</div>
	    </div>
	</body>
</html>
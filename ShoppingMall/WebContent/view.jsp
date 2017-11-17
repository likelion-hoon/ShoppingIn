<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="com.hoon.board.BoardDAO" %>
<%@ page import="com.hoon.file.downloadAction" %>


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
			
			BoardDAO boardDAO = new BoardDAO();
			Board board = boardDAO.getBoard(boardId);
			boardDAO.increaseHit(boardId); // 조회 수 값 증가
			String fileRealName = boardDAO.getFileRealName(boardId);
		%>
	
	    <div class="container"> 
	    		<div class="row">
		    			<table class="table table-striped" style="border:1px solid #dddddd;text-align:center;">
		    				<thead>
		    					<tr>
		    						<th colspan="3" style="background-color: #eeeeee; text-align:center;"> 게시판 글 보기 양식 </th>
		    					</tr>
		    				</thead>
		    				<tbody>
		    					<tr>
		    						<td style="border-right:1px solid #eeeeee;width:100px;">글 제목</td>
		    						<td colspan="2"><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
		    					</tr>
		    					<tr>
		    						<td style="border-right:1px solid #eeeeee;width:100px;"> 작성자 </td>
		    						<td colspan="2"><%= board.getMemberId() %></td>
		    					</tr>
		    					<tr>
		    						<td style="border-right:1px solid #eeeeee;width:100px;"> 작성일자 </td>
		    						<td colspan="2"><%= board.getBoardDate() %></td>
		    					</tr>
		    					<tr>
		    						<td style="border-right:1px solid #eeeeee;width:100px;"> 조회수 </td>
		    						<td colspan="2"><%= board.getBoardHit() %></td>
		    					</tr>
		    					
		    					<tr>
		    						<td style="border-right:1px solid #eeeeee;width:100px;"> 파일 </td>
		    						<% if(fileRealName != null)  { %>
			    						<td colspan="2"><a href="/ShoppingMall/downloadAction?file=<%= 
			    								java.net.URLEncoder.encode(fileRealName,"UTF-8")%>"> <%= fileRealName %></a></td>
		    						<% } else { %>
			    						<td colspan="2"> 파일없음 </td>
			    					<% } %>
		    					</tr>
		    					<tr>
		    						<td style="vertical-align:middle;border-right:1px solid #eeeeee;width:100px;"> 작성내용 </td>
		    						<td colspan="2"  style="height:350px"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
		    					</tr>
		    				</tbody>
		    			</table>    		
	    		</div>
	    		
	    		<!-- 댓글이 들어갈 위치 -->
	    		
	    		<hr>
	    		<!-- 댓글 창이 들어갈 위치 -->
	    		<div class="row"> 
		    		<div class="form-group">
			    		 <form action="reply.jsp" method="POST"> 
			    			<p style="margin-bottom:20px"> 작성자 : <%= session.getAttribute("memId") %></p>
			    			
			    			<textarea class="form-control" placeholder="댓글 내용" name="replayContent" maxlength="300" style="height:70px;margin-bottom:20px;"></textarea>
			    			<input type="submit" class="btn btn-success" value="작성">  
			    		</form>
			    		<hr>
			    	</div>
	    		</div>
	    		
    			<a href="board.jsp" class="btn btn-success"> 목록 </a>
	    			<%
	    			 	if(memId != null && memId.equals(board.getMemberId())){ 		
	    			%>
	    				<a href="update_form.jsp?boardId=<%= board.getBoardId() %>" class="btn btn-success"> 수정 </a>
	    				<a href="delete.jsp?boardId=<%= board.getBoardId() %>" class="btn btn-success"> 삭제 </a>
	    			<%
	    			 	}
	    			%>
	    </div>  <!-- 컨테이너의 마지막  -->
	</body>
</html>
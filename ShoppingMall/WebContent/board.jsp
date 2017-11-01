<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.hoon.board.BoardDAO" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="java.util.ArrayList" %>

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
			
			int pageNumber = 1; 
			if(request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
			}
			
		%>
	    <div class="container"> 
	    		<div class="row">
	    			<table class="table table-striped" style="text-align:center;border: 1px solid #dddddd">
	    				<thead>
	    					<tr>
	    						<th style="background-color: #eeeeee; text-align: center;"> 번호 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 제목 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 작성자 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 작성일 </th>
	    					</tr>
	    				</thead>
	    				<tbody>
	    					<%
	    						BoardDAO boardDAO = new BoardDAO(); 
	    						ArrayList<Board> list = boardDAO.getList(pageNumber);
	    						for(int i=0; i<list.size(); i++) {
	    					%>
	    					<tr>
	    						<td><%= list.get(i).getBoardId() %></td>
	    						<td><a href="view.jsp?boardId=<%= list.get(i).getBoardId() %>"> <%=  list.get(i).getBoardTitle() %> </a></td>
	    						<td><%= list.get(i).getMemberId() %></td>
	    						<td><%= list.get(i).getBoardDate() %></td>
	    					</tr>
	    					<%
	    						}
	    					%>
	    				</tbody>
	    			</table>
	    			<%
	    				if(pageNumber != 1) {
	    			%>
	    				<a href="board.jsp?pageNumber=<%= pageNumber -1 %>" class="btn btn-success btn-arraw-left"> 이전 </a>
	    			<%
	    				} if(boardDAO.nextPage(pageNumber + 1)) {
	    			%>	
	    			<a href="board.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-right"> 다음 </a>
	    			<%
	    				}
	    			%>
	    			<a href="write_form.jsp" class="btn btn-success pull-right"> 글쓰기 </a>
	    		</div>
	    </div>
	</body>
</html>
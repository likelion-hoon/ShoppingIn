<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.hoon.board.BoardDAO" %>
<%@ page import="com.hoon.board.Board" %>
<%@ page import="java.util.ArrayList" %>

<html>
	<body>
		<script type="text/javascript">
			function searchBoardFunction() {
				var searchType = $('#searchType').val();
				var searchValue = $('#searchValue').val();
				
				$.ajax({
					type : 'POST',
					url : './SearchBoardServlet',
					data : {
						searchType : searchType,
						searchValue : searchValue
					},
					success : function(result) {
					}
				});
			}
			
			function onChangeValue() {
				var boardCount = $('#boardCount').val();
				
				$.ajax({
					type : 'POST',
					url : './OnChangeValueServlet',
					data : {
						boardCount : boardCount
					},
					success : function(result) {
					}
				});
			}
			
			document.oncontextmenu = function(e) {
				   alert("오른쪽버튼을 이용할 수 없습니다.");
				   return false;
		    }
		</script>
		<%@ include file="nav.jsp" %>
		<%	
			PrintWriter script = response.getWriter(); 
	
			if(memId==null) {  // 세션을 가져왔는데도 null값인 경우에는 로그인을 하라고 돌려보낸다. 
				script.println("<script>");
				script.println("alert('로그인이 필요합니다.')");
				script.println("location.href = 'login_form.jsp'");
				script.println("</script>");
			 	script.close(); 
			}
			
			int pageNumber = 1; 
			if(request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
			}
			
		%>
	    <div class="container"> 
	    
	    		<!--  10개씩 보기, 20개씩 보기 구현 -->
	    		<table style="float:left;margin-bottom:10px;">
	    			<tr>
	    				<td> 
				    		<select id="boardCount" name="boardCount" class="form-control pull-left" style="float:left">
			 				<option value="10"> 10개 </option>
				    			<option value="20"> 20개 </option>
						</select> 
					</td>
					<td>
						<a href="board.jsp" onclick="onChangeValue();" type="button" class="btn btn-success" style="margin-left:10px;"> 보기 </a>
					</td>
				</tr>
			</table>
	    		
	    		<!--  게시판 내용 검색 하기  -->	
	    		<table style="float:right;margin-bottom:10px;">
	    			<tr>
	    				<td> 
	    					<select id="searchType" name="searchType" class="form-control">
	    						<option value="boardTitle"> 제목 </option>
	    						<option value="memberId"> 작성자 </option>
	    					</select>
	    				</td>
	    			
	    				<td><input id="searchValue" type="text" class="form-control" style="margin-left:10px;" placeholder="Search.."></td> 
	    				<td><button onclick="searchBoardFunction();" type="submit" class="btn btn-success" style="margin-left:20px;"> 검색 </button></td>
	    			</tr>
	    		</table>
	    		
	    		<div class="row">
	    			<table class="table table-striped table-bordered table-hover" style="text-align:center;border: 1px solid #dddddd">
	    				<thead>
	    					<tr>
	    						<th style="background-color: #eeeeee; text-align: center;"> 번호 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 제목 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 작성자 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 작성일 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 조회수 </th>
	    						<th style="background-color: #eeeeee; text-align: center;"> 파일(Y/N) </th>
	    						 
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
	    						<td><a href="view.jsp?boardId=<%= list.get(i).getBoardId() %>"><%=  list.get(i).getBoardTitle() %></a></td>
	    						<td><%= list.get(i).getMemberId() %></td>
	    						<td><%= list.get(i).getBoardDate() %></td>
	    						<td><%= list.get(i).getBoardHit()  %></td>
	    						<%if(list.get(i).getFileName()==null) { %>
	    							<td>	 N </td>
	    						<% } else { %>
	    						    <td> Y </td>
	    						<% }%>
	    						
	    					<%
	    						}
	    					%>
	    					</tr>
	    				</tbody>
	    			</table>
	    			<%
	    				if(pageNumber != 1) {
	    			%>
	    				<a href="board.jsp?pageNumber=<%= pageNumber -1 %>" class="btn btn-success btn-arrow-left"> 이전 </a>
	    			<%
	    				} if(boardDAO.nextPage(pageNumber + 1)) {
	    			%>	
	    			<a href="board.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arrow-right"> 다음 </a>
	    			<%
	    				}
	    			%>
	    			<!-- <nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">Next</a></li>
				  </ul>
				</nav> -->
	    			<a href="write_form.jsp" class="btn btn-success pull-right"> 글쓰기 </a>
	    		</div>
	    </div>
	</body>
</html>
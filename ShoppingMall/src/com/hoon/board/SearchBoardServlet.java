package com.hoon.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoon.member.MemberDAO;


@WebServlet("/SearchBoardServlet")
public class SearchBoardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		response.getWriter().write(new BoardDAO().searchBoard(searchType, searchValue) + ""); 
	}
}

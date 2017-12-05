package com.hoon.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoon.board.BoardDAO;

@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		response.getWriter().write(new ReplyDAO().writeReply(id,content) + ""); 
	}
}

package com.hoon.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

	Connection conn = null;
	ResultSet rs = null; 

	// 생성자
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shopping?autoReconnect=true&useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버 로드
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		} 
				
	}

	// 날짜 반환 함수 
	public String getDate() {
		String sql = "select now()";
		PreparedStatement pstmt =  null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return ""; // DB오류
	}


	// 최신글의 번호의 다음 번호를 리턴 
	public int getNext() {
		String sql = "select boardId from board order by boardId desc";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1; // 해당 번호의 다음차례를 리턴한다.
			}

			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		} 
			
		return -1; // DB 오류
	}
	
	// 조회수 증가하는 함수
	public int increaseHit(int boardId) {
		String sql = "update board set boardHit = boardHit + 1 where boardId = ?";
		PreparedStatement pstmt = null; 
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return -1; // DB오류
	}

	public int write(String boardTitle, String memberId, String boardContent) {
		
		String sql = "INSERT INTO board values(?,?,?,?,?,?)";
		String date = getDate().substring(0,4)+"년 "+getDate().substring(5,7)+"월 "+ getDate().substring(8,10)+"일 "+ getDate().substring(11,13)+"시 "
				+getDate().substring(14,15)+"분 "+getDate().substring(17,19)+"초 ";
		
		PreparedStatement pstmt = null; 

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, memberId);
			pstmt.setString(4, date);
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 0); // 처음 글쓸때 조회수는 0으로 입
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
			
		return -2; // DB 오류
	}

	// ArrayList에서 게시글 정보 하나를 가져오는 역할
	public ArrayList<Board> getList(int pageNumber) {

		String sql = "select * from board where boardId < ? order by boardId desc limit 10";
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) { // 각각의 페이지 마다
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setMemberId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardHit(rs.getInt(6));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	// 페이징 처리를 위한 함수
	public boolean nextPage(int pageNumber) {

		String sql = "select * from board where boardId < ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return false;
	}

	// 해당 번호의 게시글을 가져오는 함수
	public Board getBoard(int boardId) {

		String sql = "select * from board where boardId = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setMemberId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardHit(rs.getInt(6));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return null;
	}

	// 글을 수정하는 함수
	public int update(int boardId, String boardTitle, String boardContent) {
		
		String sql = "update board set boardTitle = ?, boardContent = ? where boardId = ?";
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTitle); 
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardId);
		
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return -1; // DB 오류
	}
	
	// 글을 삭제하는 함수 
	public int delete(int boardId) {
		
		String sql = "delete from board where boardId = ?";
		PreparedStatement pstmt = null;
		
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1; // DB 오류
	}
}

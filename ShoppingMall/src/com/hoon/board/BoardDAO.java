package com.hoon.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	private Connection conn; 
	private ResultSet rs; 
	
	// 생성자
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf8"; 
			String dbID = "root"; 
			String dbPassword = "1234"; 
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버 로드 
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String sql = "select now()"; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				return rs.getString(1); 
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "";  // DB오류
	}
	
	public int getNext() {
		String sql = "select boardId from board order by boardId desc";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				return rs.getInt(1)+1; // 해당 번호의 다음차례를 리턴한다.
			}
			
			return 1; // 첫 번째 게시물인 경우 
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;  // DB 오류
	}
	
	public int write(String boardTitle, String memberId, String boardContent) {
		String sql = "INSERT INTO board values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getNext()); 
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, memberId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;  // DB 오류
	}
	
	// ArrayList에서 게시글 정보 하나를 가져오는 역
	public ArrayList<Board> getList(int pageNumber) {
		
		String sql = "select * from board where boardId < ? and boardAvailable = 1 order by boardId desc limit 10";
		ArrayList<Board> list = new ArrayList<Board>(); 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {  // 각각의 페이지 마다
				Board board = new Board(); 
				board.setBoardId(rs.getInt(1)); 
				board.setBoardTitle(rs.getString(2));
				board.setMemberId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				list.add(board);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list; 
	}
	
	// 페이징 처리를 위한 함수 
	public boolean nextPage(int pageNumber) {
		
		String sql = "select * from board where boardId < ? and boardAvailable = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {  
				return true; 
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false; 
	}
	

	
	
}

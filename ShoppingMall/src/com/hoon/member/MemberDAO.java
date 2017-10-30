package com.hoon.member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// MySQL에 연결하는 역할의 클래스 
// 데이터 접근 객체  
public class MemberDAO {
	
	private Connection conn; 
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	// 생성자
	public MemberDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shopping"; 
			String dbID = "root"; 
			String dbPassword = "1234"; 
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버 로드 
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String memId, String memPassword) {
		String sql = "select memPassword from member where memId = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) { // 해당 레코드가 있으면
				if(rs.getString(1).equals(memPassword))
					return 1; // 로그인 성공
				else
					return 0; // 패스워드 불일치
			}
			
			return -1; // 아이디가 없음 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // DB오류
	}
	
	
	// 회원 삽입 코드 
	public int insert(Member m) {
		
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?)"; 
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPassword());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getMemGender());
			pstmt.setString(5, m.getMemBirth()); 
			pstmt.setString(6,  m.getMemPhone()); 
			
			return pstmt.executeUpdate(); 

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return -1; // DB오류 
		
	}
	
	// 데이터베이스 접속 종료 
		public void close()  {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
}

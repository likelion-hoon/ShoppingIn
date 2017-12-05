package com.hoon.member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

// MySQL에 연결하는 역할의 클래스 
// 데이터 접근 객체  
public class MemberDAO {
	
	private Connection conn; 
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	// 생성자
	public MemberDAO() {
		try {
			// JNDI 서버 객체 생성
			InitialContext ic = new InitialContext(); 
			// lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/mysql");
			// getConnection()
			conn = ds.getConnection();
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
	
	// 아이디 중복 체크 함수 
	public int registerCheck(String memId) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM member WHERE memId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();

			if (rs.next()) { 
				return 0; // 이미 존재하는 회원
			} else if(memId.equals("")){
				return 2; // 아무것도 입력하지 않음
			} else if(!memId.contains("@")) {
				return 3; // 이메일 형식이 아닙니다.
			} else {
				return 1; // 가입 가능한 회원 아이디 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return -1; // 데이터베이스 오류
	}
	
	// 모든 연결자원 접속종료 
	public void close()  {
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
	}
}

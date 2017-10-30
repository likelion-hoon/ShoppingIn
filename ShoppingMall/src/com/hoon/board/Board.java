package com.hoon.board; // 1. 패키지화 시키기 

public class Board {

	private int boardId; // 2.private 선언
	private String boardTitle;
	private String memberId;
	private String boardDate;
	private String boardContent;
	private int boardAvailable;

	// 3. 기본 생성자 생성
	public Board() {

	}
	
	public Board(int boardId, String boardTitle, String memberId, String boardDate, String boardContent,
			int boardAvailable) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.memberId = memberId;
		this.boardDate = boardDate;
		this.boardContent = boardContent;
		this.boardAvailable = boardAvailable;
	}
	
	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardAvailable() {
		return boardAvailable;
	}

	public void setBoardAvailable(int boardAvailable) {
		this.boardAvailable = boardAvailable;
	}
}

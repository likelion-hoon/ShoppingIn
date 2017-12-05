package com.hoon.reply;

public class Reply {
	
	private String replyId; 
	private String replyContent;
	
	public Reply(String replyId, String replyContent) {
		this.setReplyId(replyId);
		this.setReplyContent(replyContent);
	}

	
	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public String getReplyId() {
		return replyId;
	}


	public void setReplyId(String replyId) {
		this.replyId = replyId;
	} 
	
	
}

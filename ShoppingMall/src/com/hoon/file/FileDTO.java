package com.hoon.file;

// db에 있는 정보를 가져와 FileDTO객체에 저장한다. 
public class FileDTO {

	private String fileName;
	private String fileRealName;
	
	public FileDTO() {
		
	}

	public FileDTO(String fileName, String fileRealName, int downloadCount) {
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

}

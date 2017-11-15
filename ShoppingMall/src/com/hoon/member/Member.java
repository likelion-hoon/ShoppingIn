package com.hoon.member; // 1. 패키지화 시키기

public class Member {

	private String memId;   // 2. 변수 private로 선언
	private String memPassword; 
	private String re_Password; //  비밀번호 재확인 변수 
	private String memName; 
	private String memGender; 
	private String memBirth; 
	private String memPhone; 
	
	// 3. 기본 생성자 생성 
	public Member() {
		
	}
	
	public Member(String memId, String memPassword, String re_Password, String memName, String memGender,
			String memBirth, String memPhone) {
		
		this.memId = memId;
		this.memPassword = memPassword;
		this.re_Password = re_Password;
		this.memName = memName;
		this.memGender = memGender;
		this.memBirth = memBirth;
		this.memPhone = memPhone;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPassword() {
		return memPassword;
	}

	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	
	public String getRe_Password() {
		return re_Password;
	}

	public void setRe_Password(String re_Password) {
		this.re_Password = re_Password;
	}


	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}


}

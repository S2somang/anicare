package org.anicare.jsp.member.model.vo;

public class Member implements java.io.Serializable{

	private String userId;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String userPwd;
	private String uType;
	private String ssn;
	private String bn;
	private String status;
	
	public Member() {}

	public Member(String userId, String name, String phone, String email, String address, String userPwd, String uType,
			String ssn, String bn, String status) {
		super();
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.userPwd = userPwd;
		this.uType = uType;
		this.ssn = ssn;
		this.bn = bn;
		this.status = status;
	}

	public Member(String phone, String email, String address) {
		super();
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	
	
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getuType() {
		return uType;
	}

	public void setuType(String uType) {
		this.uType = uType;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getBn() {
		return bn;
	}

	public void setBn(String bn) {
		this.bn = bn;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", name=" + name + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", userPwd=" + userPwd + ", uType=" + uType + ", ssn=" + ssn + ", bn=" + bn + ", status="
				+ status + "]";
	}
	
	
	
	
}

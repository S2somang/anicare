package org.anicare.jsp.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable {
	private int bCode;
	private String title;
	private int count;
	private String content;
	private int bNum;
	private String bType;
	private Date bDate;
	private String userId;
	private String email;
	private String name;
	private int cc;
	private int refBcode;
	
	public Board() {}

	public Board(int bCode, String title, int count, String content, int bNum, String bType, Date bDate, String userId,
			String email, String name, int cc, int refBcode) {
		super();
		this.bCode = bCode;
		this.title = title;
		this.count = count;
		this.content = content;
		this.bNum = bNum;
		this.bType = bType;
		this.bDate = bDate;
		this.userId = userId;
		this.email = email;
		this.name = name;
		this.cc = cc;
		this.refBcode = refBcode;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}

	public int getRefBcode() {
		return refBcode;
	}

	public void setRefBcode(int refBcode) {
		this.refBcode = refBcode;
	}

	@Override
	public String toString() {
		return "Board [bCode=" + bCode + ", title=" + title + ", count=" + count + ", content=" + content + ", bNum="
				+ bNum + ", bType=" + bType + ", bDate=" + bDate + ", userId=" + userId + ", email=" + email + ", name="
				+ name + ", cc=" + cc + ", refBcode=" + refBcode + "]";
	}
	
}

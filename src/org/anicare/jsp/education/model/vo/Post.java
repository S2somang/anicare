package org.anicare.jsp.education.model.vo;

import java.sql.Date;

public class Post implements java.io.Serializable{
	private int bCode;
	private String title;
	private int count;
	private String content;
	private int bnum;
	private String btype;
	private Date bDate;
	private String userId; 
	private String refBcode;

	public Post () {}

	public Post(int bCode, String title, int count, String content, int bnum, String btype, Date bDate, String userId,
			String refBcode) {
		super();
		this.bCode = bCode;
		this.title = title;
		this.count = count;
		this.content = content;
		this.bnum = bnum;
		this.btype = btype;
		this.bDate = bDate;
		this.userId = userId;
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

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
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

	public String getRefBcode() {
		return refBcode;
	}

	public void setRefBcode(String refBcode) {
		this.refBcode = refBcode;
	}

	@Override
	public String toString() {
		return "Post [bCode=" + bCode + ", title=" + title + ", count=" + count + ", content=" + content + ", bnum="
				+ bnum + ", btype=" + btype + ", bDate=" + bDate + ", userId=" + userId + ", refBcode=" + refBcode
				+ "]";
	}
	
	

	
	
}

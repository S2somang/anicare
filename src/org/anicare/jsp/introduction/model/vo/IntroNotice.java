package org.anicare.jsp.introduction.model.vo;

import java.sql.Date;

public class IntroNotice implements java.io.Serializable {
	private String ncode;
	private String title;
	private int count;
	private String content;
	private Date date;
	private String category;
	private int bcode;

	public IntroNotice() {}

	public IntroNotice(String ncode, String title, int count, String content, Date date, String category, int bcode) {
		super();
		this.ncode = ncode;
		this.title = title;
		this.count = count;
		this.content = content;
		this.date = date;
		this.category = category;
		this.bcode = bcode;
	}

	public String getNcode() {
		return ncode;
	}

	public void setNcode(String ncode) {
		this.ncode = ncode;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getBcode() {
		return bcode;
	}

	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	@Override
	public String toString() {
		return "IntroNotice [ncode=" + ncode + ", title=" + title + ", count=" + count + ", content=" + content
				+ ", date=" + date + ", category=" + category + ", bcode=" + bcode + "]";
	}

	
}

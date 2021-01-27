package org.anicare.jsp.board.model.vo;

import java.sql.Date;

public class Missing implements java.io.Serializable {
	private String info;
	private Date mDate;
	private String map;
	private int bCode;
	private String mTime;
	
	public Missing() {}

	public Missing(String info, Date mDate, String map, int bCode, String mTime) {
		super();
		this.info = info;
		this.mDate = mDate;
		this.map = map;
		this.bCode = bCode;
		this.mTime = mTime;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getmTime() {
		return mTime;
	}

	public void setmTime(String mTime) {
		this.mTime = mTime;
	}

	@Override
	public String toString() {
		return "Missing [info=" + info + ", mDate=" + mDate + ", map=" + map + ", bCode=" + bCode + ", mTime=" + mTime
				+ "]";
	}

}

package org.anicare.jsp.myPage.model.vo;

import java.sql.Date;

public class MyPage implements java.io.Serializable {
	
	private Date date;
	private int pCount;
	private int pMoney;
	private int tMoney;
	
	public MyPage() {}
	public MyPage(Date date, int pCount, int pMoney, int tMoney) {
		super();
		this.date = date;
		this.pCount = pCount;
		this.pMoney = pMoney;
		this.tMoney = tMoney;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public int getpMoney() {
		return pMoney;
	}
	public void setpMoney(int pMoney) {
		this.pMoney = pMoney;
	}
	public int gettMoney() {
		return tMoney;
	}
	public void settMoney(int tMoney) {
		this.tMoney = tMoney;
	}
	@Override
	public String toString() {
		return "MyPage [date=" + date + ", pCount=" + pCount + ", pMoney=" + pMoney + ", tMoney=" + tMoney + "]";
	}
	
	
	
	
}

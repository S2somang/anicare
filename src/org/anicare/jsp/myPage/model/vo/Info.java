package org.anicare.jsp.myPage.model.vo;

public class Info {
	private String sDate;
	private String st;
	private String money;
	
	
	public Info() {}


	public Info(String sDate, String st, String money) {
		super();
		this.sDate = sDate;
		this.st = st;
		this.money = money;
	}


	public String getsDate() {
		return sDate;
	}


	public void setsDate(String sDate) {
		this.sDate = sDate;
	}


	public String getSt() {
		return st;
	}


	public void setSt(String st) {
		this.st = st;
	}


	public String getMoney() {
		return money;
	}


	public void setMoney(String money) {
		this.money = money;
	}


	@Override
	public String toString() {
		return "Info [sDate=" + sDate + ", st=" + st + ", money=" + money + "]";
	}
	
	
	
}

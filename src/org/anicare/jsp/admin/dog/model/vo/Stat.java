package org.anicare.jsp.admin.dog.model.vo;

import java.util.Date;

public class Stat {

	
	//status
	private String acode;
	private Date date;
	private String status;
	
	public Stat() {}
	
	
	public Stat(String acode, Date date, String status) {
		super();
		this.acode = acode;
		this.date = date;
		this.status = status;
	}
	public String getAcode() {
		return acode;
	}
	public void setAcode(String acode) {
		this.acode = acode;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Stat [acode=" + acode + ", date=" + date + ", status=" + status + "]";
	}
	
	
	
	
}

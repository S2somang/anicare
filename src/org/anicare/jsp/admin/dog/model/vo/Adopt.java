package org.anicare.jsp.admin.dog.model.vo;

import java.util.Date;

public class Adopt {

	//dog
	private String dcode;
	private String name;
	
	//adopt
	private String acode;
	private String fin;
	private Date date;
	
	//status
	private String status;
	
	//MEMBER
	
	private String user_id;
	private String phone;
	
	
	public Adopt() {}


	public Adopt(String dcode, String name, String acode, String fin, Date date, String status, String user_id,
			String phone) {
		super();
		this.dcode = dcode;
		this.name = name;
		this.acode = acode;
		this.fin = fin;
		this.date = date;
		this.status = status;
		this.user_id = user_id;
		this.phone = phone;
	}


	public String getDcode() {
		return dcode;
	}


	public void setDcode(String dcode) {
		this.dcode = dcode;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAcode() {
		return acode;
	}


	public void setAcode(String acode) {
		this.acode = acode;
	}


	public String getFin() {
		return fin;
	}


	public void setFin(String fin) {
		this.fin = fin;
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


	public String getuser_id() {
		return user_id;
	}


	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "Adopt [dcode=" + dcode + ", name=" + name + ", acode=" + acode + ", fin=" + fin + ", date=" + date
				+ ", status=" + status + ", user_id=" + user_id + ", phone=" + phone + "]";
	}


	
	
	
	
}

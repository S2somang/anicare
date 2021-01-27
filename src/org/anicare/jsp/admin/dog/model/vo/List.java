package org.anicare.jsp.admin.dog.model.vo;

public class List {

	private String dcode;
	private String user_id;
	private String acode;
	
	
	public List() {}


	public List(String dcode, String user_id, String acode) {
		super();
		this.dcode = dcode;
		this.user_id = user_id;
		this.acode = acode;
	}


	public String getDcode() {
		return dcode;
	}


	public void setDcode(String dcode) {
		this.dcode = dcode;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getAcode() {
		return acode;
	}


	public void setAcode(String acode) {
		this.acode = acode;
	}


	@Override
	public String toString() {
		return "List [dcode=" + dcode + ", user_id=" + user_id + ", acode=" + acode + "]";
	}
	
	
	
	
}

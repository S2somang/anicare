package org.anicare.jsp.support.model.vo;

import java.sql.Date;

public class SuBoard {

	private int stCode;
	private String content;
	private String reply;
	private int bCount;
	private String status;
	
	private String con1;
	private String con2;
	private String con3;
	private String con4;
	
	private String dcode;
	private int type;
	private int refStcode;
	private String name;
	
	public SuBoard() {
		
	}

	public SuBoard(int stCode, String content, String reply, int bCount, String status, String con1, String con2,
			String con3, String con4, String dcode, int type, int refStcode, String name) {
		super();
		this.stCode = stCode;
		this.content = content;
		this.reply = reply;
		this.bCount = bCount;
		this.status = status;
		this.con1 = con1;
		this.con2 = con2;
		this.con3 = con3;
		this.con4 = con4;
		this.dcode = dcode;
		this.type = type;
		this.refStcode = refStcode;
		this.name = name;
	}

	public int getStCode() {
		return stCode;
	}

	public void setStCode(int stCode) {
		this.stCode = stCode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCon1() {
		return con1;
	}

	public void setCon1(String con1) {
		this.con1 = con1;
	}

	public String getCon2() {
		return con2;
	}

	public void setCon2(String con2) {
		this.con2 = con2;
	}

	public String getCon3() {
		return con3;
	}

	public void setCon3(String con3) {
		this.con3 = con3;
	}

	public String getCon4() {
		return con4;
	}

	public void setCon4(String con4) {
		this.con4 = con4;
	}

	public String getDcode() {
		return dcode;
	}

	public void setDcode(String dcode) {
		this.dcode = dcode;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getRefStcode() {
		return refStcode;
	}

	public void setRefStcode(int refStcode) {
		this.refStcode = refStcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "SuBoard [stCode=" + stCode + ", content=" + content + ", reply=" + reply + ", bCount=" + bCount
				+ ", status=" + status + ", con1=" + con1 + ", con2=" + con2 + ", con3=" + con3 + ", con4=" + con4
				+ ", dcode=" + dcode + ", type=" + type + ", refStcode=" + refStcode + ", name=" + name + "]";
	}

	
}

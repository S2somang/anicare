package org.anicare.jsp.support.model.vo;

public class SuAttachment {

	private String dcode;
	
	private int tCode;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	
	private int stcode;
	
	public SuAttachment() {
		
	}

	public SuAttachment(String dcode, int tCode, String originName, String changeName, String filePath, int fileLevel,
			int stcode) {
		super();
		this.dcode = dcode;
		this.tCode = tCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.stcode = stcode;
	}

	public String getDcode() {
		return dcode;
	}

	public void setDcode(String dcode) {
		this.dcode = dcode;
	}

	public int gettCode() {
		return tCode;
	}

	public void settCode(int tCode) {
		this.tCode = tCode;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getStcode() {
		return stcode;
	}

	public void setStcode(int stcode) {
		this.stcode = stcode;
	}

	@Override
	public String toString() {
		return "SuAttachment [dcode=" + dcode + ", tCode=" + tCode + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", stcode=" + stcode + "]";
	}

	
	
	
	
}

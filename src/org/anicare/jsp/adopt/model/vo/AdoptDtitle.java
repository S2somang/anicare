package org.anicare.jsp.adopt.model.vo;

public class AdoptDtitle {
	private int tcode;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String status;
	private int stcode;
	private int type;
	private String dcode;
	
	public AdoptDtitle() {}

	public AdoptDtitle(int tcode, String originName, String changeName, String filePath, int fileLevel, String status,
			int stcode, int type, String dcode) {
		super();
		this.tcode = tcode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.status = status;
		this.stcode = stcode;
		this.type = type;
		this.dcode = dcode;
	}

	public int getTcode() {
		return tcode;
	}

	public void setTcode(int tcode) {
		this.tcode = tcode;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStcode() {
		return stcode;
	}

	public void setStcode(int stcode) {
		this.stcode = stcode;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDcode() {
		return dcode;
	}

	public void setDcode(String dcode) {
		this.dcode = dcode;
	}

	@Override
	public String toString() {
		return "AdoptDtitle [tcode=" + tcode + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", status=" + status + ", stcode=" + stcode
				+ ", type=" + type + ", dcode=" + dcode + "]";
	}
	
	
}

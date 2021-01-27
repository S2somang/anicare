package org.anicare.jsp.adopt.model.vo;

public class AdoptStory {

	private String dcode;
	private int stcode;
	private String status;
	private String content;
	private int bcount;
	private int reply;
	private int type;
	private int refStcode;
	private int tcode;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	
	
	public AdoptStory() {}


	public AdoptStory(String dcode, int stcode, String status, String content, int bcount, int reply, int type,
			int refStcode, int tcode, String originName, String changeName, String filePath, int fileLevel) {
		super();
		this.dcode = dcode;
		this.stcode = stcode;
		this.status = status;
		this.content = content;
		this.bcount = bcount;
		this.reply = reply;
		this.type = type;
		this.refStcode = refStcode;
		this.tcode = tcode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}


	public String getDcode() {
		return dcode;
	}


	public void setDcode(String dcode) {
		this.dcode = dcode;
	}


	public int getStcode() {
		return stcode;
	}


	public void setStcode(int stcode) {
		this.stcode = stcode;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getBcount() {
		return bcount;
	}


	public void setBcount(int bcount) {
		this.bcount = bcount;
	}


	public int getReply() {
		return reply;
	}


	public void setReply(int reply) {
		this.reply = reply;
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


	@Override
	public String toString() {
		return "DogStory [dcode=" + dcode + ", stcode=" + stcode + ", status=" + status + ", content=" + content
				+ ", bcount=" + bcount + ", reply=" + reply + ", type=" + type + ", refStcode=" + refStcode + ", tcode="
				+ tcode + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", fileLevel=" + fileLevel + "]";
	}
	
	
	
	
	
}

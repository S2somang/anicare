package org.anicare.jsp.education.model.vo;

import java.sql.Date;

public class BoardAttachment implements java.io.Serializable{
	private int fCode;
	private String originName;
	private String changeName;
	private String filePath;
	private int refBCode;
	private Date uploadDate;
	private int downloadCount;
	
	public BoardAttachment() {}

	public BoardAttachment(int fCode, String originName, String changeName, String filePath, int refBCode,
			Date uploadDate, int downloadCount) {
		super();
		this.fCode = fCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.refBCode = refBCode;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
	}

	public int getfCode() {
		return fCode;
	}

	public void setfCode(int fCode) {
		this.fCode = fCode;
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

	public int getRefBCode() {
		return refBCode;
	}

	public void setRefBCode(int refBCode) {
		this.refBCode = refBCode;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	@Override
	public String toString() {
		return "BoardAttachment [fCode=" + fCode + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", refBCode=" + refBCode + ", uploadDate=" + uploadDate
				+ ", downloadCount=" + downloadCount + "]";
	}
	
	
	
}

package org.anicare.jsp.adopt.model.vo;

import java.sql.Date;

public class Mix {

	//dog & info
	private String dcode;
	private String name;
	private String gender;
	private String breed;
	private Date date;
	private int weight;
	private String fixing;
	private int age;
	private String potty;
	private String chip;
	private String personality;
	
	
	//story & dtitle
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
	
	
	public Mix () {}


	public Mix(String dcode, String name, String gender, String breed, Date date, int weight, String fixing, int age,
			String potty, String chip, String personality, int stcode, String status, String content, int bcount,
			int reply, int type, int refStcode, int tcode, String originName, String changeName, String filePath,
			int fileLevel) {
		super();
		this.dcode = dcode;
		this.name = name;
		this.gender = gender;
		this.breed = breed;
		this.date = date;
		this.weight = weight;
		this.fixing = fixing;
		this.age = age;
		this.potty = potty;
		this.chip = chip;
		this.personality = personality;
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBreed() {
		return breed;
	}


	public void setBreed(String breed) {
		this.breed = breed;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}


	public String getFixing() {
		return fixing;
	}


	public void setFixing(String fixing) {
		this.fixing = fixing;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getPotty() {
		return potty;
	}


	public void setPotty(String potty) {
		this.potty = potty;
	}


	public String getChip() {
		return chip;
	}


	public void setChip(String chip) {
		this.chip = chip;
	}


	public String getPersonality() {
		return personality;
	}


	public void setPersonality(String personality) {
		this.personality = personality;
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
		return "Mix [dcode=" + dcode + ", name=" + name + ", gender=" + gender + ", breed=" + breed + ", date=" + date
				+ ", weight=" + weight + ", fixing=" + fixing + ", age=" + age + ", potty=" + potty + ", chip=" + chip
				+ ", personality=" + personality + ", stcode=" + stcode + ", status=" + status + ", content=" + content
				+ ", bcount=" + bcount + ", reply=" + reply + ", type=" + type + ", refStcode=" + refStcode + ", tcode="
				+ tcode + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", fileLevel=" + fileLevel + "]";
	}
	
	
	
}

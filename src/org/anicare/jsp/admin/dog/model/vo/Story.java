package org.anicare.jsp.admin.dog.model.vo;

public class Story {
	
	//story
	private int stcode;
	private String status;
	private String content;
	private int bcount;
	private int reply;
	private String dcode;
	private int type;
	private int refStcode;
	
	//content detail
	private String con1;
	private String con2;
	private String con3;
	private String con4;
	
	//dog
	private String name;
	private String gender;
	private String breed;
	
	//infomation
	private int weight;
	private String fixing;
	private int age;
	private String potty;
	private String chip;
	private String personality;
	
	public Story() {}

	public Story(int stcode, String status, String content, int bcount, int reply, String dcode, int type,
			int refStcode, String con1, String con2, String con3, String con4, String name, String gender, String breed,
			int weight, String fixing, int age, String potty, String chip, String personality) {
		super();
		this.stcode = stcode;
		this.status = status;
		this.content = content;
		this.bcount = bcount;
		this.reply = reply;
		this.dcode = dcode;
		this.type = type;
		this.refStcode = refStcode;
		this.con1 = con1;
		this.con2 = con2;
		this.con3 = con3;
		this.con4 = con4;
		this.name = name;
		this.gender = gender;
		this.breed = breed;
		this.weight = weight;
		this.fixing = fixing;
		this.age = age;
		this.potty = potty;
		this.chip = chip;
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

	@Override
	public String toString() {
		return "Story [stcode=" + stcode + ", status=" + status + ", content=" + content + ", bcount=" + bcount
				+ ", reply=" + reply + ", dcode=" + dcode + ", type=" + type + ", refStcode=" + refStcode + ", con1="
				+ con1 + ", con2=" + con2 + ", con3=" + con3 + ", con4=" + con4 + ", name=" + name + ", gender="
				+ gender + ", breed=" + breed + ", weight=" + weight + ", fixing=" + fixing + ", age=" + age
				+ ", potty=" + potty + ", chip=" + chip + ", personality=" + personality + "]";
	}

}

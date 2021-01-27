package org.anicare.jsp.admin.dog.model.vo;

public class Infomation {
	private int weight;
	private String fixing;
	private int age;
	private String potty;
	private String chip;
	private String personality;
	private String dcode;
	
	
	public Infomation() {}


	public Infomation(int weight, String fixing, int age, String potty, String chip, String personality, String dcode) {
		super();
		this.weight = weight;
		this.fixing = fixing;
		this.age = age;
		this.potty = potty;
		this.chip = chip;
		this.personality = personality;
		this.dcode = dcode;
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


	public String getDcode() {
		return dcode;
	}


	public void setDcode(String dcode) {
		this.dcode = dcode;
	}


	@Override
	public String toString() {
		return "Infomation [weight=" + weight + ", fixing=" + fixing + ", age=" + age + ", potty=" + potty + ", chip="
				+ chip + ", personality=" + personality + ", dcode=" + dcode + "]";
	}
	
	
}

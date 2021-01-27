package org.anicare.jsp.admin.dog.model.vo;

import java.sql.Date;

public class Dog {

	//dog table
	private String dcode;
	private String name;
	private String gender;
	private String breed;
	private Date date;
	
	//infomation table
	private int weight;
	private String fixing;
	private int age;
	private String potty;
	private String chip;
	private String personality;
	
	public Dog() {
	}

	public Dog(String dcode, String name, String gender, String breed, Date date, int weight, String fixing, int age,
			String potty, String chip, String personality) {
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

	@Override
	public String toString() {
		return "Dog [dcode=" + dcode + ", name=" + name + ", gender=" + gender + ", breed=" + breed + ", date=" + date
				+ ", weight=" + weight + ", fixing=" + fixing + ", age=" + age + ", potty=" + potty + ", chip=" + chip
				+ ", personality=" + personality + "]";
	}



}

package com.entity;

public class Doctor {
	private int id = (int)(Math.random() * 9000);
	private String name;
	private String dob;
	private String qualification;
	private String specialize;
	private String email;
	private String phone;
	private String password;
	
	public Doctor(){
		
	}

	public Doctor(String name, String dob, String qualification, String specialize, String email, String phone,
			String password) {

		this.name = name;
		this.dob = dob;
		this.qualification = qualification;
		this.specialize = specialize;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialize() {
		return specialize;
	}

	public void setSpecialize(String specialize) {
		this.specialize = specialize;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}

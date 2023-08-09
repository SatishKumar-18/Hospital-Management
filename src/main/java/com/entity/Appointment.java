package com.entity;

public class Appointment {
	private int id = (int)(Math.random() * 9000);
	private int userId;
	private int doctorId;
	private String name;
	private String age;
	private String gender;
	private String appDate;
	private String disease;
	private String email;
	private String phone;
	private String address;
	private String status;
	
	public Appointment() {
		
	}

	public Appointment(int userId, int doctorId, String name, String age, String gender, String appDate,
			String disease, String email, String phone, String address, String status) {
		super();
		this.userId = userId;
		this.doctorId = doctorId;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.appDate = appDate;
		this.disease = disease;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}

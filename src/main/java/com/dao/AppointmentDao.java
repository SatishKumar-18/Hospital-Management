package com.dao;

import java.sql.*;
import java.util.*;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection conn;
	
	public AppointmentDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment app) {
		boolean f = false;
		
		try {
			String query = "insert into appointment (ID, USER_ID, NAME, GENDER, AGE, APP_DATE, EMAIL, PHONE, DISEASE, DOCTOR_ID, ADDRESS, STATUS) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, app.getId());
			pst.setInt(2, app.getUserId());
			pst.setString(3, app.getName());
			pst.setString(4, app.getGender());
			pst.setString(5, app.getAge());
			pst.setString(6, app.getAppDate());
			pst.setString(7, app.getEmail());
			pst.setString(8, app.getPhone());
			pst.setString(9, app.getDisease());
			pst.setInt(10, app.getDoctorId());
			pst.setString(11, app.getAddress());
			pst.setString(12, app.getStatus());
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Appointment> getAppointmentByUser(int userId){
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;
		
		try {
			String query = "Select * from appointment where user_id=?";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, userId);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				app = new Appointment();
				
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setPhone(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				list.add(app);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Appointment> getAppointmentByAdmin(){
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;
		
		try {
			String query = "Select * from appointment";
			
			PreparedStatement pst = conn.prepareStatement(query);
			
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				app = new Appointment();
				
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setPhone(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				list.add(app);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Appointment> getAppointmentByDoctor(int doctorId){
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;
		
		try {
			String query = "Select * from appointment where doctor_id=?";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, doctorId);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				app = new Appointment();
				
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setPhone(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				list.add(app);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Appointment getAppointmentById(int id){
		
		Appointment app = null;
		
		try {
			String query = "Select * from appointment where id=?";
			
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				app = new Appointment();
			
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setPhone(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return app;
	}
	
	public boolean updateStatus(int id, String comment) {
		boolean f = false;
		
		try {
			String query = "update Appointment set status=? where id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			
			pst.setString(1, comment);
			pst.setInt(2, id);
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}

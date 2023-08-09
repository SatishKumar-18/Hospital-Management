package com.dao;

import java.sql.*;
import java.util.*;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public Doctor loginDoctor(String email, String password) {
		Doctor doctor = null;
		
		try {
			String query = "Select * from doctor where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(query);
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				doctor = new Doctor();
				
				doctor.setId(rs.getInt(1));
				doctor.setName(rs.getString(2));
				doctor.setDob(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialize(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setPhone(rs.getString(7));
				doctor.setPassword(rs.getString(8));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return doctor;
	}
	public boolean AddDoctor(Doctor d) {
		
		boolean f = false;
		try {
			String query = "insert into Doctor (id, name, dob, qualification, specialization, email, phone, password) values(?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, d.getId());
			pst.setString(2, d.getName());
			pst.setString(3, d.getDob());
			pst.setString(4, d.getQualification());
			pst.setString(5, d.getSpecialize());
			pst.setString(6, d.getEmail());
			pst.setString(7, d.getPhone());
			pst.setString(8, d.getPassword());
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Doctor> getDoctor(){
		
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		
		try {
			String query = "Select * from Doctor";
			PreparedStatement pst = conn.prepareStatement(query);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialize(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPhone(rs.getString(7));
				d.setPassword(rs.getString(8));
				
				list.add(d);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Doctor getDoctorById(int id) {
		Doctor d = new Doctor();
		
		try{
			PreparedStatement pst = conn.prepareStatement("Select * from doctor where id=?");
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialize(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPhone(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f = false;
		try {
			String query = "update doctor set name=?, dob=?, qualification=?, specialization=?, email=?, phone=?, password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			
			pst.setString(1, d.getName());
			pst.setString(2, d.getDob());
			pst.setString(3, d.getQualification());
			pst.setString(4, d.getSpecialize());
			pst.setString(5, d.getEmail());
			pst.setString(6, d.getPhone());
			pst.setString(7, d.getPassword());
			pst.setInt(8, d.getId());
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String query = "delete from doctor where id=?";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, id);
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean ChangePassword(int doctorId, String password) {
		boolean f = false;
		
		try {
			String query = "update doctor set password=? where id=?";
			
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, password);
			pst.setInt(2, doctorId);
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int countDoctor() {
		int i = 0;
		try {
			String query = "Select * from doctor";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public int countAppointment() {
		int i = 0;
		try {
			String query = "Select * from appointment";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countUser() {
		int i = 0;
		try {
			String query = "Select * from userdata";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countSpecialist() {
		int i = 0;
		try {
			String query = "Select * from specialist";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
}

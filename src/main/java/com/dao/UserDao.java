package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Doctor;
import com.entity.User;

public class UserDao {
	private Connection conn;
	
	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean userRegister(User u) {
		boolean f = false;
		
		try {
			String query1 = "Select * from UserData where email=?";
			PreparedStatement pst1 = conn.prepareStatement(query1);
			
			pst1.setString(1, u.getEmail());
			
			ResultSet rs = pst1.executeQuery();
			
			if(!rs.next()) {
				String query = "insert into UserData(id, name, email, password) values (?, ?, ?, ?)";
				
				PreparedStatement pst = conn.prepareStatement(query);
				pst.setInt(1, u.getId());
				pst.setString(2, u.getName());
				pst.setString(3, u.getEmail());
				pst.setString(4, u.getPassword());
				
				int n = pst.executeUpdate();
				
				if(n == 1) {
					f = true;
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public User loginUser(String email, String password) {
		
		User user = null;
		try {
			String query = "Select * from UserData where email=? and password=?";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				user = new User();
				
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean ChangePassword(int userId, String password) {
		boolean f = false;
		
		try {
			String query = "update userdata set password=? where id=?";
			
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, password);
			pst.setInt(2, userId);
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<User> getUserByAdmin(){
		List<User> list = new ArrayList<User>();
		User u = null;
		
		try {
			String query = "Select * from userdata";
			
			PreparedStatement pst = conn.prepareStatement(query);
			
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				u = new User();
				
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				
				list.add(u);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public User getUserById(int id) {
		User u = new User();
		
		try{
			PreparedStatement pst = conn.prepareStatement("Select * from userdata where id=?");
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
}

package com.dao;

import java.sql.*;
import java.util.*;

import com.entity.Specialist;

public class SpecialistDao {
	private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(Specialist s) {
		
		
		boolean f = false;
		
		try {
			String query = "insert into specialist(id, spec_name) values (?, ?)";
			
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, s.getId());
			pst.setString(2, s.getSpecialistName());
			
			int n = pst.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Specialist> getSpecialist(){
		List<Specialist> list = new ArrayList<>();
		
		Specialist s = null;
		
		try {
			String query = "Select * from specialist";
			
			PreparedStatement pst = conn.prepareStatement(query);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				
				list.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}

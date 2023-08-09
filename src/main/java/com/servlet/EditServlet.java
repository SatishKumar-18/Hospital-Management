package com.servlet;

import com.Connection.DatabaseConnect;
import com.dao.DoctorDao;
import com.entity.Doctor;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class EditServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialize = request.getParameter("specialize");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			
			Doctor d = new Doctor();
			d.setId(id);
			d.setName(name);
			d.setDob(dob);
			d.setQualification(qualification);
			d.setSpecialize(specialize);
			d.setEmail(email);
			d.setPhone(phone);
			d.setPassword(password);
			
			DoctorDao dao = new DoctorDao(DatabaseConnect.getConnect());
			
			HttpSession session = request.getSession();
			
			if(dao.updateDoctor(d)) {
				session.setAttribute("succMsg", "Update Successful");
				response.sendRedirect("AddDoctor.jsp");
			}
			else {
				session.setAttribute("errMsg", "Something went wrong..");
				response.sendRedirect("AddDoctor.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

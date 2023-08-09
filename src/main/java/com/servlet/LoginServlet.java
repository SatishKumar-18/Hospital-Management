package com.servlet;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Connection.DatabaseConnect;
import com.dao.DoctorDao;
import com.dao.UserDao;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				
				session.setAttribute("email", new User());
				response.sendRedirect("AdminDash.jsp");
			}
			else {
				UserDao dao = new UserDao(DatabaseConnect.getConnect());
				User user = dao.loginUser(email, password);
				
				DoctorDao dao1 = new DoctorDao(DatabaseConnect.getConnect());
				Doctor doctor = dao1.loginDoctor(email, password);
				
				session = request.getSession();
				if(user != null) {
					session.setAttribute("email", user.getEmail());
					session.setAttribute("id", user.getId());
					response.sendRedirect("UserAppointment.jsp");
				}
				else if(doctor != null) {
					session.setAttribute("email", doctor.getEmail());
					session.setAttribute("id", doctor.getId());
					response.sendRedirect("DoctorViewAppointment.jsp");
				}
				else {
					session.setAttribute("errorMsg", "Invalid email and password");
					response.sendRedirect("Login.jsp");
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}

package com.servlet;

import java.io.IOException;

import com.Connection.DatabaseConnect;
import com.dao.AppointmentDao;
import com.entity.Appointment;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int userId = Integer.parseInt(request.getParameter("userId"));
		int doctorId = Integer.parseInt(request.getParameter("doctor"));
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String appDate = request.getParameter("appDate");
		String disease = request.getParameter("disease");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		
		Appointment app = new Appointment(userId, doctorId, name, age, gender, appDate, disease, email, phone, address, "Pending");
		
		AppointmentDao dao = new AppointmentDao(DatabaseConnect.getConnect());
		
		HttpSession session = request.getSession();
		
		if(dao.addAppointment(app)) {
			session.setAttribute("succMsg", "Appointment Booked Successsfully");
			response.sendRedirect("UserAppointment.jsp");
		}
		else {
			session.setAttribute("errMsg", "Something went wrong...");
			response.sendRedirect("UserAppointment.jsp");
		}
	}
}

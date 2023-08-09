package com.servlet;

import com.Connection.DatabaseConnect;
import com.dao.AppointmentDao;
import com.entity.Appointment;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateStatus")
public class updateStatus extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String comment = request.getParameter("comment");
			
			AppointmentDao  dao = new AppointmentDao(DatabaseConnect.getConnect());
			
			HttpSession session = request.getSession();
			
			if(dao.updateStatus(id, comment)) {
				
				response.sendRedirect("DoctorViewAppointment.jsp");
			}else {
				session.setAttribute("errorMsg", "Something went wrong....");
				response.sendRedirect("DoctorViewAppointment.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

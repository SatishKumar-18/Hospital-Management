package com.servlet;

import java.io.IOException;

import com.Connection.DatabaseConnect;
import com.dao.DoctorDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteDoctorServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DatabaseConnect.getConnect());
		
		boolean f = dao.deleteDoctor(id);
		
		if(f) {
			response.sendRedirect("AddDoctor.jsp");
		}
	}
}

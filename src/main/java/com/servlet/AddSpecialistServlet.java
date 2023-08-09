package com.servlet;

import java.io.IOException;

import com.Connection.DatabaseConnect;
import com.dao.SpecialistDao;
import com.entity.Specialist;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addSpecialist")
public class AddSpecialistServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String specName = request.getParameter("specName");
		
		HttpSession session = request.getSession();
		
		Specialist s = new Specialist(specName);
		
		SpecialistDao dao = new SpecialistDao(DatabaseConnect.getConnect());
		
		boolean f = dao.addSpecialist(s);
		
		if(f) {
			session.setAttribute("succMsg", "Specialist Added");
			response.sendRedirect("AdminDash.jsp");
		}
		else {
			session.setAttribute("errMsg", "Something went wrong.");
			response.sendRedirect("AdminDash.jsp");
		}
	}
}

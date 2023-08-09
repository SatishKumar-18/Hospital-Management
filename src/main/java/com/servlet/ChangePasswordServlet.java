package com.servlet;

import java.io.IOException;

import com.Connection.DatabaseConnect;
import com.dao.DoctorDao;
import com.dao.UserDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int id = Integer.parseInt(request.getParameter("did"));
		String newPassword = request.getParameter("newPassword");
		String password = request.getParameter("confirmPassword");
		
		HttpSession session = request.getSession();
		
		if(newPassword.equals(password)) {
			UserDao dao = new UserDao(DatabaseConnect.getConnect());
			DoctorDao dao1 = new DoctorDao(DatabaseConnect.getConnect());
			
			session = request.getSession();
			
			if(dao.ChangePassword(id, password)) {
				session.setAttribute("succMsg", "Password Changed");
				response.sendRedirect("ChangePassword.jsp");
			}else if(dao1.ChangePassword(id, password)) {
				session.setAttribute("succMsg", "Password Changed");
				response.sendRedirect("ChangePassword.jsp");
			}else {
				session.setAttribute("errorMsg", "Something went wrong...");
				response.sendRedirect("ChangePassword.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "Password did not match");
			response.sendRedirect("ChangePassword.jsp");
		}
	}
}

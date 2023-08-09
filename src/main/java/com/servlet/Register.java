package com.servlet;

import java.io.IOException;

import com.Connection.DatabaseConnect;
import com.dao.UserDao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("Email");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			
			if(name == null || name == "") {
				session.setAttribute("errorMsg", "Please enter your name");
				response.sendRedirect("Register.jsp");
				
			}
			else if(email == null || email == "") {
				session.setAttribute("errorMsg", "Please enter your email");
				response.sendRedirect("Register.jsp");
			}
			else if(password == null || password == "") {
				session.setAttribute("errorMsg", "Please enter password");
				response.sendRedirect("Register.jsp");
				
			}
			else if(password.length() <4) {
				session.setAttribute("errorMsg", "Password: Minimum 4 characters");
				response.sendRedirect("Register.jsp");
			}
			else {
				User u = new User(name, email, password);
				
				UserDao dao = new UserDao(DatabaseConnect.getConnect());
				boolean f = dao.userRegister(u);
				
				if(f) {
					session.setAttribute("succMsg", "Register Succesfull!!");
					response.sendRedirect("Register.jsp");
				}else {
					session.setAttribute("errorMsg", "User already Registered");
					response.sendRedirect("Register.jsp");
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
		
}

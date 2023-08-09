<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <%
   	if(session.getAttribute("email") == null){
   		response.sendRedirect("Login.jsp");
   	}
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/AddDoctor.css">
<title>Edit</title>
</head>
<body>

	<%@ page import="com.dao.SpecialistDao, com.dao.DoctorDao, com.entity.Specialist, com.entity.Doctor, com.Connection.DatabaseConnect, java.util.*" %>
	<header class="header" id="header">

        <nav class="nav container">
            <a href="index.html" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                <ul class="nav_list">
                    <li class="nav_list">
                        <a href="AdminDash.jsp" class="nav_link">Admin Dash</a>
                    </li>
                    <div class="nav_link">
                        <a href="logout" class="button nav_button">Logout</a>
                    </div>
                </ul>
            </div>
        </nav>
    </header>
    
    <div class="doctor_container">
    	<div class="form_container">
        <div class="box form-box">
            <header>Add Doctor</header>
            <form action="update" method="post" >
            	<%
            		int id = Integer.parseInt(request.getParameter("id"));
            		
            		DoctorDao dao = new DoctorDao(DatabaseConnect.getConnect());
            		
            		Doctor d = dao.getDoctorById(id);
          
            	%>
            	<input type="hidden" value="<%=id%>" name="id">
            	<div class="field input">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="<%= d.getName() %>">
                </div>
                <div class="field input">
                    <label for="dob">DOB</label>
                    <input type="date" name="dob" id="dob" value="<%= d.getDob() %>">
                </div>
                <div class="field input">
                    <label for="qualification">Qualification</label>
                    <input type="text" name="qualification" id="qualification" value="<%= d.getQualification() %>">
                </div>
                <div class="field input">
                    <label for="specialize">Specialize</label>
                    <select name="specialize" id="specialize">
                    	<option><%= d.getSpecialize() %></option>
                    	<%
                    		SpecialistDao dao1 = new SpecialistDao(DatabaseConnect.getConnect());
                    		List<Specialist> list = dao1.getSpecialist();
                    		
                    		for(Specialist s : list){%>
                    			<option><%= s.getSpecialistName() %></option>
                    		<%}
                    	%>
                    </select>
                </div>
                <div class="field input">
                    <label for="email">E-mail</label>
                    <input type="email" name="email" id="email" value="<%= d.getEmail() %>">
                </div>
                <div class="field input">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" id="phone" value="<%= d.getPhone() %>">
                </div>
                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="<%= d.getPassword() %>">
                </div>
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Save">
                </div>
                
            </form>
        </div>
    </div>
    </div>
</body>
</html>
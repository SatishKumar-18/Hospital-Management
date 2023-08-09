<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("email") == null){
		response.sendRedirect("Login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

<link rel="stylesheet" href="CSS/UserViewAppointment.css">
<title>Patient</title>
</head>
<body>

<%@ page import="com.dao.AppointmentDao, com.dao.DoctorDao, com.entity.Appointment, com.entity.Doctor, com.Connection.DatabaseConnect, java.util.*" %>

	<header class="header" id="header">
        <nav class="nav container">
            <a href="index.html" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                <ul class="nav_list">
                    <li class="nav_list">
                        <a href="DoctorViewAppointment.jsp" class="nav_link">View Appointment</a>
                    </li>
                    <li class="nav_list">
                        <a href="PatientList.jsp" class="nav_link active-link">Patient List</a>
                    </li>
                    <li class="nav_list">
                        <a href="ChangePassword.jsp" class="nav_link">Change Password</a>
                    </li>
                    
                    <div class="nav_menu" id="nav-menu">
                    	<div class="nav_link">
                        	<a href="logout" class="button nav_button">Logout</a>
                    	</div>
            		</div>
                </ul>
               
            </div>
        </nav>
    </header>
    
    <div class="doctor_container">
    
    	<div class="doctor_list">
    	<h2>Patients</h2>
    	<table>
    		<tr>
    			<th>Name</th>
    			<th>Gender</th>
    			<th>Age</th>
    			<th>Appointment Date</th>
    			<th>Disease</th>
    			<th>Status</th>
    			<th>Email</th>
    			<th>Phone</th>
    			<th>Address</th>
    		</tr>
    		<tbody>
    			<%
    				int id = (int)session.getAttribute("id");
    			
    				AppointmentDao dao = new AppointmentDao(DatabaseConnect.getConnect());
    				
                    List<Appointment> list = dao.getAppointmentByDoctor(id);
                   	for(Appointment app : list){%>
                   		<tr>
    						<td><%=app.getName() %></td>
    						<td><%=app.getGender() %></td>
    						<td><%=app.getAge() %></td>
    						<td><%=app.getAppDate() %></td>
    						<td><%=app.getDisease() %></td>
    						<td><%=app.getStatus() %></td>
    						<td><%=app.getEmail() %></td>
    						<td><%=app.getPhone() %></td>
    						<td><%=app.getAddress() %></td>
    					</tr>
                   	<%}
    			%>
    		</tbody>
    		
    	</table>
    </div>
    </div>
    
    
    <script src="JS/script.js"></script>
</body>
</html>
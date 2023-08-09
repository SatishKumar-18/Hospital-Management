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
<title>Appointment</title>
</head>
<body>

<%@ page import="com.dao.AppointmentDao, com.dao.DoctorDao, com.dao.UserDao, com.entity.Appointment, com.entity.User, com.entity.Doctor, com.Connection.DatabaseConnect, java.util.*" %>

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
    	<h2>Appointments</h2>
    	<table>
    		<tr>
    			<th>User Name</th>
    			<th>Patient Name</th>
    			<th>Gender</th>
    			<th>Age</th>
    			<th>Appointment Date</th>
    			<th>Phone</th>
    			<th>Disease</th>
    			<th>Doctor</th>
    			<th>Status</th>
    		</tr>
    		<tbody>
    			<%
    				AppointmentDao dao = new AppointmentDao(DatabaseConnect.getConnect());
    				DoctorDao dao2 = new DoctorDao(DatabaseConnect.getConnect());
    				UserDao dao3 = new UserDao(DatabaseConnect.getConnect());
    				
                    List<Appointment> list = dao.getAppointmentByAdmin();
                   	for(Appointment app : list){
                   		Doctor d = dao2.getDoctorById(app.getDoctorId());
                   		User u = dao3.getUserById(app.getUserId());%>
                   		<tr>
                   			<td><%=u.getName() %></td>
    						<td><%=app.getName() %></td>
    						<td><%=app.getGender() %></td>
    						<td><%=app.getAge() %></td>
    						<td><%=app.getAppDate() %></td>
    						<td><%=app.getPhone() %></td>
    						<td><%=app.getDisease() %></td>
    						<td><%=d.getName() %></td>
    						<td>
    						
    							<% if("pending".equals(app.getStatus())){%>
    								<a href="" class="pendingBtn">Pending</a>
    							<% }
    								else{%>
    									<%= app.getStatus() %>
    							<% }%>
    							
    						</td>
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
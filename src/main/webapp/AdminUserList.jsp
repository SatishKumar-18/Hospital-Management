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
<title>Users</title>
</head>
<body>

<%@ page import="com.dao.UserDao, com.entity.User, com.Connection.DatabaseConnect, java.util.*" %>

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
    	<h2>Patients</h2>
    	<table>
    		<tr>
    			<th>Name</th>
    			<th>Email</th>
    		</tr>
    		<tbody>
    			<%
    				UserDao dao = new UserDao(DatabaseConnect.getConnect());
    				
                    List<User> list = dao.getUserByAdmin();
                   	for(User app : list){%>
                   		<tr>
    						<td><%=app.getName() %></td>
    						<td><%=app.getEmail() %></td>
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
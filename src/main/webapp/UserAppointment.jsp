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

<link rel="stylesheet" href="CSS/UserDash.css">
<title>Appointment</title>
</head>
<body>

<%@ page import="com.dao.DoctorDao, com.entity.Doctor, com.Connection.DatabaseConnect, java.util.*" %>

	<header class="header" id="header">
        <nav class="nav container">
            <a href="index.html" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                <ul class="nav_list">
                    <li class="nav_list">
                        <a href="UserAppointment.jsp" class="nav_link active-link">Appointment</a>
                    </li>
                    <li class="nav_list">
                        <a href="UserViewAppointment.jsp" class="nav_link">View Appointment</a>
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
        <div class="app_image">
    		<img src="Images\3922314.jpg" alt="Appointment">
    	</div>
    	<div class="form_container">
        <div class="box form-box">
            <header>Appointment</header>
            <form action="appointment" method="post" >
            	<input type="hidden" name="userId" value="${id}">
            	<%
            		String errorMsg = (String)session.getAttribute("errorMsg");
            		String succMsg = (String)session.getAttribute("succMsg");
            		if(errorMsg != null){%>
            			<p style="color:red; text-align: center"><%=errorMsg%></p>	
            		<%
            			session.removeAttribute("errorMsg");
            		}
            		else if(succMsg != null){%>
        				<p style="color:green; text-align: center"><%=succMsg%></p>	
        			<%
        				session.removeAttribute("succMsg");
            		}
            	%>
            	<div class="field input">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name">
                </div>
                <div class="field input">
                    <label for="age">Age</label>
                    <input type="text" name="age" id="age">
                </div>
                <div class="field input">
                    <label for="gender">Gender</label>
                    <select name="gender" id="sgender">
                    	<option>--Select--</option>
                    	<option>Male</option>
                    	<option>Female</option>
                    	<option>Other</option>
                    </select>
                </div>
                <div class="field input">
                    <label for="appDate">Appointment Date</label>
                    <input type="date" name="appDate" id="appDate">
                </div>
                <div class="field input">
                    <label for="disease">Disease</label>
                    <input type="text" name="disease" id="disease">
                </div>
                <div class="field input">
                    <label for="doctor">Doctor</label>
                    <select name="doctor" id="doctor">
                    	<option>--Select--</option>
                    	<%
                    		DoctorDao dao = new DoctorDao(DatabaseConnect.getConnect());
                    		List<Doctor> list = dao.getDoctor();
                    		
                    		for(Doctor d : list){%>
                    			<option value="<%=d.getId() %>"><%= d.getName() %> (<%=d.getSpecialize() %>)</option>
                    		<%}
                    	%>
                    </select>
                </div>
                <div class="field input">
                    <label for="email">E-mail</label>
                    <input type="email" name="email" id="email">
                </div>
                <div class="field input">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" id="phone">
                </div>
                
      			<div class="field input">
                    <label for="address">Address</label>
                    <textarea name="address" id="address"></textarea>
                </div>
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Book">
                </div>
                
            </form>
        </div>
    	</div>
    </div>
    
</body>
</html>
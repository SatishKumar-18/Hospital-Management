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

<link rel="stylesheet" href="CSS/Comment.css">
<title>Comment</title>
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
                        <a href="PatientList.jsp" class="nav_link">Patient List</a>
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
    	
    	<div class="form_container">
        <div class="box form-box">
            <header>Doctor Feedback</header>
            
            <%
            	int id = Integer.parseInt(request.getParameter("id"));
            	AppointmentDao dao = new AppointmentDao(DatabaseConnect.getConnect());
            	
            	Appointment app = dao.getAppointmentById(id);
            %>
            <form action="updateStatus" method="post" >
            	
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
                    <input type="text" name="name" id="name" readonly value="<%= app.getName() %>">
                </div>
                <div class="field input">
                    <label for="age">Age</label>
                    <input type="text" name="age" id="age" readonly value="<%= app.getAge() %>">
                </div>
               
                <div class="field input">
                    <label for="disease">Disease</label>
                    <input type="text" name="disease" id="disease" readonly value="<%= app.getDisease() %>">
                </div>
                
                <div class="field input">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" id="phone" readonly value="<%= app.getPhone() %>">
                </div>
                
                <div class="field input">
                    <label for="comment">Comment</label>
                    <textarea name="comment" id="comment"></textarea>
                </div>
      			
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Submit">
                </div>
                
                <input type="hidden" name="id" value="<%= app.getId() %>">
                <input type="hidden" name="did" value="<%= app.getDoctorId() %>">
                
            </form>
        </div>
    	</div>
    </div>
    
    
    <script src="JS/script.js"></script>
</body>
</html>
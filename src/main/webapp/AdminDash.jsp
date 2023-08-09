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

<link rel="stylesheet" href="CSS/AdminDash.css">
<title>Admin Dashboard</title>
</head>
<body>
<%@ page import="com.dao.AppointmentDao, com.dao.DoctorDao, com.entity.Appointment, com.entity.Doctor, com.Connection.DatabaseConnect, java.util.*" %>
	<header class="header" id="header">

        <nav class="nav container">
            <a href="index.html" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                    <div class="nav_link">
                        <a href="logout" class="button nav_button">Logout</a>
                    </div>
            </div>

        </nav>
    </header>
    <main class="main">
        <section class="program section" id="program">
            <div class="container">
                <div class="section_data">
                    <div class="section_titles">
                        <h1 class="section_title">ADMIN</h1>
                    </div>
                    <%
            			String errorMsg = (String)session.getAttribute("errMsg");
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
                </div>
                <% DoctorDao dao = new DoctorDao(DatabaseConnect.getConnect()); %>
                <div class="program_container grid">
                    <a href="AddDoctor.jsp"><article class="program_card">
                        <div class="program_shape">
                            <img src="Images/doctor_icon.png" alt="program image" class="program_img">
                        </div>
                        <h3 class="program_title">Doctor</h3>
                        <p><%=dao.countDoctor() %></p>
                        
                    </article></a>

                    <a href="AdminUserList.jsp"><article class="program_card">
                        <div class="program_shape">
                            <img src="Images/group.png" alt="program image" class="program_img">
                        </div>
                        <h3 class="program_title">User</h3>
                        <p><%=dao.countUser() %></p>
                        
                    </article></a>

                   <a href="AdminViewAppointment.jsp"> <article class="program_card">
                        <div class="program_shape">
                            <img src="Images/appointment.png" alt="program image" class="program_img">
                        </div>
                        <h3 class="program_title">Appointment</h3>
                       	<p><%=dao.countAppointment() %></p>
                        
                    </article></a>

                    <article class="program_card" id="specProgram">
                        <div class="program_shape">
                            <img src="Images/nephrologist.png" alt="program image" class="program_img">
                        </div>
                        <h3 class="program_title">Specialist</h3>
                        <p><%=dao.countSpecialist() %></p>
                        
                    </article>
                    
                </div>
            </div>
        </section>
        
        <!-- The Modal -->
       	<div class="modal" id="myModal">
       		<div class="modal-content">
				<span class="close" id="Close">&times;</span>
				<form action="addSpecialist" method="post">
					<div class="field input">
						<label for="specName">Enter Specialist Name</label>
						<input type="text" name="specName" >
					</div>
					<div class="field">
						<input type="submit" class="btn" name="submit" value="Add">
					</div>			
				</form>    		
       		</div>
       	</div>
</main>
        
<script>
	var modal = document.getElementById("myModal");
	var click = document.getElementById("specProgram");
	var span = document.getElementById("Close");
	
	click.addEventListener('click', () =>{
		modal.style.display = "block";
	})
	
	span.addEventListener('click', () =>{
		modal.style.display = "none";
	})
	
	window.addEventListener('click', () =>{
		if(event.target == modal){
			modal.style.display = "none";
		}
	})
</script>
</body>
</html>
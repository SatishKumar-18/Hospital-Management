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
<link rel="stylesheet" href="CSS/AddDoctor.css">
<title>Insert title here</title>
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
            <form action="addDoctor" method="post" >
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
                    <label for="dob">DOB</label>
                    <input type="date" name="dob" id="dob">
                </div>
                <div class="field input">
                    <label for="qualification">Qualification</label>
                    <input type="text" name="qualification" id="qualification">
                </div>
                <div class="field input">
                    <label for="specialize">Specialize</label>
                    <select name="specialize" id="specialize">
                    	<option>--Select--</option>
                    	<%
                    		SpecialistDao dao = new SpecialistDao(DatabaseConnect.getConnect());
                    		List<Specialist> list = dao.getSpecialist();
                    		
                    		for(Specialist s : list){%>
                    			<option><%= s.getSpecialistName() %></option>
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
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password">
                </div>
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Save">
                </div>
                
            </form>
        </div>
    </div>
    <div class="doctor_list">
    	<h2>Doctor List</h2>
    	<table>
    		<tr>
    			<th>Name</th>
    			<th>DOB</th>
    			<th>Qualification</th>
    			<th>Specialization</th>
    			<th>Email</th>
    			<th>Phone</th>
    			<th>Action</th>
    		</tr>
    		<tbody>
    			<%
    				DoctorDao dao2 = new DoctorDao(DatabaseConnect.getConnect());
                    List<Doctor> list2 = dao2.getDoctor();
                   	for(Doctor d : list2){%>
                   		<tr>
    						<td><%=d.getName() %></td>
    						<td><%=d.getDob() %></td>
    						<td><%=d.getQualification() %></td>
    						<td><%=d.getSpecialize() %></td>
    						<td><%=d.getEmail() %></td>
    						<td><%=d.getPhone() %></td>
    						<td>
    							<a href="Edit.jsp?id=<%= d.getId() %>" class="btn">Edit</a>
    							<a href="delete?id=<%= d.getId() %>" class="errBtn">Delete</a>
    						</td>
    					</tr>
                   	<%}
    			%>
    		</tbody>
    		
    	</table>
    </div>
    </div>
</body>
</html>
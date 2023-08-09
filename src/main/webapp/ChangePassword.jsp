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

<link rel="stylesheet" href="CSS/ChangePassword.css">
<title>Change Password</title>
</head>
<body>
<%@ page import="com.dao.UserDao, com.dao.DoctorDao, com.entity.Specialist, com.entity.Doctor, com.Connection.DatabaseConnect, java.util.*" %>
	<header class="header" id="header">

        <nav class="nav container">
            <a href="index.html" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                <ul class="nav_list">  
                    <div class="nav_menu" id="nav-menu">
                    	<div class="nav_link">
                        	<a href="logout" class="button nav_button">Logout</a>
                    	</div>
            		</div>

                </ul>
                
            </div>

        </nav>
    </header>
    
    <div class="form_container">
        <div class="box form-box">
            <header>Change Password</header>
            
            <form action="changePassword" method="post" >
            	
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
                    <label for="newPassword">New Password</label>
                    <input type="password" name="newPassword" id="newPassword">
                </div>
                <div class="field input">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword">
                </div>
      			<input type="hidden" value="${id}" name="did">
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Save Changes">
                </div>
                
            </form>
        </div>
    	</div>
</body>
</html>
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
<title>Dashboard</title>
</head>
<body>
	<header class="header" id="header">

        <nav class="nav container">
            <a href="index.html" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                <ul class="nav_list">
                    <li class="nav_list">
                        <a href="index.html" class="nav_link">Appointment</a>
                    </li>
                    <li class="nav_list">
                        <a href="index.html" class="nav_link">View Appointment</a>
                    </li>
                    <li class="nav_list">
                        <a href="login.html" class="nav_link">Profile</a>
                    </li>
                    
                    <div class="nav_menu" id="nav-menu">
                    	<div class="nav_link">
                        	<a href="logout" class="button nav_button">Logout</a>
                    	</div>
            		</div>

                </ul>
                
                <div class="nav_close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
            </div>

            <!-----Toggle Button------>
            <div class="nav_toggle" id="nav-toggle">
                <i class="ri-menu-line"></i>
            </div>
        </nav>
    </header>
    
    <script src="JS/script.js"></script>
</body>
</html>
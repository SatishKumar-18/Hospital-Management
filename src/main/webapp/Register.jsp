<%@page import="com.Connection.DatabaseConnect"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

<link rel="stylesheet" href="CSS/login.css">
<title>Register</title>
</head>
<body>
	 <header class="header" id="header">

        <nav class="nav container">
            <a href="#" class="nav_logo">
               Medica.
            </a>

            <div class="nav_menu" id="nav-menu">
                <ul class="nav_list">
                    <li class="nav_list">
                        <a href="index.html" class="nav_link">Home</a>
                    </li>
                    <li class="nav_list">
                        <a href="index.html" class="nav_link">Services</a>
                    </li>
                    <li class="nav_list">
                        <a href="login.html" class="nav_link">About Us</a>
                    </li>
                    <li class="nav_list">
                        <a href="login.html" class="nav_link">Contact</a>
                    </li>

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
    
    <div class="form_container">
        <div class="box form-box">
            <header>Sign Up</header>
            <form action="register" method="post">
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
                    <input type="text" name="name" id="username" >
                </div>
                <div class="field input">
                    <label for="Email">E-mail</label>
                    <input type="email" name="Email" id="Email" >
                </div>
               
                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" >
                </div>
               
                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Register">
                </div>
                <div class="links">
                    Already have account? <a href="Login.jsp">Login</a>
                </div>
            </form>
        </div>
    </div>
    

    <script src="JS/login.js"></script>
</body>
</html>
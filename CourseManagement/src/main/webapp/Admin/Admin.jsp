<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="Admin.css">
</head>
<body>
    <nav class="navbar">
        <ul>
            <li><a>Home</a></li>
            <li></li>
            <li><a href="../Logout">Log Out</a></li>
        </ul>
    </nav>
    
    <%
	    response.setHeader("Cache-Control","no-cache, no-store, must-validate"); 
		if(session.getAttribute("uname")==null){
			response.sendRedirect("../index.jsp");
		}
		
		String TYPE=(String)session.getAttribute("type");
		if(TYPE.equals("teacher")){
			response.sendRedirect("../Teacher/Teacher.jsp");
		}
		if(TYPE.equals("student")){
			response.sendRedirect("../Student/Student.jsp");
		}
    
    %>

    <section>
        <div class="student-box">
            <div>
                <h2>Admin</h2>
                <div class="container">
                    <div class="btn"><a href="addcourses.jsp">Add Courses</a></div>
                    <div class="btn"><a href="assign.jsp">Assign Teacher</a></div>
                </div>	
            </div>
        </div>
    </section>

    <script type="module" src="https://u...content-available-to-author-only...g.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://u...content-available-to-author-only...g.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>

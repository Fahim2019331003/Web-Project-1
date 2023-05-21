<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Add Courses</title>
    <link rel="stylesheet" href="Addcourses.css">
</head>

<body>
    <nav class="navbar">
        <ul>
            <li><a href="Admin.jsp">Home</a></li>
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
        <div class ="add-box">
            <form action="../addCourse" method="post">
                <h2>Add Course</h2>
                <div class="input-box">
                    <input type="text" name="courseID" required>
                    <label>Course ID</label>
                </div>
                <div class="input-box">
                    <input type="text" name="coursename" required>
                    <label>Course Name</label>
                </div>
                <div class="input-box">
                    <input type="number" step="0.1" min="0.0" max="4.0" name="credits" required>
                    <label>Credits</label>
                </div>
                <div class="button_container">
                    <button type="submit">Enter This Course</button>
                </div>
            </form>
        </div>
    </section>
    

</body>
</html>
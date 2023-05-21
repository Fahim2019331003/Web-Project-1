<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@page import="java.sql.*"%>
		
	<%@ page import="com.cms.LoginDao" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Student</title>
    <link rel="stylesheet" href="Student.css">
</head>
<body>
    <nav class="navbar">
        <ul>
            <li><a href="Student.jsp">Home</a></li>
            <li></li>
            <li><a href="../Logout">Log Out</a></li>
        </ul>
    </nav>
    
    
    <% response.setHeader("Cache-Control","no-cache, no-store, must-validate"); 
	
    if(session.getAttribute("uname")==null){
		response.sendRedirect("../index.jsp");
	}
	
	String TYPE=(String)session.getAttribute("type");
	if(TYPE.equals("teacher")){
		response.sendRedirect("../Teacher/Teacher.jsp");
	}
	if(TYPE.equals("admin")){
		response.sendRedirect("../Admin/Admin.jsp");
	}
	
	String uname = (String) session.getAttribute("uname");
	
	LoginDao dao=new LoginDao();
	
	ResultSet rs=dao.query("select * from students where username= '"+uname+"'");
	
	String Name=null;
	String StudentID=null;
	
	while(rs.next())
	{
		
		Name=rs.getString("name");
		StudentID=rs.getString("studentID");
		
	}
	
	
	
	%>
	
	
    <section>
        <div class ="student-box">
            <div>
                <div class="iicon"><img src="student.png" height="100" width="100"></div>
                <h2>Student Profile</h2>
                <div class="name-container">
                    <p><label class="xxx"><%= Name %></label></p>
                    <p><label>Reg No: <label class="xxx"><%= StudentID %></label></label></p>
                    
                </div>
                <div class="container">
                    <div class="btn"><a href="courses.jsp">Registered Courses</a></div>
                    <div class="btn"><a href="newcourses.jsp">Register New Courses</a></div>
                </div>
            </div>
        </div>
    </section>

    <script type="module" src="https://u...content-available-to-author-only...g.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://u...content-available-to-author-only...g.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
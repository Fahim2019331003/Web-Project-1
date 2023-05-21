<!DOCTYPE html>
<html lang="en">
<head>

	<%@page import="java.sql.*"%>
		
	<%@ page import="com.cms.LoginDao" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Teacher</title>
    <link rel="stylesheet" href="Teacher.css">
</head>
<body>
	
	<nav class="navbar">
        <ul>
            <li><a href="Teacher.jsp">Home</a></li>
            <li><a href="../Logout">Log Out</a></li>
        </ul>
    </nav>


    <% response.setHeader("Cache-Control","no-cache, no-store, must-validate");
    	
    	if(session.getAttribute("uname")==null){
    		response.sendRedirect("../index.jsp");
    	}
    	
    	String TYPE=(String)session.getAttribute("type");
    	if(TYPE.equals("student")){
    		response.sendRedirect("../Student/Student.jsp");
    	}
    	if(TYPE.equals("admin")){
    		response.sendRedirect("../Admin/Admin.jsp");
    	}
    
    
    %>
    <% 
	
	
	String uname = (String) session.getAttribute("uname");
	
	LoginDao dao=new LoginDao();
	
	ResultSet rs=dao.query("select * from teachers where username= '"+uname+"'");
	
	String Name=null;
	String TeacherID=null;
	
	while(rs.next())
	{
		
		Name=rs.getString("name");
		TeacherID=rs.getString("teacherID");
		
	}
	
	
	
	%>
    <section>
        <div class ="student-box">
            <div>
                <div class="iicon"><img src="teacher.png" height="100" width="100"></div>
                <h2>Teacher Profile</h2>
                <div class="name-container">
                    <p><label class="xxx"><%= Name %></label></p>
                    <label>Identification No: <label class="xxx"><%=TeacherID %></label></label>
                </div>
                <div class="button_container">
                    <a href="courses.jsp"><button type="button">Registered Courses</button></a>
                </div>
            </div>
        </div>
    </section>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
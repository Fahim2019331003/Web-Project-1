<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student</title>

	<%@page import="java.sql.*"%>
	
	<%@ page import="com.cms.LoginDao" %>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin Table</title>
    <link rel="stylesheet" href="demo.css">
	
	
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
	
	<%
    try
    {
    	String courseID=request.getParameter("courseID");
    	
    	%>
    	
    	<%
    	
    	LoginDao dao=new LoginDao();
    	ResultSet rs=dao.query("select * from teachers;");
    	
    %>
    <h2>Teacher Selection For Course <%= courseID %></h2>
    <div class="table-wrapper">
    <table class="fl-table">
      <thead>
          <tr>
             <th>Teacher Name</th>
             <th>Teacher ID</th>
             <th>Assign Him</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
            	<% String username=rs.getString("username"); 
            		String userandID= username+"#"+courseID;
            	%>
                
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("teacherID") %></td>
                <td><form action="../updateTeacher"><button type="submit" name="userandID" value=<%= userandID %>>Assign</button></form></td>
            </tr>
            <%}%>
           </tbody>
        </table>
        </div><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    
    %>
	

</body>
</html>
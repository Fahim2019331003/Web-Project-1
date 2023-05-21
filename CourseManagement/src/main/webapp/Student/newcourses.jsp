<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
	
	%>
	
	
	<%
	
	if(session.getAttribute("uname")==null){
    	response.sendRedirect("../index.jsp");
    }
	
    try
    {
    	String uname = (String) session.getAttribute("uname");
    	LoginDao dao=new LoginDao();
    	ResultSet rs=dao.query("select * from courses where not exists(select * from takes where takes.courseID=courses.courseID and username='"+uname+"');");
    	
    %>
    <h2>Add A Course</h2>
    <div class="table-wrapper">
    <table class="fl-table">
      <thead>
          <tr>
             <th>Course ID</th>
             <th>Course Name</th>
             <th>Enroll</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
            <% String courseID=rs.getString("courseID");
                 
                %>
                <td><%=courseID %></td>
                <td><%=rs.getString("coursename") %></td>
                
                <td><form action="../enrollment"><button type="submit" name="courseID" value=<%=courseID%>>Enroll</button></form></td>
            </tr>
            <%}%>
           </tbody>
        </table></div><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    
    %>
	

</body>
</html>
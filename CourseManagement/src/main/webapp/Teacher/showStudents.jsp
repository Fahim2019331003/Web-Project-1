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
    <title>Teacher</title>
    <link rel="stylesheet" href="demo.css">
	
	
</head>
<body>

	<nav class="navbar">
        <ul>
            <li><a href="Teacher.jsp">Home</a></li>
            <li></li>
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
    try
    {
    	String id=request.getParameter("courseID");
    	%>
    	
    	<%
		LoginDao dao=new LoginDao();
		
			ResultSet rs= dao.query("select * from takes where courseID='"+id+"';");
			
			
			
			
			
		
    %><h2>Registered Students for: <%= id %></h2>
    <div class="table-wrapper">
    <table class="fl-table">
      <thead>
          <tr>
             <th>Student Name</th>
             <th>Student ID</th>
             
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
        	
        	String username=rs.getString("username");
        	LoginDao dao2=new LoginDao();
        	ResultSet rs2= dao2.query("select * from students where username='"+username+"';");
        	String name=null;
        	String stu_id=null;
        	while(rs2.next())
        	{
        		name=rs2.getString("name");
        		stu_id=rs2.getString("studentID");
        	}
            %>
            <tr>
             
                <td><%= name %></td>
                <td><%= stu_id %></td>
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
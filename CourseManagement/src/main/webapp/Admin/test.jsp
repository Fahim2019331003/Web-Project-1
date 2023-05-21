<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin Table</title>
    <link rel="stylesheet" href="demo.css">

	<%@page import="java.sql.*"%>
	
	<%@ page import="com.cms.LoginDao" %>
	
	
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
    try
    {
    	
    	LoginDao dao=new LoginDao();
    	ResultSet rs=dao.query("select * from courses where not exists(select * from teaches where teaches.courseID=courses.courseID);");
    	
    %>
    <h2>Courses</h2>
    <div class="table-wrapper">
    <table class="fl-table">
        <thead>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Credits</th>
                <th>Assign</th>
            </tr>
        </thead>
        <%while(rs.next())
        {
            %>
            <tr>
            <% String courseID=rs.getString("courseID");
                 
                %>
                <td><%=courseID %></td>
                <td><%=rs.getString("coursename") %></td>
                <td><%=rs.getString("credit") %></td>
                <td><form action="selectTeacher.jsp"><div class="button_container"><button type="submit" name="courseID" value=<%=courseID%>>Assign Teacher</button></div></form></td>
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
package com.cms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/enrollment")
public class enrollment extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id=request.getParameter("courseID");
		LoginDao dao=new LoginDao();
		try {
			ResultSet rs= dao.query("select * from courses where courseID='"+id+"';");
			
			String courseID=id;
			String coursename = null;
			
			while(rs.next()) {
				coursename=rs.getString("coursename");
			}
			
			InsertDB db=new InsertDB();
			HttpSession session=request.getSession();
			String username= (String) session.getAttribute("uname");
			db.insertCourse(username,coursename,courseID);
			
			
			response.sendRedirect("Student/newcourses.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

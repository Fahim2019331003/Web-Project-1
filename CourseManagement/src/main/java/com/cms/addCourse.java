package com.cms;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/addCourse")
public class addCourse extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String courseid=request.getParameter("courseID");
		String coursename=request.getParameter("coursename");
		String credits=request.getParameter("credits");
		try {
			
			
			InsertDB db=new InsertDB();
			
			
			db.insertCourse(coursename,courseid,Float.parseFloat(credits));
			
			
			response.sendRedirect("Admin/addcourses.jsp");
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package com.cms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/updateTeacher")
public class updateTeacher extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String s=request.getParameter("userandID");
		
		String[] result=s.split("#");
		String username=result[0];
		String courseID=result[1];
		String coursename=null;
		System.out.println(username+" "+courseID);
		
		
		try {
			
			LoginDao dao=new LoginDao();
			
			ResultSet rs = dao.query("select * from courses where courseID='"+courseID+"';");
			
			while(rs.next()) {
				coursename=rs.getString("coursename");
			}
			
			
			InsertDB db=new InsertDB();
			
			db.assignTeacher(username,coursename,courseID);
			
			
			response.sendRedirect("Admin/assign.jsp");
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

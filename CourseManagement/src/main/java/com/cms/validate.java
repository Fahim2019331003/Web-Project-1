package com.cms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/validate")
public class validate extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("username");
		String pass=request.getParameter("password");
		String type=request.getParameter("userType");
		System.out.println(uname + " "+pass+" "+type);
		
		
		
		
		
		
		
		
		LoginDao dao=new LoginDao();
		HttpSession session= request.getSession();
		try {
			if(dao.check(type, uname, pass)) {
				
				
				
				session.setAttribute("type", type);
				session.setAttribute("uname", uname);
				
				if(session.getAttribute("error")!=null) {
					session.removeAttribute("error");
				}
				
				
				if(type.equals("admin"))
				{
					response.sendRedirect("Admin/Admin.jsp");
				}
				else if(type.equals("student")) {
					response.sendRedirect("Student/Student.jsp");
				}
				else {
					response.sendRedirect("Teacher/Teacher.jsp");
				}
				
				
				
				
				
				
			}
			else {
				session.setAttribute("error","invalid");
				response.sendRedirect("index.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}

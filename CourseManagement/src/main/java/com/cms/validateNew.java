package com.cms;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/validateNew")
public class validateNew extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session=request.getSession();
		String uname=request.getParameter("username");
		String pass=request.getParameter("password");
		String type=request.getParameter("userType");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		LoginDao dao=new LoginDao();
		
		boolean flag=false;
		
		try {
			if(dao.check(type, uname))
			{
				System.out.println("okkkkkk");
				InsertDB idb=new InsertDB();
				idb.insert(type,uname,name,id,pass);
				
				
			}
			else flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(flag==true) {
			
			session.setAttribute("error2", "Invalid");
		}
		else {
			
			session.setAttribute("success", "success");
						
		}
		
		response.sendRedirect("signup.jsp");
		
		
	}

}

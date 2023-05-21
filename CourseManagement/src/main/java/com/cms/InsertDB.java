package com.cms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertDB {
	
	String url="jdbc:mysql://localhost:3306/course_management";
	String uname="root";
	String pass="1234";
	String sql;
	
	public void insert(String type,String username,String name,String id,String password) throws SQLException
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement("insert into users values(?,?,?)");
			PreparedStatement st2;
		
			st.setString(1, type);
			st.setString(2, username);
			st.setString(3, password);
			if(type.equals("student")) {
				sql="insert into students values(?,?,?)";
				st2=con.prepareStatement(sql);
				
			}
			else {
				sql="insert into teachers values(?,?,?)";
				st2=con.prepareStatement(sql);
			}
			
			st2.setString(1, username);
			st2.setString(2, name);
			st2.setInt(3, Integer.parseInt(id));
			
			st.executeUpdate();
			st2.executeUpdate();
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	
	public void insertCourse(String username,String coursename,String courseID) throws SQLException
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement("insert into takes values(?,?,?)");
		
			st.setString(1, username);
			st.setString(2, coursename);
			st.setString(3, courseID);
			
			
			st.executeUpdate();
			
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	public void insertCourse(String coursename,String courseID,Float credit) throws SQLException
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement("insert into courses values(?,?,?)");
		
			st.setString(1, coursename);
			st.setString(2, courseID);
			st.setFloat(3, credit);
			
			
			st.executeUpdate();
			
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	public void assignTeacher(String username,String coursename,String courseID) throws SQLException
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement("insert into teaches values(?,?,?)");
		
			st.setString(1, username);
			st.setString(2, coursename);
			st.setString(3, courseID);
			
			
			st.executeUpdate();
			
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
}

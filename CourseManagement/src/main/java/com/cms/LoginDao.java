package com.cms;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	String sql="select * from users where type=? and username=? and password=?";
	String url="jdbc:mysql://localhost:3306/course_management";
	String uname="root";
	String pass="1234";
	
	
	public boolean check(String type,String username,String password) throws SQLException
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement(sql);
			
			st.setString(1, type);
			st.setString(2, username);
			st.setString(3, password);
			
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean check(String type,String username) throws SQLException
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement("select * from users where username=?");
			
			st.setString(1, username);
			
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				return false;
			}
			else return true;
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
		
	}
	
	public ResultSet query(String que) throws ClassNotFoundException, SQLException
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			PreparedStatement st=con.prepareStatement(que);
			
			ResultSet rs=st.executeQuery();
			
			
			return rs;
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>

	<% response.setHeader("Cache-Control","no-cache, no-store, must-validate"); 
		
	if(session.getAttribute("uname")!=null){
		
		String type=(String)session.getAttribute("type");
		if(type.equals("admin") ){
			response.sendRedirect("Admin/Admin.jsp");
		}
		else if(type.equals("student")){
			response.sendRedirect("Student/Student.jsp");
		}
		else{
			response.sendRedirect("Teacher/Teacher.jsp");
		}
		
	}
	
	
	%>
    
    <section>
        <div class ="login-box">
            <form action="validate" method="post">
                <h2>Login</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <input type="text" name="username" required>
                    <label>Username</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" name="password" required>
                    <label>Password</label>
                </div>
                <div class="userType">
                    <label>
                        <input type="radio" value="admin" name="userType" checked>Admin
                    </label>
                    <label>
                        <input type="radio" value="teacher" name="userType">Teacher
                    </label>
                    <label>
                        <input type="radio" value="student" name="userType">Student
                    </label>
                    
                </div>
                <div class="register-link">
                <% 
                	if(session.getAttribute("error")!=null){
                		out.print("Invalid Username or Password!");
                		session.removeAttribute("error");
                	}
                %>
                </div>
                <div class="button_container">
                    <button type="submit">Login</button>
                </div>
                
                <div class="register-link">
                    <p>Don't have an account? <a href="signup.jsp">Register</a></p>
                </div>
            </form>
        </div>
    </section>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
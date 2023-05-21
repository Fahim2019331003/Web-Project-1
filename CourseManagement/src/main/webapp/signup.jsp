<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="signup.css">
</head>
<body>
    <% response.setHeader("Cache-Control","no-cache, no-store, must-validate"); %>
    <section>
        <div class ="reg-box">
            <form action="validateNew" method="post">
                <h2>Register</h2>
                <div class="input-box">
                    <input type="text" name="username" required>
                    <label>Username</label>
                </div>
                <div class="input-box">
                    <input type="text" name="name" required>
                    <label>Full Name</label>
                </div>
                <div class="input-box">
                    <input type="number" name="id" required>
                    <label>Identification No</label>
                </div> 
                <div class="input-box">
                  <input type="email" name="email" required>
                  <label>E-mail</label>
                </div>
                <div class="input-box">
                    <input type="password" name="password" required>
                    <label>Password</label>
                </div>
                <div class="userType">
                    <label>
                        <input type="radio" value="teacher" name="userType" >Teacher
                    </label>
                    <label>
                        <input type="radio" value="student" name="userType" checked>Student
                    </label>
                </div>
                <div class="register-link">
                <% 
                	if(session.getAttribute("error2")!=null){
                		out.print("This Username Already Exists!");
                		session.removeAttribute("error2");
                	}
                	if(session.getAttribute("success")!=null){
                		out.print("Successfully Created Account!");
                		session.removeAttribute("success");
                	}
                %>
                </div>
                <div class="button_container">
                    <button type="submit">Register</button>
                </div>
                <div class="button_container">
                    <a href="index.jsp"><button type="button">Back To Login</button></a>
                </div>
            </form>
            <br>
            
        </div>
        
    </section>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
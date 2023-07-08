<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.ServletRequest"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Images/Java_logo_001.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <link href="index-styles.css" rel="stylesheet" />
        <style>
            body {
                    margin: 0px;
                    padding: 0px;
                    font-family: Arial, Helvetica, sans-serif;
                    background: url('Images/blue-background.jpg');
                    background-size: cover;
                    background-attachment: fixed;
                    font-size: 1em;
                    color: black;
                    }
                * {box-sizing: border-box}

                input[type=text], input[type=password] {
                  width: 100%;
                  padding: 15px;
                  margin: 5px 0 22px 0;
                  display: inline-block;
                  border: none;
                  background: #f1f1f1;
                }
                .container1 {
                        width: 60%;
                        margin: auto;
                    }

                input[type=text]:focus, input[type=password]:focus {
                  background-color: #ddd;
                  outline: none;
                }

                hr {
                  border: 1px solid #f1f1f1;
                  margin-bottom: 25px;
                }

                button {
                  border-color: gray;
                  background-color: #066173;
                  color: white;
                  padding: 14px 20px;
                  margin: 8px 0;

                  cursor: pointer;
                  width: 100%;
                  opacity: 0.9;
                }

                button:hover {
                  background-color: lightseagreen;
                  opacity:1;
                }

                .cancelbtn {
                  padding: 14px 20px;
                  color: black;
                  background-color: lightgray;
                }

                .cancelbtn, .signupbtn {
                  width: 25%;
                }

                .container {
                  padding: 16px;
                }

                .clearfix::after {
                  content: "";
                  clear: both;
                  display: table;
                }

                @media screen and (max-width: 300px) {
                  .cancelbtn, .signupbtn {
                     width: 100%;
                  }
                }
                .c_d_time{
                    font-family: Arial, Helvetica, sans-serif;
                    color: black;
                    font-weight: bold;
                    margin-top: 10%;
                }
        </style>
        
    </head>
    <body>  
            <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
                    <a class="navbar-brand" href="#page-top">JAVA BANK</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
                        
                        <div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
                                        <li class="nav-item mx-0 mx-lg-1"><a
                                                        class="nav-link py-3 px-0 px-lg-3 rounded" href="Account_Open_01.jsp">Balance</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="My_Profile.jsp">My Profile</a></li>
                                        <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Money_Transfer.jsp">Money Transfer</a></li>
                                        <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Transaction_History.jsp">Transaction History</a></li>
                                        <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Fixed_Deposit.jsp">Fixed Deposit</a></li>
                                        <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Change_Password.jsp">Change Password</a></li>
				</ul>
			</div>
                        
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout_servlet">Log out</a></li>
				</ul>
			</div>
                    </div>
                   </nav>
                    
                    <div class="c_d_time">
                        <jsp:useBean id="now" class="java.util.Date" />     
                        <fmt:formatDate type="both"  var="current_date_time" value="${now}" />
                        &#128197;<c:out value="${current_date_time}"></c:out>
                    </div><br>
                    
        <div class="container1">
            <form action="Change_Password_01.jsp" style="border:1px solid #ccc" method="post">
                <div class="container">
                    <h1 align="center">Change Password &#128273;</h1>
                        <hr>

                    <label><b>Account Number</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${sessionScope.ac_number}"></c:out>
                    </div>
            
                    <label for="old_password"><b>Old Password</b></label>
                    <input type="password" placeholder="Old password" name="old_password" required/>
            
                    <label for="password"><b>New Password</b></label>
                    <input type="password" 
                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$"
                           title="At least 1 Uppercase
At least 1 Lowercase
At least 1 Number
At least 1 Symbol
symbol allowed --> !@#$%^&*_=+-
Min 8 chars and Max 20 chars"
                            placeholder="Create new password" name="password" required/>

                    <label for="password_repeat"><b>Re-enter Password</b></label>
                    <input type="password"
                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$"
                           title="At least 1 Uppercase
At least 1 Lowercase
At least 1 Number
At least 1 Symbol
symbol allowed --> !@#$%^&*_=+-
Min 8 chars and Max 20 chars"
                           placeholder="Repeat Password" name="password_repeat" required/>

                    <label>
                        <input type="checkbox" name="accept" style="margin-bottom:15px" required/>Accept all
                    </label>

                    <div class="clearfix">
                    <button type="submit" class="signupbtn">Submit</button>
                    </div>
                </div>
            </form>
        </div>                   
    </body>
</html>
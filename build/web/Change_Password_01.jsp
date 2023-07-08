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
        <title>Change Password</title>
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
                    
                    <c:set var="account_no" value="${sessionScope.ac_number}"></c:set>
                    <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:query dataSource="${conn}" var="rs">select * from account_details where account_no=?;
            <sql:param value="${account_no}"/>
            </sql:query>
            
            <c:forEach items="${rs.rows}" var="row">     
                <c:set var="x3" value="${row.password}"></c:set>       
            </c:forEach>
            
            <c:choose>
                
                <c:when test="${param.old_password==x3}">
                            <sql:update dataSource="${conn}" var="up">update account_details set password=? where account_no=?;
                                <sql:param value="${param.password_repeat}"/>
                                <sql:param value="${account_no}"/>
                            </sql:update>
                            <c:if test="${up>0}">
                                    <h2 class="container1">Your password has been changed successfully...</h2>
                            </c:if>            
                </c:when>
                <c:otherwise>
                        <%
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Invalid old password !!!');");
                            out.println("location='Change_Password.jsp';");
                            out.println("</script>");
                            RequestDispatcher rd1=request.getRequestDispatcher("/Change_Password.jsp");
                            rd1.include(request, response); 
                            %>
                
                </c:otherwise>
            </c:choose>
    </body>
</html>
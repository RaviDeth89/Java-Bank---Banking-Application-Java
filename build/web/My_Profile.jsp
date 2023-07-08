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
        <title>My Profile</title>
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
            }
            * {box-sizing: border-box}
            .container2 {
                width: 50%;
                margin: 0 auto;
               
            }
            .container1 {
                width: 100%;
                margin: 0 auto;
                margin-left: 18%;
                margin-right: 50%;
            }
            table {
                  border: 2px solid #ccc;
                  border-collapse: collapse;
                  margin: 0;
                  padding: 0;
                  width: 60%;
                  table-layout: fixed;
                }

                table caption {
                  font-size: 1.5em;
                  margin: .5em 0 .75em;
                }

                table tr {
                  background-color: #f8f8f8;
                  border: 1px solid #ddd;
                  padding: .35em;
                }

                table th,
                table td {
                  padding: .625em;
                  text-align: center;
                }

                table th {
                  font-size: .85em;
                  letter-spacing: .1em;
                  text-transform: uppercase;
                }

                @media screen and (max-width: 600px) {
                  table {
                    border: 0;
                  }

                  table caption {
                    font-size: 1.3em;
                  }

                  table thead {
                    border: none;
                    height: 1px;
                    margin: -1px;
                    overflow: hidden;
                    padding: 0;
                    position: absolute;
                    width: 1px;
                  }

                  table tr {
                    border-bottom: 3px solid #ddd;
                    display: block;
                    margin-bottom: .625em;
                  }

                  table td {
                    border-bottom: 1px solid #ddd;
                    display: block;
                    font-size: .8em;
                    text-align: right;
                  }

                  table td::before {
                    content: attr(data-label);
                    float: left;
                    font-weight: bold;
                    text-transform: uppercase;
                  }

                  table td:last-child {
                    border-bottom: 0;
                  }
                }
                .btn:hover{
                    background-color: rgb(192, 192, 192);
                } 
                .c_d_time{
                    font-family: Arial, Helvetica, sans-serif;
                    color: black;
                    font-weight: bold;
                    margin-top: 8%;
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
                            <c:set var="x1" value="${row.account_no}"></c:set>
                            <c:set var="x2" value="${row.full_name}"></c:set>
                            <c:set var="x3" value="${row.father_name}"></c:set> 
                            <c:set var="x4" value="${row.address}"></c:set>
                            <c:set var="x5" value="${row.city}"></c:set>
                            <c:set var="x6" value="${row.state}"></c:set>
                            <c:set var="x7" value="${row.pincode}"></c:set>
                            <c:set var="x8" value="${row.aadhar_no}"></c:set>
                            <c:set var="x9" value="${row.dob}"></c:set>
                            <c:set var="x10" value="${row.age}"></c:set>
                            <c:set var="x11" value="${row.account_type}"></c:set>
                            <c:set var="x12" value="${row.gender}"></c:set> 
                            <c:set var="x13" value="${row.mob_no}"></c:set>
                            <c:set var="x14" value="${row.email_id}"></c:set>
                            <c:set var="x15" value="${row.reg_date}"></c:set>
                            <c:set var="x16" value="${row.reg_time}"></c:set>
                            <c:set var="x17" value="${row.card_no}"></c:set>
                            <c:set var="x18" value="${row.balance}"></c:set>
                        </c:forEach>
                        
            <div class="container2">
                    <h1 align="center">My Profile</h1>
                        <hr>

                    <label><b>Account Number</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x1}"></c:out>
                    </div>
                    
                    <label><b>Full Name</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x2}"></c:out>
                    </div>
                    
                    <label><b>Father's Name</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x3}"></c:out>
                    </div>
                    
                    <label><b>Address</label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x4}"></c:out>
                    </div>
                    
                    <label><b>City</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x5}"></c:out>
                    </div>
                    
                    <label><b>State</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x6}"></c:out>
                    </div>
                    
                    <label><b>Pin Code</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x7}"></c:out>
                    </div>
                    
                    <label><b>Aadhar Card No.</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x8}"></c:out>
                    </div>
                    
                    <label><b>Date of Birth (YYYY/MM/DD)</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x9}"></c:out>
                    </div>
                    
                    <label><b>Age</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x10}"></c:out>
                    </div>
                    
                    <label><b>Account Type</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x11}"></c:out>
                    </div>
                    
                    <label><b>Gender</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x12}"></c:out>
                    </div>
                    
                    <label><b>Mobile Number</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x13}"></c:out>
                    </div>
                    
                    <label><b>Email-id</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x14}"></c:out>
                    </div>
                    
                    <label><b>Account Registration Date</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x15}"></c:out>
                    </div>
                    
                    <label><b>Account Registration Time</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x16}"></c:out>
                    </div>
                    
                    <label><b>ATM Card No.</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="${x17}"></c:out>
                    </div>   
                    
                    <label><b>Current Balance</b></label>
                    <div style="width: 100%;
                        padding: 15px;
                        margin: 5px 0 22px 0;
                        display: inline-block;
                        border: none;
                        background: #f1f1f1;">
                        <c:out value="Rs. ${x18}"></c:out>
                    </div>
    </body>
</html>
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
        <title>Fix Deposit</title>
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
               .container2 {
                      width: 100%; 
                      padding: 2%;
                      margin: auto;
                      font-size: 1.10em;
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
                width: 40%;
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

              .container3 {
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
                    margin-top: 8%;
                }
                .container4 {
                padding: 16px;
                margin-left: 60%;
              }
              table {
                  border: 2px solid gray;
                  border-collapse: collapse;
                  margin: 0;
                  padding: 0;
                  width: 100%;
                  table-layout: fixed;
                }

                table caption {
                  font-size: 1.5em;
                  margin: .5em 0 .75em;
                }

                table tr {
                  border: 1px solid gray;
                  padding: .35em;
                }

                table th,
                table td {
                  padding: .625em;
                  text-align: center;
                  border: 1px solid lightgray;
                }

                table th {
                  font-size: .85em;
                  letter-spacing: .1em;
                  text-transform: uppercase;
                  font-weight: bold;
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
                    border-bottom: 3px solid lightgray;
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
                    </div>
                    
                    <form action="Fixed_deposit_request.jsp" method="post"> 
                                    <div class="container4">
                                        <a style="font-size:1.20em;font-weight: bold;">Request for Fixed deposit  :</a>
                                        <button class="btn btn-primary btn-xl" id="newuser"
                                            type="submit">Send Request</button>    
                                    </div>
                                </form>
                    
            <div class="container1">
                <h2 align="center" style="font-weight:normal;">Fixed Deposit</h2>
             <c:set var="account_no" value="${sessionScope.ac_number}"></c:set>
            <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:query dataSource="${conn}" var="rs">select * from fixed_deposit where account_no=?;
            <sql:param value="${account_no}"/>
            </sql:query>
                    
                    <div class="container2"> 
                        
                        <table>
                            <tr>
                                <th>FD Number</th>
                                <th>Account Number</th>
                                <th>Name</th>
                                <th>Date and Time</th>
                                <th>Interest Rate per annum (%)</th>
                                <th>Principal Amount</th>
                                <th>Maturity Amount</th>
                            </tr>

                            <c:forEach items="${rs.rows}" var="row">
                            <tr>
                                <td><c:out value="${row.fd_number}"></c:out></td>
                                <td><c:out value="${row.account_no}"></c:out></td>
                                <td><c:out value="${row.account_holder_name}"></c:out></td>
                                <td><c:out value="${row.reg_date_time}"></c:out></td>
                                <td><c:out value="${row.interest_rate}"></c:out></td>
                                <td><c:out value="Rs. ${row.fixed_deposit_amount}"></c:out></td>
                                <td><c:out value="Rs. ${row.maturity_amount}"></c:out></td>
                                
                            </tr>
                            </c:forEach>
                        </table>
                    </div>     
            
        </div>           
                                                                 
    </body>
</html>
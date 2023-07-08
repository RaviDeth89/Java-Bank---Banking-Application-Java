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
        <title>Quick Money Transfer</title>
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
            
            <c:set var="account_no" value="${sessionScope.ac_number}"></c:set> 
            <c:choose>
                <c:when test="${account_no==param.ts_account_no}">
                   <%
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Beneficiary and your account number must be different !!!');");
                    out.println("location='Money_Transfer.jsp';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/Money_Transfer.jsp");
                    rd.include(request, response);
                    %> 
                </c:when>
                <c:otherwise>
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
                        <c:set var="x3" value="${row.password}"></c:set> 
                        <c:set var="x4" value="${row.balance}"></c:set> 
                    </c:forEach>

                    <c:choose>

                        <c:when test="${param.password==x3}">

                            <c:set var="finalbal" value="${x4-param.ts_amount}"></c:set>
                            <c:if test="${finalbal<1000}">
                                <% 
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Insufficient balance !!!');");
                                out.println("location='Money_Transfer.jsp';");
                                out.println("</script>");
                                RequestDispatcher rd1=request.getRequestDispatcher("/Money_Transfer.jsp");
                                rd1.include(request, response);
                                %>
                            </c:if>
                            <c:if test="${finalbal>=1000}">

                                <sql:query dataSource="${conn}" var="rs1">select * from account_details where account_no=?;
                                <sql:param value="${param.ts_account_no}"/>
                                </sql:query>

                                <c:forEach items="${rs1.rows}" var="row1">     
                                    <c:set var="y1" value="${row1.account_no}"></c:set>
                                    <c:set var="y2" value="${row1.full_name}"></c:set>
                                    <c:set var="y4" value="${row1.balance}"></c:set> 
                                </c:forEach>
                                <c:set var="finalbal1" value="${y4+param.ts_amount}"></c:set>
                                <sql:update dataSource="${conn}" var="up">update account_details set balance=? where account_no=?;
                                    <sql:param value="${finalbal1}"/>
                                    <sql:param value="${param.ts_account_no}"/>
                                    </sql:update>

                                <sql:update dataSource="${conn}" var="up1">update account_details set balance=? where account_no=?;
                                <sql:param value="${finalbal}"/>
                                <sql:param value="${sessionScope.ac_number}"/>
                                </sql:update>

                                <jsp:useBean id="now1" class="java.util.Date" />     
                                <fmt:formatDate type="date"  var="date" value="${now1}" />
                                <fmt:formatDate type="time"  var="time" value="${now1}" />
                                <c:set var="date" value="${date}"></c:set>
                                <c:set var="time" value="${time}"></c:set>

                                <sql:update dataSource="${conn}" var="up2">insert into transaction_details (account_no,ac_holder_name,description,date,time,credit_debit,transfer_balance,current_balance) values(?,?,?,?,?,?,?,?);
                                    <sql:param value="${y1}"/>
                                    <sql:param value="${x2}"/>    
                                    <sql:param value="Transfer from account no. ${x1}"/>
                                    <sql:param value="${date}"/>
                                    <sql:param value="${time}"/>
                                    <sql:param value="Credit"/>
                                    <sql:param value="+${param.ts_amount}"/>
                                    <sql:param value="${finalbal1}"/>
                                    </sql:update>

                                <sql:update dataSource="${conn}" var="up3">insert into transaction_details (account_no,ac_holder_name,description,date,time,credit_debit,transfer_balance,current_balance) values(?,?,?,?,?,?,?,?);
                                    <sql:param value="${x1}"/>
                                    <sql:param value="${x2}"/>    
                                    <sql:param value="Transfer to account no. ${y1}"/>
                                    <sql:param value="${date}"/>
                                    <sql:param value="${time}"/>
                                    <sql:param value="Debit"/>
                                    <sql:param value="-${param.ts_amount}"/>
                                    <sql:param value="${finalbal}"/>
                                </sql:update>

                                <c:if test="${up > 0}">
                                    <h2>Transaction is successfully completed.</h2>
                                </c:if> 
                            </c:if>   

                        </c:when>

                            <c:otherwise>
                                <%
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Invalid password !!!');");
                                out.println("location='Money_Transfer.jsp';");
                                out.println("</script>");
                                RequestDispatcher rd2=request.getRequestDispatcher("/Money_Transfer.jsp");
                                rd2.include(request, response);
                                %>
                            </c:otherwise>

                    </c:choose>
                </c:otherwise>
            </c:choose>
                  
    </body>
</html>
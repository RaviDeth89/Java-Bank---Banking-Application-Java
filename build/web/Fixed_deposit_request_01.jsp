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
        <title>Fix Deposit Request</title>
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
</style>
    </head>
    <body>
         <div class="c_d_time">
                        <jsp:useBean id="now" class="java.util.Date" />     
                        <fmt:formatDate type="both"  var="reg_date_time" value="${now}" />
                        &#128197;<c:out value="${reg_date_time}"></c:out>
                    </div><br>
                    
         <c:set var="account_no" value="${sessionScope.ac_number}"></c:set>z
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
                    
                    <c:set var="finalbal" value="${x4-param.amount}"></c:set>
                    <c:if test="${finalbal<1000}">
                        <% 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Insufficient balance !!!');");
                        out.println("location='Fixed_deposit_request.jsp';");
                        out.println("</script>");
                        RequestDispatcher rd1=request.getRequestDispatcher("/Fixed_deposit_request.jsp");
                        rd1.include(request, response);
                        %>
                    </c:if>
                    <c:if test="${finalbal>=1000}">
                        <c:set var="interest_rate" value="8.5"></c:set>
                        <c:set var="maturity_amount" value="${param.amount+((param.amount*interest_rate)/100)}"> </c:set> 
                        <sql:update dataSource="${conn}" var="up">insert into fixed_deposit (account_no,account_holder_name,password,reg_date_time,interest_rate,fixed_deposit_amount,maturity_amount) values(?,?,?,?,?,?,?);
                            <sql:param value="${account_no}"/>
                            <sql:param value="${x2}"/>
                            <sql:param value="${x3}"/>
                            <sql:param value="${reg_date_time}"/>
                            <sql:param value="${interest_rate}"/>
                            <sql:param value="${param.amount}"/>
                            <sql:param value="${maturity_amount}"/>
                        </sql:update>
                        
                        <sql:update dataSource="${conn}" var="up1">update account_details set balance=? where account_no=?;
                        <sql:param value="${finalbal}"/>
                        <sql:param value="${account_no}"/>
                        </sql:update>
                        
                        <jsp:useBean id="now1" class="java.util.Date" />     
                        <fmt:formatDate type="date"  var="date" value="${now1}" />
                        <fmt:formatDate type="time"  var="time" value="${now1}" />
                        <c:set var="date" value="${date}"></c:set>
                        <c:set var="time" value="${time}"></c:set>
                        
                        <sql:update dataSource="${conn}" var="up3">insert into transaction_details (account_no,ac_holder_name,description,date,time,credit_debit,transfer_balance,current_balance) values(?,?,?,?,?,?,?,?);
                            <sql:param value="${x1}"/>
                            <sql:param value="${x2}"/>    
                            <sql:param value="Fix deposit approved"/>
                            <sql:param value="${date}"/>
                            <sql:param value="${time}"/>
                            <sql:param value="Debit"/>
                            <sql:param value="-${param.amount}"/>
                            <sql:param value="${finalbal}"/>
                        </sql:update>
                    
                        <c:if test="${up > 0}">
                            <c:redirect url="Fixed_deposit_done.jsp"></c:redirect>
                            </c:if> 
                    </c:if>   
                               
                </c:when>
                
                    <c:otherwise>
                        <%
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid password !!!');");
                        out.println("location='Fixed_deposit_request.jsp';");
                        out.println("</script>");
                        RequestDispatcher rd=request.getRequestDispatcher("/Fixed_deposit_request.jsp");
                        rd.include(request, response);
                        %>
                    </c:otherwise>
            
            </c:choose>
        
    </body>
</html>

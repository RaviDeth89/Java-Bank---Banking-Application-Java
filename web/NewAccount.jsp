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
        <title>New Account</title>
        
        <link href="index-styles.css" rel="stylesheet" />
        <style>
            h1{
                margin-top: 10%;
            }
        </style>
        
    </head>
    <body>
            <jsp:useBean id="now" class="java.util.Date" />     
            <fmt:formatDate type="date"  var="reg_date" value="${now}" />
            <fmt:formatDate type="time" var="reg_time" value="${now}" />
            
            <c:set var="status" value="Inactive"></c:set>
             
            <c:choose>
                <c:when test="${param.age<18}">
                    <c:set var="account_type" value="Minor"></c:set>
                </c:when>
                <c:when test="${param.age>=18}">
                    <c:set var="account_type" value="Major"></c:set>
                </c:when>
            </c:choose>
            
            
            <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:update dataSource="${conn}" var="rowCount" scope="session"
                        sql="insert into account_details(account_no, full_name, father_name, address, city, state, pincode, aadhar_no, dob, age, account_type, gender, mob_no, email_id, reg_date, reg_time, password, status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)">
                    <sql:param value="${param.account_no}"/>
                    <sql:param value="${param.full_name}" />
                    <sql:param value="${param.father_name}" />
                    <sql:param value="${param.address}" />
                    <sql:param value="${param.city}" />
                    <sql:param value="${param.state}" />
                    <sql:param value="${param.pincode}" />
                    <sql:param value="${param.aadhar_no}" />
                    <sql:param value="${param.dob}" />
                    <sql:param value="${param.age}" />
                    <sql:param value="${account_type}" />
                    <sql:param value="${param.gender}" />
                    <sql:param value="${param.mob_no}" />
                    <sql:param value="${param.email_id}" />
                    <sql:param value="${reg_date}" />
                    <sql:param value="${reg_time}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${status}" />
            </sql:update>
            
            <c:if test="${rowCount > 0}">
              <nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="index.html">Home</a></li>
                                        <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="NewAccount.html">Sign up</a></li>
				</ul>
			</div>
                    </div>
            </nav>
              
                <h1 align="center">&#128100; Account is added successfully as ${param.full_name}.<br>Please, wait for account confirmation...<br>Your account will be activated within 1 hour. </h1>
       </c:if>                  
</body>
</html>
    

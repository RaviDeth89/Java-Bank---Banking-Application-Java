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
        <title>New ATM User</title>
        
        <link href="index-styles.css" rel="stylesheet" />
        <style>
            h1{
                margin-top: 10%;
            }
        </style>
        
    </head>
    <body>
        <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:query dataSource="${conn}" var="rs">select * from account_details where account_no=?;
            <sql:param value="${param.account_no}"/>
            </sql:query>
            
            <c:forEach items="${rs.rows}" var="row">     
                <c:set var="x1" value="${row.account_no}"></c:set>
                <c:set var="x2" value="${row.full_name}"></c:set>
                <c:set var="x3" value="${row.password}"></c:set> 
                <c:set var="x4" value="${row.status}"></c:set>
            </c:forEach>
            <c:set var="x5" value="Active"></c:set>
            <c:choose>
                <c:when test="${x4==x5}">
                    <c:choose>    
                        <c:when test="${param.account_no==x1 && param.password==x3}">
                            
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
                                                        class="nav-link py-3 px-0 px-lg-3 rounded" href="index.html">Log out</a></li>
                                        </ul>
                                </div>
                            </div>
                           </nav>

                            <div class="c_d_time">
                                <jsp:useBean id="now" class="java.util.Date" />     
                                <fmt:formatDate type="both"  var="current_date_time" value="${now}" />
                                <c:out value="${current_date_time}"></c:out>
                            </div><br>
                            
                            <jsp:useBean id="now1" class="java.util.Date" />     
                            <fmt:formatDate type="date"  var="reg_date" value="${now1}" />
                            <fmt:formatDate type="time" var="reg_time" value="${now1}" />

                            <sql:setDataSource var="conn" scope="session"
                                               user="root" password=""
                                               url="jdbc:mysql://localhost:3306/java_bank"
                                               driver="com.mysql.jdbc.Driver"/>

                            <sql:query dataSource="${conn}" var="rs1">select * from account_details where account_no=?;
                            <sql:param value="${param.account_no}"/>
                            </sql:query>

                            <c:forEach items="${rs1.rows}" var="row1">     
                                <c:set var="balance" value="${row1.balance}"></c:set>        
                            </c:forEach>

                            <sql:update dataSource="${conn}" var="up1">update account_details set card_no=? where account_no=?;
                                            <sql:param value="${param.card_no}"/>
                                            <sql:param value="${param.account_no}"/>
                                            </sql:update>


                            <sql:update dataSource="${conn}" var="rowCount" scope="session"
                                        sql="insert into atm(account_no, card_no, full_name, mob_no, email_id, reg_date, reg_time, pin, balance) values(?,?,?,?,?,?,?,?,?)">
                                    <sql:param value="${param.account_no}"/>
                                    <sql:param value="${param.card_no}"/>
                                    <sql:param value="${param.full_name}" />
                                    <sql:param value="${param.mob_no}" />
                                    <sql:param value="${param.email_id}" />
                                    <sql:param value="${reg_date}" />
                                    <sql:param value="${reg_time}" />
                                    <sql:param value="${param.pin}" />
                                    <sql:param value="${balance}" />
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
                                                                class="nav-link py-3 px-0 px-lg-3 rounded" href="ATM_Machine.jsp">Log in</a></li>
                                                </ul>
                                        </div>
                                    </div>
                            </nav>

                                <h1 align="center">&#128179; New ATM Card is added successfully.</h1>
                                <h2 align="center">ATM Card Holder Name is ${param.full_name}.</h2>
                       </c:if>                  

                        </c:when>

                        <c:otherwise>

                            <% 
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Invalid account no. or password !!!');");
                                out.println("location='New_Atm_User.html';");
                                out.println("</script>");
                                RequestDispatcher rd2=request.getRequestDispatcher("/New_Atm_User.html");
                                rd2.include(request, response);
                                %>
                        </c:otherwise>
                    </c:choose> 
                </c:when>
                            
                <c:otherwise>
                     <% 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Your account is Inactive !! Contact to the bank manager');");
                        out.println("location='New_Atm_User.html';");
                        out.println("</script>");
                        RequestDispatcher rd1=request.getRequestDispatcher("/New_Atm_User.html");
                        rd1.include(request, response);
                        %>
                </c:otherwise>
                            
            </c:choose>    
        
            
</body>
</html>
    

<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.ServletRequest"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="java.io.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Images/Java_logo_001.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ATM Login</title>
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
                width: 80%;
                margin: 0 auto;
                margin-left: 50%;
                margin-right: 50%;
            }
            .container1 {
                width: 100%;
                margin: 0 auto;
                margin-left: 18%;
                margin-right: 50%;
            }
            h1{
                margin-top: 8%;
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
        </style>
        
    </head>
    <body>   
            <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:query dataSource="${conn}" var="rs">select * from atm where card_no=?;
            <sql:param value="${param.card_no}"/>
            </sql:query>
            
            <c:forEach items="${rs.rows}" var="row">     
                <c:set var="x1" value="${row.card_no}"></c:set>
                <c:set var="x2" value="${row.full_name}"></c:set>
                <c:set var="x3" value="${row.pin}"></c:set>       
            </c:forEach>
            
            <c:choose>
                
                <c:when test="${param.card_no==x1 && param.pin==x3}">
                    <c:set var="atm_number" value="${param.card_no}" scope="session"></c:set>
                    
                    <sql:query dataSource="${conn}" var="rs">select * from account_details where card_no=?;
                    <sql:param value="${param.card_no}"/>
                    </sql:query>
                    <c:forEach items="${rs.rows}" var="row">     
                        <c:set var="z" value="${row.balance}"></c:set>
                    </c:forEach>
                    <sql:update dataSource="${conn}" var="upp">
                        update atm set balance=? where card_no=?;
                        <sql:param value="${z}"/>
                        <sql:param value="${param.card_no}"/>
                    </sql:update>
                    
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout_servlet">Log out</a></li>
				</ul>
			</div>
                    </div>
                   </nav>
                    
                    <h1 align="center">Account Details</h1>
                    <h2 align="center">Hello, <c:out value="${x2}"></c:out> &#128100;</h2><br>
                    
                    <div class="container1"> 
                        <table>
                            <tr>
                                <th>Account Number</th>
                                <th>Card No</th>
                                <th>Name</th>
                                <th>Mobile Number</th>
                                <th>Balance</th>
                            </tr>

                            <c:forEach items="${rs.rows}" var="row">
                            <tr>
                                <td><c:out value="${row.account_no}"></c:out></td>
                                <td><c:out value="${row.card_no}"></c:out></td>
                                <td><c:out value="${row.full_name}"></c:out></td>
                                <td><c:out value="${row.mob_no}"></c:out></td>
                                <td><c:out value="Rs. ${row.balance}"></c:out></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div> 
                   
                    <br><br><br><br><br>
                    
                    <div class="container1">
                        <table>
                            <tr>
                                <td><a style="font-weight: bold; font-size: 1.25em; color: darkblue;" href="Deposit.html">Deposit Money</a></td>
                                <td><a style="font-weight: bold; font-size: 1.25em; color: darkblue;" href="Cash.html">Cash Withdraw</a></td>
                            </tr>
                        </table>
                    </div>
                    
                </c:when>
                    
                <c:otherwise>
                   
                    <% 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid Card no. or PIN !!!');");
                        out.println("location='ATM_Machine.jsp';");
                        out.println("</script>");
                        RequestDispatcher rd1=request.getRequestDispatcher("/ATM_Machine.jsp");
                        rd1.include(request, response);
                        %>
                </c:otherwise>
            </c:choose>         
    </body>
</html>


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
        <link rel="icon" href="Laughing-Person.svg">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link href="index-styles.css" rel="stylesheet" />
        <style>
            body {
                margin: 0px;
                padding: 0px;
                font-family: Arial, Helvetica, sans-serif;
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
                    background-color:  lightblue;
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
                    <a class="navbar-brand" href="Admin_001.jsp">JAVA BANK</a>
			
                        
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
                                            class="nav-link py-3 px-0 px-lg-3 rounded" href="Admin_001.jsp">Log Out</a></li>
				</ul>
			</div>
                    </div>
             </nav>
                    
                    <div class="c_d_time">
                        <jsp:useBean id="now" class="java.util.Date" />     
                        <fmt:formatDate type="both"  var="current_date_time" value="${now}" />
                        &#128197;<c:out value="${current_date_time}"></c:out>
                    </div><br>
                       
                        <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
    
                    <sql:query dataSource="${conn}" var="rs">select * from admin where id=?;
                    <sql:param value="${param.id}"/>
                    </sql:query>

                    <c:forEach items="${rs.rows}" var="row">
                        <c:set var="x1" value="${row.id}"></c:set>
                        <c:set var="x2" value="${row.name}"></c:set>
                        <c:set var="x3" value="${row.password}"></c:set>     
                    </c:forEach>

            <c:choose>

                <c:when test="${param.id==x1 && param.name==x2 && param.password==x3}">
                    <div class="container1">
                        <form action="Admin_003.jsp" method="post">
                            <label> Account Number : </label>
                            <input type="text" placeholder="Account number" name="account_no" style="border-color: green;"/>
                            <button style="border-color: black;" class="btn" type="submit">Enter</button>       
                        </form>
                    <sql:query dataSource="${conn}" var="rs1">select * from account_details;
                    </sql:query>
                    <br>
                    <table>
                        <tr>
                            <th>
                                Account Number
                            </th>
                            <th>
                                Account Holder Name
                            </th>
                            <th>
                                Registration Date & Time
                            </th>
                            <th>
                                Status
                            </th>
                        </tr>
                        
                        <c:forEach items="${rs1.rows}" var="row1">
                            <tr>
                                <td>
                                    <c:out value="${row1.account_no}"></c:out> 
                                </td>
                                <td>
                                    <c:out value="${row1.full_name}"></c:out> 
                                </td>
                                <td>
                                    <c:out value="${row1.reg_date} | ${row1.reg_time}"></c:out> 
                                </td>
                                <td>
                                    <c:out value="${row1.status}"></c:out> 
                                </td>
                            </tr>
                        </c:forEach> 
                    </table>
                </c:when>
                    <c:otherwise>
                        <% 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Wrong Id, Name or Password !!!');");
                        out.println("location='Admin_001.jsp';");
                        out.println("</script>");
                        RequestDispatcher rd1=request.getRequestDispatcher("/Admin_001.jsp");
                        rd1.include(request, response);
                        %>
                    </c:otherwise>
                </c:choose>
            </div>
    </body>
</html>
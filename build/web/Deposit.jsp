<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.ServletRequest"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : Verify
    Created on : 17 Oct, 2022, 10:51:57 PM
    Author     : ravid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Images/Java_logo_001.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Deposit</title>
        
        <style>
            body{
                font-size: 1.25em;
            }
            body {
                margin: 0px;
                padding: 0px;
                background: url('bubbles_right.svg');
                background-size: cover;
                background-attachment: fixed;
            }
            * {box-sizing: border-box}
            .container2 {
                width: 80%;
                margin: 0 auto;
                margin-left: 50%;
                margin-right: 50%;
            }
            .container {
                width: 80%;
                margin: 0 auto;
                margin-left: 25%;
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
        </style>
        
    </head>
    <body>   
            <c:set var="card_no" value="${sessionScope.atm_number}"></c:set>
            <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:query dataSource="${conn}" var="rs">select * from atm where card_no=?;
            <sql:param value="${card_no}"/>
            </sql:query>
            
            <c:forEach items="${rs.rows}" var="row"> 
                <c:set var="x1" value="${row.account_no}"></c:set>
                <c:set var="x2" value="${row.full_name}"></c:set>
                <c:set var="x3" value="${row.card_no}"></c:set>
                <c:set var="x5" value="${row.pin}"></c:set>
                <c:set var="x6" value="${row.balance}"></c:set>        
            </c:forEach>
            
            <c:choose>
                
                <c:when test="${param.pin==x5}">
                    <c:set var="finalbal" value="${x6+param.bal}"></c:set>
                        
                            <sql:update dataSource="${conn}" var="up">update atm set balance=? where card_no=?;
                            <sql:param value="${finalbal}"/>
                            <sql:param value="${card_no}"/>
                            </sql:update>
                            
                            <sql:update dataSource="${conn}" var="up1">update account_details set balance=? where card_no=?;
                            <sql:param value="${finalbal}"/>
                            <sql:param value="${card_no}"/>
                            </sql:update>
                            
                            <jsp:useBean id="now1" class="java.util.Date" />     
                        <fmt:formatDate type="date"  var="date" value="${now1}" />
                        <fmt:formatDate type="time"  var="time" value="${now1}" />
                        <c:set var="date" value="${date}"></c:set>
                        <c:set var="time" value="${time}"></c:set>
                        
                        <sql:update dataSource="${conn}" var="up3">insert into transaction_details (account_no,ac_holder_name,description,date,time,credit_debit,transfer_balance,current_balance) values(?,?,?,?,?,?,?,?);
                            <sql:param value="${x1}"/>
                            <sql:param value="${x2}"/>    
                            <sql:param value="Deposit through ATM card : ${x3}"/>
                            <sql:param value="${date}"/>
                            <sql:param value="${time}"/>
                            <sql:param value="Crediit"/>
                            <sql:param value="+${param.bal}"/>
                            <sql:param value="${finalbal}"/>
                        </sql:update>

                            <c:if test="${up > 0}">
                            <c:redirect url="Done.jsp"></c:redirect>
                            </c:if> 
                </c:when>
                    
                <c:otherwise>   
                    <% 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid PIN !!!');");
                        out.println("location='Deposit.html';");
                        out.println("</script>");
                        RequestDispatcher rd1=request.getRequestDispatcher("/Deposit.html");
                        rd1.include(request, response);
                        %>
                </c:otherwise>
            </c:choose>              
    </body>
</html>

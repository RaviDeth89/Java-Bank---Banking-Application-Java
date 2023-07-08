<%-- 
    Document   : Client_message
    Created on : 27 Oct, 2022, 2:46:52 AM
    Author     : ravid
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Images/Java_logo_001.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Message</title>
    </head>
    <body>
            <jsp:useBean id="now" class="java.util.Date" />     
            <fmt:formatDate type="both"  var="date_time" value="${now}" />
          
            <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:update dataSource="${conn}" var="rowCount" scope="session"
                        sql="insert into client_message (name,email,mob_number,message,date_time) values(?,?,?,?,?)">
                    <sql:param value="${param.name}"/>
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.number}" />
                    <sql:param value="${param.message}" />
                    <sql:param value="${date_time}" />
            </sql:update>
            
            <c:if test="${rowCount > 0}">
                <%
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Message is sent successfully...');");
                    out.println("location='index.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/index.html");
                    rd.include(request, response);
                %>
            </c:if>
            
    </body>
</html>

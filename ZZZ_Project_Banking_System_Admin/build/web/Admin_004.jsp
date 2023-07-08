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
    </head>
    <body>  
                       
                        <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
                            <sql:update dataSource="${conn}" var="up1">update account_details set status=? where account_no=?;
                                <sql:param value="${param.status}"/>
                                <sql:param value="${sessionScope.ac_number1}"/>
                            </sql:update>
                            <c:if test="${up1>0}">
                                <% 
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('Status updated successfully...');");
                                    out.println("location='Admin_002.jsp';");
                                    out.println("</script>");
                                    RequestDispatcher rd1=request.getRequestDispatcher("/Admin_002.jsp");
                                    rd1.include(request, response);
                                %>    
                            </c:if>
    </body>
</html>
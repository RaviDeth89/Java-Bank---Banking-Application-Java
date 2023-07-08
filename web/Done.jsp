<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Images/Java_logo_001.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successful</title>
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
                margin: auto;
                margin-left: 50%;
                margin-right: 50%;
            }
            .container3 {
                width: 80%;
                margin: auto;
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
                .btn{
                    background-color: #badce3;
                    border-color: gray;
                }
                .btn:hover{
                    background-color: #17a98c;
                }
                .h111{
                    margin-top: 8%;
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout_servlet">Log out</a></li>
				</ul>
			</div>
                    </div>
        </nav>
        <h2 class="h111" align="center">Transaction is successfully completed &#128578;</h2><br>
        <div class="container1">    
            <c:set var="card_no" value="${sessionScope.atm_number}"></c:set>
            <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/java_bank"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:query dataSource="${conn}" var="rs">select * from atm where card_no=?;
            <sql:param value="${card_no}"/>
            </sql:query>
            
            <c:forEach items="${rs.rows}" var="row">     
                <c:set var="x2" value="${row.full_name}"></c:set>
            </c:forEach>
                    
            <h1 align="center">Account Details</h1>
                    <h2 align="center">Hello, <c:out value="${x2}"></c:out> &#128100;</h2><br>
                    
                    <div class="container3"> 
                        <table>
                            <tr>
                                <td>Account No</td>
                                <td>Name</td>
                                <td>Card No</td>
                                <td>Mobile Number</td>
                                <td>Balance</td>
                            </tr>

                            <c:forEach items="${rs.rows}" var="row">
                            <tr>
                                <td><c:out value="${row.account_no}"></c:out></td>
                                <td><c:out value="${row.full_name}"></c:out></td>
                                <td><c:out value="${row.card_no}"></c:out></td>
                                <td><c:out value="${row.mob_no}"></c:out></td>
                                <td><c:out value="Rs. ${row.balance}"></c:out></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div> 
       </div> 
            
    </body>
</html>

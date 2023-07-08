<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
    <head>
        <link rel="icon" href="Laughing-Person.svg">
        <title>Admin Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="index-styles.css" rel="stylesheet" />
        <style>
            
            body{
                font-family: Arial, Helvetica, sans-serif;
                background: url('other-bck.jpg');
                background-size: cover;
                background-attachment: fixed;
                font-size: 1.20em;
            }
            * {box-sizing: border-box}
            .container-h1{
                width: 40%;
                margin: 0 auto;
                margin-top: 8%;
            }
            .h10{
                background-color: rgba(26, 188, 156, 0.5);
                color: #003366;
                font-family:inherit;
                font-weight: bolder;
            }
            .container-atm {
                width: 75%;
                margin: 0 auto;
                margin-top: 4%;
                margin-left: 27.5%;
                margin-right: 50%;
            }
            .right {
                position: absolute;
                right: 10px;
                top: 125px;
                display: inline-block;
            }
            .left {
                position: absolute;
                left: 10px;
                top: 125px;
                display: inline-block;
            }
            img{
                height: 560px;
                width: 475px;
            }
            table {
                  border: 2px solid gray;
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
                  background-color: rgba(255, 255, 255, 0.5);
                  font-weight: bold;
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
                    background-color: lightgoldenrodyellow;
                    font-weight: bold;
                    border-color: darkslategray;
                }
                .btn:hover{
                    background-color: cadetblue;
                }
                
        </style>
    </head>
    
    <body>
        <nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="Admin_001.jsp">JAVA BANK</a>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Admin_001.jsp">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>
    
        <br>
        <form action="Admin_002.jsp" method="post">
            <div class="container-h1"><h1 align="center" class="h10">Admin Login &#128176;</h1></div>
            <div class="container-atm">
                <table>
                    <tr>
                        <td>
                            ID Number :
                        </td>
                        <td>
                            <input type="text" name="id" placeholder="ID number"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Administrator Name :
                        </td>
                        <td>
                            <input type="text" name="name" placeholder="Administrator Name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password : 
                        </td>
                        <td>
                            <input type="password" name="password" placeholder="Password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                            <button type="submit" name="Enter" class="btn"> Login </button>
                        </td>
                    </tr>
                </table>  
            </div>
        </form>
        
    </body>

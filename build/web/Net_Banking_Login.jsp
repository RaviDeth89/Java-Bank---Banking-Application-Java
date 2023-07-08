<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
    <head>
        <link rel="icon" href="Images/Java_logo_001.png">
        <title>Net Banking Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="index-styles.css" rel="stylesheet" />
        <style>
            
            body{
                font-family: Arial, Helvetica, sans-serif;
                background: url('Images/Bank-bck-001.jpg');
                background-size: cover;
                background-attachment: fixed;
                font-size: 1.20em;
            }
            * {box-sizing: border-box}
            .h101{
                margin-top: 8%;
                width: 35%;
                margin-left: 32%;
                margin-right: 50%;
            }
            .h10{
                background-color: rgba(255, 255 , 255 , 0.7);
                font-family:inherit;
                align-content: center;
                font-weight: bold;
            }
            .container-login {
                width: 75%;
                margin: 0 auto;
                margin-top: 4%;
                margin-left: 26%;
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
                    border-color: gray;
                }
                .btn:hover{
                    background-color:#badbcc;
                }
                
        </style>
    </head>
    
    <body>
        <nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
                    <!--<img class="leftimg" src="Images/Java_logo_001.png" alt="">-->
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
    
        <br>
        <form action="Account_Open.jsp" method="post">
            <div class="h101"><h1 align="center" class="h10"> Login &#128176;</h1></div>
            <div class="container-login">
                <table>
                    <tr>
                        <td>
                            Account Number :
                        </td>
                        <td>
                            <input type="text" name="account_no" placeholder="Account number"/>
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

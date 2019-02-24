<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KEVIN FASHIONS | Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <script src="js/alert.js"></script>
    <script src="js/confirm.js"></script>
    <script src="js/prompt.js"></script>
    <script src="js/log.js"></script>
</head>
<%@ page import="javax.servlet.http.HttpSession, kevin.model.User" %>
<% 
	HttpSession logged = request.getSession(false);
%>
<body>
	<%
	if (request.getAttribute("result") != null) {
		out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result")
				+ "') </script>");
	}
	%>
    <header>
    <div id="overlay"></div>
        <div id="alertbox">
            <div>
                <div id="alertboxhead"></div>
                <div id="alertboxbody"></div>
                <div id="alertboxfoot"></div>
            </div>
        </div>
        <div id="logbox" style="width: 26vw">
            <div>
                <div id="logboxhead" style="padding: 0.5vw;">
                    <button style="float: right; border: none; background-color: transparent; outline: none; cursor: pointer; font-size: 1.5vw; color: rgba(1, 90, 108, 1);"
                        onclick="Login.close()">✖</button>
                    <h3 style="transform: translateX(5%)">Sign In</h3>
                </div>
                <form method="POST" action="LoginServlet">
                    <div id="logboxbody" style="padding: 0.5vw">
                        <input required type="email" name="email" class="textbox" placeholder="E-Mail" autocomplete="off" style="margin: 0.5vw 1vw; width: 20vw">
                        <input required type="password" name="password" class="textbox" placeholder="Password" autocomplete="off" style="margin: 0.5vw 1vw; width: 20vw">
                    </div>
                    <div id="logboxfoot" style="text-align: center; padding: 0.5vw">
                        <button id="logbut" class="button" type="submit">Login</button>
                    </div>
                </form>
            </div>
        </div>
        <nav class="navbar">
            <a href="">Home</a><a href="feedback.jsp">Feedback</a><a href="">Auction</a>
            <div class="innav">
            <a class='nvbut' id="acb" href="register.jsp">Sign Up</a>
            <% 
            	if (logged.getAttribute("user") != null) {
            		out.print("<a class='nvbut' href='LogoutServlet'>Sign Out</a>");
            	} else {
            		out.print("<a class='nvbut' onclick='Login.render()'>Sign In</a>");
            	}
            %>
            </div>
        </nav>
        <img src="img/header.jpg" alt="header">
    </header>
    <div class="reg-container">
        <div class="reg-cont">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem, doloremque sequi et error odit pariatur reprehenderit nobis! Velit, nam saepe.</div>
        <div class="reg-cont">
            <h3>Sign Up</h3>
            <form method="POST" action="RegisterServlet">
                <table>
                    <tr>
                        <td><input type="text" pattern="[a-zA-Z]{3,}" title="First Name Should Only Contain Letters" name="firstName" class="textbox" placeholder="First Name" autocomplete="off" id="halfbox"></td>
                        <td><input type="text" pattern="[a-zA-Z]{3,}" title="Last Name Should Only Contain Letters" name="lastName" class="textbox" placeholder="Last Name" autocomplete="off" id="halfbox"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="email" name="email" class="textbox" placeholder="E-Mail" autocomplete="off" id="fullbox"></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="postalNumber" class="textbox" placeholder="Postal Number" autocomplete="off" id="halfbox"></td>
                        <td><input type="text" pattern="[a-zA-Z]{3,}" title="Street Should Only Contain Letters" name="street" class="textbox" placeholder="Street" autocomplete="off" id="halfbox"></td>
                    </tr>
                    <tr>
                        <td><input type="text" pattern="[a-zA-Z]{3,}" title="City Should Only Contain Letters" name="city" class="textbox" placeholder="City" autocomplete="off" id="halfbox"></td>
                        <td><input type="text" pattern="[a-zA-Z]{3,}" title="District Should Only Contain Letters" name="district" class="textbox" placeholder="District" autocomplete="off" id="halfbox"></td>
                    </tr>
                    <tr>
                            <td colspan="2"><input type="text" pattern="[0-9]{10}" title="Telephone Number Should Contain 10 Digits" name="telephone" class="textbox" placeholder="Telephone" autocomplete="off" id="fullbox"></td>
                    </tr>
                    <tr>
                            <td><input type="password" title="" name="password" class="textbox" placeholder="New Password" autocomplete="off" id="halfbox"></td>
                            <td><input type="password" title="" name="confirmPassword" class="textbox" placeholder="Confirm Password" autocomplete="off" id="halfbox"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: end"><input type="submit" value="Submit" class="button">&emsp;<input type="reset" value="Clear" class="button"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
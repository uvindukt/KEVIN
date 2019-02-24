<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KEVIN FASHIONS | Order</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="img/icon.png">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <script src="js/alert.js"></script>
    <script src="js/confirm.js"></script>
    <script src="js/prompt.js"></script>
    <script src="js/log.js"></script>
    <script src="js/form.js"></script>
    <script src="js/file.js"></script>
    <script src="js/order.js"></script>
</head>
<%@ page import="javax.servlet.http.HttpSession, kevin.model.User" %>
<% 
	HttpSession logged = request.getSession(false);
	User user = new User();
	
	if (logged.getAttribute("admin") != null)
		response.sendRedirect("admin.jsp");

	if (logged.getAttribute("user") != null) {
		
		user = (User) logged.getAttribute("user");
		
	} else {
		
		response.sendRedirect("account.jsp");
		
	}
	
%>
<body>
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
                    <button style="float: right; border: none; background-color: transparent; outline: none; cursor: pointer; font-size: 1.5vw; color: rgba(254, 0, 2, 1);"
                        onclick="Login.close()">✖</button>
                    <h3 style="transform: translateX(5%)"><img src="img/logo.png" width="164vw" height="33vw"></h3>
                </div>
                <form method="POST" action="LoginServlet">
                    <div id="logboxbody" style="padding: 0.5vw">
                        <input required type="text" name="email" class="textbox" placeholder="E-Mail" autocomplete="off" style="margin: 0.5vw 1vw; width: 20vw">
                        <input required type="password" name="password" class="textbox" placeholder="Password" autocomplete="off" style="margin: 0.5vw 1vw; width: 20vw">
                    </div>
                    <div id="logboxfoot" style="text-align: center; padding: 0.5vw;">
                        <button class="button" type="submit"><i class="fas fa-sign-in-alt">&ensp;</i>Login</button>
                    </div>
                </form>
            </div>
        </div>
        <nav class="navbar">
            <a href="items.jsp"><i class="fa fa-shopping-bag"></i>&ensp;Items</a><a href="feedback.jsp"><i class="fas fa-comments"></i>&ensp;Feedback</a><a href="auction.jsp"><i class="fas fa-gavel"></i>&ensp;Auction</a>
            <div class="innav">
            <%
				if (logged.getAttribute("user") != null) {
					out.print("<a class='nvbut' href='dispute.jsp'><i class='fa fa-exclamation-triangle'></i>&ensp;Disputes</a>");
					out.print("<a class='nvbut' href='refund.jsp'><i class='fas fa-hand-holding-usd'></i>&ensp;Refunds</a>");
					out.print("<a id='acb' class='nvbut' href='order.jsp'><i class='fas fa-dollar-sign'></i>&ensp;Orders</a>");
					out.print("<a class='nvbut' href='card.jsp'><i class='fas fa-credit-card'></i>&ensp;Credit Cards</a>");
					out.print("<a class='nvbut' href='pack.jsp'><i class='fas fa-gift'></i>&ensp;Packages</a>");
					out.print("<a class='nvbut' href='track.jsp'><i class='fas fa-tasks'></i>&ensp;Tracking</a>");
					out.print("<a class='nvbut' href='cart.jsp'><i class='fas fa-shopping-cart'></i>&ensp;Shopping Cart</a>");
					out.print("<a class='nvbut' href='message.jsp'><i class='fas fa-envelope'></i>&ensp;Messages</a>");
					out.print("<a class='nvbut' href='account.jsp'><i class='fas fa-user'></i>&ensp;Profile</a>");
					out.print("<a class='nvbut' href='LogoutServlet'><i class='fas fa-sign-out-alt'></i>&ensp;Sign Out</a>");
				} else {
					out.print("<a class='nvbut' href='account.jsp'><i class='fas fa-user'></i>&ensp;Sign Up</a>");
					out.print("<a class='nvbut' style='cursor: pointer;' onclick='Login.render()'><i class='fas fa-sign-in-alt'></i>&ensp;Sign In</a>");
				}
			%>
            </div>
        </nav>
        <img src="img/logo.png" alt="logo" id="logo">
        <img src="img/h.jpg" alt="header">
    </header>
    <div class="track-container">
    	<div class="track-cont1">
    		<h2>Add Order</h2>
    		<form method="post" action="OrderServlet" enctype="multipart/form-data">
    		<table style="margin: auto">
    			<tr><td colspan="2"><textarea required autocomplete="off" class="textbox" type="text" placeholder="Description" name="description" style="width: 40vw; height: 8vw;"></textarea></td></tr>
    			<tr><td style="width: 20vw"><input required autocomplete="off" class="textbox" min="20" type="number" placeholder="Quantity" name="quantity" style="width: 18vw"></td>
    			<td style="padding-top: 1.5vw; width: 20vw"><div class="upload-btn-wrapper">
    				<input required class="textbox" id="inputfile" onchange="alertFilename()" type="file" accept="image/*" name="image">
  					<button class="btn" id="up">Upload a file</button>
    			</div><br><br></td></tr>
    			<tr><td colspan="2"><button class="button" type="submit" value="Submit"><i class="fas fa-save"></i>&ensp;Save</button>&emsp;<button class="button" type="reset" value="Clear"><i class="fas fa-times"></i>&ensp;Clear</button></td></tr>
    		</table>
    		</form>
    	</div>
    	<div class="track-cont2" style="padding-top: 3vh">
    		<h2>Orders</h2>
    		<form method="post" action="GetOrderServlet" id="ofl"><input type="text" hidden required name="id" id="osub" value=""><select onchange="getOrderDetails(document.getElementById('ofl'));" required class="select" style="width: 20vw; margin-bottom: 2vw" id="olist"><option value="" disabled selected>Select Auction Item</option></select></form>
    		<form method="post" action="DeleteOrderServlet" id="dor"><input type="text" hidden required name="id" id="orid" value=""><button type="button" onclick="Order.render('Enter New Quantity', 'EditOrderServlet')" class="button"><i class="fa fa-edit"></i>&ensp;Edit</button>&emsp;<button type="button" class="button" onclick="Confirm.render('Are you sure want to delete this order?', 'dor')"><i class="fa fa-trash"></i>&ensp;Delete</button></form>
    	</div>
    	<div id="orderdiv" hidden></div>
    </div>
    <div hidden id="cc"><select required class="select" name="creditcard" style="width: 20vw;" id="clist"><option value="" disabled selected>Select Credit Card</option></select></div>
    <%
		if (request.getAttribute("result") != null) {
 			out.print("<script type='text/javascript'>Alert.render('"+request.getAttribute("result")+"')</script>");
		}
	%>
</body>
</html>